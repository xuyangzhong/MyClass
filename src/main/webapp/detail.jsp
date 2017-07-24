<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="com.zxy.model.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
   <meta charset="utf-8"> 
   <title>假期请假</title>
   <link rel="stylesheet" href="css/bootstrap.min.css">  
   <script src="js/jquery.min.js"></script>
   <script src="js/bootstrap.min.js"></script>
   <script type="text/javascript">
	function load(){
		var user="${user}";
		if(user==null||user==""){
			window.location.href="login.jsp";
		}
	}
	</script>
</head>
<body onload="load()">
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="index.jsp"><strong >MyClass</strong></a>
				</div>
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
               
               <ul class="nav navbar-nav navbar-right">
                  <li>
                      <a id="username">${user.username}</a>
                  </li>
                  <li class="dropdown">
                      <a class="dropdown-toggle" data-toggle="dropdown">欢迎您<strong class="caret"></strong></a>
                     <ul class="dropdown-menu">
                     	<li>
                     		<a href="index.jsp">回到首页</a>
                     	</li>
                        <li>
                            <a href="ExitServlet">退出</a>
                        </li>
                     </ul>
                  </li>
               </ul>
            </div>
				
			</nav>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-12 column">
			<c:choose>
			<c:when test="${!empty submitwork}">
				<table class="table table-hover">
					<thead>
						<tr>
							<th width="30%">
								课程id
							</th>
							<th width="30%">
								姓名
							</th>
							<th width="40%">
								提交时间
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								${submitwork.workid}
							</td>
							<td>
								${submitwork.username}
							</td>
							<td>
								<fmt:formatDate pattern="yyyy-MM-dd" value="${submitwork.subdate}"/>
							</td>
						</tr>
					</tbody>
				</table>
				<div align="center">
					<button type="button" class="btn btn-primary btn-default" onclick="window.location.href='SubmitServlet?askname=true&workid=${workid}'">提交并覆盖本课程实验</button>
					<p class="help-block">若想删除之前上传，只需重新上传即可覆盖</p>
    				<p class="help-block">若重复提交，只有最后一次提交的记录</p>
				</div> 
			</c:when>
			<c:otherwise>
			<table height="350px">
			</table>
			<div align="center">
				<button type="button" class="btn btn-primary btn-default" onclick="window.location.href='SubmitServlet?askname=true&workid=${workid}'">提交本课程实验</button>
			</div> 
			</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>
</body>