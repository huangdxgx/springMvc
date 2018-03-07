<%@ page language="java" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html>	
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改管理员信息</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/back/style.css">
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/user_js/function_user.js"></script>
</head>
<body>
<section><jsp:include page="index_back.jsp"/></section>
<section class="rt_wrap content mCustomScrollbar">
 <div class="rt_content">
 <%-- <span style="line-height: 30px;">您现在的位置：<a href="${pageContext.request.contextPath}/product/productlist.action">SmartShop</a> &gt; 个人信息完善</span>  --%>
      <div class="page_title">
       <h2 class="fl">修改管理员信息</h2>      
      </div> 
       <form action="${pageContext.request.contextPath }/user/completeUser.action" method="post" enctype="multipart/form-data" id="updateform" name="updateform" > 
  		<input type="hidden" name="userId" value="${user.userId }"/>
      <table class="table">   
      <tr>
     	<td  class="center">上传头像：</td>
      	<td> 
      	    	
        <label class="uploadImg">
        <c:if test="${not empty user.userPhoto}"><img alt="头像" src="/picture/${user.userPhoto}" width=100 height=100/></c:if> 
         <input type="file" name="file" value="${user.userPhoto}"/>        
         <c:if test="${empty user.userPhoto}"> <span>上传头像</span> </c:if> 
        </label>
         
      	</td>           
       <tr>      
        	<td class="center">用户名(*)</td>
        	<td><input class="text" type="text" name="userName" value="${user.userName }" onblur="checkItem(this)" onfocus="focusItem(this)"  required="required"/><span></span> </td> 
        </tr>
        <tr>              
        	<td class="center">登录名(*)</td>
        	<td><input class="text" type="text" name="loginName" value="${user.loginName }" onblur="checkloginName(this,'${user.loginName }')" onfocus="focusItem(this)" required="required"><span></span> </td> 
        </tr>
        <tr>              
        	<td class="center">密码(*)</td>
        	<td><input class="text" type="text" name="loginPwd" value="${user.loginPwd }" onblur="checkItem(this)" onfocus="focusItem(this)"  required="required"><span></span> </td>  
        </tr> 
        <tr>            
       	 	<td class="center">手机号码(*)</td>
        	<td><input class="text" type="text" pattern="^1[34578]\d{9}$" name="userPhone" value="${user.userPhone }" onblur="checkItem(this)" onfocus="focusItem(this)" required="required"><span></span> </td>
        </tr>  
        <tr>             
        <td class="center">性别</td><td>
      	    <input type="radio" name="userSex" value="0" <c:if test="${user.userSex ==0 }">checked="checked"</c:if>>男性&nbsp;
        	<input type="radio" name="userSex" value="1" <c:if test="${user.userSex ==1 }">checked="checked"</c:if>/>女性 </td> 
        </tr>  
        <tr>            
        	<td class="center">收货地址(*)</td>
        	<td>
        	<input class="text" type="text" name="userAddress" value="${user.userAddress }" onblur="checkItem(this)" onfocus="focusItem(this)" required="required"/><span></span></td>       
        </tr> 
        <tr>              
        	<td class="center">用户类型</td>
        	<td>
        	<input type="radio" name="userStatus" value="${user.userStatus}" <c:if test="${user.userStatus==1 }">checked="checked"</c:if> readonly="readonly">管理员</td> 
        </tr>                                                   
        <tr>              
        	<td class="center" colspan="2"><input type="submit"  value="保存"> &nbsp;
        	<input type="button" onclick="comeback()" value="取消"> </td> 
        </tr>                                                   
      </table>
     </form> 
 </div>
</section>
</body>
</html>