<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link href="adminex/css/style.css"  rel="stylesheet" />
<link href="adminex/css/style-responsive.css"  rel="stylesheet" />
<link href="css/jquery-confirm.css" rel="stylesheet" type="text/css"/>
<link href="css/services/footer.css"  rel="stylesheet" />
<title>角色管理</title>
</head>
<body class="horizontal-menu-page">
	<section>
		<%@include file="../includes/header.jsp"%>
		<h1>
			角色管理
		</h1>
		<!--页面主体  开始-->
		<div class="wrapper">
			<div class="col-lg-12">
				<section class="panel">
					<header class="panel-heading"> 角色管理 </header>
					<div class="panel-body">
						<!-- 员工查询 -->
						<div class="col-lg-2" >
							<a href="services/role/toAddRole" class="btn btn-danger" type="button">+添加新角色</a>
						</div>
						<form class="form-inline" action="services/role/search">
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
															<li><a href="services/role/detail/${role.uuid }">详情</a></li>
															<li><a href="services/role/toUpdate/${role.uuid }">编辑</a></li>
															<li><a onclick="deleteRole('${role.uuid}')">删除</a></li>
														</ul>
													</div>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div>查询到${totals }条记录/共${totalPages }页</div>
							</div>
						</div>
						<!-- 分页组件 -->
						<%@ include file="../includes/page.jsp"%>
					</div>
				</section>
			</div>
		</div>

		<!--页脚区域  开始-->
		<div><%@ include file="../includes/footer.jsp"%></div>
		<!--页脚区域  结束-->
	</section>

<script src="adminex/js/jquery-1.10.2.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="adminex/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="adminex/js/jquery-migrate-1.2.1.min.js"></script>
<script src="adminex/js/bootstrap.min.js"></script>
<script src="adminex/js/modernizr.min.js"></script>
<script src="adminex/js/jquery.nicescroll.js"></script>
<script src="js/jquery-confirm.js"></script>

<!--common scripts for all pages-->
<script src="adminex/js/scripts.js"></script>
<script src="js/roleManage.js"></script>

</body>
</html>
