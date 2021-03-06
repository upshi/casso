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
<link href="adminex/css/style.css" rel="stylesheet" />
<link href="adminex/css/style-responsive.css" rel="stylesheet" />
<link href="css/services/footer.css"  rel="stylesheet" />
<link href="css/jquery-confirm.css" rel="stylesheet">
<link href="css/zoom.css" rel="stylesheet">
<!-- fileinput组件样式 -->
<link href="adminex/fileinput/fileinput.min.css" rel="stylesheet">
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
								<div class="col-sm-2 col-sm-offset-2">
									<session class="panel">
										<header class="panel-heading text-center">
											<b>用户名:</b>
										</header>
									</session>
								</div>
								<div class="col-sm-3">
									<session class="panel">
										<header class="panel-heading">
											${user.userName}
										</header>
									</session>
								</div>
							</div>
							
							<div class="row">
								<div class="col-sm-2 col-sm-offset-2">
									<session class="panel">
										<header class="panel-heading text-center">
											<b>姓名:</b>
										</header>
									</session>
								</div>
								<div class="col-sm-3">
									<session class="panel">
										<header class="panel-heading">
											${user.name}
										</header>
									</session>
								</div>
							</div>
							
							<div class="row">
								<div class="col-sm-2 col-sm-offset-2">
									<session class="panel">
										<header class="panel-heading text-center">
											<b>性别:</b>
										</header>
									</session>
								</div>
								<div class="col-sm-3">
									<session class="panel">
										<header class="panel-heading">
											${user.sex}
										</header>
									</session>
								</div>
							</div>
							
							<div class="row">
								<div class="col-sm-2 col-sm-offset-2">
									<session class="panel">
										<header class="panel-heading text-center">
											<b>年龄:</b>
										</header>
									</session>
								</div>
								<div class="col-sm-3">
									<session class="panel">
										<header class="panel-heading">
											${user.age}
										</header>
									</session>
								</div>
							</div>
							
							<div class="row">
								<div class="col-sm-2 col-sm-offset-2">
									<session class="panel">
										<header class="panel-heading text-center">
											<b>身份证号:</b>
										</header>
									</session>
								</div>
								<div class="col-sm-3">
									<session class="panel">
										<header class="panel-heading">
											${user.idNo}
										</header>
									</session>
								</div>
							</div>
							
							<div class="row">
								<div class="col-sm-2 col-sm-offset-2">
									<session class="panel">
										<header class="panel-heading text-center">
											<b>手机号:</b>
										</header>
									</session>
								</div>
								<div class="col-sm-3">
									<session class="panel">
										<header class="panel-heading">
											${user.phone}
										</header>
									</session>
								</div>
							</div>
							
							<div class="row">
								<div class="col-sm-2 col-sm-offset-2">
									<session class="panel">
										<header class="panel-heading text-center">
											<b>常用邮箱:</b>
										</header>
									</session>
								</div>
								<div class="col-sm-3">
									<session class="panel">
										<header class="panel-heading">
											${user.email}
										</header>
									</session>
								</div>
							</div>
							
							<div class="row">
								<div class="col-sm-2 col-sm-offset-2">
									<session class="panel">
										<header class="panel-heading text-center">
											<b>地址:</b>
										</header>
									</session>
								</div>
								<div class="col-sm-6">
									<session class="panel">
										<header class="panel-heading">
											${user.address}
										</header>
									</session>
								</div>
							</div>
							
							<div class="row">
								<div class="col-sm-2 col-sm-offset-2">
									<session class="panel">
										<header class="panel-heading text-center">
											<b>教育背景:</b>
										</header>
									</session>
								</div>
								<div class="col-sm-3">
									<session class="panel">
										<header class="panel-heading">
											${user.eduBackground}
										</header>
									</session>
								</div>
							</div>
							
							<div class="row">
								<div class="col-sm-2 col-sm-offset-2">
									<session class="panel">
										<header class="panel-heading text-center">
											<b>部门:</b>
										</header>
									</session>
								</div>
								<div class="col-sm-3">
									<session class="panel">
										<header class="panel-heading">
											${user.department}
										</header>
									</session>
								</div>
							</div>
							
							<div class="row">
								<div class="col-sm-2 col-sm-offset-2">
									<session class="panel">
										<header class="panel-heading text-center">
											<b>职务:</b>
										</header>
									</session>
								</div>
								<div class="col-sm-3">
									<session class="panel">
										<header class="panel-heading">
											${user.title}
										</header>
									</session>
								</div>
							</div>
							
							<div class="row">
								<div class="col-sm-2 col-sm-offset-2">
									<session class="panel">
										<header class="panel-heading text-center">
											<b>描述:</b>
										</header>
									</session>
								</div>
								<div class="col-sm-6">
									<session class="panel">
										<header class="panel-heading">
											${user.description}
										</header>
									</session>
								</div>
							</div>
							
							<div class="row">
								<div class="col-sm-2 col-sm-offset-2">
									<session class="panel">
										<header class="panel-heading text-center">
											<b>照片:</b>
										</header>
									</session>
								</div>
								<div class="col-sm-3">
									<session class="panel">
										<header class="panel-heading">
											<c:if test="${user.photo != null && user.photo != '' }">
												<img data-action="zoom" src="${user.photo }" height="100" width="100" />
											</c:if>
										</header>
									</session>
								</div>
							</div>
							
							<div class="row">
								<div class="col-sm-2 col-sm-offset-2">
									<session class="panel">
										<header class="panel-heading text-center">
											<b>状态:</b>
										</header>
									</session>
								</div>
								<div class="col-sm-3">
									<session class="panel">
										<header class="panel-heading">
											<c:if test="${user.state == 0}">已删除</c:if>
											<c:if test="${user.state == 1}">已锁定</c:if>
											<c:if test="${user.state == 2}">使用中</c:if>
										</header>
									</session>
								</div>
							</div>
							
							<c:forEach items="${userRoles}" var="userRole" varStatus="id">
								<div class="row">
									<c:if test="${id.index == 0 }">
										<div class="col-sm-2 col-sm-offset-2">
											<session class="panel">
												<header class="panel-heading text-center">
													<b>角色列表:</b>
												</header>
											</session>
										</div>
									</c:if>
									<c:if test="${id.index != 0 }">
										<div class="col-sm-2 col-sm-offset-2">
											
										</div>
									</c:if>
									<div class="col-sm-3">
										<session class="panel">
											<header class="panel-heading">
												${userRole.role.cName }&nbsp;&nbsp;|&nbsp;&nbsp;${userRole.role.eName }
											</header>
										</session>
									</div>
								</div>
							</c:forEach>
							
							<br><br><br>
							<div class="row">
								<br>
								<div class="col-sm-offset-2 col-sm-20">
									<a href="services/user/toUpdate/${user.uuid}"  class="btn btn-success" type="button">编辑</a>&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="services/user/toAllocateRole/${user.uuid}"  class="btn btn-success" type="button">分配角色</a>&nbsp;&nbsp;&nbsp;&nbsp;
									<button id="resetPwd" uuid="${user.uuid}" class="btn btn-success" type="button">重置密码</button>&nbsp;&nbsp;&nbsp;&nbsp;
									<button id="updatePhoto" uuid="${user.uuid}" class="btn btn-success" type="button">更改照片</button>&nbsp;&nbsp;&nbsp;&nbsp;
									<c:if test="${user.state == 1}" >
										<button id="unlock" uuid="${user.uuid}" class="btn btn-warning" type="button">解锁用户</button>&nbsp;&nbsp;&nbsp;&nbsp;
										<a class="btn btn-danger" onclick="deleteUser('${user.uuid}')">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;
									</c:if>
									<c:if test="${user.state == 2}" >
										<button id="lock" uuid="${user.uuid}" class="btn btn-warning" type="button">锁定用户</button>&nbsp;&nbsp;&nbsp;&nbsp;
										<a class="btn btn-danger" onclick="deleteUser('${user.uuid}')">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;
									</c:if>
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
				<div class="form-group" id="passwordGroup">
					<div class="col-sm-12 form-horizontal adminex-form">
						<label for="password" class="col-sm-2 control-label">新密码&nbsp;*</label>
						<div class="col-lg-7">
							<input type="password" uuid="${user.uuid }" class="form-control" id="password" name="password" placeholder="请输入新密码">
							<p class="help-block"></p>
						</div>
						<button id="resetPwdConfirm" class="btn btn-warning col-sm-2" type="submit">确认重置</button>
					</div>
				</div>
			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>
<!-- Modal End -->

<!-- Modal Start -->
<div class="modal fade" id="updatePhotoModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title text-left">
					 更改照片
				</h4>
			</div>
			<div class="modal-body row">
				<form class="form-horizontal adminex-form" method="POST" action="services/user/updatePhoto" enctype="multipart/form-data">
					<input type="hidden" name="uuid" value="${user.uuid }" />
					<div class="form-group" id="photoGroup">
						<label class="col-sm-2 control-label">请选择</label>
						<div class="col-sm-7">
							<input type="file" id="input-id" name="file_data" />
							<p class="help-block"></p>
						</div>
					</div>
					<label class="col-sm-3 control-label"></label>
					<button id="updatePhotoConfirm" class="btn btn-warning col-sm-2" type="submit">确定</button>
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

<!-- fileinput组件 -->
<script type="text/javascript" src="adminex/fileinput/fileinput.min.js"></script>
<script type="text/javascript" src="adminex/fileinput/fileinput_locale_zh.js"></script>
<script src="js/file.js"></script>

<!-- Zoom -->
<script src="js/zoom.min.js"></script>
<script src="js/transition.js"></script>

<!-- Custom JS -->
<script src="js/userDetail.js"></script>

</body>
</html>