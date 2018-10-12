package com.wuhongyu.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.type.IntegerTypeHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wuhongyu.common.MyCommon;
import com.wuhongyu.entity.DataSearch;
import com.wuhongyu.entity.ExcelColumnName;
import com.wuhongyu.entity.ExcelData;
import com.wuhongyu.service.impl.ExcelServiceimpl;
import com.wuhongyu.util.MyUtil;

@Controller
public class ExcelController {

	@Autowired
	private ExcelServiceimpl excelServiceimpl;
	
	@RequestMapping("/leadingExcel")
	public String leadingExcel() {
		return "leadingExcel";
	}
	
	@RequestMapping("/excelList")
	public String excelList(Model model, @Param("excel") MultipartFile excel,@Param("currentPage")String currentPage
			,@Param("ExcelData")ExcelData excelData) {
		if(excel!=null && !"".equals(excel)) {
			//导入excel前先清空数据库的数据
			excelServiceimpl.cleanAll();
			excelServiceimpl.leadingExcel(excel);
		}
		List<ExcelColumnName> nameList = excelServiceimpl.selecColumnNameList();
		PageHelper.startPage(MyUtil.getCurrentPage(currentPage),MyCommon.PAGESIZE);
		List<ExcelData> dataList = excelServiceimpl.selectDataList(excelData);
		PageInfo<ExcelData> page = new PageInfo<ExcelData>(dataList);
		model.addAttribute("nameList", nameList);
		model.addAttribute("dataList", dataList);
		model.addAttribute("page", page);
		model.addAttribute("dataSearch", excelData);
		return "list";
	}
	
	@RequestMapping("/cleanAll")
	public String cleanAll(Model model) {
		excelServiceimpl.cleanAll();
		return "leadingExcel";
	}
	
	@RequestMapping("/deleteOne")
	public String deleteOne(Model model,@Param("ExcelData")ExcelData excelData,@Param("currentPage")String currentPage) {
		excelServiceimpl.deleteDataById(excelData.getId());
		return this.excelList(model, null, currentPage, excelData);
	}
	
	@RequestMapping("/deleteBath")
	public String deleteBath(Model model,@Param("checkId") Integer[] checkId,@Param("ExcelData")ExcelData excelData,@Param("currentPage")String currentPage) {
		excelServiceimpl.deleteByIds(checkId);
		return this.excelList(model, null, currentPage, excelData);
	}
	
	@RequestMapping("/queryBeforeUpdateOrInsert")
	public String queryBeforeUpdateOrInsert(Model model,@Param("ExcelData")ExcelData excelData,@Param("currentPage")String currentPage) {
		List<ExcelColumnName> nameList = excelServiceimpl.selecColumnNameList();
		model.addAttribute("nameList", nameList);
		if(excelData.getId()!=null && !"".equals(excelData.getId())) {
			ExcelData data = excelServiceimpl.queryById(excelData.getId());
			model.addAttribute("data", data);
			model.addAttribute("dataSearch", excelData);
			model.addAttribute("currentPage", currentPage);
		}
		return "addOrUpdate";
	}
	
	@RequestMapping("/updateOrInsertData")
	public String updateOrInsertData(Model model,@Param("DataSearch")DataSearch dataSearch,@Param("ExcelData")ExcelData excelData,@Param("currentPage")String currentPage) {
		excelServiceimpl.updateOrInser(excelData);
		ExcelData likeData = new ExcelData();
		likeData.setColumn1(dataSearch.getLikecolumn1());
		likeData.setColumn2(dataSearch.getLikecolumn2());
		likeData.setColumn3(dataSearch.getLikecolumn3());
		return this.excelList(model, null, currentPage, likeData);
	}
	
	@RequestMapping("/queryBreforeUpdateColumn")
	public String queryBreforeUpdateColumn(Model model,@Param("status")String status) {
		List<ExcelColumnName> nameList = excelServiceimpl.selecColumnNameList();
		model.addAttribute("nameList", nameList);
		model.addAttribute("status", status);
		return "updateColumn";
		
	}
	
	@RequestMapping("/deleteOrInsertColumn")
	public String deleteOrInsertColumn(Model model,@Param("ExcelColumnName")ExcelColumnName excelColumnName,
			@Param("status")String status) {
		if("1".equals(status)) {
			excelServiceimpl.deleteColumn(excelColumnName.getId());
		}else if("2".equals(status)) {
			excelServiceimpl.insertColumn(excelColumnName);
		}
		return this.excelList(model, null, "1", new ExcelData());
	}
}
