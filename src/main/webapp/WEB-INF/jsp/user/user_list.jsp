<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户列表</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/back/style.css">
<!--[if lt IE 9]>
<script src="js/html5.js"></script>
<![endif]-->
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script>
	(function($){
		$(window).load(function(){		
			$("a[rel='load-content']").click(function(e){
				e.preventDefault();
				var url=$(this).attr("href");
				$.get(url,function(data){
					$(".content .mCSB_container").append(data); //load new content inside .mCSB_container
					//scroll-to appended content 
					$(".content").mCustomScrollbar("scrollTo","h2:last");
				});
			});
			
			$(".content").delegate("a[href='top']","click",function(e){
				e.preventDefault();
				$(".content").mCustomScrollbar("scrollTo",$(this).attr("href"));
			});		
		});
	})(jQuery);
</script>
<body>
<section><jsp:include page="index_user.jsp"/></section>
<section class="rt_wrap content mCustomScrollbar">
 <div class="rt_content">
 <span style="line-height: 30px;">您现在的位置：<a href="${pageContext.request.contextPath}/product/productlist.action">SmartShop</a> &gt; 个人中心</span> 
      <div class="page_title">
       <h2 class="fl">个人信息</h2>      
      </div> 
      <input type="hidden" name="userId" value="${user.userId }"/>     
      <table class="table">
       <tr>       
        <th>用户名</th>
        <th>登录名</th>
        <th>密码</th>
        <th>手机号码</th>
        <th>性别</th>
        <th>收货地址</th>
        <th>用户类型</th>
        <th>操作</th>
       </tr>
       <tr>         
        <td class="center">${user.userName }</td>
        <td><a href="${pageContext.request.contextPath }/user/getUserDetail.action?userId=${user.userId }">${user.loginName }</a></td>
         <td>${user.loginPwd }</td>
        <td class="center">${user.userPhone }</td>
        <td class="center"><c:if test="${user.userSex==1 }">女</c:if><c:if test="${user.userSex==0 }">男</c:if> </td>
        <td class="center">${user.userAddress }<c:if test="${not empty user.userAddress }"><a title="已验证" class="link_icon">&#89;</a></c:if></td>
        <td class="center"><c:if test="${user.userStatus=='2' }">普通会员</c:if></td>
        <td class="center">
         <a href="${pageContext.request.contextPath }/user/getUserById.action?userId=${user.userId}" title="修改" class="link_icon">&#100;</a>
        </td>
       </tr>
       
      </table>
     
 </div>
</section>

</body>
</html>