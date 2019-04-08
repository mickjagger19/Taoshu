package com.mick.search.serviceimpl;


import com.alibaba.dubbo.config.annotation.Service;
import com.google.gson.Gson;
import com.mick.common.exception.TaoshuException;
import com.mick.common.utils.HttpUtil;
import com.mick.manager.dto.EsCount;
import com.mick.manager.dto.EsInfo;
import com.mick.manager.pojo.Product;
import com.mick.search.serviceint.SearchItemServiceint;
import org.elasticsearch.action.bulk.BulkRequestBuilder;
import org.elasticsearch.action.bulk.BulkResponse;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.TransportAddress;
import org.elasticsearch.transport.client.PreBuiltTransportClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.apache.commons.lang3.StringUtils;
import com.mick.search.mapper.ProductMapper;

import java.net.InetAddress;
import java.util.List;

import static org.elasticsearch.common.xcontent.XContentFactory.jsonBuilder;


@Service
public class SearchItemServiceImpl implements SearchItemServiceint {

	private final static Logger log= LoggerFactory.getLogger(SearchItemServiceImpl.class);

	@Autowired
	private ProductMapper ProductMapper;

	@Value("${ES_CONNECT_IP}")
	private String ES_CONNECT_IP;

	@Value("${ES_NODE_CLIENT_PORT}")
	private String ES_NODE_CLIENT_PORT;

	@Value("${ES_CLUSTER_NAME}")
	private String ES_CLUSTER_NAME;

	@Value("${ITEM_INDEX}")
	private String ITEM_INDEX;

	@Value("${ITEM_TYPE}")
	private String ITEM_TYPE;

	@Override
	public void importAllItems() {

		try{
			System.setProperty("es.set.netty.runtime.available.processors", "false");
			Settings settings = Settings.builder()
					.put("cluster.name", ES_CLUSTER_NAME).build();
			TransportClient client = new PreBuiltTransportClient(settings)
					.addTransportAddress(new TransportAddress(InetAddress.getByName(ES_CONNECT_IP), 9300));

			//批量添加
			BulkRequestBuilder bulkRequest = client.prepareBulk();

			//查询商品列表
			List<Product> itemList = ProductMapper.getProductList();

			//遍历商品列表
			for (Product searchItem : itemList) {
				bulkRequest.add(client.prepareIndex(ITEM_INDEX, ITEM_TYPE, String.valueOf(searchItem.getpId()))
						.setSource(jsonBuilder()
								.startObject()
								.field("pId", searchItem.getpId())
								.field("pName", searchItem.getpName())
								.field("pCategory", searchItem.getpCategory())
								.field("pPicture", searchItem.getpPicture())
								.field("pOriprice", searchItem.getpOriprice())
								.field("pPrice", searchItem.getpPrice())
								.field("pStock", searchItem.getpStock())
								.field("pIntro", searchItem.getpIntro())
								.field("pTime", searchItem.getpTime())
								.endObject()
						)
				);
			}

			BulkResponse bulkResponse = bulkRequest.get();

			log.info("更新索引成功");

			System.out.println("更新索引成功");

			client.close();
		}catch (Exception e){
			e.printStackTrace();
			throw new TaoshuException("导入ES索引库出错，请再次尝试");
		}

	}

	@Override
	public EsInfo getEsInfo() {

		String healthUrl="http://"+ES_CONNECT_IP+":"+ES_NODE_CLIENT_PORT+"/_cluster/health";
		String countUrl="http://"+ES_CONNECT_IP+":"+ES_NODE_CLIENT_PORT+"/_count";
		String healthResult= HttpUtil.sendGet(healthUrl);
		String countResult=HttpUtil.sendGet(countUrl);
		if(StringUtils.isBlank(healthResult)||StringUtils.isBlank(countResult)){
			throw new TaoshuException("连接集群失败，请检查ES运行状态");
		}
		EsInfo esInfo=new EsInfo();
		EsCount esCount=new EsCount();
		try {
			esInfo=new Gson().fromJson(healthResult,EsInfo.class);
			esCount=new Gson().fromJson(countResult,EsCount.class);
			esInfo.setCount(esCount.getCount());
		}catch (Exception e){
			e.printStackTrace();
			throw new TaoshuException("获取ES信息出错");
		}

		return esInfo;
	}
}
