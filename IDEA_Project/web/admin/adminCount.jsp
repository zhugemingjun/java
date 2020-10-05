<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document).ready(function(){
		$("ul li:eq(5)").addClass("active");
	});
</script>
<div class="data_list">
	<div class="data_list_title">
		职位人数统计
	</div>
	<div>
		<table class="table table-striped table-bordered table-hover datatable">
			<thead style="background:#e0effd">
			<tr>
				<th>总裁</th>
				<th>财务总监</th>
				<th>技术总监</th>
				<th>财务主管</th>
				<th>技术主管</th>
				<th>java开发师</th>
				<th>python开发师</th>
				<th>c开发师</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="counts" items="${positionCount}">
				<tr>
					<td>${counts.position1}人</td>
					<td>${counts.position2}人</td>
					<td>${counts.position3}人</td>
					<td>${counts.position4}人</td>
					<td>${counts.position5}人</td>
					<td>${counts.position6}人</td>
					<td>${counts.position7}人</td>
					<td>${counts.position8}人</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</div>