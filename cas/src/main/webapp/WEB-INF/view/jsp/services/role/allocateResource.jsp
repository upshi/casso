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

<title>编辑角色</title>
</head>
<body class="horizontal-menu-page">
	<section>
		<%@include file="../includes/header.jsp"%>
	
			<!--页面主体  开始-->
			<div class="wrapper">
				<div class="col-lg-12">
					<section class="panel">
						<header class="panel-heading"> 分配资源 </header>
						<div class="panel-body">
							<form action="role/allocateResource" class="form-horizontal" method="POST">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								<input type="hidden" name="roleUuid" value="${role.uuid}"/>
								<div class="form-group">
									<label class="col-sm-2 control-label">角色名:&nbsp;</label>
									<label class="col-sm-4 control-label" style="text-align:left">${role.cName }&nbsp;&nbsp;|&nbsp;&nbsp;${role.eName }</label>
								</div>
								
								<div class="form-group last">
									<label class="control-label col-md-2"> 资源列表</label>
									<div class="col-md-9">
										<select name="resourceUuid" class="multi-select" multiple="" id="multi_select">
											<c:forEach items="${resourceList}" var="resource" varStatus="id">
												<option value="${resource.uuid }" <c:if test="${resource.description == '%SELECTED%@' }">selected</c:if> >
													${resource.name }&nbsp;&nbsp;|&nbsp;&nbsp;${resource.url }
												</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="panel-body">
									<label class="col-sm-5 control-label"></label>
									<sec:authorize access="hasRole('ROLE_ed18b105ecc94d5a9df80fa96c983c8f')">	
										<button class="btn btn-primary" type="submit" id="submit">保存</button>
									</sec:authorize>
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
<!--multi-select-->
<script type="text/javascript" src="adminex/js/jquery-multi-select/js/jquery.multi-select.js"></script>
<script type="text/javascript" src="adminex/js/jquery-multi-select/js/jquery.quicksearch.js"></script>
<script type="text/javascript" src="js/multi-select.js"></script>


<!--common scripts for all pages-->
<script src="adminex/js/scripts.js"></script>
<script src="js/updateRole.js"></script>

</body>
</html>
