package com.mick.manager.dao;


import com.mick.manager.pojo.Product;
import com.mick.manager.pojo.ProductExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductMapper {
    long countByExample(ProductExample example);

    int deleteByExample(ProductExample example);

    int deleteByPrimaryKey(Integer pId);

    int insert(Product record);

    int insertSelective(Product record);

    List<Product> selectByExample(ProductExample example);

    Product selectByPrimaryKey(Integer pId);

    int updateByExampleSelective(@Param("record") Product record, @Param("example") ProductExample example);

    int updateByExample(@Param("record") Product record, @Param("example") ProductExample example);

    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKey(Product record);

    List<Product> getProductionByKeyword(String keyword);

    Product getProductionBypId(Integer pId);

    List<Product> getNewProduct(int i);

    List<Product> getRandomProduct(int i);

    List<Product> getSpecialOffer(int i);
}