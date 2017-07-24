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
			<table class="table table-hover">
				<thead>
					<tr>
						<th width="20%">
							序号
						</th>
						<th width="20%">
							课程id
						</th>
						<th width="30%">
							课程名
						</th>
						<th width="30%">
							起止时间
						</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
					<c:when test="${empty workTable}">
					
					</c:when>
					<c:otherwise>
						<c:forEach items="${workTable.worklist}" var="h" varStatus="vh">
							<tr onclick="window.location.href='SubmitServlet?search=false&add=false&delete=false&detail=true&workid=${h.id}'">
								<td>
									${vh.count }
								</td>
								<td>
									${h.id }
								</td>
								<td>
									${h.workname }
								</td>
								<td>
									<fmt:formatDate pattern="yyyy-dd-MM" value="${h.workbegintime}"/>
									~
									<fmt:formatDate pattern="yyyy-dd-MM" value="${h.workendtime}"/>
								</td>
						</c:forEach>
					</tr>
					</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>