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
<!-- fileinput组件样式 -->
<link href="adminex/fileinput/fileinput.min.css" rel="stylesheet">
<title>批量导入用户</title>
</head>
<body class="horizontal-menu-page">
	<section>
		<%@include file="../includes/header.jsp"%>
			<!--页面主体  开始-->
			<div class="wrapper">
				<div class="col-sm-12">
	                <section class="panel">
	                    <header class="panel-heading">
	                    	<h4>
		                    	<c:if test="${errors > 0 }">此次导入<span style="color:blue">${total }</span>名用户,其中有误信息<span style="color:red">${errors }</span>名,正确信息<span style="color:green">${corrects }</span>名</c:if>
		                    	<c:if test="${errors == 0 }">此次导入<span style="color:green">${total }</span>名用户信息全部正确</c:if>
		                    	<c:if test="${corrects > 0 }">
		                    		<a href="services/user/manage" class="btn btn-warning pull-right" >返回</a>
		                    		&nbsp;&nbsp;&nbsp;&nbsp;
		                    		<button id="importBtn" class="btn btn-warning pull-right">导入所有正确用户</button>
		                    	</c:if>
		                    	
	                    	</h4>
	                    </header>
	                    <div class="panel-body">
	                    	<c:if test="${errors > 0 }">
		                        <table class="table table-hover">
		                            <thead>
		                            <tr>
		                                <th>序号</th>
		                                <th>用户名</th>
		                                <th>错误项</th>
		                            </tr>
		                            </thead>
		                            <tbody>
			                           <c:forEach items="${errorUsers }" var="errorUser" varStatus="line">
							                <tr>
												<td>${line.index+1 }</td>
												<td>${errorUser.userName }</td>
												<td>
													<c:forEach items="${errorUser.errors }" var="error" varStatus="id">
														${id.index+1}、${error }<br>
													</c:forEach>
												</td>
											</tr>
										</c:forEach>
		                            </tbody>
		                        </table>
		                     </c:if>
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

<!-- Custom JS -->
<script src="js/batchImport.js"></script>

</body>
</html>