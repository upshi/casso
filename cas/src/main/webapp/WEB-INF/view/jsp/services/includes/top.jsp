<%--

    Licensed to Jasig under one or more contributor license
    agreements. See the NOTICE file distributed with this work
    for additional information regarding copyright ownership.
    Jasig licenses this file to you under the Apache License,
    Version 2.0 (the "License"); you may not use this file
    except in compliance with the License.  You may obtain a
    copy of the License at the following location:

      http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.

--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page language="java" session="false"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="top.casso.cas.model.User" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title><spring:message code="${pageTitle}" text="Logged Out" /></title>
<meta name="version" content="<%=org.jasig.cas.CasVersion.getVersion()%>" />
<link rel="icon" href="<c:url value="/images/favicon.ico" />" type="image/x-icon" />

<link href="<c:url value="/adminex/css/style.css" />"  rel="stylesheet" />
<link href="<c:url value="/adminex/css/style-responsive.css" />"  rel="stylesheet" />

<link rel="stylesheet" href="<c:url value="/css/services/cas.css" />" type="text/css" />
<script src="<c:url value="/adminex/js/jquery-1.10.2.min.js" />"></script>
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->

<style type="text/css">
#$ {
pageTitle
}
span {
	background: #fff;
	color: #000;
}
</style>
</head>

<body class="horizontal-menu-page">
<%
	User loginUser = (User)request.getSession().getAttribute("loginUser");
%>


<section>
    <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
        	<!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <a class="navbar-brand" href="index.html">
                    <img src="<c:url value="/images/logo-index.png" />" alt="">
                </a>
            </div>
            
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li id="navi_service_manage"><a id="manageServiceView" href="<c:url value='/services/manage.html' />">服务管理</a></li>
                    <li id="navi_add_service"><a id="addServiceView" href="<c:url value='/services/add.html' />"><spring:message code="addServiceView" /></a></li>
                    <li id="navi_statistics"><a id="viewStatisticsView" href="<c:url value='/services/viewStatistics.html' />"><spring:message code="viewStatisticsView" /></a></li>
                    <li id="navi_user_manage"><a href="<c:url value='/services/user/manage' />">用户管理</a></li>
                    <li id="navi_role_manage"><a href="<c:url value='/services/role/manage' />">角色管理</a></li>
                </ul>

                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <form class="navbar-form navbar-left" role="search">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Search">
                            </div>
                        </form>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <img alt="" src="<c:url value="<%=loginUser.getPhoto() %>" />" /> 欢迎您 ,<%=loginUser.getName() %> <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="<c:url value="/self/info" />">个人信息</a></li>
                            <li><a href="">修改密码</a></li>
                            <li><a id="nav-logout" href="<c:url value="/logout" />" url="<c:url value="/services/logout.html" />">登出</a></li>
                        </ul>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
    
    <!-- 在单点退出之前  先退出本应用 -->
    <script>
		$('#nav-logout').on('click', function(){
			var flag = false;
			$.ajax({
				url: $(this).attr('url'), 
				async : false ,
				success: function(){
					flag = true;
				}
			});
			return flag;
		})
	</script>

    <!--body wrapper start-->
    <div class="wrapper">
		