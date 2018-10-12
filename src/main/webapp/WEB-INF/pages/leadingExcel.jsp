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
<script src="http://libs.baidu.com/jquery/1.8.0/jquery.min.js"></script>
<title>JSP Page</title>
</head>
<body style="background: #e1e9eb;">
	<form action="<%= basePath %>excelList" id="mainForm" method="POST" enctype="multipart/form-data">

		<div class="right">
			<div class="current">
				当前位置：<a href="#" style="color: #6E6E6E;">内容管理</a>
				&gt; 内容列表
			</div>
			<div class="rightCont">
				<p class="g_title fix">
					内容列表 
				</p>
				<table class="tab1">
					<tbody>
						<tr>
							<td width="90" align="right">表格：</td>
							<td><input type="file" name="excel"/></td>

							<td width="85" align="right"><input type="submit"
								class="tabSub" value="导入" /></td>
						</tr>
					</tbody>
				</table>
				<div class="zixun fix">
					<table class="tab2" width="100%">
						
							<!-- <tr>
								<th><input type="checkbox" id="all"
									onclick="javascript:checkAll();" /></th>
								<th>用户编号</th>
								<th>用户名称</th>
								<th>用户密码</th>
								<th>用户性别</th>
								<th>用户电话</th>
								<th>操作</th>
							</tr> -->
						<%-- 	<c:forEach items="${userPage.list}" var="userList"
								varStatus="index">
								<tr
									<c:if test="${index.count%2 == 0}">style='background-color:#ECF6EE;'</c:if>>
									<td><input type="checkbox" name="checkId"
										value="${userList.id}" /></td>
									<td>${userList.id}</td>
									<td>${userList.username}</td>
									<td>${userList.password}</td>
									<td>${userList.gender}</td>
									<td>${userList.phone}</td>
									<td><a
										href="javascript:update('<%=basePath%>','${userList.id}','${user.username}','${userPage.currentPage}');">修改</a>&nbsp;&nbsp;&nbsp;
										<a
										href="javascript:deleteOne('<%=basePath%>','${userList.id}','${user.username}','${userPage.currentPage}');">删除</a>
									</td>
								</tr>
							</c:forEach> --%>
					</table>
				<%-- 	<div class='page fix'>
						共 <b>${ userPage.allLine}</b> 条 <a
							href="javascript:findPage('<%=basePath%>','${user.username}','<%=first%>');"
							class='first'>首页</a>
						<c:if test="${userPage.currentPage>1 }">
							<a
								href="javascript:findPage('<%=basePath%>','${user.username}','${userPage.currentPage-1 }');"
								class='pre'>上一页</a>
						</c:if>
						当前第<span>${userPage.currentPage }/${userPage.allPage }</span>页

						<c:if test="${userPage.currentPage < userPage.allPage }">
							<a
								href="javascript:findPage('<%=basePath%>','${user.username}','${userPage.currentPage+1 }');"
								class='next'>下一页</a>
						</c:if>
						<a
							href="javascript:findPage('<%=basePath%>','${user.username}','${userPage.allPage }');"
							class='last'>末页</a> 跳至&nbsp;<input type='text' id="pageGo"
							value="" class='allInput w28' />&nbsp;页&nbsp; <a
							href="javascript:goPage('<%=basePath%>','${user.username}');" class='go'>GO</a>
					</div> --%>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
