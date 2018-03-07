<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主页</title>		
<style type="text/css">
	
</style>
</head>
<script type="application/x-javascript">
		addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar() { window.scrollTo(0, 1); }
	</script>
	<!-- //for-mobile-apps -->
    <link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<!-- pignose css -->
	<link href="<%=request.getContextPath()%>/css/pignose.layerslider.css" rel="stylesheet" type="text/css" media="all" />
	<!-- //pignose css -->
	<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css" media="all" />
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
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/user_js/function_user.js"></script>
	<body>
 <%--<div><jsp:include page="<%=request.getContextPath()%>/../jsp/top.jsp"/></div>--%>
 <div><c:import url="${pageContext.request.contextPath}../jsp/top"/></div>
<!-- //banner-top -->
<!-- banner -->

<div class="banner-grid">
	<div id="visual">
			<div class="slide-visual">
				<!--图片列表(1000 x 424) -->
				<ul class="slide-group">
					<li><img class="img-responsive" src="<%=request.getContextPath()%>/images/ba1.jpg" alt="Dummy Image" /></li>
					<li><img class="img-responsive" src="<%=request.getContextPath()%>/images/ba2.jpg" alt="Dummy Image" /></li>
					<li><img class="img-responsive" src="<%=request.getContextPath()%>/images/ba3.jpg" alt="Dummy Image" /></li>
				</ul>

				<!-- Slide Description Image Area (316 x 328) -->
				<div class="script-wrap">
					<ul class="script-group">
						<li><div class="inner-script"><img class="img-responsive" src="<%=request.getContextPath()%>/images/baa1.jpg" alt="Dummy Image" /></div></li>
						<li><div class="inner-script"><img class="img-responsive" src="<%=request.getContextPath()%>/images/baa2.jpg" alt="Dummy Image" /></div></li>
						<li><div class="inner-script"><img class="img-responsive" src="<%=request.getContextPath()%>/images/baa3.jpg" alt="Dummy Image" /></div></li>
					</ul>
					<div class="slide-controller">
						<a href="#" class="btn-prev"><img src="<%=request.getContextPath()%>/images/btn_prev.png" alt="Prev Slide" /></a>
						<a href="#" class="btn-play"><img src="<%=request.getContextPath()%>/images/btn_play.png" alt="Start Slide" /></a>
						<a href="#" class="btn-pause"><img src="<%=request.getContextPath()%>/images/btn_pause.png" alt="Pause Slide" /></a>
						<a href="#" class="btn-next"><img src="<%=request.getContextPath()%>/images/btn_next.png" alt="Next Slide" /></a>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="clearfix"></div>
		</div>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/pignose.layerslider.js"></script>
	<script type="text/javascript">
	//<![CDATA[
		$(window).load(function() {
			$('#visual').pignoseLayerSlider({
				play    : '.btn-play',
				pause   : '.btn-pause',
				next    : '.btn-next',
				prev    : '.btn-prev'
			});
		});
	//]]>
	</script>
</div>
<!-- content -->
<div class="new_arrivals">
	<div class="container">
		<h3><span>新品</span>上架</h3>
		<p>夏季新品，入夏大放价</p>
		<div class="new_grids">
			<div class="col-md-4 new-gd-left">
				<img src="<%=request.getContextPath()%>/images/wed1.jpg" alt=" " />
				<div class="wed-brand simpleCart_shelfItem">
					<h4>婚  纱</h4>
					<h5>初夏活动大放价 感恩回馈 低至5折 </h5>
					<p><i>￥2000</i> <span class="item_price">￥3500</span><a class="item_add hvr-outline-out button2" href="${pageContext.request.contextPath }/product/queryById.action?productId=${product.productId}">加入购物车</a></p>
				</div>
			</div>
			<div class="col-md-4 new-gd-middle">
				<div class="new-levis">
					<div class="mid-img">
						<img src="<%=request.getContextPath()%>/images/levis1.png" alt=" " />
					</div>
					<div class="mid-text">
						<h4>四折优惠<span>你还在等什么</span></h4>
						<a class="hvr-outline-out button2" href="product.html">立即购买 </a>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="new-levis">
					<div class="mid-text">
						<h4>五折优惠<span>感恩回馈</span></h4>
						<a class="hvr-outline-out button2" href="product.html">立即购买 </a>
					</div>
					<div class="mid-img">
						<img src="<%=request.getContextPath()%>/images/dig.jpg" alt=" " />
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="col-md-4 new-gd-left">
				<img src="<%=request.getContextPath()%>/images/wed2.jpg" alt=" " />
				<div class="wed-brandtwo simpleCart_shelfItem">
					<h4>男士春装  / 男士夏装</h4>
					<p>男装  专场</p>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>
<!-- //content -->

<!-- content-bottom -->

