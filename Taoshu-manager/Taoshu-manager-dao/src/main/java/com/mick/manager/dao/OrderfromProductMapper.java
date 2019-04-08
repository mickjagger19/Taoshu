package com.mick.manager.dao;


import java.util.List;

import com.mick.manager.pojo.OrderfromProduct;
import com.mick.manager.pojo.OrderfromProductExample;
import org.apache.ibatis.annotations.Param;

public interface OrderfromProductMapper {
    long countByExample(OrderfromProductExample example);

    int deleteByExample(OrderfromProductExample example);

    int deleteByPrimaryKey(Integer opId);

    int insert(OrderfromProduct record);

    int insertSelective(OrderfromProduct record);

    List<OrderfromProduct> selectByExample(OrderfromProductExample example);

    OrderfromProduct selectByPrimaryKey(Integer opId);

    int updateByExampleSelective(@Param("record") OrderfromProduct record, @Param("example") OrderfromProductExample example);

    int updateByExample(@Param("record") OrderfromProduct record, @Param("example") OrderfromProductExample example);

    int updateByPrimaryKeySelective(OrderfromProduct record);

    int updateByPrimaryKey(OrderfromProduct record);
}