# 淘书网Taoshu

JavaWeb项目，SSM版(页面仿京东)。通过Jedis实现IP限流拦截器，并实现了基于Dubbo的分布式系统。搜索引擎使用ElasticSearch。数据库连接池使用Druid。

**亮点**

1.功能基本齐全

2.Maven项目,Spring+SpingMVC+Mybatis

3.pojo类和Dao类由Mybatis Generator生成，免去手写代码可能造成的困难和错误

4.使用Dubbo+Zookeeper实现分布式系统。manager-service、search-service通过Dubbo向Zookeeper暴露Service类接口，client-service使用@Reference注解远程调用服务

5.基于ElasticSearch的搜索引擎，商家手动导入、更改索引信息。搜索出相应文档后通过GSON反序列化获得pojo类，返回给client

6.基于Jedis的限流拦截器。根据用户的IP地址和UUID作为score，分配用户独有的BUCKET，并维护一个Transaction-ID,通过当前用户连接获取的Transaction-ID在BUCEKT中的顺序来判断是否超限。

**功能**

1.首页
![image](https://github.com/mickjagger19/Taoshu/blob/master/images/01.png)
搜索页
![image](https://github.com/mickjagger19/Taoshu/blob/master/images/05.png)
商品介绍页
![image](https://github.com/mickjagger19/Taoshu/blob/master/images/03.png)
登录注册页
![image](https://github.com/mickjagger19/Taoshu/blob/master/images/06.png)
购物车页
![image](https://github.com/mickjagger19/Taoshu/blob/master/images/02.png)
2.用户间可以进行私信交流
![image](https://github.com/mickjagger19/Taoshu/blob/master/images/04.png)
3.自由发布闲置二手书籍
![image](https://github.com/mickjagger19/Taoshu/blob/master/images/08.png)
**安装使用**

1.下载项目，解压，用IDEA打开，等待Maven下载所有dependence

2.导入mysql脚本Taoshu.sql

3.下载安装并运行Zookeeper,Elastic Search和Dubbo

4.设置db.properties,resouce.properties等配置文件

5.按照顺序依次运行:Taoshu-manager-service,Taoshu-search-service,Taoshu-client-web

