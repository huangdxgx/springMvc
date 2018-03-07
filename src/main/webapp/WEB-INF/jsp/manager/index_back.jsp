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
 <h1><img src="${pageContext.request.contextPath}/images/admin_logo.png"/></h1>
 <ul class="rt_nav">
 <li><c:if test="${not empty sessionScope.adminName}"><span style=" line-height:50px; color: white;"><c:out value="${sessionScope.adminName}"/> 您好，今天是<fmt:formatDate pattern="yyyy-MM-dd" 	value="<%=new Date()%>"/>，欢迎回到后台信息管理中心</span></c:if></li>
  <li><a href="${pageContext.request.contextPath}/manager/index_back.jsp" target="_blank" class="website_icon">站点首页</a></li>
  <li><a href="${pageContext.request.contextPath}/user/getAdminByloginName.action" class="set_icon">管理员</a></li>
  <li><a href="javascript:loginoutAdmin()" class="quit_icon">安全退出</a></li>
 </ul>
</header>
<!--aside nav-->
<!--aside nav-->
<aside class="lt_aside_nav content mCustomScrollbar">
 <ul> 
  <li>
   <dl>
    <dt>商品信息管理</dt>
    <!--当前链接则添加class:active-->
    <dd><a href="${pageContext.request.contextPath}/product/list.action" class="active">商品列表</a></dd>
    <dd><a href="${pageContext.request.contextPath}/manager/product_detail.jsp">商品上新</a></dd>
   </dl>
  </li>  
  <li>
   <dl>
    <dt>订单信息管理</dt>
    <dd><a href="${pageContext.request.contextPath}/manager/order_list.jsp">订单列表</a></dd>
    <dd><a href="${pageContext.request.contextPath}/manager/order_detail.jsp">订单详情</a></dd>
   </dl>
  </li> 
  <li>
   <dl>
    <dt>用户管理</dt>
    <dd><a href="${pageContext.request.contextPath}/user/userlist.action">用户列表</a></dd>
   </dl>
  </li> 
  <li>
   <dl>
    <dt>配送与支付设置</dt>
    <dd><a href="${pageContext.request.contextPath}/manager/express_list.jsp">配送方式</a></dd>
    <dd><a href="${pageContext.request.contextPath}/manager/pay_list.jsp">支付方式</a></dd>
   </dl>
  </li>
 </ul>
</aside>  

</body>
</html>