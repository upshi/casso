<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<!--multi-select-->
<link rel="stylesheet" type="text/css" href="assets/css/multi-select.css" />

<!-- Custom Style -->
<link href="assets/css/common.css" rel="stylesheet" type="text/css">
<link href="static/css/allocateRole.css" rel="stylesheet" type="text/css">
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
						<header class="panel-heading"> 分配角色 </header>
						<div class="panel-body">
							<form action="user/allocateRole" class="form-horizontal" method="POST">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								<input type="hidden" name="userUuid" value="${user.uuid}"/>
								<div class="form-group">
									<label class="col-sm-2 control-label">姓名:&nbsp;</label>
									<label class="col-sm-4 control-label" style="text-align:left">${user.name }&nbsp;&nbsp;|&nbsp;&nbsp;${company.name }</label>
								</div>
								
								<div class="form-group last">
									<label class="control-label col-md-2"> 角色列表</label>
									<div class="col-md-9">
										<select name="roleUuid" class="multi-select" multiple="" id="multi_select">
											<c:forEach items="${roleList}" var="role" varStatus="id">
												<option value="${role.uuid }" <c:if test="${role.description == '%SELECTED%@' }">selected</c:if> >
													${role.cName }&nbsp;&nbsp;|&nbsp;&nbsp;${role.eName }
												</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="panel-body">
									<label class="col-sm-5 control-label"></label>
									<sec:authorize access="hasRole('ROLE_7fb1b2deae0e449fa1e46683e0cd9f2d')">	
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
	
	<!--multi-select-->
	<script type="text/javascript" src="assets/adminex/js/jquery-multi-select/js/jquery.multi-select.js"></script>
	<script type="text/javascript" src="assets/adminex/js/jquery-multi-select/js/jquery.quicksearch.js"></script>

	<!--common scripts for all pages-->
	<script src="assets/adminex/js/scripts.js"></script>
	<script src="assets/js/multi-select.js"></script>
	<!-- Custom JS -->
	<script type="text/javascript">
		$('#navi_user').addClass('active');
	</script>
</body>

</html>
