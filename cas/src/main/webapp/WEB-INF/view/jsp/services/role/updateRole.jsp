<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
<link href="static/css/updateRole.css" rel="stylesheet" type="text/css">
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
						<header class="panel-heading"> 编辑角色信息 </header>
						<div class="panel-body">
							<form id="form" class="form-horizontal" method="post" action="role/update" role="form">
								<input type="hidden" class="form-control" id="uuid" name="uuid" value="${role.uuid}">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								<br>
								<div class="form-group" id="cNameGroup">
									<label for="cName" class="col-sm-3 control-label">角色中文名&nbsp;*</label>
									<div class="col-sm-4">
										<input type="text" originalCName="${role.cName }" class="form-control" id="cName" name="cName" placeholder="请输入角色中文名" value="${role.cName }"/>
										<p class="help-block"></p>
									</div>
								</div>
								
								<div class="form-group" id="eNameGroup">
									<label for="sn" class="col-sm-3 control-label">角色英文名&nbsp;*</label>
									<div class="col-sm-4">
										<input type="text" originalEName="${role.eName }" class="form-control" id="eName" name="eName" placeholder="请输入角色英文名" value="${role.eName }"/>
										<p class="help-block"></p>
									</div>
								</div>
					
								<div class="form-group">
									<label for="description" class="col-sm-3 control-label">公司简介</label>
									<div class="col-sm-4">
										<textarea class="form-control" rows="4" id="description" name="description" placeholder="请输入角色描述">${role.description }</textarea>
									</div>
								</div>
								<br>
								<div class="panel-body">
									<label class="col-sm-3 control-label"></label>
									<sec:authorize access="hasRole('ROLE_ec7aa29f5d854d07abe547e3f15fb64a')">	
										<button class="btn btn-primary" type="submit" id="submit">保存</button>
									</sec:authorize>
								</div>
							</form>
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
	<script src="assets/js/jquery.base64.js"></script>

	<!--common scripts for all pages-->
	<script src="assets/adminex/js/scripts.js"></script>
	<!-- Custom JS -->
	<script src="assets/js/updateRole.js"></script>
</body>

</html>
