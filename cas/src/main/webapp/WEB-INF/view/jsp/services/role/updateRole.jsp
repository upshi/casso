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
<title>编辑角色</title>
</head>
<body class="horizontal-menu-page">
	<section>
		<%@include file="../includes/header.jsp"%>
			<!--页面主体  开始-->
			<div class="wrapper">
				<div class="col-lg-12">
					<section class="panel">
						<header class="panel-heading"> 编辑角色信息 </header>
						<div class="panel-body">
							<form id="form" class="form-horizontal" method="post" action="services/role/update" role="form">
								<input type="hidden" class="form-control" id="uuid" name="uuid" value="${role.uuid}">
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
<script src="js/jquery-confirm.js"></script>

<!--common scripts for all pages-->
<script src="adminex/js/scripts.js"></script>
<script src="js/updateRole.js"></script>

</body>
</html>
