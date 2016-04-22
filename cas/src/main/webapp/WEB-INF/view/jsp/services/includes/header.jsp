<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="index.html">
                <img src="images/logo-index.png" alt="">
            </a>
        </div>
		
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="services/manage.html">管理服务</a></li>
				<li><a href="services/add.html">添加服务</a></li>
				<li><a href="services/viewStatistics.html">统计信息</a></li>
				<li><a href="services/user/manage">用户管理</a></li>
				<li><a href="services/role/manage">角色管理</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li>
					<form class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Search">
						</div>
					</form>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"> <img alt="" src="<c:url value="/adminex/images/photos/user-avatar.png" />" /> John Doe <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#">Profile</a></li>
						<li><a href="#">Settings</a></li>
						<li><a id="nav-logout" href="<c:url value="/logout" />" url="<c:url value="/services/logout.html" />">Log Out</a></li>
					</ul></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>