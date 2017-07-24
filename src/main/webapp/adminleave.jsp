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
		var admin="${admin}";
		if(admin==null||admin==""){
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
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="adminindex.jsp"><strong >MyClass</strong></a>
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
                     		<a href="adminindex.jsp">回到首页</a>
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
		<c:when test="${empty leavePeo}">
			<ul class="nav nav-pills">
				<li class="active" id="nonehomestar" name="nonehomestar">
					 <a onclick="nonehomeshow()"> <span class="badge pull-right"></span>回家</a>
				</li>
				<li id="nonetravelstar" name="nonetravelstar">
					 <a onclick="nonetravelshow()"> <span class="badge pull-right"></span>旅游</a>
				</li>
			</ul>
			<table height="300px"></table>
			<div align="center">
				<button type="button" class="btn btn-primary btn-default disabled">查看table页面</button>
			</div>
		</c:when>
		<c:otherwise>
			<ul class="nav nav-pills">
				<li class="active" id="homestar" name="homestar">
					 <a onclick="homeshow()" > <span class="badge pull-right">${leavePeo.homenum eq 0 ? 0 : leavePeo.homenum }</span>回家</a>
				</li>
				<li id="travelstar" name="travelstar">
					 <a onclick="travelshow()"> <span class="badge pull-right">${leavePeo.travelnum eq 0 ? 0 : leavePeo.travelnum }</span>旅游</a>
				</li>
			</ul>
			<table class="table table-hover" id="hometable" name="hometable">
				<thead>
					<tr>
						<th width="5%">
							序号
						</th>
						<th width="10%">
							学号
						</th>
						<th width="7%">
							姓名
						</th>
						<th width="5%">
							性别
						</th>
						<th width="10%">
							寝室号
						</th>
						<th width="10%">
							班级
						</th>
						<th width="10%">
							电话号码
						</th>
						<th width="23%">
							家庭地址
						</th>
						<th width="10%">
							电话号码
						</th>
						<th width="10%">
							状态
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${leavePeo.homepeo}" var="h" varStatus="vh">
					<tr>
						<td>
							${vh.count }
						</td>
						<td>
							${h.id}
						</td>
						<td>
							${h.username}
						</td>
						<td>
							${h.sex}
						</td>
						<td>
							${h.dorm}
						</td>
						<td>
							${h.classname}
						</td>
						<td>
							${h.mobilephone}
						</td>
						<td>
							${h.address}
						</td>
						<td>
							${h.homephone}
						</td>
						<td>
							回家
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<table class="table table-hover hidden" id="traveltable" name="traveltable">
				<thead>
					<tr>
						<th width="5%">
							序号
						</th>
						<th width="10%">
							学号
						</th>
						<th width="7%">
							姓名
						</th>
						<th width="5%">
							性别
						</th>
						<th width="10%">
							寝室号
						</th>
						<th width="10%">
							班级
						</th>
						<th width="10%">
							电话号码
						</th>
						<th width="23%">
							家庭地址
						</th>
						<th width="10%">
							电话号码
						</th>
						<th width="10%">
							状态
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${leavePeo.travelpeo}" var="h" varStatus="vh">
					<tr>
						<td>
							${vh.count }
						</td>
						<td>
							${h.id}
						</td>
						<td>
							${h.username}
						</td>
						<td>
							${h.sex}
						</td>
						<td>
							${h.dorm}
						</td>
						<td>
							${h.classname}
						</td>
						<td>
							${h.mobilephone}
						</td>
						<td>
							${h.address}
						</td>
						<td>
							${h.homephone}
						</td>
						<td>
							回家
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<div align="center">
				<button type="button" class="btn btn-primary btn-default" data-toggle="modal" data-target="#myModal">清空</button>
			</div>
			<!-- 模态框（Modal） -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   				<div class="modal-dialog">
        			<div class="modal-content">
            			<div class="modal-header">
                			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                			<h4 class="modal-title" id="myModalLabel"></h4>
            			</div>
            			<div class="modal-body">确定清空所有请假消息？</div>
            			<div class="modal-footer">
            				<button type="button" class="btn btn-primary" onclick="window.location.href='LeaveServlet?clear=true'">提交更改</button>
                			<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            			</div>
        			</div><!-- /.modal-content -->
    			</div><!-- /.modal -->
			</div>
		</c:otherwise>
		</c:choose> 
		</div>
	</div>
</div>
 <script type="text/javascript">
	function homeshow(){
		$("#homestar").addClass("active");
		$("#travelstar").removeClass("active");
		$("#hometable").removeClass("hidden");
		$("#traveltable").addClass("hidden");
	}
	function travelshow(){
		$("#travelstar").addClass("active");
		$("#homestar").removeClass("active");
		$("#traveltable").removeClass("hidden");
		$("#hometable").addClass("hidden");
	}
	function nonehomeshow(){
		$("#nonehomestar").addClass("active");
		$("#nonetravelstar").removeClass("active");
	}
	function nonetravelshow(){
		$("#nonetravelstar").addClass("active");
		$("#nonehomestar").removeClass("active");
	}
	</script>
</body>