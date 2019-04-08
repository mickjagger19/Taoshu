package com.mick.manager.dao;


import com.mick.manager.pojo.Product;
import com.mick.manager.pojo.Shoppingcar;
import com.mick.manager.pojo.ShoppingcarExample;
import org.apache.ibatis.annotations.Param;


import java.util.List;

public interface ShoppingcarMapper {
    long countByExample(ShoppingcarExample example);

    int deleteByExample(ShoppingcarExample example);

    int deleteByPrimaryKey(Integer sId);

    int insert(Shoppingcar record);

    int insertSelective(Shoppingcar record);

    List<Shoppingcar> selectByExample(ShoppingcarExample example);

    Shoppingcar selectByPrimaryKey(Integer sId);

    int updateByExampleSelective(@Param("record") Shoppingcar record, @Param("example") ShoppingcarExample example);

    int updateByExample(@Param("record") Shoppingcar record, @Param("example") ShoppingcarExample example);

    int updateByPrimaryKeySelective(Shoppingcar record);

    int updateByPrimaryKey(Shoppingcar record);

    //获取购物车中商品
    List<Product> getProductInShoppingCar(@Param("uId") Integer uId, @Param("sStates") Integer sStates);

    int deleteByuIdANDPId(Integer uId, Integer pId);
}