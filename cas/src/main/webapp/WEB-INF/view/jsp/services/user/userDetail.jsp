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
<link href="adminex/css/style.css" rel="stylesheet" />
<link href="adminex/css/style-responsive.css" rel="stylesheet" />
<link href="css/services/footer.css"  rel="stylesheet" />
<link href="css/jquery-confirm.css" rel="stylesheet">
<title>用户详情</title>
</head>
<body class="horizontal-menu-page">
	<section>
		<%@include file="../includes/header.jsp"%>
			<!--页面主体  开始-->
			<div class="wrapper">
				<div class="col-lg-12">
					<section class="panel">
						<header class="panel-heading"> 用户信息详情 </header>
						<div class="panel-body">
							<br>
							<div class="row">
								<label class="col-sm-3 text-right">用户名:</label> <label class="col-sm-3 text-left">${user.userName}</label>
							</div>
							
							<div class="row">
								<label class="col-sm-3 text-right">姓名:</label> <label class="col-sm-3 text-left">${user.name}</label>
							</div>
							
							<div class="row">
								<label class="col-sm-3 text-right">性别:</label> <label class="col-sm-3 text-left">${user.sex}</label>
							</div>
							
							<div class="row">
								<label class="col-sm-3 text-right">年龄:</label> <label class="col-sm-3 text-left">${user.age}</label>
							</div>
							
							<div class="row">
								<label class="col-sm-3 text-right">身份证号:</label> <label class="col-sm-3 text-left">${user.idNo}</label>
							</div>
							
							<div class="row">
								<label class="col-sm-3 text-right">手机号:</label> <label class="col-sm-3 text-left">${user.phone}</label>
							</div>
							
							<div class="row">
								<label class="col-sm-3 text-right">常用邮箱:</label> <label class="col-sm-3">${user.email}</label>
							</div>
							
							<div class="row">
								<label class="col-sm-3 text-right">地址:</label> <label class="col-sm-3">${user.address}</label>
							</div>
					
							<div class="row">
								<label class="col-sm-3 text-right">教育背景:</label> <label class="col-sm-3">${user.eduBackground}</label>
							</div>
							
							<div class="row">
								<label class="col-sm-3 text-right">部门:</label> <label class="col-sm-3">${user.department}</label>
							</div>
							
							<div class="row">
								<label class="col-sm-3 text-right">职务:</label> <label class="col-sm-3">${user.title}</label>
							</div>
							
							<div class="row">
								<label class="col-sm-3 text-right">描述:</label> <label class="col-sm-3">${user.description}</label>
							</div>
							
							<div class="row">
								<br>
								<label class="col-sm-3 text-right">头像:</label> <img src="${user.photo }" height="50" width="50" />
								<br><br>
							</div>
							
							<div class="row">
								<label class="col-sm-3 text-right">状态:</label>
								<c:if test="${user.state == 0}"><label class="col-sm-3">已删除</label></c:if>
								<c:if test="${user.state == 1}"><label class="col-sm-3">已冻结</label></c:if>
								<c:if test="${user.state == 2}"><label class="col-sm-3">使用中</label></c:if>
							</div>
							
							<c:forEach items="${userRoles}" var="userRole" varStatus="id">
								<div class="row">
									<c:if test="${id.index == 0 }"><label class="col-sm-3 text-right">角色列表:</label></c:if>
									<c:if test="${id.index != 0 }"><label class="col-sm-3 text-right"></label></c:if>
									<label class="col-sm-3">${userRole.role.cName }&nbsp;&nbsp;|&nbsp;&nbsp;${userRole.role.eName }</label><br>
								</div>
							</c:forEach>
							
							<br><br><br>
							<div class="row">
								<br>
								<div class="col-sm-offset-3 col-sm-20">
									<a href="services/user/toUpdate/${user.uuid}"  class="btn btn-warning" type="button">编辑</a>&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="services/user/toAllocateRole/${user.uuid}"  class="btn btn-info" type="button">分配角色</a>&nbsp;&nbsp;&nbsp;&nbsp;
									<button id="resetPwd" uuid="${user.uuid}" class="btn btn-warning" type="button">重置密码</button>&nbsp;&nbsp;&nbsp;&nbsp;
									<button uuid="${user.uuid}" class="btn btn-info" type="button">更改头像</button>&nbsp;&nbsp;&nbsp;&nbsp;
									<a class="btn btn-danger" onclick="deleteUser('${user.uuid}')">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="services/user/manage" class="btn btn-primary"  type="button">查看人员列表</a>
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

<!-- Modal Start -->
<div class="modal fade" id="resetPwdModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title text-left">
					 重置密码
				</h4>
			</div>
			<div class="modal-body row">
				<form action="services/user/resetPwd" method="post" class="form-horizontal adminex-form" role="form">
					<input type="hidden" name="uuid" value="${user.uuid }" />
					<div class="form-group" id="passwordGroup">
						<div class="col-sm-12">
							<label for="password" class="col-sm-2 control-label">重置密码&nbsp;*</label>
							<div class="col-lg-7">
								<input type="password" class="form-control" id="password" name="password" placeholder="请输入新密码">
								<p class="help-block"></p>
							</div>
							<input id="resetPwdConfirm" class="btn btn-warning col-sm-2" type="submit" value="确认重置" />
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>
<!-- Modal End -->


<script src="adminex/js/jquery-1.10.2.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="adminex/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="adminex/js/jquery-migrate-1.2.1.min.js"></script>
<script src="adminex/js/bootstrap.min.js"></script>
<script src="adminex/js/modernizr.min.js"></script>
<script src="adminex/js/jquery.nicescroll.js"></script>

<!--common scripts for all pages-->
<script src="adminex/js/scripts.js"></script>
<script src="js/jquery-confirm.js"></script>
<script src="js/jquery.base64.js"></script>

<!-- Custom JS -->
<script src="js/userDetail.js"></script>

</body>
</html>