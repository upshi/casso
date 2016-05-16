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
<title>个人信息</title>
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
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
						<li>
							<form class="navbar-form navbar-left" role="search">
								<div class="form-group">
									<input type="text" class="form-control" placeholder="Search">
								</div>
							</form>
						</li>
						<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"> <img alt="" src="${user.photo }" /> 欢迎您,${user.name } <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="self/info">个人信息</a></li>
								<li><a href="#">修改密码</a></li>
								<li><a id="nav-logout" href="<c:url value="/logout" />" url="<c:url value="/services/logout.html" />">登出</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		
		<!--页面主体  开始-->
			<div class="wrapper">
				<div class="col-lg-12">
					<section class="panel">
						<header class="panel-heading"> 个人信息 </header>
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
							
							<br><br><br>
							<div class="row">
								<br>
								<div class="col-sm-offset-2 col-sm-20">
									<button id="updateInfo"  class="btn btn-success" type="button">编辑</button>&nbsp;&nbsp;&nbsp;&nbsp;
									<button id="resetPwd" uuid="${user.uuid}" class="btn btn-success" type="button">修改密码</button>&nbsp;&nbsp;&nbsp;&nbsp;
									<button id="updatePhoto" uuid="${user.uuid}" class="btn btn-success" type="button">更改照片</button>&nbsp;&nbsp;&nbsp;&nbsp;
								</div>
							</div>
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
<!-- Modal Start -->
<div class="modal fade" id="resetPwdModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title text-left">
					 修改密码
				</h4>
			</div>
			<div class="modal-body row form-horizontal">
				<div class="form-group" id="oldPasswordGroup">
					<label class="col-sm-2 control-label">原密码&nbsp;*</label>
					<div class="col-lg-7">
						<input type="password" uuid="${user.uuid }" class="form-control" id="oldPassword" placeholder="请输入原密码">
						<p class="help-block"></p>
					</div>
				</div>
				<div class="form-group" id="passwordGroup">
					<label for="password" class="col-sm-2 control-label">新密码&nbsp;*</label>
					<div class="col-lg-7">
						<input type="password" uuid="${user.uuid }" class="form-control" id="password" name="password" placeholder="请输入新密码">
						<p class="help-block"></p>
					</div>
				</div>
				<button id="resetPwdConfirm" class="btn btn-warning col-sm-2 col-sm-offset-2" type="submit">确认</button>
			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>
<!-- Modal End -->

<!-- Modal Start -->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title text-left">
					 编辑个人信息
				</h4>
			</div>
			<div class="modal-body row">
				<form id="form" class="form-horizontal" method="post" action="self/updateInfo" enctype="multipart/form-data">
					<input type="hidden" name="uuid" value="${user.uuid }" />
					<br>
					<div class="form-group">
						<label class="col-sm-3 control-label">用户名&nbsp;*</label>
                        <label class="col-sm-7 text-left">${user.userName}</label>
					</div>
					
					<div class="form-group" id="nameGroup">
						<label for="name" class="col-sm-3 control-label">姓名&nbsp;*</label>
	                    <div class="col-lg-9">
							<input type="text" class="form-control" id="name" name="name" placeholder="请输入姓名" value="${user.name }" />
							<p class="help-block"></p>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label">性别&nbsp;&nbsp;</label>
						<div class="col-sm-7">
							<c:if test="${user.sex == '男' }">
								<label class="radio-inline"> <input type="radio" name="sex" value="男" checked> 男</label> 
								<label class="radio-inline"> <input type="radio" name="sex" value="女"> 女</label>
							</c:if>
							<c:if test="${user.sex == '女' }">
								<label class="radio-inline"> <input type="radio" name="sex" value="男"> 男</label> 
								<label class="radio-inline"> <input type="radio" name="sex" value="女" checked> 女</label>
							</c:if>
						</div>

					</div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label">年龄&nbsp;&nbsp;</label>
						<div class="col-sm-7">
							<select id="age-select" name="age" class="form-control" age="${user.age }"></select>
						</div>
					</div>
					
					<div class="form-group" id="idNoGroup">
						<label for="telephone" class="col-sm-3 control-label">身份证号&nbsp;&nbsp;</label>
						<div class="col-lg-9">
							<input type="text" class="form-control" id="idNo" value="${user.idNo }" name="idNo" placeholder="请输入身份证号">
                                  <p class="help-block"></p>
						</div>
					</div>
					
					<div class="form-group" id="phoneGroup">
						<label for="mobilePhone" class="col-sm-3 control-label">手机号码&nbsp;*</label>
						<div class="col-lg-9">
							<input type="text" class="form-control" id="phone" value="${user.phone }" name="phone" placeholder="请输入手机号">
                                  <p class="help-block"></p>
						</div>
					</div>
					
					<div class="form-group" id="emailGroup">
						<label for="email" class="col-sm-3 control-label">常用邮箱&nbsp;*</label>
						<div class="col-lg-9">
							<input type="text" class="form-control" id="email" name="email" value="${user.email }" placeholder="请输入邮箱">
                                  <p class="help-block"></p>
						</div>
					</div>
					
					<div class="form-group">
						<label for="email" class="col-sm-3 control-label">地址&nbsp;&nbsp;</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="address" value="${user.address }" placeholder="请输入地址">
						</div>
					</div>
					
					<div class="form-group">
						<label for="email" class="col-sm-3 control-label">教育背景&nbsp;&nbsp;</label>
						<div class="col-sm-7">
							<select id="eduBackground-select" class="form-control" name="eduBackground" eduBackground="${user.eduBackground }">
								<option value="专科及以下">专科及以下</option>
								<option value="本科">本科</option>
								<option value="硕士">硕士</option>
								<option value="博士">博士及以上</option>
							</select>
						</div>
					</div>
					
					<div class="form-group">
						<label for="email" class="col-sm-3 control-label">部门&nbsp;&nbsp;</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="department" value="${user.department }" placeholder="">
						</div>
					</div>
					
					<div class="form-group">
						<label for="email" class="col-sm-3 control-label">职务&nbsp;&nbsp;</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="title" value="${user.title }" placeholder="">
						</div>
					</div>
					
					<div class="form-group">
						<label for="email" class="col-sm-3 control-label">描述&nbsp;&nbsp;</label>
						<div class="col-sm-7">
							<textarea class="form-control" name="description" placeholder="">${user.description}</textarea>
						</div>
					</div>
		
					<br>
					<div class="panel-body">
						<label class="col-sm-3 control-label"></label>
						<button class="btn btn-primary" type="submit" id="submit">保存</button>
					</div>
				</form>
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
				<form class="form-horizontal adminex-form" method="POST" action="self/updatePhoto" enctype="multipart/form-data">
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

<script src="js/info.js"></script>
<script src="js/updateInfo.js"></script>
</body>
</html>