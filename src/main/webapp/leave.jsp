<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<div class="row clearfix">
				<div class="col-md-12 column">
					
					<form role="form">
						<div class="row clearfix">
							<div class="col-md-12 column">
								<h1 align="center">
									放假通知
								</h1>
								<br> </br>
								<div>
									<table class="table"> 
										<tr>
											<td style="word-break:break-all">
												balabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabala
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
						<div  align="center">
							<div class="checkbox" style="width:100px" tabindex="0" id="readbox" name="readbox">
								<label><input type="checkbox" name="read" id="read" />我已阅读</label>
							</div>
						</div>
						<div align="center">
							<h3>选择出行原因</h3>
							<br></br>
						</div>
						<div align="center">
							<button type="button" class="btn btn-primary" onclick="gohome()" value="回家">回家</button>
							&nbsp;&nbsp;
							<button type="button" class="btn btn-primary" onclick="travel()" value="旅游">旅游</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal"role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title">
					确认框
				</h4>
			</div>
			<div class="modal-body">
				确定选择
				<span id="way" name="way"></span>
				<span>?</span>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="go()">
					确定
				</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">
					关闭
				</button>
				
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
</div>
<script type="text/javascript">
	function gohome(){
   		var read=document.getElementById("read");
   		var readbox=document.getElementById("readbox");
   		if(read.checked==false){
   			alert("请先阅读假期相关信息");
   			readbox.focus();
   		}else{
   			var way=document.getElementById("way");
   			way.innerHTML="回家";
   			confirm();
   		}
   	}
   	function travel(){
   		var read=document.getElementById("read");
   		var readbox=document.getElementById("readbox");
   		if(read.checked==false){
   			alert("请先阅读假期相关信息");
   			readbox.focus();
   		}else{
   			var way=document.getElementById("way");
   			way.innerHTML="旅游";
   			confirm();
   		}
   	}
	function confirm(){
		$('#myModal').modal('show');
	}
	function go(){
		var way=document.getElementById("way");
		if(way.innerHTML=="回家"){
			window.location.href="LeaveServlet?way=huijia";
		}
		if(way.innerHTML=="旅游"){
			window.location.href="LeaveServlet?way=lvyou";
		}
	}
</script>
</body>
</html>

