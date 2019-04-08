package com.mick.manager.dao;


import java.util.List;

import com.mick.manager.pojo.HistoryInfo;
import com.mick.manager.pojo.HistoryInfoExample;
import org.apache.ibatis.annotations.Param;

public interface HistoryInfoMapper {
    long countByExample(HistoryInfoExample example);

    int deleteByExample(HistoryInfoExample example);

    int deleteByPrimaryKey(Integer hId);

    int insert(HistoryInfo record);

    int insertSelective(HistoryInfo record);

    List<HistoryInfo> selectByExample(HistoryInfoExample example);

    HistoryInfo selectByPrimaryKey(Integer hId);

    int updateByExampleSelective(@Param("record") HistoryInfo record, @Param("example") HistoryInfoExample example);

    int updateByExample(@Param("record") HistoryInfo record, @Param("example") HistoryInfoExample example);

    int updateByPrimaryKeySelective(HistoryInfo record);

    int updateByPrimaryKey(HistoryInfo record);
}