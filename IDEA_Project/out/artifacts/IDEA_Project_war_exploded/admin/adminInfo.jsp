<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function(){
		$("ul li:eq(4)").addClass("active");
	});
</script>
<div class="data_list">
	<div class="data_list_title">
		当前用户信息
	</div>
	<div class="data_form">
		<table align="center">
			<tr>
				<td><font color="red">*</font>管理员名称：</td>
				<td><input type="text" value="${admin.username}" readonly style="margin-top:5px;height:30px;" /></td>
			</tr>
			<tr>
				<td><font color="red">*</font>管理员姓名：</td>
				<td><input type="text" value="${admin.name }" readonly style="margin-top:5px;height:30px;" /></td>
			</tr>
			<tr>
				<td><font color="red">*</font>手机号：</td>
				<td><input type="text" value="${admin.phone_id }" readonly style="margin-top:5px;height:30px;" /></td>
			</tr>
			<tr>
				<td><font color="red">*</font>性别：</td>
				<td><input type="text" value="${staff.sex }" readonly style="margin-top:5px;height:30px;" /></td>
			</tr>
			<tr>
				<td><font color="red">*</font>职位：</td>
				<td><input type="text" value="${staff.position }" readonly style="margin-top:5px;height:30px;" /></td>
			</tr>
			<tr>
				<td><font color="red">*</font>入职时间：</td>
				<td><input type="text" value="${staff.enroldate }" readonly style="margin-top:5px;height:30px;" /></td>
			</tr>
			<tr>
				<td><font color="red">*</font>角色类型：</td>
				<td><input type="text" value="${admin.role }" readonly style="margin-top:5px;height:30px;" /></td>
			</tr>
		</table>
	</div>
</div>