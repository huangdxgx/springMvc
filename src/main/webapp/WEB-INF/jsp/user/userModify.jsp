<%@ page language="java" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html>	
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改用户</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/back/style.css">
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/user_js/function_user.js"></script>
<script type="text/javascript">
//取消修改
function cancel1() {
	window.location.href="/Goods/user/userlist.action";
};
</script>
</head>
<body>
<section><jsp:include page="index_user.jsp"/></section>
<section class="rt_wrap content mCustomScrollbar">
 <div class="rt_content">
 <span style="line-height: 30px;">您现在的位置：<a href="${pageContext.request.contextPath}/product/productlist.action">SmartShop</a> &gt; 个人信息修改</span> 
      <div class="page_title">
       <h2 class="fl">修改个人信息</h2>      
      </div> 
       <form action="" method="post" id="updateform" name="updateform"> 
  		<input type="hidden" name="userId" value="${user.userId }"/>
      <table class="table">              
       <tr>      
        <td class="center">用户名</td><td><input type="text" name="userName" value="${user.userName }"> </td> 
        </tr>
        <tr>              
        <td class="center">登录名(*)</td><td><input type="text" name="loginName" value="${user.loginName }" required="required"> </td> 
        </tr>
        <tr>              
        <td class="center">密码(*)</td><td><input type="text" name="loginPwd" value="${user.loginPwd }"  required="required"> </td>  
        </tr> 
        <tr>            
        <td class="center">手机号码</td><td><input type="text" name="userPhone" value="${user.userPhone }"> </td>
        </tr>  
        <tr>             
        <td class="center">性别s</td><td>
      	    <input type="radio" name="userSex" value="0" <c:if test="${user.userSex==0 }">checked="checked"</c:if>>男性&nbsp;
        	<input type="radio" name="userSex" value="1" <c:if test="${user.userSex==1 }">checked="checked"</c:if>/>女性 </td> 
        </tr>  
        <tr>            
        <td class="center">收货地址</td><td><input type="text" name="userAddress" value="${user.userAddress }"> </td>
        </tr> 
        <tr>              
        <td class="center">用户类型</td><td><input type="radio" name="userStatus" value="${user.userStatus}" <c:if test="${user.userStatus==2 }">checked="checked"</c:if> readonly="readonly">普通会员</td> 
        </tr>                                                   
        <tr>              
        <td class="center" colspan="2"><input type="button" onclick="updateUser()" value="修改"> &nbsp;<input type="button" <c:if test="${user.loginName=='admin'}">onclick="comeback()"</c:if> onclick="cancel()"  value="取消"> </td> 
        </tr>                                                   
      </table>
     </form> 
 </div>
</section>
</body>
</html>