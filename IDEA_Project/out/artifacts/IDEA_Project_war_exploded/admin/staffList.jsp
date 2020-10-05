<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document).ready(function(){
		$("ul li:eq(2)").addClass("active");
	});
	
	function StaffDelete(sno) {
		if(confirm("您确定要删除员工信息吗？")) {
			window.location="admin?action=deletestaff&sno="+sno;
		}
	}
</script>
<div class="data_list">
	<div class="data_list_title">
		员工管理
	</div>
	<form name="searchForm" action="admin?action=searchstaff" class="form-search" method="post"  style="padding-bottom: 0px">
		<button class="btn btn-success" type="button" style="margin-right: 50px;" onclick="javascript:window.location='admin?action=addstaff'">添加员工</button>
		<span class="data_search">
			<select id="searchType" name="searchType" style="width: 120px;">
				<option value="name">员工ID</option>
			</select>&nbsp;
			<input id="s_Text" name="s_Text" type="text"  style="width:120px;height: 20px;" class="input-medium search-query" value="${s_Text}">&nbsp;
			<button type="submit" class="btn btn-info" onkeydown="if(event.keyCode==13) searchForm.submit()">搜索</button>
		</span>
	</form>
	<div>
		<table class="table table-striped table-bordered table-hover datatable">
			<thead style="background:#e0effd">
				<tr>
			    	<th>员工ID</th>
			        <th>员工姓名</th>
					<th>员工性别</th>
					<th>员工职位</th>
					<th>手机号</th>
					<th>入职时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="staff" items="${staffList}">
				<tr>
					<td>${staff.sno}</td>
					<td>${staff.name}</td>
					<td>${staff.sex}</td>
					<td>${staff.position}</td>
					<td>${staff.phone_id}</td>
					<td>${staff.enroldate}</td>
					<td>
							<button onclick="javascript:window.location='admin?action=editstaff&sno=${staff.sno}'" class="btn btn-mini btn-info" type="button">修改</button>&nbsp;
							<button onclick="StaffDelete(${staff.sno})" class="btn btn-mini btn-danger" type="button">删除</button>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div align="center"><font color="red">${error}</font></div>
</div>