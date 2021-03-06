<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
   <meta charset="utf-8"> 
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>登陆</title>
   <link rel="stylesheet" href="css/bootstrap.min.css">  
   <script src="js/jquery.min.js"></script>
   <script src="js/bootstrap.min.js"></script>
   <script type="text/javascript">

	function load(){
		
		var error="${login_error}";
		if(error==null||error==""){
			
		}else{
			$("#myAlert").removeClass("hidden");
		}
		var user="${user}";
		if(user!=null&&user!=""){
			window.location.href="index.jsp";
		}
	}
	</script>
</head>
<body onload="load()">
<div class="bg-primary text-center d-flex h-100 align-items-center">
<table height="300px">
</table>
</div>
<div class="container">
	<div>
		<br>
		<br>
		<br>
	</div>	
	<div class="row clearfix">
		<div class="col-md-4 column">
		</div>
		<div class="col-md-4 column">
			<div id="myAlert" class="alert alert-warning hidden">
    			<a href="#" class="close" onclick="hide()">&times;</a>
    			<strong>警告！</strong>用户名或密码输入错误。
			</div>
			<form class="form-horizontal" role="form" action="LoginServlet" method="post">
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">用户</label>
					<div class="col-sm-10">
						<input class="form-control" id="username" name="username" onblur="checkusername()" onfocus="resetusername()" />
					</div>
					
				</div>
				<div class="form-group">
					 <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="password" name="password" 
						onblur="checkpassword()" onfocus="resetpassword()"  />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<div class="checkbox">
							 <label><input type="checkbox" name="isadmin" id="isadmin" value="Login_of_Admin"/>管理员登陆</label>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						 <button type="submit" class="btn btn-default">Sign in</button>
					</div>
				</div>
			</form>
		</div>
		<div class="col-md-4 column">
		</div>
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
<script src="https://pingendo.com/assets/bootstrap/bootstrap-4.0.0-alpha.6.min.js"></script>
<script type="text/javascript">
	function hide(){
		$("#myAlert").addClass('hidden');
	}
	function checkusername(){
		$("#username").attr("placeholder","用户名不能为空");
	}
	function resetusername(){
		$("#username").attr("placeholder","");
	}
	function checkpassword(){
		$("#password").attr("placeholder","密码不能为空");
	}
	function resetpassword(){
		$("#password").attr("placeholder","");
	}
</script>
</body>
</html>
