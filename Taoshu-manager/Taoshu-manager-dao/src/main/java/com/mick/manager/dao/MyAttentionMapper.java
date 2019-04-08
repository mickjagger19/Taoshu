package com.mick.manager.dao;

import com.mick.manager.pojo.MyAttention;
import com.mick.manager.pojo.MyAttentionExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MyAttentionMapper {
    long countByExample(MyAttentionExample example);

    int deleteByExample(MyAttentionExample example);

    int deleteByPrimaryKey(Integer maId);

    int insert(MyAttention record);

    int insertSelective(MyAttention record);

    List<MyAttention> selectByExample(MyAttentionExample example);

    MyAttention selectByPrimaryKey(Integer maId);

    int updateByExampleSelective(@Param("record") MyAttention record, @Param("example") MyAttentionExample example);

    int updateByExample(@Param("record") MyAttention record, @Param("example") MyAttentionExample example);

    int updateByPrimaryKeySelective(MyAttention record);

    int updateByPrimaryKey(MyAttention record);

    //查询关注带出商品详情
    List<MyAttention> getAttentionCarryProduct(Integer uId);
}