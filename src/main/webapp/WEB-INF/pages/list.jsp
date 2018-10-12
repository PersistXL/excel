<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Integer first = 1;
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE" />
<title>内容列表页面</title>
<link href="<%= basePath %>css/all.css" rel="stylesheet" type="text/css" />
<script src="<%=basePath %>js/jquery-1.8.0.min.js"></script>
<script src="<%=basePath %>js/list.js"></script>
<title>JSP Page</title>
</head>
<body style="background: #e1e9eb;">
	<form action="<%= basePath %>excelList" id="mainForm" method="POST">
		<input type="hidden" name="id" id="id" value="" /> 
		<input type="hidden" name="currentPage" id="currentPage" value="" />
		<div class="right">
			<div class="current">
				当前位置：<a href="<%=basePath %>leadingExcel" style="color: #6E6E6E;">内容管理</a>
				&gt; 内容列表
			</div>
			<div class="rightCont">
				<p class="g_title fix">
					内容列表 
					<a class="btn03" href="<%=basePath %>queryBeforeUpdateOrInsert">新增</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a class="btn03"href="javascript:deleteBath('<%=basePath%>','${dataSearch.column1}','${dataSearch.column2}','${dataSearch.column3}','${page.pageNum }');">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a class="btn03"href="<%=basePath%>cleanAll">清空</a>
					<a class="btn03"href="<%=basePath%>queryBreforeUpdateColumn?status=1">删除行</a>
					<a class="btn03"href="<%=basePath%>queryBreforeUpdateColumn?status=2">插入行</a>
				</p>
				<table class="tab1">
					<tbody>
						<tr>
							<td width="90" align="right">${nameList[0].columnname}：</td>
							<td>
								<input type="text" id="column1" name="column1" class="allInput" value="" />
							</td>
							<td width="90" align="right">${nameList[1].columnname}：</td>
							<td>
								<input type="text" id="column2" name="column2" class="allInput" value="" />
							</td>
							<td width="90" align="right">${nameList[2].columnname}：</td>
							<td>
								<input type="text" id="column3" name="column3" class="allInput" value="" />
							</td>

							<td width="85" align="right">
								<input type="submit" class="tabSub" value="查 询" />
							</td>
						</tr>
					</tbody>
				</table>
				<div class="zixun fix">
					<table class="tab2" width="100%">
						<tr>
						<th>
						<input type="checkbox" id="all" onclick="javascript:checkAll();" />
						</th>
							<c:forEach items="${nameList }" var="name">
								<th>${name.columnname }</th>
							</c:forEach>
						<th>操作</th>
						</tr>
						<c:forEach items="${dataList }" var="data" varStatus="index">
							<tr
							<c:if test="${index.count%2 == 0}">style='background-color:#ECF6EE;'</c:if>>
								<td><input type="checkbox" name="checkId"
										value="${data.id}" /></td>
								<c:if test="${!empty data.column1}">
									<td>${data.column1}</td>
								</c:if>
								<c:if test="${!empty data.column2}">
									<td>${data.column2}</td>
								</c:if>
								<c:if test="${!empty data.column3}">
									<td>${data.column3}</td>
								</c:if>
								<c:if test="${!empty data.column4}">
									<td>${data.column4}</td>
								</c:if>
								<c:if test="${!empty data.column5}">
									<td>${data.column5}</td>
								</c:if>
								<c:if test="${!empty data.column6}">
									<td>${data.column6}</td>
								</c:if>
								<c:if test="${!empty data.column7}">
									<td>${data.column7}</td>
								</c:if>
								<c:if test="${!empty data.column8}">
									<td>${data.column8}</td>
								</c:if>
								<c:if test="${!empty data.column9}">
									<td>${data.column9}</td>
								</c:if>
								<c:if test="${!empty data.column10}">
									<td>${data.column10}</td>
								</c:if>
								<td>
									<a href="javascript:update('<%=basePath%>','${data.id }','${dataSearch.column1}','${dataSearch.column2}','${dataSearch.column3}','${page.pageNum }');">修改</a>
									<a href="javascript:deleteOne('<%=basePath%>','${data.id }','${dataSearch.column1}','${dataSearch.column2}','${dataSearch.column3}','${page.pageNum }');">删除</a>
								</td>
							</tr>
						</c:forEach>
						
					</table>
					<!-- 分页模块 -->
					<div class='page fix'>
						共 <b>${ page.total}</b> 条 <a
							href="javascript:findPage('<%=basePath%>','${dataSearch.column1}','${dataSearch.column2}','${dataSearch.column3}','${page.firstPage }');"
							class='first'>首页</a>
						<c:if test="${page.pageNum>1 }">
							<a
								href="javascript:findPage('<%=basePath%>','${dataSearch.column1}','${dataSearch.column2}','${dataSearch.column3}','${page.prePage }');"
								class='pre'>上一页</a>
						</c:if>
						当前第<span>${page.pageNum }/${page.pages }</span>页

						<c:if test="${page.pageNum < page.pages }">
							<a
								href="javascript:findPage('<%=basePath%>','${dataSearch.column1}','${dataSearch.column2}','${dataSearch.column3}','${page.nextPage }');"
								class='next'>下一页</a>
						</c:if>
						<a 
							href="javascript:findPage('<%=basePath%>','${dataSearch.column1}','${dataSearch.column2}','${dataSearch.column3}','${page.pages }');"
							class='last'>末页</a> 跳至&nbsp;
							<input type='text' id="pageGo" value="" class='allInput w28' />&nbsp;页&nbsp; 
							<a
							href="javascript:goPage('<%=basePath%>','${dataSearch.column1}','${dataSearch.column2}','${dataSearch.column3}','${page.pages }');"
							class='go'>GO</a>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
