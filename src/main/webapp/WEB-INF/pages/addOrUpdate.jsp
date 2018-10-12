<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE" />
<title>添加用户页面</title>
<link href="<%=basePath%>css/all.css" rel="stylesheet" type="text/css" />
<script src="<%=basePath%>js/jquery-1.8.0.min.js"></script>
<title>JSP Page</title>
</head>
<body style="background: #e1e9eb;">
	<form action="<%=basePath%>updateOrInsertData" method="post">
		<c:if test="${!empty data.id }">
			<input type="hidden" name="id" value="${data.id }"/>
			<input type="hidden" name="currentPage" value="${currentPage }"/>
			<input type="hidden" name="likecolumn1" value="${excelData.column1 }"/>
			<input type="hidden" name="likecolumn2" value="${excelData.column2 }"/>
			<input type="hidden" name="likecolumn3" value="${excelData.column3 }"/>
		</c:if>
		<div class="right">
			<div class="current">
				当前位置：<a href="<%=basePath%>excelList" style="color: #6E6E6E;">用户管理</a>
				&gt; 信息维护
			</div>
			<div class="rightCont">
				<p class="g_title fix">信息维护</p>
				<table class="tab1">
					<tbody>
					   <c:if test="${fn:length(nameList)>0}">
						<tr>
							<td width="90" align="right">${nameList[0].columnname }：</td>
							<td>
								<input type="text" name="column1" class="allInput" value="${data.column1 }"/>
							</td>
						</tr>
						</c:if>
						<c:if test="${fn:length(nameList)>1}">
						<tr>
							<td width="90" align="right">${nameList[1].columnname }：</td>
							<td>
								<input type="text" name="column2" class="allInput" value="${data.column2 }"/>
							</td>
						</tr>
						</c:if>
						<c:if test="${fn:length(nameList)>2}">
						<tr>
							<td width="90" align="right">${nameList[2].columnname }：</td>
							<td>
								<input type="text" name="column3" class="allInput" value="${data.column3 }"/>
							</td>
						</tr>
						</c:if>
						<c:if test="${fn:length(nameList)>3}">
						<tr>
							<td width="90" align="right">${nameList[3].columnname }：</td>
							<td>
								<input type="text" name="column4" class="allInput" value="${data.column4 }"/>
							</td>
						</tr>
						</c:if>
						<c:if test="${fn:length(nameList)>4}">
						<tr>
							<td width="90" align="right">${nameList[4].columnname }：</td>
							<td>
								<input type="text" name="column5" class="allInput" value="${data.column5 }"/>
							</td>
						</tr>
						</c:if>
						<c:if test="${fn:length(nameList)>5}">
						<tr>
							<td width="90" align="right">${nameList[5].columnname }：</td>
							<td>
								<input type="text" name="column6" class="allInput" value="${data.column6 }"/>
							</td>
						</tr>
						</c:if>
						<c:if test="${fn:length(nameList)>6}">
						<tr>
							<td width="90" align="right">${nameList[6].columnname }：</td>
							<td>
								<input type="text" name="column6" class="allInput" value="${data.column6 }"/>
							</td>
						</tr>
						</c:if>
						<c:if test="${fn:length(nameList)>7}">
						<tr>
							<td width="90" align="right">${nameList[7].columnname }：</td>
							<td>
								<input type="text" name="column7" class="allInput" value="${data.column7 }"/>
							</td>
						</tr>
						</c:if>
						<tr>
							<td width="85" align="right"><input type="submit"
								class="tabSub" value="添 加" /></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</form>
</body>
</html>
