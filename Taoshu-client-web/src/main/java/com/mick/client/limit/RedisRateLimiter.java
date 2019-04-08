package com.mick.client.limit;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.Transaction;
import redis.clients.jedis.ZParams;

import java.util.List;
import java.util.UUID;

@Component
public class RedisRateLimiter {

    final static Logger log= LoggerFactory.getLogger(RedisRateLimiter.class);

    @Autowired
    private JedisPool jedisPool;

    private static final String BUCKET = "BUCKET_";
    private static final String BUCKET_COUNT = "BUCKET_COUNT";
    private static final String BUCKET_MONITOR = "BUCKET_MONITOR_";


    /*
     *@Param
     *  point: 客户端IP地址
     *  limit: 每秒钟允许的请求数
     *  timeout: 允许的延迟时间
     *
     */
    public String acquireTokenFromBucket(String point, int limit, long timeout) {

        try (Jedis jedis = jedisPool.getResource()) {
            //获取UUID
            String token = UUID.randomUUID().toString();
            long now = System.currentTimeMillis();
            //开启事务
            Transaction transaction = jedis.multi();

            //删除信号量 移除有序集中指定区间(score)内的所有成员 ZREMRANGEBYSCORE key min max
            transaction.zremrangeByScore((BUCKET_MONITOR + point).getBytes(), "-inf".getBytes(), String.valueOf(now - timeout).getBytes());
            //为每个有序集分别指定一个乘法因子(默认设置为 1) 每个成员的score值在传递给聚合函数之前都要先乘以该因子
            ZParams params = new ZParams();
            params.weightsByDouble(1.0, 0.0);
            //计算给定的一个或多个有序集的交集
            transaction.zinterstore(BUCKET + point, params, BUCKET + point, BUCKET_MONITOR + point);

            //计数器自增
            transaction.incr(BUCKET_COUNT);
            List<Object> results = transaction.exec();
            long counter = (Long) results.get(results.size() - 1);

            //新建一个事务
            transaction = jedis.multi();
            //Zadd 将一个或多个成员元素及其分数值(score)加入到有序集当中
            transaction.zadd(BUCKET_MONITOR + point, now, token);
            transaction.zadd(BUCKET + point, counter, token);
            transaction.zrank(BUCKET + point, token);
            results = transaction.exec();
            //获取排名(小->大)，判断请求是否取得了信号量
            long rank = (Long) results.get(results.size() - 1);
            if (rank < limit) {
                return token;
            } else {
                //没有获取到信号量，清理之前放入redis中垃圾数据
                transaction = jedis.multi();
                //Zrem移除刚才加入的score
                transaction.zrem(BUCKET_MONITOR + point, token);
                transaction.zrem(BUCKET + point, token);
                transaction.exec();
            }
        } catch (Exception e) {
            log.error("限流出错" + e.toString());
        }
        return null;
    }
}

