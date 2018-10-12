package com.wuhongyu.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.wuhongyu.entity.ExcelColumnName;
import com.wuhongyu.entity.ExcelData;

public interface ExcelService {
	
	public void leadingExcel(MultipartFile excel);
	
	public List<ExcelColumnName> selecColumnNameList();
	
	public List<ExcelData> selectDataList(ExcelData excelData);
	
	public void cleanAll();
	
	public void deleteDataById(Integer id);
	
	public void deleteByIds(Integer[] ids);
	
	public void updateOrInser(ExcelData excelData);
	
	public ExcelData queryById(Integer id);
	
	public void deleteColumn(Integer id);
	
	public void insertColumn(ExcelColumnName excelColumnName);
}
