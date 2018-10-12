package com.wuhongyu.mapper;

import com.wuhongyu.entity.ExcelData;
import com.wuhongyu.entity.ExcelDataExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ExcelDataMapper {
    int countByExample(ExcelDataExample example);

    int deleteByExample(ExcelDataExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(ExcelData record);

    int insertSelective(ExcelData record);

    List<ExcelData> selectByExample(ExcelDataExample example);

    ExcelData selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ExcelData record, @Param("example") ExcelDataExample example);

    int updateByExample(@Param("record") ExcelData record, @Param("example") ExcelDataExample example);

    int updateByPrimaryKeySelective(ExcelData record);

    int updateByPrimaryKey(ExcelData record);
    
    void cleanAll();
    
    void deleteByKeys(@Param("ids") List<Integer> ids);
    
    void updateColumn(@Param("column")String column);
    
    void updateColumnNull(@Param("sql")String sql);
}