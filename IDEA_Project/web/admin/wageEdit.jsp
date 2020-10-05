<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
	$(document).ready(function(){
		$("ul li:eq(3)").addClass("active");
	});
</script>
<div class="data_list">
	<div class="data_list_title">
		<c:choose>
			<c:when test="${currWage==null}">
				    添加工资信息
			</c:when>
			<c:otherwise>
				    修改工资信息
			</c:otherwise>
		</c:choose>
	</div>
	<form action="admin?action=savewage" method="post">
	<input type="hidden" id="id" name="id" value="${currWage.id }" />
		<div class="data_form">
			<table align="center">
				<tr>
					<td><font color="red">*</font>员工ID：</td>
					<td><input type="text" id="sno"  name="sno" value="${currWage.sno }" placeholder="请输入员工ID"  style="margin-top:5px;height:30px;" /></td>
				</tr>
				<tr>
					<td><font color="red">*</font>员工姓名：</td>
					<td><input type="text" id="name"  name="name" value="${currWage.name }"  placeholder="请输入姓名"  style="margin-top:5px;height:30px;" /></td>
				</tr>
				<tr>
					<td><font color="red">*</font>职位：</td>
					<td>
						<select id="position" name="position" style="width: 90px;">
							<option value="" >请选择...</option>
							<option value="总裁" ${currWage.position eq "总裁"?"selected":"" }>总裁</option>
							<option value="财务总监" ${currWage.position eq "财务总监"?"selected":"" }>财务总监</option>
							<option value="技术总监" ${currWage.position eq "技术总监"?"selected":"" }>技术总监</option>
							<option value="财务主管" ${currWage.position eq "财务主管"?"selected":"" }>财务主管</option>
							<option value="技术主管" ${currWage.position eq "技术主管"?"selected":"" }>技术主管</option>
							<option value="java开发师" ${currWage.position eq "java开发师"?"selected":"" }>java开发师</option>
							<option value="python开发师" ${currWage.position eq "python开发师"?"selected":"" }>python开发师</option>
							<option value="c开发师" ${currWage.position eq "c开发师"?"selected":"" }>c开发师</option>
						</select>
      				</td>
				</tr>
				<tr>
					<td><font color="red">*</font>年：</td>
					<td>
						<select id="year" name="year" style="width: 90px;">
							<option value="" >请选择...</option>
							<option value="2010年" ${currWage.year eq "2010年"?"selected":"" }>2010年</option>
							<option value="2011年" ${currWage.year eq "2011年"?"selected":"" }>2011年</option>
							<option value="2012年" ${currWage.year eq "2012年"?"selected":"" }>2012年</option>
							<option value="2013年" ${currWage.year eq "2013年"?"selected":"" }>2013年</option>
							<option value="2014年" ${currWage.year eq "2014年"?"selected":"" }>2014年</option>
							<option value="2015年" ${currWage.year eq "2015年"?"selected":"" }>2015年</option>
							<option value="2016年" ${currWage.year eq "2016年"?"selected":"" }>2016年</option>
							<option value="2017年" ${currWage.year eq "2017年"?"selected":"" }>2017年</option>
							<option value="2018年" ${currWage.year eq "2018年"?"selected":"" }>2018年</option>
							<option value="2019年" ${currWage.year eq "2019年"?"selected":"" }>2019年</option>
							<option value="2020年" ${currWage.year eq "2020年"?"selected":"" }>2020年</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><font color="red">*</font>月：</td>
					<td>
						<select id="month" name="month" style="width: 90px;">
							<option value="" >请选择...</option>
							<option value="1月" ${currWage.month eq "1月"?"selected":"" }>1月</option>
							<option value="2月" ${currWage.month eq "2月"?"selected":"" }>2月</option>
							<option value="3月" ${currWage.month eq "3月"?"selected":"" }>3月</option>
							<option value="4月" ${currWage.month eq "4月"?"selected":"" }>4月</option>
							<option value="5月" ${currWage.month eq "5月"?"selected":"" }>5月</option>
							<option value="6月" ${currWage.month eq "6月"?"selected":"" }>6月</option>
							<option value="7月" ${currWage.month eq "7月"?"selected":"" }>7月</option>
							<option value="8月" ${currWage.month eq "8月"?"selected":"" }>8月</option>
							<option value="9月" ${currWage.month eq "9月"?"selected":"" }>9月</option>
							<option value="10月" ${currWage.month eq "10月"?"selected":"" }>10月</option>
							<option value="11月" ${currWage.month eq "11月"?"selected":"" }>11月</option>
							<option value="12月" ${currWage.month eq "12月"?"selected":"" }>12月</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><font color="red">*</font>基本工资（底薪）：</td>
					<td>
						<input type="text" id="basic_wage"  name="basic_wage" value="${currWage.basic_wage }" placeholder="请输入基本工资"  style="margin-top:5px;height:30px;" />
					</td>
				</tr>
				<tr>
					<td><font color="red">*</font>绩效：</td>
					<td><input type="text" id="subsidy"  name="subsidy" value="${currWage.subsidy }" placeholder="请输入绩效"  style="margin-top:5px;height:30px;" /></td>
				</tr>
				<tr>
					<td><font color="red">*</font>奖金：</td>
					<td><input type="text" id="bonus"  name="bonus" value="${currWage.bonus }" placeholder="奖金"  style="margin-top:5px;height:30px;" /></td>
				</tr>
				<tr>
					<td><font color="red">*</font>交税：</td>
					<td><input type="text" id="tax"  name="tax" readonly="readonly" value="${currWage.bonus }" placeholder="奖金"  style="margin-top:5px;height:30px;" /></td>
				</tr>
				<tr>
					<td><font color="red">*</font>实际工资：</td>
					<td><input type="text" id="real_wage"  name="real_wage" readonly="readonly"  value="${currWage.bonus }" placeholder="实际工资"  style="margin-top:5px;height:30px;" /></td>
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

			window.location="admin?action=showwage";

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

			//验证职位
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

			//验证年
			if ($(this).is("#year")) {
				var year = $.trim(this.value); //原生js去空格方式：this.replace(/(^\s*)|(\s*$)/g, "")
				if (year == "") {
					var errorMsg = " 年份不能为空！";
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

			//验证职位
			if ($(this).is("#month")) {
				var month = $.trim(this.value); //原生js去空格方式：this.replace(/(^\s*)|(\s*$)/g, "")
				if (month == "") {
					var errorMsg = " 月份不能为空！";
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

			//验证基本工资
			if ($(this).is("#basic_wage")) {
				var basic_wage = $.trim(this.value); //原生js去空格方式：this.replace(/(^\s*)|(\s*$)/g, "")
				var basic_wageval = /^(-)?\d+(.\d{1,2})?$/;  //正则表达式验证  带1-2位小数的正数或负数
				if (basic_wage == "" || basic_wage.length >8 || !basic_wageval.test(basic_wage)) {
					var errorMsg = "数值不能为空，或数值过大";
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

			//验证绩效
			if ($(this).is("#subsidy")) {
				var subsidy = $.trim(this.value); //原生js去空格方式：this.replace(/(^\s*)|(\s*$)/g, "")
				var subsidyval = /^(-)?\d+(.\d{1,2})?$/;  //正则表达式验证  带1-2位小数的正数或负数
				if (subsidy == "" || subsidy.length >8 || !subsidyval.test(subsidy)) {
					var errorMsg = "数值不能为空，或数值过大";
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
			//验证奖金
			if ($(this).is("#bonus")) {
				var bonus = $.trim(this.value); //原生js去空格方式：this.replace(/(^\s*)|(\s*$)/g, "")
				var bonusval = /^(-)?\d+(.\d{1,2})?$/;  //正则表达式验证  带1-2位小数的正数或负数
				if (bonus == "" || bonus.length >8 || !bonusval.test(bonus)) {
					var errorMsg = "数值不能为空，或数值过大";
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


			//计算交税
			if ($(this).is("#tax")) {

				var basic_wage=1.0*$("#basic_wage").val()
				// basic_wage=basic_wage*100/100
				var subsidy=1.0*$("#subsidy").val()
				// subsidy=subsidy*100/100
				var bonus=1.0*$("#bonus").val()
				// bonus=bonus*100/100
				var sum=(basic_wage+subsidy+bonus)

				if(sum>5000){
					sum=(sum-5000)*0.3
				}else {
					sum=0
				}
				$("#tax").attr("value",sum);
			}

			//计算交税
			if ($(this).is("#real_wage")) {

				var basic_wage=$("#basic_wage").val()
				basic_wage=basic_wage*100/100
				var subsidy=$("#subsidy").val()
				subsidy=subsidy*100/100
				var bonus=$("#bonus").val()
				bonus=bonus*100/100
				var tax=$("#tax").val()
				tax=tax*100/100
				var sum=(basic_wage+subsidy+bonus-tax)*100/100

				$("#real_wage").attr("value",sum);
			}

		})
	})
</script>