<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<link rel="shortcut icon" href="assets/images/favicon.ico">

<title>融圳保本理财系统</title>

<link href="assets/adminex/css/style.css" rel="stylesheet">
<link href="assets/adminex/css/style-responsive.css" rel="stylesheet">

<!-- Custom Style -->
<link href="assets/css/common.css" rel="stylesheet" type="text/css">
<link href="assets/css/jquery-confirm.css" rel="stylesheet" type="text/css"/>
<link href="assets/css/roleManager.css" rel="stylesheet" type="text/css">
</head>
<body class="sticky-header">
	<section> <!-- 左侧导航栏  开始 -->
	<div><%@ include file="/include/left-side.jsp"%></div>
	<!-- 左侧导航栏  结束--> <!-- 主要内容  开始-->
	<div class="main-content">
		<!-- 头部  开始-->
		<div><%@ include file="/include/header.jsp"%></div>
		<!-- 头部  结束 -->

		<!-- 页面标题	开始 -->
		<div class="page-heading"></div>
		<!-- 页面标题	结束-->

		<!--页面主体  开始-->
		<div class="wrapper">
			<div class="col-lg-12">
				<section class="panel">
				<header class="panel-heading"> 角色管理 </header>
					<div class="panel-body">
						<!-- 员工查询 -->
						<div class="row">
							<br>
							<sec:authorize access="hasRole('ROLE_3e78e6d0c62446f4bfa3de189209003a')">	
								<div class="col-lg-2" >
									<a href="role/toAddRole" class="btn btn-danger" type="button">+添加新角色</a>
								</div>
							</sec:authorize>
							<sec:authorize access="hasRole('ROLE_7dbec705f75b439d8b53bf253b69392d')">	
								<form class="form-inline" action="role/search">
									<div class="col-lg-2">
										<div class="form-group">
											<input type="text" class="form-control" name="cName" placeholder="请输入中文角色名">&nbsp;&nbsp;&nbsp;&nbsp;
										</div>
									</div>
									<div class="col-lg-2">
										<div class="form-group">
											<input type="text" class="form-control" name="eName" placeholder="请输入英文角色名">&nbsp;&nbsp;&nbsp;&nbsp;
										</div>
									</div>
									<div class="col-lg-2">
										<button type="submit" class="btn btn-success">搜索</button>
									</div>
								</form>
							</sec:authorize>
						</div>
	
						<div class="row">
							<br>
							<div class="col-lg-12">
								<div class="table-responsive">
									<table class="table table-bordered text-center">
										<thead>
											<tr>
												<th class="text-center">序号</th>
												<th class="text-center">中文角色名</th>
												<th class="text-center">英文角色名</th>
												<th class="text-center">操作</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${roleList}" var="role" varStatus="id">
												<tr>
													<td>${id.index+1 }</td>
													<td>${role.cName }</td>
													<td>${role.eName }</td>
													<td>
														<div class="btn-group">
															<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
																操作 <span class="caret"></span>
															</button>
															<ul class="dropdown-menu" style="min-width: 60px">
																<sec:authorize access="hasRole('ROLE_c4bf86ab86804e1da2d179a62dfa8174')">	
																	<li><a href="role/detail/${role.uuid }">详情</a></li>
																</sec:authorize>
																<sec:authorize access="hasRole('ROLE_c188483f3fb343dc85fdc9294edc8cd6')">	
																	<li><a href="role/toUpdate/${role.uuid }">编辑</a></li>
																</sec:authorize>
																<sec:authorize access="hasRole('ROLE_dbad596109e94df2a1c5390fa9586028')">	
																	<li><a href="role/toAllocateResource/${role.uuid }">分配资源</a></li>
																</sec:authorize>
																<sec:authorize access="hasRole('ROLE_59db1b052eb0419a9791ad82b06d6ec6')">	
																	<li><a onclick="deleteRole('${role.uuid}')">删除</a></li>
																</sec:authorize>
															</ul>
														</div>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<div>查询到${total_mine }条记录/共${pageTotal }页</div>
								</div>
							</div>
						</div>
						<!-- 分页组件 -->
						<%@ include file="/include/page.jsp"%>
					</div>
				</section>
			</div>
		</div>

		<!--页脚区域  开始-->
		<div><%@ include file="/include/footer.jsp"%></div>
		<!--页脚区域  结束-->
	</div>
	</section>

	<!-- Placed js at the end of the document so the pages load faster -->
	<script src="assets/adminex/js/jquery-1.10.2.min.js"></script>
	<script src="assets/adminex/js/jquery-ui-1.9.2.custom.min.js"></script>
	<script src="assets/adminex/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="assets/adminex/js/bootstrap.min.js"></script>
	<script src="assets/adminex/js/modernizr.min.js"></script>
	<script src="assets/adminex/js/jquery.nicescroll.js"></script>
	<script src="assets/js/jquery-confirm.js"></script>

	<!--common scripts for all pages-->
	<script src="assets/adminex/js/scripts.js"></script>
	<script src="assets/js/roleManager.js"></script>
</body>
</html>