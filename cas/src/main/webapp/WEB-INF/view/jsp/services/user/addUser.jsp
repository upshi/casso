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
<!-- fileinput组件样式 -->
<link href="adminex/fileinput/fileinput.min.css" rel="stylesheet">
<title>添加用户</title>
</head>
<body class="horizontal-menu-page">
	<section>
		<%@include file="../includes/header.jsp"%>
			<!--页面主体  开始-->
			<div class="wrapper">
				<div class="col-lg-12">
					<section class="panel">
						<header class="panel-heading"> 添加新用户 </header>
						<div class="panel-body">
							<form id="form" class="form-horizontal" method="post" action="services/user/addUser" enctype="multipart/form-data">
								<br>
								<div class="form-group" id="userNameGroup">
									<label for="userName" class="col-sm-3 control-label">用户名&nbsp;*</label>
	                                <div class="col-lg-3">
	                                    <div class="iconic-input right">
	                                        <input type="text" class="form-control" id="userName" name="userName" placeholder="请输入用户名">
	                                        <p class="help-block"></p>
	                                    </div>
	                                </div>
								</div>
					
								<div class="form-group" id="passwordGroup">
									<label for="password" class="col-sm-3 control-label">初始密码&nbsp;*</label>
	                                <div class="col-lg-3">
	                                    <div class="iconic-input right">
	                                        <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
	                                        <p class="help-block"></p>
	                                    </div>
	                                </div>
								</div>
								
								<div class="form-group" id="nameGroup">
									<label for="name" class="col-sm-3 control-label">姓名&nbsp;*</label>
									<div class="col-lg-3">
	                                    <div class="iconic-input right">
											<input type="text" class="form-control" id="name" name="name" placeholder="请输入姓名">
	                                        <p class="help-block"></p>
	                                    </div>
	                                </div>
								</div>
								
								<div class="form-group">
									<label class="col-sm-3 control-label">性别&nbsp;&nbsp;</label>
										<div class="col-sm-3">
										<label class="radio-inline"> <input type="radio" name="sex" value="男" checked> 男</label> 
										<label class="radio-inline"> <input type="radio" name="sex" value="女"> 女</label>
									</div>

								</div>
								
								<div class="form-group">
									<label class="col-sm-3 control-label">年龄&nbsp;&nbsp;</label>
									<div class="col-sm-3">
										<select id="age-select" name="age" class="form-control"></select>
									</div>
								</div>
								
								<div class="form-group">
									<label for="telephone" class="col-sm-3 control-label">身份证号&nbsp;&nbsp;</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" id="idNo" value=" " name="idNo" placeholder="请输入身份证号">
									</div>
								</div>
								
								<div class="form-group">
									<label for="mobilePhone" class="col-sm-3 control-label">手机号码&nbsp;&nbsp;</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" id="phone" value=" " name="phone" placeholder="请输入手机号">
									</div>
								</div>
								
								<div class="form-group">
									<label for="email" class="col-sm-3 control-label">常用邮箱&nbsp;&nbsp;</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" id="email" name="email" value=" " placeholder="请输入邮箱">
									</div>
								</div>
								
								<div class="form-group">
									<label for="email" class="col-sm-3 control-label">地址&nbsp;&nbsp;</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" name="address" value=" " placeholder="请输入地址">
									</div>
								</div>
								
								<div class="form-group" id="adddoc-imgGroup">
									<label class="col-sm-3 control-label">头像</label>
									<div class="col-sm-3">
										<div class="iconic-input right">
											<input type="file" id="input-id" name="file_data" />
											<p class="help-block"></p>
										</div>
									</div>
								</div>
								
								<div class="form-group">
									<label for="email" class="col-sm-3 control-label">教育背景&nbsp;&nbsp;</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" name="eduBackground" value=" " placeholder="">
									</div>
								</div>
								
								<div class="form-group">
									<label for="email" class="col-sm-3 control-label">部门&nbsp;&nbsp;</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" name="department" value=" " placeholder="">
									</div>
								</div>
								
								<div class="form-group">
									<label for="email" class="col-sm-3 control-label">职务&nbsp;&nbsp;</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" name="title" value=" " placeholder="">
									</div>
								</div>
								
								<div class="form-group">
									<label for="email" class="col-sm-3 control-label">描述&nbsp;&nbsp;</label>
									<div class="col-sm-3">
										<textarea class="form-control" name="description" value=" " placeholder=""></textarea>
									</div>
								</div>
					
								<br>
								<div class="panel-body">
									<label class="col-sm-3 control-label"></label>
									<button class="btn btn-primary" type="submit" id="submit">保存</button>
								</div>
							</form>
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

<!--common scripts for all pages-->
<script src="adminex/js/scripts.js"></script>
<script src="js/jquery-confirm.js"></script>
	
<!-- fileinput组件 -->
<script type="text/javascript" src="adminex/fileinput/fileinput.min.js"></script>
<script type="text/javascript" src="adminex/fileinput/fileinput_locale_zh.js"></script>

<!-- Custom JS -->
<script src="js/jquery.base64.js"></script>
<script src="js/addUser.js"></script>
<script src="js/file.js"></script>

</body>
</html>