<div class="content-bottom">
	<div class="col-md-7 content-lgrid">
		<div class="col-sm-6 content-img-left text-center">
			<div class="content-grid-effect slow-zoom vertical">
				<div class="img-box"><img src="<%=request.getContextPath()%>/images/p1.jpg" alt="image" class="img-responsive zoom-img"></div>
					<div class="info-box">
						<div class="info-content simpleCart_shelfItem">
									<h4>手机</h4>
									<span class="separator"></span>
									<p><span class="item_price">￥3500</span></p>
									<span class="separator"></span>
									<a class="item_add hvr-outline-out button2" href="${pageContext.request.contextPath }/product/queryById.action?productId=${product.productId}">加入购物车 </a>
						</div>
					</div>
			</div>
		</div>
		<div class="col-sm-6 content-img-right">
			<h3>618商城特惠<span>五折 ！</span>手机</h3>
		</div>
		
		<div class="col-sm-6 content-img-right">
			<h3>活动：买一送一<span>知名品牌</span>手表</h3>
		</div>
		<div class="col-sm-6 content-img-left text-center">
			<div class="content-grid-effect slow-zoom vertical">
				<div class="img-box"><img src="<%=request.getContextPath()%>/images/p2.jpg" alt="image" class="img-responsive zoom-img"></div>
					<div class="info-box">
						<div class="info-content simpleCart_shelfItem">
							<h4>手表</h4>
							<span class="separator"></span>
							<p><span class="item_price">￥1500</span></p>
							<span class="separator"></span>
							<a class="item_add hvr-outline-out button2" href="${pageContext.request.contextPath }/product/queryById.action?productId=${product.productId}">加入购物车</a>
						</div>
					</div>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
	<div class="col-md-5 content-rgrid text-center">
		<div class="content-grid-effect slow-zoom vertical">
				<div class="img-box"><img src="<%=request.getContextPath()%>/images/p4.jpg" alt="image" class="img-responsive zoom-img"></div>
					<div class="info-box">
						<div class="info-content simpleCart_shelfItem">
									<h4>潮鞋</h4>
									<span class="separator"></span>
									<p><span class="item_price">￥1600</span></p>
									<span class="separator"></span>
									<a class="item_add hvr-outline-out button2" href="${pageContext.request.contextPath }/product/queryById.action?productId=${product.productId}">加入购物车</a>
						</div>
					</div>
			</div>
	</div>
	<div class="clearfix"></div>
</div>
<!-- //content-bottom -->
<!-- product-nav -->

<div class="product-easy">
	<div class="container">
		
		<script src="<%=request.getContextPath()%>/js/easyResponsiveTabs.js" type="text/javascript"></script>
		<script type="text/javascript">
							$(document).ready(function () {
								$('#horizontalTab').easyResponsiveTabs({
									type: 'default', //Types: default, vertical, accordion           
									width: 'auto', //auto or any width like 600px
									fit: true   // 100% fit in a container
								});
							});
							
		</script>
		<!--商品信息-->
		<div class="sap_tabs">
			<div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
				<ul class="resp-tabs-list">
					<li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>最新上架</span></li> 
					<li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span>商城特惠</span></li> 
					<li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><span>好物集锦</span></li> 
				</ul>	
					  	 
				<div class="resp-tabs-container">
				
				<!----------------------------- tab1 ----------------------------------------------------------------------->
					<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
					<c:forEach var="product" items="${newslist }">	
						<div class="col-md-3 product-men" style="display: inline-block;">						
							<div class="men-pro-item simpleCart_shelfItem">							
								<div class="men-thumb-item">
									<img src="<%=request.getContextPath()%>/images/${product.fileName }" alt="" class="pro-image-front">
									<img src="<%=request.getContextPath()%>/images/${product.fileName }" alt="" class="pro-image-back">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="single.html" class="link-product-add-cart">商品详情</a>
											</div>
										</div>
										<span class="product-new-top">新品</span>
										
								</div>
								<div class="item-info-product ">
									<h4><a href="single.html">${product.productName }</a></h4>
									<div class="info-product-price">
										<span class="item_price">${product.productPrice }</span>
										<del>$69.71</del>
									</div>
									<a href="${pageContext.request.contextPath }/product/queryById.action?productId=${product.productId}" class="item_add single-item hvr-outline-out button2">加入购物车</a>									
								</div>
								
							</div>
							
						</div>
						</c:forEach>
							<div class="clearfix"></div>
							
					</div>
					
