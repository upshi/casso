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
<!--multi-select-->
<link rel="stylesheet" type="text/css" href="css/multi-select.css" />

<title>分配用户</title>
</head>
<body class="horizontal-menu-page">
	<section>
		<%@include file="../includes/header.jsp"%>
	
			<!--页面主体  开始-->
			<div class="wrapper">
				<div class="panel">
					<header class="panel-heading"> 分配用户 </header>
					<div class="panel-body">
						<form class="form-inline" action="services/role/searchUsers">
							<input type="hidden" name="roleUuid" value="${role.uuid}"/>
							<label class="col-sm-2 control-label text-right">搜索用户:</label>
							<div class="form-group">
				                <input class="form-control" name="userName" type="text" placeholder="请输入用户名" />
							</div>
							<div class="form-group">
				                <input class="form-control" name="name" type="text" placeholder="请输入姓名" />
							</div>
							<div class="form-group">
				                <select name="sex" class="form-control">
				                	<option value="">性别</option>
				                	<option value="男">男</option>
				                	<option value="女">女</option>
				                </select>
							</div>
							<div class="form-group">
				                <select name="eduBackground" class="form-control">
				                	<option value="">教育背景</option>
				                	<option value="专科及以下">专科及以下</option>
									<option value="本科">本科</option>
									<option value="硕士">硕士</option>
									<option value="博士">博士及以上</option>
				                </select>
							</div>
							<div class="form-group">
				                <input class="form-control" name="title" type="text" placeholder="请输入职务" />
							</div>
							<div class="form-group">
				                <input class="form-control" name="department" type="text" placeholder="请输入部门" />
							</div>
							<div class="form-group">
				                <button class="btn btn-info">搜索</button>
							</div>
		                </form>
					
						<form id="userForm" class="form-horizontal" method="POST">
							<input type="hidden" name="roleUuid" value="${role.uuid}"/>
							<div class="form-group">
								<label class="col-sm-2 control-label">角色名:&nbsp;</label>
								<label class="col-sm-4 control-label" style="text-align:left">${role.cName }&nbsp;&nbsp;|&nbsp;&nbsp;${role.eName }</label>
							</div>
							
							<div class="form-group">
								<label class="control-label col-md-2"> 用户列表:</label>
								<div class="col-md-9">
									<select name="userUuid" class="multi-select" multiple="" id="multi_select">
										<c:forEach items="${userList}" var="user" varStatus="id">
											<option value="${user.uuid }" >
												${user.userName }&nbsp;&nbsp;|&nbsp;&nbsp;${user.name }
											</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="panel-body">
								<label class="col-sm-5 control-label"></label>
								<button class="btn btn-primary" type="submit" id="submit">保存</button>
							</div>
						</form>
					</div>
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
<!--multi-select-->
<script type="text/javascript" src="adminex/js/jquery-multi-select/js/jquery.multi-select.js"></script>
<script type="text/javascript" src="adminex/js/jquery-multi-select/js/jquery.quicksearch.js"></script>
<script type="text/javascript" src="js/multi-select-user.js"></script>


<!--common scripts for all pages-->
<script src="adminex/js/scripts.js"></script>
<script src="js/allocateUser.js"></script>

</body>
</html>
