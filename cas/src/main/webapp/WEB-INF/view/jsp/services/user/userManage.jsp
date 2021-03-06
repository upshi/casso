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
<!-- fileinput组件样式 -->
<link href="adminex/fileinput/fileinput.min.css" rel="stylesheet">
<title>用户管理</title>
</head>
<body class="horizontal-menu-page">
	<section>
		<%@include file="../includes/header.jsp"%>
		
		<!--页面主体  开始-->
		<div class="wrapper">
			<div class="panel">
				<div class="panel-heading"> 
					用户管理
				</div>
				<div class="panel-body">
					<!-- 用户查询 -->
					<form class="form-inline" action="services/user/search">
						<div class="form-group">
							<a class="btn btn-danger form-control" href="services/user/toAdd">+添加新用户</a>
						</div>
						<div class="form-group btn-group">
							<button data-toggle="dropdown" class="btn btn-danger dropdown-toggle" type="button">批量导入 <span class="caret"></span></button>
                            <ul role="menu" class="dropdown-menu">
                                <li><a id="batchImportBtn">导入用户</a></li>
                                <li><a href="http://cdn.upshi.cn/casso/user/import/batchImport.xls">下载模板</a></li>
                            </ul>
						</div>
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
			                <select name="state" class="form-control">
			                	<option value="-1">状态</option>
			                	<option value="0">已删除</option>
			                	<option value="1">已锁定</option>
			                	<option value="2">使用中</option>
			                </select>
						</div>
						<div class="form-group">
			                <input class="form-control" name="phone" type="text" placeholder="请输入手机号" />
						</div>
						<div class="form-group">
			                <input class="form-control" name="department" type="text" placeholder="请输入部门" />
						</div>
						<div class="form-group">
			                <button class="btn btn-info">搜索</button>
						</div>
	                </form>
	                <br>
					<table class="table table-bordered text-center">
						<thead>
							<tr>
								<th class="text-center">序号</th>
								<th class="text-center">用户名</th>
								<th class="text-center">姓名</th>
								<th class="text-center">性别</th>
								<th class="text-center">手机号码</th>
								<th class="text-center">部门</th>
								<th class="text-center">状态</th>
								<th class="text-center">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${userList}" var="user" varStatus="id">
								<tr>
									<td>${id.index+1 }</td>
									<td>${user.userName }</td>
									<td>${user.name }</td>
									<td>${user.sex }</td>
									<td>${user.phone }</td>
									<td>${user.department }</td>
									<td>
										<c:if test="${user.state == 0}">已删除</c:if>
										<c:if test="${user.state == 1}">已锁定</c:if>
										<c:if test="${user.state == 2}">使用中</c:if>
									</td>
									<td>
										<div class="btn-group">
											<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
												操作 <b class="caret"></b>
											</button>
											<ul class="dropdown-menu" style="min-width: 60px">
												<li><a href="services/user/detail/${user.uuid }">详情</a></li>
												<li><a href="services/user/toUpdate/${user.uuid }">编辑</a></li>
												<li><a href="services/user/toAllocateRole/${user.uuid }">分配角色</a></li>
												<li><a onclick="deleteUser('${user.uuid}','${url }')">删除</a></li>
											</ul>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<div>查询到${totals }条记录/共${totalPages }页</div>
	
					<!-- 分页组件 -->
					<%@ include file="../includes/page.jsp"%>
				</div>
			</div>
		</div>
	
		<!--页脚区域  开始-->
		<div><%@ include file="../includes/footer.jsp"%></div>
		<!--页脚区域  结束-->
	</section>


<!-- Modal Start -->
<div class="modal fade" id="batchImportModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title text-left">
					批量导入用户
				</h4>
			</div>
			<div class="modal-body row">
				<form class="form-horizontal adminex-form" method="POST" action="services/user/toBatchImport" enctype="multipart/form-data">
					<div class="form-group" id="fileGroup">
						<label class="col-sm-3 control-label">请选择Excel文件</label>
						<div class="col-sm-8">
							<input type="file" id="input-id" name="file" />
							<p class="help-block"></p>
						</div>
					</div>
					<label class="col-sm-3 control-label"></label>
					<button id="batchImportConfirm" class="btn btn-warning col-sm-2" type="submit">确定</button>
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
<script src="js/jquery-confirm.js"></script>

<!-- fileinput组件 -->
<script type="text/javascript" src="adminex/fileinput/fileinput.min.js"></script>
<script type="text/javascript" src="adminex/fileinput/fileinput_locale_zh.js"></script>

<!--common scripts for all pages-->
<script src="adminex/js/scripts.js"></script>
<script src="js/userManage.js"></script>

</body>
</html>
