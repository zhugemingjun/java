<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
	$(document).ready(function(){
		$("ul li:eq(2)").addClass("active");
	});
</script>
<div class="data_list">
	<div class="data_list_title">
		<c:choose>
			<c:when test="${currStaff==null}">
				    添加员工信息
			</c:when>
			<c:otherwise>
				    修改员工信息
			</c:otherwise>
		</c:choose>
	</div>
	<form action="admin?action=savestaff" method="post">
	<input type="hidden" id="id" name="id" value="${currStaff.sno }" />
		<div class="data_form">
			<table align="center">
				<tr>
					<td><font color="red">*</font>员工ID：</td>
					<td><input type="text" id="sno"  name="sno" value="${currStaff.sno }" placeholder="请输入ID"  style="margin-top:5px;height:30px;" /></td>
				</tr>
				<tr>
					<td><font color="red">*</font>员工姓名：</td>
					<td><input type="text" id="name"  name="name" value="${currStaff.name }"  placeholder="请输入姓名"  style="margin-top:5px;height:30px;" /></td>
				</tr>
				<tr>
					<td><font color="red">*</font>性别：</td>
					<td>
						<select id="sex" name="sex" style="width: 90px;">
							<option value="" >请选择...</option>
							<option value="男" ${currStaff.sex eq "男"?"selected":"" }>男</option>
							<option value="女" ${currStaff.sex eq "女"?"selected":"" }>女</option>
						</select>
      				</td>
				</tr>
				<tr>
					<td><font color="red">*</font>职位：</td>
					<td>
						<select id="position" name="position" style="width: 90px;">
							<option value="" >请选择...</option>
							<option value="总裁" ${currStaff.position eq "总裁"?"selected":"" }>总裁</option>
							<option value="财务总监" ${currStaff.position eq "财务总监"?"selected":"" }>财务总监</option>
							<option value="技术总监" ${currStaff.position eq "技术总监"?"selected":"" }>技术总监</option>
							<option value="财务主管" ${currStaff.position eq "财务主管"?"selected":"" }>财务主管</option>
							<option value="技术主管" ${currStaff.position eq "技术主管"?"selected":"" }>技术主管</option>
							<option value="java开发师" ${currStaff.position eq "java开发师"?"selected":"" }>java开发师</option>
							<option value="python开发师" ${currStaff.position eq "python开发师"?"selected":"" }>python开发师</option>
							<option value="c开发师" ${currStaff.position eq "c开发师"?"selected":"" }>c开发师</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><font color="red">*</font>手机号：</td>
					<td><input type="text" id="phone_id"  name="phone_id" value="${currStaff.phone_id }"  placeholder="请输入手机号"  style="margin-top:5px;height:30px;" /></td>
				</tr>
				<tr>
					<td><font color="red">*</font>入职日期：</td>
					<td><input type="date" id="date" name="enroldate" lay-verify="date" placeholder="yyyy-MM-dd" value="${currStaff.enroldate }" placeholder="请输入入职日期"  style="margin-top:5px;height:30px;" /></td>
				</tr>
			</table>
			<div align="center">
				<input type="submit" class="btn btn-primary" value="保存"/>
				&nbsp;<button class="btn btn-primary" type="button" onclick="returnList()">返回</button>
			</div>
			<div align="center">
				<font id="error" color="red">${error}</font>
			</div>
		</div>
	</form>
</div>
<script>
	function returnList() {

			window.location="admin?action=showstaff";

	}
</script>

