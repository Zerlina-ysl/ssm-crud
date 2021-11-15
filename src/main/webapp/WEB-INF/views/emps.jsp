<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<%
		String appContext = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+appContext;
		request.setAttribute("APP_PATH",basePath);
	%>

	<!-- http://localhost:8080/ssm-crud/ -->
	<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<h1>SSM-CRUD</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4 col-md-offset-10">
			<button class="btn btn-primary">新增</button>
			<button class="btn btn-danger">删除</button>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<table class="table table-hover">
				<tr>
					<th>#</th>
					<th>lastName</th>
					<th>email</th>
					<th>gender</th>
					<th>deptName</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${page.list}" var="emp">
					<tr>
						<th>${emp.id }</th>
						<th>${emp.lastName }</th>
						<th>${emp.email }</th>
						<th>${emp.gender=="0"?"男":"女" }</th>
						<th>${emp.department.name }</th>
						<th >
							<button class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
								编辑</button>
							<button class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-transh" aria-hidden="true"></span>
								删除</button>
						</th>
					</tr>
				</c:forEach>
			</table>
		</div>

	</div>


	<!-- pagehelper -->
	<div class="row">

		<div class="col-md-6">
			当前${page.pageNum }页，共${page.pages }页，共${page.total }条记录
		</div>
		<div class="col-md-6">
			<nav aria-label="Page navigation">
				<ul class="pagination">
					<li><a href="${ APP_PATH}/emps?pn=1">首页</a></li>
					<c:if test="${page.hasPreviousPage }">
						<li><a href="${ APP_PATH}/emps?pn=${ page.pageNum-1}" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span></a> </li>
					</c:if>
					<c:forEach items="${page.navigatepageNums }" var="i">
						<c:if test="${ i==page.pageNum}">
							<li class="active"><a href="#">${i }</a></li>
						</c:if>
						<!-- 本页高亮 -->
						<c:if test="${ i!=page.pageNum}">
							<li class="disable"><a href="${ APP_PATH}/emps?pn=${ i}">${i }</a></li>
						</c:if>

					</c:forEach>
					<c:if test="${page.hasNextPage }">
						<li><a href="${ APP_PATH}/emps?pn=${ page.pageNum+1}" aria-label="Next">
							<span aria-hidden="true">&raquo;</span> </a></li>
					</c:if>
					<li><a href="${APP_PATH }/emps?pn=${page.pages}">末页</a></li>
				</ul>
			</nav>

		</div>
	</div>
	<div class="row"></div>
	<div class="row"></div>


</div>

</body>
</html>