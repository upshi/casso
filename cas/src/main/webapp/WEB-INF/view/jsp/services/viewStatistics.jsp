<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<%@include file="includes/top.jsp"%>
<h1>
	<spring:message code="${pageTitle}" text="Logged Out" />
</h1>

<h2>运行时统计数据</h2>
<table width="1000">
    <tbody>
    	<tr>
            <td><b>属性</b></td>
            <td><b>值</b></td>
        </tr>
        <tr>
            <td>服务器</td>
            <td>${serverIpAddress} (${serverHostName})</td>
        </tr>
        <tr>
            <td>中央认证服务票据后缀</td>
            <td>${casTicketSuffix}</td>
        </tr>
        <tr>
            <td>服务开始时间</td>
            <td>
            	<fmt:formatDate value="${startTime}" pattern="yyyy年MM月dd日   E  HH:mm:ss"/>
            </td>
        </tr>
        <tr>
            <td>持续时间</td>
            <td>${upTime}</td>
        </tr>
        <tr>
            <td>内存</td>
            <td> ${freeMemory} MB 空闲 <img src="../images/green.gif" width="${freeMemory / (totalMemory) * 500}" height="30" /><img src="../images/red.gif" width="${(totalMemory - freeMemory) / totalMemory * 500}" height="30" /> ${totalMemory} MB 总共 </td>
        </tr>
        <tr>
            <td>最大内存</td>
            <td>${maxMemory} MB</td>
        </tr>
        <tr>
            <td>有效处理器</td>
            <td>${availableProcessors}</td>
        </tr>
    </tbody>
</table>

<br /><br />

<h2>Ticket Registry 统计数据</h2>
<table width="1000">
    <tbody>
    	<tr>
            <td><b>属性</b></td>
            <td><b>值</b></td>
        </tr>
        <tr>
            <td>有效 TGTs</td>
            <td>${unexpiredTgts}</td>
        </tr>
        <tr>
            <td>有效 STs</td>
            <td>${unexpiredSts}</td>
        </tr>
        <tr>
            <td>失效 TGTs</td>
            <td>${expiredTgts}</td>
        </tr>
        <tr>
            <td>失效 STs</td>
            <td>${expiredSts}</td>
        </tr>
    </tbody>
</table>
<br>
<h2>性能统计数据</h2>
<br>
<c:forEach items="${graphingStatisticAppenders}" var="appender">
	<h3>${appender.name}</h3>
	<img src="${appender.chartGenerator.chartUrl}" alt="${appender.name}" />
</c:forEach>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

<script type="text/javascript">
	document.getElementById('navi_statistics').setAttribute('class','active'); 
</script> 
<%@include file="includes/bottom.jsp" %>