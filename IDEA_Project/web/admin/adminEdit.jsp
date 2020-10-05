<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("ul li:eq(1)").addClass("active");
	});
</script>
<div class="data_list">
	<div class="data_list_title">
		<c:choose>
			<c:when test="${currAdmin==null}">
				    添加管理员信息
			</c:when>
			<c:otherwise>
				    修改管理员信息
			</c:otherwise>
		</c:choose>
	</div>
	<form action="admin?action=saveadmin" method="post">
		<input type="hidden" id="id" name="id" value="${currAdmin.id }" />
		<div class="data_form">
			<table align="center">
				<tr>
					<td><font color="red">*</font>用户账号：</td>
					<td><input type="text" id="username"  name="username" value="${currAdmin.username}" placeholder="请输入管理员名称"  style="margin-top:5px;height:30px;" /></td>
				</tr>
				<tr>
					<td><font color="red">*</font>用户密码：</td>
					<td><input type="text" id="password"  name="password" value="${currAdmin.password }" placeholder="请输入管理员密码"  style="margin-top:5px;height:30px;" /></td>
				</tr>
				<tr>
					<td><font color="red">*</font>用户姓名：</td>
					<td><input type="text" id="name"  name="name" value="${currAdmin.name }" placeholder="请输入管理员姓名"  style="margin-top:5px;height:30px;" /></td>
				</tr>
				<tr>
					<td><font color="red">*</font>手机号码：</td>
					<td><input type="text" id="phone_id"  name="phone_id" value="${currAdmin.phone_id }" placeholder="请输入手机号"  style="margin-top:5px;height:30px;" /></td>
				</tr>
				<tr>
					<td><font color="red">*</font>角色类型：</td>
					<td>
						<select id="role" name="role">
	      					<option value="管理员" ${currAdmin.role eq "管理员"?"selected":"" }>管理员</option>
							<option value="员工" ${currAdmin.role eq "员工"?"selected":"" }>员工</option>
						</select>
					</td>
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
<%--javaScript处理返回按钮跳转页面--%>
<script>
	function returnList() {

		window.location="admin?action=showadmin";

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
			//验证账号
			if ($(this).is("#username")) {
				var userNameVal = $.trim(this.value); //原生js去空格方式：this.replace(/(^\s*)|(\s*$)/g, "")
				var regUserName = /[~#^$@%&!*()<>:;'"{}【】  ]/;  //正则表达式验证
				if (userNameVal == "" || userNameVal.length < 5 || regUserName.test(userNameVal)) {
					var errorMsg = " 账号非空，长度5位以上，不包含特殊字符！";
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
			//验证密码
			if ($(this).is("#password")) {
				var passwordVal = $.trim(this.value); //原生js去空格方式：this.replace(/(^\s*)|(\s*$)/g, "")
				var regPassword = /[~#^$@%&!*()<>:;'"{}【】  ]/;  //正则表达式验证
				if (passwordVal == "" || passwordVal.length < 5 || regPassword.test(passwordVal)) {
					var errorMsg = " 密码非空，长度5位以上，不包含特殊字符！";
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
		})
})
</script>