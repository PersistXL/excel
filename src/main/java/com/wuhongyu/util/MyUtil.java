package com.wuhongyu.util;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.wuhongyu.entity.ExcelColumnName;
import com.wuhongyu.entity.ExcelData;

public class MyUtil {
	

	//分页
	public static Integer getCurrentPage(String current) {
		Integer currentPage = null;
		try {
			 currentPage = Integer.parseInt(current);
		} catch (NumberFormatException e) {
			
		}
		if(currentPage ==null || currentPage <=0) {
			currentPage=1;
		}
		return currentPage;
	}

	public static List<Object> excel2Mysql(MultipartFile excel) throws Exception {
		CommonsMultipartFile cFile = (CommonsMultipartFile) excel;
        DiskFileItem fileItem = (DiskFileItem) cFile.getFileItem();
        InputStream in = fileItem.getInputStream();
		String fileName = excel.getOriginalFilename();
		Workbook hssfWorkbook = null;
		if (fileName.endsWith("xlsx")) {
			hssfWorkbook = new XSSFWorkbook(in);// Excel 2007
		} else if (fileName.endsWith("xls")) {
			hssfWorkbook = new HSSFWorkbook(in);// Excel 2003
		}
		//获取列名称
		Sheet sheet1 = hssfWorkbook.getSheetAt(0);
		Row row1 = sheet1.getRow(0);
		List<Object> list = new ArrayList<Object>();
		List<ExcelColumnName> columnList = new ArrayList<ExcelColumnName>();
		List<ExcelData> dataList = new ArrayList<ExcelData>();
		for(int i=0; i<row1.getLastCellNum(); i++) {
			ExcelColumnName columnName = new ExcelColumnName();
			columnName.setColumnname(row1.getCell(i).toString());
			columnList.add(columnName);
		}
		for(int i=0; i<hssfWorkbook.getNumberOfSheets(); i++) {
			Sheet sheet = hssfWorkbook.getSheetAt(i);
			for(int j=1; j<=sheet.getLastRowNum(); j++) {
				Row row = sheet.getRow(j);
				ExcelData data = MyUtil.insertRow(row);
				dataList.add(data);
			}
		}
		list.add(columnList);
		list.add(dataList);
		return list;
	}
	public static ExcelData insertRow(Row row) {
		ExcelData data = new ExcelData();
		if(row.getCell(0)!=null) {
			data.setColumn1(row.getCell(0).toString());
		}
		if(row.getCell(1)!=null) {
			data.setColumn2(row.getCell(1).toString());
		}
		if(row.getCell(2)!=null) {
			data.setColumn3(row.getCell(2).toString());
		}
		if(row.getCell(3)!=null) {
			data.setColumn4(row.getCell(3).toString());
		}
		if(row.getCell(4)!=null) {
			data.setColumn5(row.getCell(4).toString());
		}
		if(row.getCell(5)!=null) {
			data.setColumn6(row.getCell(5).toString());
		}
		if(row.getCell(6)!=null) {
			data.setColumn7(row.getCell(6).toString());
		}
		if(row.getCell(7)!=null) {
			data.setColumn8(row.getCell(7).toString());
		}
		if(row.getCell(8)!=null) {
			data.setColumn9(row.getCell(8).toString());
		}
		if(row.getCell(9)!=null) {
			data.setColumn10(row.getCell(9).toString());
		}
		return data;
	}
}
