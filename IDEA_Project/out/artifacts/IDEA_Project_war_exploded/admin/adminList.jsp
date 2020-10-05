<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List" %>
<%@ page import="com.web.model.Admin" %>

<script type="text/javascript">
	$(document).ready(function(){
		$("ul li:eq(1)").addClass("active");
	});
	
	function adminDelete(adminId) {
		if(confirm("您确定要删除这个用户吗？")) {
			window.location="admin?action=deleteadmin&adminId="+adminId;
		}
	}
</script>
<div class="data_list">
	<div class="data_list_title">
		管理员管理界面
	</div>
	<form name="searchForm" action="admin?action=searchadmin" class="form-search" method="post"  style="padding-bottom: 0px">
		<button class="btn btn-success" type="button" style="margin-right: 50px;" onclick="javascript:window.location='admin?action=addadmin'">添加用户</button>
		<span class="data_search">
			<select id="searchType" name="searchType" style="width: 120px;">
				<option value="1" ${searchType eq "1"?"selected":"" }>账号名</option>   <%--后台传回数据，回显当前选择--%>
				<option value="2" ${searchType eq "2"?"selected":"" }>手机</option>		<%--后台传回数据，回显当前选择--%>
				<option value="3" ${searchType eq "3"?"selected":"" }>角色</option>		<%--后台传回数据，回显当前选择--%>
			</select>&nbsp;
			<input id="usertext" name="usertext" type="text"  style="width:120px;height: 20px;" class="input-medium search-query" value="${userText}">&nbsp;
			<button type="submit" class="btn btn-info" onkeydown="if(event.keyCode==13) searchForm.submit()">搜索</button>
		</span>
	</form>
	<div>
		<table class="table table-striped table-bordered table-hover datatable">
			<thead style="background:#e0effd">
				<tr>
			    	<th>编号</th>
					<th>账号名</th>
					<th>用户姓名</th>
					<th>手机号</th>
					<th>角色</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="admin" items="${adminList}">
					<tr>
						<td>${admin.id}</td>
						<td>${admin.username}</td>
						<td>${admin.name}</td>
						<td>${admin.phone_id}</td>
						<td>${admin.role}</td>
						<td>
							<button onclick="javascript:window.location='admin?action=editadmin&adminId=${admin.id}'" class="btn btn-mini btn-info" type="button">修改</button>&nbsp;
							<button onclick="adminDelete(${admin.id})" class="btn btn-mini btn-danger" type="button">删除</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div align="center"><font color="red">${error}</font></div>
</div>