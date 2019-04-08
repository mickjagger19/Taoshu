package com.mick.search.mapper;


import com.mick.manager.pojo.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductMapper {

    List<Product> getProductList();

    Product getProductById(@Param("id") Long id);

}