<%--jquery处理表单--%>
<script>
	jQuery(document).ready(function(){
		$('form').bind('submit',function(){
			return false;
		});
		//为表单元素添加失去焦点事件
		//验证账号
		$("form :input").blur(function() {
			var $parent = $(this).parent();
			$parent.find(".msg").remove(); //删除以前的提醒元素（find()：查找匹配元素集中元素的所有匹配元素）
			//验证ID
			if ($(this).is("#sno")) {
				var sno = $.trim(this.value); //原生js去空格方式：this.replace(/(^\s*)|(\s*$)/g, "")
				var snolength = /\d{6}/;  //正则表达式验证
				if (sno == "" || sno.length > 6 || snolength.test(sno)) {
					var errorMsg = " ID非空，且小于6位数";
					//class='msg onError' 中间的空格是层叠样式的格式
					$parent.append("<span style='color: red' class='msg onError'>" + errorMsg + "</span>");
					$('form').bind('submit',function(){
						return false;
					});
				} else {
					var okMsg = " 输入正确";
					$parent.find(".high").remove();
					$parent.append("<span  style='color: green' class='msg onSuccess'>" + okMsg + "</span>");
					$("form").unbind();
				}
			}

			//验证姓名
			if ($(this).is("#name")) {
				var namesVal = $.trim(this.value); //原生js去空格方式：this.replace(/(^\s*)|(\s*$)/g, "")
				var regNames = /^[\u4E00-\u9FA5]{1,6}$/;  //正则表达式验证
				if (namesVal == "" || namesVal.length <1 || !regNames.test(namesVal)) {
					var errorMsg = " 不能为空，最少一个字，最多六个字";
					//class='msg onError' 中间的空格是层叠样式的格式
					$parent.append("<span style='color: red' class='msg onError'>" + errorMsg + "</span>");
					$('form').bind('submit',function(){
						return false;
					});
				} else {
					var okMsg = " 输入正确";
					$parent.find(".high").remove();
					$parent.append("<span  style='color: green' class='msg onSuccess'>" + okMsg + "</span>");
					$("form").unbind();
				}
			}

			//验证性别
			if ($(this).is("#sex")) {
				var sex = $.trim(this.value); //原生js去空格方式：this.replace(/(^\s*)|(\s*$)/g, "")
				if (sex == "") {
					var errorMsg = " 性别不能为空！";
					//class='msg onError' 中间的空格是层叠样式的格式
					$parent.append("<span style='color: red' class='msg onError'>" + errorMsg + "</span>");
					$('form').bind('submit',function(){
						return false;
					});
				} else {
					var okMsg = " 输入正确";
					$parent.find(".high").remove();
					$parent.append("<span  style='color: green' class='msg onSuccess'>" + okMsg + "</span>");
					$("form").unbind();
				}
			}

			if ($(this).is("#position")) {
				var position = $.trim(this.value); //原生js去空格方式：this.replace(/(^\s*)|(\s*$)/g, "")
				if (position == "") {
					var errorMsg = " 职位不能为空！";
					//class='msg onError' 中间的空格是层叠样式的格式
					$parent.append("<span style='color: red' class='msg onError'>" + errorMsg + "</span>");
					$('form').bind('submit',function(){
						return false;
					});
				} else {
					var okMsg = " 输入正确";
					$parent.find(".high").remove();
					$parent.append("<span  style='color: green' class='msg onSuccess'>" + okMsg + "</span>");
					$("form").unbind();
				}
			}

			//验证手机号码
			if ($(this).is("#phone_id")) {
				var phone_idVal = $.trim(this.value); //原生js去空格方式：this.replace(/(^\s*)|(\s*$)/g, "")
				var regPhone_id = /^[1][3,4,5,7,8][0-9]{9}$/;  //正则表达式验证
				if (phone_idVal == "" || phone_idVal.length !=11 || !regPhone_id.test(phone_idVal)) {
					var errorMsg = " 请输入正确的手机号";
					//class='msg onError' 中间的空格是层叠样式的格式
					$parent.append("<span style='color: red' class='msg onError'>" + errorMsg + "</span>");
					$('form').bind('submit',function(){
						return false;
					});
				} else {
					var okMsg = " 输入正确";
					$parent.find(".high").remove();
					$parent.append("<span  style='color: green' class='msg onSuccess'>" + okMsg + "</span>");
					$("form").unbind();
				}
			}

			//验证日期
			if ($(this).is("#date")) {
				var date = $.trim(this.value); //原生js去空格方式：this.replace(/(^\s*)|(\s*$)/g, "")
				if (date == "" ) {
					var errorMsg = " 请输入日期";
					//class='msg onError' 中间的空格是层叠样式的格式
					$parent.append("<span style='color: red' class='msg onError'>" + errorMsg + "</span>");
					$('form').bind('submit',function(){
						return false;
					});
				} else {
					var okMsg = " 输入正确";
					$parent.find(".high").remove();
					$parent.append("<span  style='color: green' class='msg onSuccess'>" + okMsg + "</span>");
					$("form").unbind();
				}
			}
		})
	})
</script>