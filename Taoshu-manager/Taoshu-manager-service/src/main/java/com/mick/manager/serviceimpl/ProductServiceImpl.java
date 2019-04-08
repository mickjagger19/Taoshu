package com.mick.manager.serviceimpl;


import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.PageHelper;
import com.mick.manager.dao.HistoryInfoMapper;
import com.mick.manager.dao.ProductMapper;
import com.mick.manager.pojo.HistoryInfo;
import com.mick.manager.pojo.Product;
import com.mick.manager.serviceint.ProductService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private HistoryInfoMapper historyInfoMapper;

    public List<Product> getNewProduct(int i){
        return  productMapper.getNewProduct(i);
    }

    public List<Product> getProductionByKeyword(String keyword,int pageNum){
        System.out.println("getProductionBykeyword啊啊啊啊");
//        PageHelper.startPage(pageNum,12);
        return productMapper.getProductionByKeyword("%"+keyword+"%");
    }

    public List<Product> getProductionById(Integer pId){
        System.out.println("getProductionById不不不不不不不");
        Product product = productMapper.selectByPrimaryKey(pId);
        ArrayList<Product> list = new ArrayList<>();
        list.add(product);
        return list;
    }

    //插入浏览历史纪录
    public void insertHistoryInfo(Integer uId, Integer pId){
        HistoryInfo historyInfo = new HistoryInfo();
        historyInfo.setgTime(new Date());
        historyInfo.sethStates(1);
        historyInfo.setpId(pId);
        historyInfo.setuId(uId);
        historyInfoMapper.insert(historyInfo);
    }

    public void insertProduct(Product p){
        productMapper.insert(p);
    }

    public List<Product> getRandomProduct(int i) {
        return productMapper.getRandomProduct(i);
    }

    public List<Product> getSpecialOffer(int i) {
        return productMapper.getSpecialOffer(i);
    }
}
