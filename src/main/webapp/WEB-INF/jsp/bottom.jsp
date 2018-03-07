<%@ page  contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<!-- //for-mobile-apps -->
	<link href="${pagecontext.request.contextPath}/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<!-- pignose css -->
	<link href="${pagecontext.request.contextPath}/css/pignose.layerslider.css" rel="stylesheet" type="text/css" media="all" />

	<!-- //pignose css -->
	<link href="${pagecontext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" media="all" />
	<!-- js -->
	<script type="text/javascript" src="${pagecontext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
	<!-- //js -->
	<!-- cart -->
	<script src="${pagecontext.request.contextPath}/js/simpleCart.min.js"></script>
	<!-- cart -->
	<!-- for bootstrap working -->
	<script type="text/javascript" src="${pagecontext.request.contextPath}/js/bootstrap-3.1.1.min.js"></script>
	<!-- //for bootstrap working -->
	 <link href='http://fonts.useso.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
	<link href='http://fonts.useso.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic' rel='stylesheet' type='text/css'>  
	<script src="${pagecontext.request.contextPath}/js/jquery.easing.min.js"></script>
<body>
<!-- //底部 -->
<div class="coupons">
	<div class="container">
		<div class="coupons-grids text-center">
			<div class="col-md-3 coupons-gd">
				<h3>简单买，快乐购！</h3>
			</div>
			<div class="col-md-3 coupons-gd">
				<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
				<h4>登录您的账号</h4>
				<p>Neque porro quisquam est, qui dolorem ipsum quia dolor
			sit amet, consectetur.</p>
			</div>
			<div class="col-md-3 coupons-gd">
				<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
				<h4>选择主题</h4>
				<p>Neque porro quisquam est, qui dolorem ipsum quia dolor
			sit amet, consectetur.</p>
			</div>
			<div class="col-md-3 coupons-gd">
				<span class="glyphicon glyphicon-credit-card" aria-hidden="true"></span>
				<h4>支付方式</h4>
				<p>Neque porro quisquam est, qui dolorem ipsum quia dolor
			sit amet, consectetur.</p>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
</div>
<!-- footer -->
<div class="footer">
	<div class="container">
		<div class="col-md-3 footer-left">
			<h2><a href="index.html"><img src="<%=request.getContextPath()%>/images/logo3.jpg" alt=" " /></a></h2>
			<p>Neque porro quisquam est, qui dolorem ipsum quia dolor
			sit amet, consectetur, adipisci velit, sed quia non 
			numquam eius modi tempora incidunt ut labore 
			et dolore magnam aliquam quaerat voluptatem.</p>
		</div>
		<div class="col-md-9 footer-right">
			<div class="col-sm-6 newsleft">
				<h3>搜索关键词 !</h3>
			</div>
			<div class="col-sm-6 newsright">
				<form>
					<input type="text" value="Email" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Email';}" required="">
					<input type="submit" value="搜索">
				</form>
			</div>
			<div class="clearfix"></div>
			<div class="sign-grds">
				<div class="col-md-4 sign-gd">
					<h4>信息</h4>
					<ul>
						<li><a href="${pageContext.request.contextPath}/product/productlist.action">主页</a></li>
						<li><a href="${pageContext.request.contextPath}/product/mens.action">男装</a></li>
						<li><a href="${pageContext.request.contextPath}/product/womens.action">女装</a></li>
						<li><a href="${pageContext.request.contextPath}/product/electronics.action">电子配件</a></li>
						<li><a href="${pageContext.request.contextPath}/product/mens.action">衬衫</a></li>
						<li><a href="${pageContext.request.contextPath}/contact.jsp">联系我们</a></li>
					</ul>
				</div>
				
				<div class="col-md-4 sign-gd-two">
					<h4>商城信息</h4>
					<ul>
						<li><i class="glyphicon glyphicon-map-marker" aria-hidden="true"></i>地址 : 中关村 <span>南宁市</span></li>
						<li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i>邮箱 : <a href="mailto:info@example.com">huangdongxi126@126.com</a></li>
						<li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>电话 : 18577854305</li>
					</ul>
				</div>
				<div class="col-md-4 sign-gd flickr-post">
					<h4>Flickr Posts</h4>
					<ul>
						<li><a href="${pageContext.request.contextPath}/product/electronics.action"><img src="<%=request.getContextPath()%>/images/b15.jpg" alt=" " class="img-responsive" /></a></li>
						<li><a href="${pageContext.request.contextPath}/product/electronics.action"><img src="<%=request.getContextPath()%>/images/b16.jpg" alt=" " class="img-responsive" /></a></li>
						<li><a href="${pageContext.request.contextPath}/product/electronics.action"><img src="<%=request.getContextPath()%>/images/b17.jpg" alt=" " class="img-responsive" /></a></li>
						<li><a href="${pageContext.request.contextPath}/product/electronics.action"><img src="<%=request.getContextPath()%>/images/b18.jpg" alt=" " class="img-responsive" /></a></li>
						<li><a href="${pageContext.request.contextPath}/product/electronics.action"><img src="<%=request.getContextPath()%>/images/b15.jpg" alt=" " class="img-responsive" /></a></li>
						<li><a href="${pageContext.request.contextPath}/product/electronics.action"><img src="<%=request.getContextPath()%>/images/b16.jpg" alt=" " class="img-responsive" /></a></li>
						<li><a href="${pageContext.request.contextPath}/product/electronics.action"><img src="<%=request.getContextPath()%>/images/b17.jpg" alt=" " class="img-responsive" /></a></li>
						<li><a href="${pageContext.request.contextPath}/product/electronics.action"><img src="<%=request.getContextPath()%>/images/b18.jpg" alt=" " class="img-responsive" /></a></li>
						<li><a href="${pageContext.request.contextPath}/product/electronics.action"><img src="<%=request.getContextPath()%>/images/b15.jpg" alt=" " class="img-responsive" /></a></li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="clearfix"></div>
		<p class="copy-right">Copyright &copy; 2017.重案四组<a target="_blank" href=""></a></p>
	</div>
</div>
<!-- //footer -->

</body>
</html>