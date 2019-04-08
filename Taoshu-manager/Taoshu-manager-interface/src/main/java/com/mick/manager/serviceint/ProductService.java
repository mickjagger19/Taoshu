package com.mick.manager.serviceint;


import com.mick.manager.pojo.Product;

import java.util.List;


public interface ProductService {

    public List<Product> getNewProduct(int i);

    public List<Product> getProductionByKeyword(String keyword,int pageNum);

    List<Product> getProductionById(Integer pId);

    //插入浏览历史纪录
    public void insertHistoryInfo(Integer uId, Integer pId);

    public void insertProduct(Product p);

    public List<Product> getRandomProduct(int i);

    List<Product> getSpecialOffer(int i);
}
