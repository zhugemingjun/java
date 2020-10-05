<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />

		<title>工资管理系统-员工界面</title>
		<link type="text/css" rel="stylesheet" href="static/css/bootstrap.min.css" />
		<link type="text/css" rel="stylesheet" href="static/css/style.css" />
		<script type="text/javascript" src="static/js/jQuery.js"></script>
	</head>
	<body>
		<div class="container-fluid" style="padding-right: 0px;padding-left: 0px;">
			<div region="north" style="height: 100px;background-image: url('static/images/bg.jpg')">
				<div align="left" style="width: 80%;height:70px ;float: left;padding-top: 40px;padding-left: 30px;" ><font color="white" size="6">工资管理系统</font><font color="white" size="4">(员工)</font></div>
				<div style="padding-top: 70px;padding-right: 20px;color:#fff;font-size:14px"><i class="icon-user icon-white"></i>&nbsp;当前用户：&nbsp;<font color="red">${admin.username }</font></div>
				<input type="hidden" id="id" name="id" value="${admin.id }" />
			</div>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span2 bs-docs-sidebar">
					<ul class="nav nav-list bs-docs-sidenav">
						<li><a href="admin?action=blank2"><i class="icon-chevron-right"></i><i class="icon-home"></i>首页</a></li>
						<li><a href="admin?action=showwagerole"><i class="icon-chevron-right"></i>工资管理界面</a></li>
						<li><a href="admin?action=admininforole"><i class="icon-chevron-right"></i>当前用户信息界面</a></li>
						<li><a href="admin?action=exit"><i class="icon-chevron-right"></i>退出系统</a></li>
					</ul>
				</div>
				<div class="span10">
					<jsp:include page="${mainPage==null?'admin/blank2.jsp':mainPage}"></jsp:include>
				</div>
			</div>
		</div>

	</body>
</html>