<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/reset.css" />
<link rel="stylesheet" href="css/common.css" />
<link rel="stylesheet" href="css/login.css" />
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<title>注册</title>
<script type="text/javascript">
	function checkLoginname() {
		if ($("#cusLoginName").val() != "") {
			$.ajax({
				url : "/foodeasy/customer/checkLoginname.action",
				type : "post",
				dataType : "json",
				data : {
					"cusLoginName" : $("#cusLoginName").val()
				},
				success : function(data) {
					if (data) {
						$("#checkLogin").html("该用户名不可使用").css({
							"display" : "block",
							"color" : "red"
						});
						return false;
					} else {
						$("#checkLogin").html("该用户名可使用").css({
							"display" : "block",
							"color" : "green"
						});
						return true;
					}
				}
			});
		}
	}

	/* 	//校验密码
	 function checkPassword(){
	 var reg = new RegExp("^[a-z]{4}$","i");
	 check("password",reg,"passwordspan","正确","错误");
	 }



	 function checkForm() {
	 if(checkLoginname()&&checkPassword()&&checkRspassword()&&checkMail()){
	 return false;
	 }
	 return true;
	 } */

	//校验确认密码
	function checkrePassword() {
		console.log(11);
		var flag;
		//获取确认密码框里内容
		var repassword = document.getElementsByName("recusPassword")[0].value;
		//获取密码框里内容
		var password = document.getElementsByName("cusPassword")[0].value;
		if (repassword == password) {
			$("#checkPass").html("").css({
				"display" : "none"
			});
			flag = true;
		} else {
			$("#checkPass").html("密码不一致").css({
				"display" : "block",
				"color" : "red"
			});
			flag = false;
		}
		return flag;
	}

	/* 	function register() {
	 $.ajax({
	 url : "/foodeasy/customer/register.action",
	 type : "post",
	 dataType : "json",
	 data : $("#regForm").serialize(),
	 success : function(data) {
	 if (data.state == "Y") {
	 alert(data.message);
	 window.location.href = "/foodeasy/main.jsp";
	 } else {
	 alert(data.message);
	 }
	 }
	 });
	 } */
</script>
</head>
<body>

	<header id="header" class="">
		<div class="common-width">
			<section class="clearfix">
				<h1 class="logo" title="艾外卖">
					<a href="index.html"></a>
				</h1>
				<span class="page-name"> | 注册</span>
			</section>
		</div>
	</header>
	<section class="main">
		<div class="common-width">
			<div class="main-inner">
				<div class="log-box" id="registerPageBox">
					<form name="regForm" id="regForm" method="post"
						action="/foodeasy/customer/register.action">
						<div class="form-group w275">
							<label for="">用户名</label> <input type="text" id="cusLoginName"
								name="cusLoginName" maxlength="11" class="form-text"
								placeholder="请输入用户名"
								pattern="^[a-zA-Z]\w{5,17}$"
								oninvalid="setCustomValidity('用户名不符合规范')" required /> <span
								style="display: none" id="checkLogin"></span>
						</div>
						<div class="form-error-message"></div>
						<div class="form-group w275">
							<label for="">登录密码</label> <input type="password"
								id="cusPassword" name="cusPassword" maxlength="10"
								class="form-text" placeholder="输入登录密码 6-10个字符" required />
						</div>
						<div class="form-error-message"></div>
						<div class="form-group w275">
							<input type="password" id="rPass2" maxlength="10"
								id="recusPassword" name="recusPassword" class="form-text"
								placeholder="确认登录密码 " onblur="checkrePassword()" required /> <span
								id="checkPass"></span>
						</div>
						<div class="form-error-message"></div>
						<div class="form-group w275">
							<label for="">姓名</label> <input type="text" id="cusUserName"
								name="cusUserName" maxlength="11" class="form-text"
								placeholder="请输入姓名" required />
						</div>
						<div class="form-group w275">
							<label for="">地址</label> <input type="text" id="cusAddress"
								name="cusAddress" maxlength="11" class="form-text"
								placeholder="请输入地址" required />
						</div>
						<div class="form-group w275">
							<label for="">手机号码</label> <input type="tel" id="cusPhone"
								name="cusPhone" maxlength="99" class="form-text"
								placeholder="请输入手机号码" pattern="^1[34578]\d{9}$"
								oninvalid="setCustomValidity('请输入11位手机号')" required />
						</div>
						<div>
							<input type="submit" class="form-btn" id="registerPageBtn" value="确认注册" />
						</div>
					</form>
				</div>
			</div>

		</div>
	</section>
	<footer id="footer">
		<div class="footer-first gray">
			<div class="company-info clearfix fs14 gray">
				<a href="/about_us/" target="_blank" rel="nofollow">关于我们</a> <a
					href="/help/" target="_blank" rel="nofollow">帮助中心</a> <a
					href="/terms-and-conditions/" target="_blank" rel="nofollow">法律声明</a>
				<a href="/jobs/" target="_blank" rel="nofollow">人才招聘</a> <a
					href="/contact/" class="last" target="_blank" rel="nofollow">联系我们</a>
				<a href="/restaurant/list/shanghai/1/" class="last" target="_blank"
					style="display: none">餐厅导航</a>
			</div>
		</div>
		<div class="footer-last">
			<a target="_blank" class="foot-logo-1 base-logo" href="index.html"></a>
			<div class="tc fs14 light-gray mb10">©2017 Java四班第三组</div>
		</div>
	</footer>

</body>
</html>