<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
        <meta name="author" content="zhugemingjun" />
		<title>工资管理系统-登录界面</title>
		<link type="text/css" rel="stylesheet" href="static/css/bootstrap.min.css" />
		<link type="text/css" rel="stylesheet" href="static/css/style.css" />
		<script type="text/javascript" src="static/js/jQuery.js"></script>
	</head>
	<body class="loginbg">
		<div class="container">
			<form name="loginform" class="form-signin" action="admin?action=login" method="post">
				<h2 class="form-signin-heading"><font color="gray">工资管理系统</font></h2>

				<div class="input-prepend">
				  	<span class="add-on"><i class="icon-user"></i></span>
				  	<input id="userName" name="username" value="" type="text" class="input-block-level" placeholder="请输入登录账号" />
				</div>
				    
				<div class="input-prepend">
					<span class="add-on"><i class="icon-lock"></i></span>
					<input id="password" name="password" value="" type="password" class="input-block-level" placeholder="请输入登录密码" />
				</div>
		        <label class="radio inline">
		      	  	<input id="admin" type="radio" name="role"  value="管理员" checked /> 系统管理员
				</label>
				<label class="radio inline">
					<input id="staff" type="radio" name="role"  value="员工" /> 员工
				</label>
<%--		        <label class="checkbox">
		          <input id="remember" name="remember" type="checkbox" value="remember-me" />记住我 &nbsp;&nbsp;&nbsp;&nbsp; <font id="error" color="red">${error}</font>  
		        </label>--%>
		        <div class="info">
			        <button class="btn btn-large btn-primary" type="submit">登录</button>
<%--			        &nbsp;&nbsp;&nbsp;&nbsp;
			        <button class="btn btn-large btn-info" type="button">重置</button>--%>
		        </div>
				<%--判断用户是否存在，如果不存在就弹出失败框--%>
			<div>
				<h3>${error}</h3>
			</div>
<%--				<p align="center" style="padding-top: 20px;"> 却家庭 &nbsp;©&nbsp;版权所有&nbsp;&nbsp;2020</p>--%>
			</form>
		</div>
	</body>
</html>