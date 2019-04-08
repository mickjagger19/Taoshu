package com.mick.search.serviceimpl;


import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.mick.common.exception.TaoshuException;
import com.mick.manager.dto.SearchResult;
import com.mick.manager.pojo.Product;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.action.search.SearchType;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.TransportAddress;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import org.elasticsearch.transport.client.PreBuiltTransportClient;
import org.springframework.beans.factory.annotation.Value;

import java.net.InetAddress;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class test {
    public static void main(String[] args){

        String key = "毛泽东";
        int page = 0;
        int size = 12;

         String ES_CONNECT_IP = "127.0.0.1";


         String ES_NODE_CLIENT_PORT = "9200";

         String ES_CLUSTER_NAME = "elasticsearch_mick";

         String ITEM_INDEX = "product";

        String ITEM_TYPE = "productList";

        try {
            System.setProperty("es.set.netty.runtime.available.processors", "false");
            Settings settings = Settings.builder()
                    .put("cluster.name", ES_CLUSTER_NAME).build();
            TransportClient client = new PreBuiltTransportClient(settings)
                    .addTransportAddress(new TransportAddress(InetAddress.getByName(ES_CONNECT_IP), 9300));

            SearchResult result = new SearchResult();

            System.out.println("qb");
//            QueryBuilder qb = QueryBuilders.wildcardQuery("p_name","空气动力学");
//            QueryBuilder qb =  QueryBuilders.moreLikeThisQuery(new String[]{"p_id"},new String[]{key},null);
//            QueryBuilder qb =  QueryBuilders.matchPhraseQuery("p_name",key);

            System.out.println("key:" + key);

            if (page <= 0) {
                page = 1;
            }
            int start = (page - 1) * size;

            //执行搜索
            SearchResponse searchResponse = null;

            searchResponse = client.prepareSearch(ITEM_INDEX)
                    .setTypes(ITEM_TYPE)
                    .setSearchType(SearchType.DFS_QUERY_THEN_FETCH)
                    .setQuery(QueryBuilders.multiMatchQuery("毛泽东","pName","pIntro"))    // Query
                    .setFrom(start).setSize(size).setExplain(true)    //从第几个开始，显示size个数据
//                    .setPostFilter(QueryBuilders.rangeQuery("salePrice").gt(priceGt).lt(priceLte))    //过滤条件
                    .get();

            SearchHits hits = null;
            if (searchResponse != null) {
                hits = searchResponse.getHits();
            }

            //返回总结果数
            if (hits != null) {
                result.setRecordNum(hits.totalHits);

            }

            System.out.println("找到" + hits.totalHits + "个结果");
            List<Product> list = new ArrayList<>();


            System.out.println("hit");
            if (hits != null && hits.totalHits > 0) {
                for (SearchHit hit : hits) {
                    //总页数
                    int totalPage = (int) (hit.getScore() / size);
                    if ((hit.getScore() % size) != 0) {
                        totalPage++;
                    }
                    //返回结果总页数
                    result.setTotalPages(totalPage);

                    System.out.println(hit.getSourceAsString());

                    Product product = new Gson().fromJson(hit.getSourceAsString(), Product.class);
                    list.add(product);
//                    Product searchItem = new Gson().fromJson(hit.getSourceAsString(), SearchItem.class);
//                    String productName = hit.getHighlightFields().get("productName").getFragments()[0].toString();
//                    searchItem.setProductName(productName);
                    //返回结果
//                    list.add(searchItem);
                }
            }
            result.setProductList(list);



            System.out.println("returning");


            //因个人服务器配置过低此处取消关闭减轻搜索压力增快搜索速度
            //client.close();
        } catch (Exception e) {
            e.printStackTrace();
            throw new TaoshuException("查询ES索引库出错");
        }



    }
}
