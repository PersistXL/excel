package com.wuhongyu.mapper;

import com.wuhongyu.entity.ExcelColumnName;
import com.wuhongyu.entity.ExcelColumnNameExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ExcelColumnNameMapper {
    int countByExample(ExcelColumnNameExample example);

    int deleteByExample(ExcelColumnNameExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(ExcelColumnName record);

    int insertSelective(ExcelColumnName record);

    List<ExcelColumnName> selectByExample(ExcelColumnNameExample example);

    ExcelColumnName selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ExcelColumnName record, @Param("example") ExcelColumnNameExample example);

    int updateByExample(@Param("record") ExcelColumnName record, @Param("example") ExcelColumnNameExample example);

    int updateByPrimaryKeySelective(ExcelColumnName record);

    int updateByPrimaryKey(ExcelColumnName record);
    
    void cleanAll();
}