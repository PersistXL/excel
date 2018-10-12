package com.wuhongyu.service.impl;

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.List;

import org.apache.ibatis.jdbc.SQL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.wuhongyu.entity.ExcelColumnName;
import com.wuhongyu.entity.ExcelColumnNameExample;
import com.wuhongyu.entity.ExcelData;
import com.wuhongyu.entity.ExcelDataExample;
import com.wuhongyu.entity.ExcelDataExample.Criteria;
import com.wuhongyu.mapper.ExcelColumnNameMapper;
import com.wuhongyu.mapper.ExcelDataMapper;
import com.wuhongyu.service.ExcelService;
import com.wuhongyu.util.MyUtil;

@Service
public class ExcelServiceimpl implements ExcelService{
	@Autowired
	private ExcelColumnNameMapper excelColumnNameMapper;
	@Autowired
	private ExcelDataMapper excelDataMapper;

	@Override
	public void leadingExcel(MultipartFile excel) {
		try {
			List<Object> list = MyUtil.excel2Mysql(excel);
			List<ExcelColumnName> columnList = (List<ExcelColumnName>) list.get(0);
			for (ExcelColumnName excelColumnName : columnList) {
				excelColumnNameMapper.insert(excelColumnName);
			}
			List<ExcelData> dataList= (List<ExcelData>) list.get(1);
			for (ExcelData excelData : dataList) {
				excelDataMapper.insert(excelData);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<ExcelColumnName> selecColumnNameList() {
		ExcelColumnNameExample example = new ExcelColumnNameExample();
		example.createCriteria();
		List<ExcelColumnName> columnList = excelColumnNameMapper.selectByExample(example);
		return columnList;
	}

	@Override
	public List<ExcelData> selectDataList(ExcelData excelData) {
		ExcelDataExample example = new ExcelDataExample();
		Criteria c = example.createCriteria();
		if(excelData.getColumn1()!=null && !"".equals(excelData.getColumn1())) {
			c.andColumn1Like("%"+excelData.getColumn1()+"%");
		}else if(excelData.getColumn2()!=null && !"".equals(excelData.getColumn2())){
			c.andColumn2EqualTo(excelData.getColumn2());
		}else if(excelData.getColumn3()!=null && !"".equals(excelData.getColumn3())) {
			c.andColumn3EqualTo(excelData.getColumn3());	
		}
		List<ExcelData> dataList = excelDataMapper.selectByExample(example);
		return dataList;
	}

	@Override
	public void cleanAll() {
		excelColumnNameMapper.cleanAll();
		excelDataMapper.cleanAll();
	}

	@Override
	public void deleteDataById(Integer id) {
		excelDataMapper.deleteByPrimaryKey(id);
	}

	@Override
	public void updateOrInser(ExcelData excelData) {
		if(excelData.getId()!=null && !"".equals(excelData.getId())) {
			excelDataMapper.updateByPrimaryKeySelective(excelData);
		}else {
			excelDataMapper.insertSelective(excelData);
		}
	}

	@Override
	public void deleteByIds(Integer[] ids) {
		if(ids!=null) {
			List<Integer> idList = Arrays.asList(ids);
			excelDataMapper.deleteByKeys(idList);
		}
	}

	@Override
	public ExcelData queryById(Integer id) {
		ExcelData data = excelDataMapper.selectByPrimaryKey(id);
		return data;
	}

	@Override
	public void deleteColumn(Integer id) {
		ExcelColumnNameExample example = new ExcelColumnNameExample();
		example.createCriteria();
		List<ExcelColumnName> nameList1 = excelColumnNameMapper.selectByExample(example);
		excelColumnNameMapper.deleteByPrimaryKey(id);
		List<ExcelColumnName> nameList = excelColumnNameMapper.selectByExample(example);
		excelColumnNameMapper.cleanAll();
		for (ExcelColumnName name : nameList) {
			name.setId(null);
			excelColumnNameMapper.insertSelective(name);
		}
		if(id == nameList1.size()) {
			
			String column = "column"+id;
			excelDataMapper.updateColumn(column);
		}else if(id >1 && id <nameList1.size()){
			String sql = "";
			for(int i=id; i<10; i++) {
				if(i<9) {
					sql = sql+"column"+i+"="+"column"+(i+1)+",";
				}else {
					sql = sql+"column"+i+"="+"column"+(i+1);
				}
			}
			excelDataMapper.updateColumnNull(sql);
		}
		
	
	}

	@Override
	public void insertColumn(ExcelColumnName excelColumnName) {
		Integer id = excelColumnName.getId();
		ExcelColumnNameExample example = new ExcelColumnNameExample();
		example.createCriteria();
		List<ExcelColumnName> nameList = excelColumnNameMapper.selectByExample(example);
		nameList.add(id, excelColumnName);
		excelColumnNameMapper.cleanAll();
		for (ExcelColumnName name : nameList) {
			name.setId(null);
			excelColumnNameMapper.insertSelective(name);
		}
		String sql = "";
		for(int i=10; i>id; i--) {
			if(i-1>id) {
				sql = sql+"column"+i+"="+"column"+(i-1)+",";
			}else {
				sql = sql+"column"+i+"="+"column"+(i-1);
			}
		}
		//这里被插入的行数据就留用之前改行的数据0.0  想改的话可以改成任意字符串
		excelDataMapper.updateColumnNull(sql);
	}

}
