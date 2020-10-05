<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document).ready(function(){
		$("ul li:eq(1)").addClass("active");
	});

</script>
<div class="data_list">
	<div class="data_list_title">
		工资管理
	</div>
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
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div align="center"><font color="red">${error}</font></div>
</div>