<!----------------------------- tab2 ----------------------------------------------------------------------->
                   
					<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1">	
					 <c:forEach var="product" items="${menlist }">										
						<div class="col-md-3 product-men">
							<div class="men-pro-item simpleCart_shelfItem">
								<div class="men-thumb-item">
									<img src="<%=request.getContextPath()%>/images/${product.fileName }" alt="" class="pro-image-front">
									<img src="<%=request.getContextPath()%>/images/${product.fileName }" alt="" class="pro-image-back">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="single.html" class="link-product-add-cart">商品详情</a>
											</div>
										</div>
										<span class="product-new-top">特惠</span>
										
								</div>
								<div class="item-info-product ">
									<h4><a href="single.html">${product.productName }</a></h4>
									<div class="info-product-price">
										<span class="item_price">${product.productPrice }</span>
										<del>$69.71</del>
									</div>
									<a href="${pageContext.request.contextPath }/product/queryById.action?productId=${product.productId}" class="item_add single-item hvr-outline-out button2">加入购物车</a>									
								</div>
							</div>
						</div>
						</c:forEach>																	
						<div class="clearfix"></div>						
					</div>			
<!----------------------------- tab3 ----------------------------------------------------------------------->					
					<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-2">
					<c:forEach var="product" items="${phonelist }">
						<div class="col-md-3 product-men">
							<div class="men-pro-item simpleCart_shelfItem">
								<div class="men-thumb-item">
									<img src="<%=request.getContextPath()%>/images/${product.fileName }" alt="" class="pro-image-front">
									<img src="<%=request.getContextPath()%>/images/${product.fileName }" alt="" class="pro-image-back">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="single.html" class="link-product-add-cart">商品详情</a>
											</div>
										</div>
										<span class="product-new-top">热卖</span>										
								</div>
								<div class="item-info-product ">
									<h4><a href="single.html">${product.productName }</a></h4>
									<div class="info-product-price">
										<span class="item_price">${product.productPrice }</span>
										<del>$69.71</del>
									</div>
									<a href="${pageContext.request.contextPath }/product/queryById.action?productId=${product.productId}" class="item_add single-item hvr-outline-out button2">加入购物车</a>									
								</div>
							</div>
						</div>	
						</c:forEach>									
						<div class="clearfix"></div>		
					</div>	
					
				</div>	
					
			</div>
		</div>
	</div>
</div>
<%--<div><jsp:include page="<%=request.getContextPath()%>/../jsp/bottom.jsp"/></div>--%>
 <div><c:import url="${pageContext.request.contextPath}../jsp/bottom"/></div>

 <!-- //footer -->
<!-- 登录框 -->
			<div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content modal-info">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
						</div>
						<div class="modal-body modal-spa">
							<div class="login-grids">
								<div class="login">
									<div class="login-bottom">
										<h3>注册</h3>
										<form action="" id="reguserform" name="reguser" method="post">
											<div class="sign-up">
												<h4>用户名:</h4>
												<span id="registerName"></span>
												<input type="hidden" name="userStatus" value="2"/>
												<input type="text" id="loginName" name="loginName" pattern="[a-zA-Z0-9]{5,15}" oninvalid="setCustomValidity('必须为字母或数字且长度大于5')" onfocus="register()"  onblur="checkName(this)" required>	
											</div>
											<div class="sign-up">
												<h4>密码:</h4>
												<span id="registerPwd"></span>
												<input type="password"  name="loginPwd1" id="regPwd" onfocus="register()"   onblur="checkPwd(this)" required>											
											</div>
											<div class="sign-up">
												<h4>确认密码:</h4>
												<span id="registerPwd1"></span>
												<input type="password"  id="regPwd1" name="loginPwd" onfocus="register()" onblur="checkPwd()"  required>											
											</div>
											<div class="sign-up">
												<input type="button" onclick="reguserSubmit()"  value="立即注册" >
											</div>											
										</form>
									</div>
									<div class="login-right">
										<h3>账号登录</h3>
										<form id="loginform" name="loginform" method="post" action="" >
											<div class="sign-in">
												<h4>用户名:</h4>
												<span id="checklogin"></span>
												<input type="text" name="loginName" id="userName" onblur="notnull()"  onfocus="checklogin()"  placeholder="请输入用户名 " required="">	
											</div>
											<div class="sign-in">
												<h4>密码:</h4>
												<input type="password" name="loginPwd" id="pwd" onblur="notnull()" value="Password"  onfocus="checklogin()" placeholder="请输入密码" required="">
												<a href="#">忘记密码?</a>
											</div>
											<div class="single-bottom">
												<input type="checkbox"  id="brand" value="">
												<label for="brand"><span></span>记住密码.</label>
											</div>
											<div class="sign-in">
												<input type="button" onclick="loginsubmit()" id="button1" value="登录" >
											</div>
										</form>
									</div>
									<div class="clearfix"></div>
								</div>
								<p>登录表示您已同意我们的<a href="#">用户条款</a>和<a href="#">隐私政策</a></p>
							</div>
						</div>
					</div>
				</div>
			</div>
<!-- //login -->
 
	</body>

</html>