<%@page contentType="text/html" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>后台管理页</title>
</head>
<link rel="stylesheet" type="text/css" href="../css/back/style.css">
<!--[if lt IE 9]>
<script src="js/html5.js"></script>
<![endif]-->
<script src="${pageContext.request.contextPath }/js/jquery.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/user_js/function_user.js"></script>
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
<!--header-->
<header>
 <h1 style="height: 70px; color: white;line-height: 70px;">个人信息中心</h1>
 <span style="line-height: 70px; color: white; margin-left: 60%;"><c:out value="${sessionScope.loginName}"/> 您好，今天是<fmt:formatDate pattern="yyyy-MM-dd" 	value="<%=new Date()%>"/>，欢迎回到个人信息中心</span>
 <span style="float: right;line-height: 70px;color: white;padding-right: 20px;"><a style="color: white;" href="${pageContext.request.contextPath }/product/productlist.action">返回首页</a></span>
 
</header>
<!--aside nav-->
<!--aside nav-->
<aside class="lt_aside_nav content mCustomScrollbar">
 <ul>
 <c:if test="${sessionScope.loginName =='admin'}">
  <li>
   <dl>
    <dt>商品信息管理</dt>
    <!--当前链接则添加class:active-->
    <dd><a href="${pageContext.request.contextPath}/manager/product_list.jsp" class="active">商品列表</a></dd>
    <dd><a href="${pageContext.request.contextPath}/manager/product_detail.jsp">商品上新</a></dd>
   </dl>
  </li>
  </c:if>
  <li>
   <dl>
    <dt>订单信息管理</dt>
    <dd><a href="${pageContext.request.contextPath}/user/order_list.jsp">订单列表</a></dd>
   <c:if test="${sessionScope.loginName =='admin'}"> <dd><a href="${pageContext.request.contextPath}/user/order_detail.jsp">订单详情</a></dd></c:if>
   </dl>
  </li>
  <li>
   <dl>
    <dt>用户管理</dt>
    <dd><a href="${pageContext.request.contextPath}/user/users.action">用户信息</a></dd>
    <dd><a href="${pageContext.request.contextPath}/user/getUser.action">完善个人信息</a></dd>
    <dd><a href="javascript:deletUser()">注销用户</a></dd>
   </dl>
  </li>
  <c:if test="${sessionScope.loginName =='admin'}">
  <li>
   <dl>
    <dt>配送与支付设置</dt>
    <dd><a href="${pageContext.request.contextPath}/manager/express_list.jsp">配送方式</a></dd>
    <dd><a href="${pageContext.request.contextPath}/manager/pay_list.jsp">支付方式</a></dd>
   </dl>
  </li>
 </c:if>
 </ul>
</aside> 

</body>
</html>