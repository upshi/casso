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
<link rel="icon" href="images/favicon.ico" type="image/x-icon" />
<link href="adminex/css/style.css"  rel="stylesheet" />
<link href="adminex/css/style-responsive.css"  rel="stylesheet" />
<link href="css/jquery-confirm.css" rel="stylesheet" type="text/css"/>
<link href="css/services/footer.css"  rel="stylesheet" />
<title>角色详情</title>
</head>
<body class="horizontal-menu-page">
	<section>
		<%@include file="../includes/header.jsp"%>
			<!--页面主体  开始-->
			<div class="wrapper">
				<div class="col-lg-12">
					<section class="panel">
						<header class="panel-heading">角色信息详情 </header>
						<div class="panel-body">
							<br>
							<div class="row">
								<label class="col-sm-2 text-right">角色中文名:</label> <label class="col-sm-8 text-left">${role.cName}</label>
							</div>
							
							<div class="row">
								<label class="col-sm-2 text-right">角色英文名:</label> <label class="col-sm-8 text-left">${role.eName}</label>
							</div>
					
							<div class="row">
								<label class="col-sm-2 text-right">角色描述:</label> <label class="col-sm-8">${role.description}</label>
							</div>
							
							<div class="row">
								<br>
								<div class="col-sm-offset-3  col-sm-20">
									<c:if test="${role.eName != 'ROLE_ADMIN' && role.eName != 'ROLE_USER' }">
										<a href="services/role/toUpdate/${role.uuid}"  class="btn btn-warning" type="button">编辑</a>&nbsp;&nbsp;&nbsp;&nbsp;
										<button class="btn btn-danger" onclick="deleteRole('${role.uuid}')">删除</button>&nbsp;&nbsp;&nbsp;&nbsp;
									</c:if>
									<a href="services/role/manage" class="btn btn-primary"  type="button">查看角色列表</a>
								</div>
							</div>
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
<script src="js/roleDetail.js"></script>

</body>
</html>
