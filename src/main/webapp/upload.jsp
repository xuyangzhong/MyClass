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
	<table height="100px">
	</table>
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-4 column">
				</div>
				<div class="col-md-4 column">
					<form role="form" action="SubmitServlet" method="post" enctype="multipart/form-data" id="myform">
						<input type="hidden" name="workid" id="workid" value="${workid}">
 						<div class="form-group">
    						<label for="name" >名称</label>
    						<input type="text" class="form-control" name="name" id="name" placeholder="请输入名称" value="${user.username}${username}">
  						</div>
  						<div class="form-group">
    						<label for="inputfile">文件输入</label>
    						<input type="file" id="inputfile" name="inputfile">
    						<p class="help-block">将本地实验报告上传(若多份请压缩后上传)</p>
    						<p class="help-block">若想删除之前上传，只需重新上传即可覆盖</p>
    						<p class="help-block">若重复提交，只有最后一次提交的记录</p>
  						</div>
  						<button type="button" class="btn btn-default" onclick="jiancha()">提交</button>
					</form>
				</div>
				<div class="col-md-4 column">
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	function jiancha(){
		var file=document.getElementById("inputfile").value;
		if(file==null||file==""){
			alert("请选择要上传的文件");
			document.getElementById("inputfile").focus();
		}else{
			document.getElementById("myform").submit();
		}
		
	}
</script>
</body>