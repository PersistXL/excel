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
	<form action="<%=basePath%>deleteOrInsertColumn?status=${status}" method="post">
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
						<tr>
							<td>
							<select name="id">
								<option value="">--请选择列--</option>
								<c:forEach items="${nameList }" var="name">
									<option value="${name.id }">${name.columnname }</option>
								</c:forEach>
							</select>
							</td>
						</tr>
						<c:if test="${status eq '2'}">
							<tr>
								<td width="90" align="right">列名称：</td>
								<td>
									<input type="text" name="columnname" class="allInput" value=""/>
								</td>
							</tr>
						</c:if>
						
						<tr>
							<td width="85" align="right"><input type="submit"
								class="tabSub" value="修改" /></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</form>
</body>
</html>
