<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document).ready(function(){
		$("ul li:eq(3)").addClass("active");
	});
	
	function WageDelete(sno) {
		if(confirm("您确定要删除工资信息吗？")) {
			window.location="admin?action=deletewage&sno="+sno;
		}
	}
</script>
<div class="data_list">
	<div class="data_list_title">
		工资管理
	</div>
	<form name="searchForm" action="admin?action=searchwage" class="form-search" method="post"  style="padding-bottom: 0px">
		<button class="btn btn-success" type="button" style="margin-right: 50px;" onclick="javascript:window.location='admin?action=addwage'">添加工资信息</button>
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
					<th>员工职位</th>
					<th>年</th>
					<th>月</th>
					<th>基本工资（底薪）</th>
					<th>绩效</th>
					<th>奖金</th>
					<th>税收</th>
					<th>实际工资</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="wage" items="${wageList}">
				<tr>
					<td>${wage.sno}</td>
					<td>${wage.name}</td>
					<td>${wage.position}</td>
					<td>${wage.year}</td>
					<td>${wage.month}</td>
					<td>${wage.basic_wage}</td>
					<td>${wage.subsidy}</td>
					<td>${wage.bonus}</td>
					<td>${wage.tax}</td>
					<td>${wage.real_wage}</td>
					<td>
							<button onclick="javascript:window.location='admin?action=editwage&sno=${wage.sno}'" class="btn btn-mini btn-info" type="button">修改</button>&nbsp;
							<button onclick="StudentDelete(${wage.sno})" class="btn btn-mini btn-danger" type="button">删除</button>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div align="center"><font color="red">${error}</font></div>
</div>