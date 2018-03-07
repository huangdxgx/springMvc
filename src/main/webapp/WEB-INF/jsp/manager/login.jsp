<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>管理员登录页</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/back/style.css" />
<style>
body{height:100%;background:#16a085;overflow:hidden;}
canvas{z-index:-1;position:absolute;}
</style>
<script src="${pageContext.request.contextPath }/js/jquery.js"></script>
<script src="${pageContext.request.contextPath }/js/verificationNumbers.js"></script>
<script src="${pageContext.request.contextPath }/js/Particleground.js"></script>
<script src="${pageContext.request.contextPath }/js/user_js/function_user.js"></script>
<script>
$(document).ready(function() {
  //粒子背景特效
  $('body').particleground({
    dotColor: '#5cbdaa',
    lineColor: '#5cbdaa'
  });
  //验证码
  createCode(); 
}); 

</script>
<body>
<form action="" method="post" id="adminlogin" name="adminlogin">
<dl class="admin_login">
 <dt>
  <strong>Smart-shop商城后台管理系统</strong>
  <em>Smart-shop Management System</em>
 </dt> 
 <dd class="user_icon">
 <span id="checkAdmin"></span>
  <input type="text" name="loginName" placeholder="账号" onfocus="spanhiden()" class="login_txtbx" required/>
 </dd>
 <dd class="pwd_icon">
  <input type="password" name="loginPwd" placeholder="密码" onfocus="spanhiden()" class="login_txtbx" required/>
 </dd>
 <dd class="val_icon">
  <div class="checkcode">
    <input type="text" id="J_codetext" placeholder="验证码" maxlength="4" onfocus="spanhiden()" onblur="checkCode(this)" class="login_txtbx" required>
    <canvas class="J_codeimg" id="myCanvas" onclick="createCode()">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
  </div>
  <input type="button" value="验证码核验"  class="ver_btn" onclick="validate();">
 </dd>
 <dd>
  <input type="button" onclick="adminLogin()" value="立即登录" class="submit_btn"/>
 </dd>
 <dd>
  <p>©copyright smart-shop商城版权所有</p>
  <p>桂 666666</p>
 </dd>
</dl>
</form>
</body>
</html>