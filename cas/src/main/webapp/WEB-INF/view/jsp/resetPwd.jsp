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
<link href="css/services/footer-fixed.css"  rel="stylesheet" />
<link href="css/jquery-confirm.css" rel="stylesheet">
<title>重置密码</title>
</head>
<body class="horizontal-menu-page">
	<section>
		<nav class="navbar navbar-default" role="navigation">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
		        <div class="navbar-header">
		            <a class="navbar-brand" href="index.html">
		                <img src="images/logo-index.png" alt="">
		            </a>
		        </div>
			</div>
		</nav>
		
			<!--页面主体  开始-->
			<div class="wrapper">
				<div class="col-lg-6 col-lg-offset-3">
					<section class="panel">
						<header class="panel-heading"> 重置密码 </header>
						<div class="panel-body">
							<form id="form" class="form-horizontal" method="post">
								<br>
								<div class="form-group" id="userNameGroup">
									<label for="userName" class="col-sm-2 control-label">用户名&nbsp;*</label>
	                                <div class="col-lg-8">
										<input type="text" class="form-control" id="userName" name="userName" placeholder="请输入用户名">
	                                    <p class="help-block"></p>
									</div>
								</div>
					
								<div class="form-group" id="passwordGroup">
									<label for="password" class="col-sm-2 control-label">新密码&nbsp;*</label>
	                                <div class="col-lg-8">
										<input type="password" class="form-control" id="password" name="password" placeholder="请输入新密码">
	                                    <p class="help-block"></p>
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
			<footer class="sticky-footer">
				<div id="footer" class="fl-panel fl-note fl-bevel-white fl-font-size-80">
					<a id="casso" href="https://www.casso.top" title="go to casso home page"></a>
					<div id="copyright">
						<br>
						<p>Copyright &copy; 2015 - 2016 YIHEIDAODI. All rights reserved.</p>
						<p>Powered by 王豫宁 兰州理工大学 计算机与通信学院 软件工程12级1班</p>
					</div>
				</div>
			</footer>
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
<script src="js/jquery.base64.js"></script>

<script src="js/resetPwd.js"></script>

</body>
</html>