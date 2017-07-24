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
		var date=new Date();
			var year=date.getFullYear();
		var month=date.getMonth()+1;
		var day=date.getDate();
		document.getElementById("beginyear").value=year;
		document.getElementById("beginmonth").value=month;
		document.getElementById("beginday").value=day;
		document.getElementById("endyear").value=year;
		document.getElementById("endmonth").value=month;
		document.getElementById("endday").value=day+7;
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
							<tr onclick="window.location.href='AdminSubmitServlet?search=false&add=false&delete=false&detail=true&workid=${h.id}'">
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
									<fmt:formatDate pattern="yyyy-MM-dd" value="${h.workbegintime}"/>
									~
									<fmt:formatDate pattern="yyyy-MM-dd" value="${h.workendtime}"/>
								</td>
						</c:forEach>
					</tr>
					</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<div align="center">
				<button type="button" class="btn btn-primary btn-default" data-toggle="modal" data-target="#myModal">添加提交课程</button>
			</div> 
			<!-- 模态框（Modal） -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    			<div class="modal-dialog">
    				<form role="form" name="myform" id="myform" action="AdminSubmitServlet" method="post">
    				<input type="hidden" name="search" value="false">
    				<input type="hidden" name="delete" value="false">
    				<input type="hidden" name="add" value="true">
    				<input type="hidden" name="detail" value="false">
       				<div class="modal-content">
            			<div class="modal-header">
                			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                			<h4 class="modal-title" id="myModalLabel">新添加课程</h4>
            			</div>
            			<div class="modal-body">
            				<div class="form-group">
    							<label for="name">课程名称</label>
    							<input type="text" class="form-control" id="name" name="name"placeholder="请输入名称">
  							</div>
  							<div class="form-group">
    							<label for="name">开始提交时间</label>
    							<div class="input-group">
            						<input type="text" class="form-control" id="beginyear" name="beginyear">
            						<span class="input-group-addon">年</span>
            						<input type="text" class="form-control" id="beginmonth" name="beginmonth">
            						<span class="input-group-addon">月</span>
            						<input type="text" class="form-control" id="beginday" name="beginday">
            						<span class="input-group-addon">日</span>
            					</div>
  							</div>
  							<div class="form-group">
    							<label for="name">结束提交时间</label>
    							<div class="input-group">
            						<input type="text" class="form-control" id="endyear" name="endyear">
            						<span class="input-group-addon">年</span>
            						<input type="text" class="form-control" id="endmonth" name="endmonth">
            						<span class="input-group-addon">月</span>
            						<input type="text" class="form-control" id="endday" name="endday">
            						<span class="input-group-addon">日</span>
            					</div>
  							</div>
						</div>
            			<div class="modal-footer">
            				<button type="button" class="btn btn-primary" onclick="jiancha()">提交</button>
                			<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>	
            			</div>
        			</div><!-- /.modal-content -->
        			</form>
    			</div><!-- /.modal -->
			</div>
		</div>
	</div>
</div>

<script>
	function jiancha(){
		if(document.getElementById("name").value==""){
				document.getElementById("name").focus();
		}else{
			document.getElementById("myform").submit();
		}
	}
</script>
</body>