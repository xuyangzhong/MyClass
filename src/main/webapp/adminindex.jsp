<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
   <meta charset="utf-8"> 
   <title>首页</title>
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
         <div class="jumbotron">
            <h1>
               Hello, world!
            </h1>
            <p>
               balabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabala
               balabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalaabalabalabalabal
               balabalabalabalabalabalabalabalabalabalabalabala
            </p>
         </div>
      </div>
   </div>
   <div class="row clearfix">
      <div class="col-md-4 column">
         <h2>
            假期请假
         </h2>
         <p>
            查看假期请假人员.
         </p>
         <p>
             <a class="btn" href="LeaveServlet?search=true">View details »</a>
         </p>
      </div>
      <div class="col-md-4 column">
         <h2>
            实验上传
         </h2>
         <p>
            创建新的或查看需要上传实验或作业的科目.
         </p>
         <p>
             <a class="btn" href="AdminSubmitServlet?search=true&add=false&delete=false&detail=false">View details »</a>
         </p>
      </div>
      <div class="col-md-4 column">
         <h2>
            消息通知
         </h2>
         <p>
            发布班级通知(包括实习招聘信息).
         </p>
         <p>
             <a class="btn" href="#">View details »</a>
         </p>
      </div>
   </div>
</div>

</body>
</html>