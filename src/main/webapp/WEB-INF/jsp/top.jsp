<%@ page  contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<!-- //for-mobile-apps -->
	<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
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
<!-- 头部-->
		<div class="header">
			<div class="container">
				<ul>
					<li><span  aria-hidden="true"></span></li>					
					<li><span  aria-hidden="true"></span>
						<a href="mailto:info@example.com"></a>
					</li>
					<li><span aria-hidden="true"><c:if test="${not empty sessionScope.commonUser }">您好，${sessionScope.commonUser }</c:if></span>
					<span><c:if test="${sessionScope.loginName !='admin' && not empty sessionScope.commonUser }"><a href="${pageContext.request.contextPath }/user/users.action">个人中心</a></c:if></span>
					<span><c:if test="${not empty sessionScope.commonUser }"><a href="javascript:logout()">注销</a></c:if></span></li>
				</ul>
			</div>
		</div>
		<!-- //header -->
		<!-- header-bot -->
		<div class="header-bot">
			<div class="container">
				<div class="col-md-3 header-left">
					<h1><a href="index.html"><img src="<%=request.getContextPath()%>/images/logo3.jpg"></a></h1>
				</div>
				<div class="col-md-6 header-middle">
					<form>
						<!--搜索框-->
						<div class="search">
							<input type="search" value="搜索" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = '搜索';}" required="">
						</div>
						<!--搜索下拉-->
						<div class="section_room">
							 <select id="country" onChange="change_country(this.value)" class="frm-field required"> 
								<option value="null">商品分类</option>
			                      <c:forEach var="category" items="${categorylist}"> 
							        <option value="${category.categoryId}">${category.categoryName}</option>
				                  </c:forEach>								
							</select> 
						</div>
						<div class="sear-sub">
							<input type="submit" value=" ">
						</div>
						<div class="clearfix"></div>
					</form>
				</div>
				<div class="col-md-3 header-right footer-bottom">
				<!-- 各种图标图标 -->
					<ul>
						<li>
							<a href="#" class="use1" data-toggle="modal" data-target="#myModal4"><span>登录</span></a>

						</li>
						<li>
							<a class="fb" href="#"></a>
						</li>
						<li>
							<a class="twi" href="#"></a>
						</li>
						<li>
							<a class="insta" href="#"></a>
						</li>
						<li>
							<a class="you" href="#"></a>
						</li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<!-- //header-bot -->
		<!-- banner -->
		<div class="ban-top">
			<div class="container">
				<div class="top_nav_left">
					<nav class="navbar navbar-default">
						<div class="container-fluid">
							<!-- 导航栏下拉-->
							<div class="navbar-header">
								<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				  </button>
							</div>
							<!-- Collect the nav links, forms, and other content for toggling -->
							<div class="collapse navbar-collapse menu--shylock" id="bs-example-navbar-collapse-1">
								<ul class="nav navbar-nav menu__list">
									<li class="active menu__item menu__item--current">
										<a class="menu__link" href="<%=request.getContextPath()%>/product/productlist.action">首页 <span class="sr-only">(current)</span></a>
									</li>
									<li class="dropdown menu__item">
										<a href="#" class="dropdown-toggle menu__link" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">商品分类<span class="caret"></span></a>
										<ul class="dropdown-menu multi-column columns-3">
											<div class="row">
												<div class="col-sm-6 multi-gd-img1 multi-gd-text ">
													<a href="mens.html"><img src="<%=request.getContextPath()%>/images/woo1.jpg" alt=" " /></a>
												</div>
												<div class="col-sm-3 multi-gd-img">
													<ul class="multi-column-dropdown">
														<li>
															<a href="mens.html">服装</a>
														</li>
														<li>
															<a href="mens.html">皮夹</a>
														</li>
														<li>
															<a href="mens.html">鞋类</a>
														</li>
														<li>
															<a href="mens.html">手表</a>
														</li>
														<li>
															<a href="mens.html">饰品</a>
														</li>
														<li>
															<a href="mens.html">手提包</a>
														</li>
														<li>
															<a href="mens.html">帽子</a>
														</li>
													</ul>
												</div>
												<div class="col-sm-3 multi-gd-img">
													<ul class="multi-column-dropdown">
														<li>
															<a href="mens.html">珠宝</a>
														</li>
														<li>
															<a href="mens.html">太阳眼镜</a>
														</li>
														<li>
															<a href="mens.html">男士香水</a>
														</li>
														<li>
															<a href="mens.html">化妆品</a>
														</li>
														<li>
															<a href="mens.html">上衣</a>
														</li>
														<li>
															<a href="mens.html">皮鞋</a>
														</li>
														<li>
															<a href="mens.html">游泳衣</a>
														</li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
										</ul>
									</li>
									<li class="dropdown menu__item">
										<a href="#" class="dropdown-toggle menu__link" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">热门商品 <span class="caret"></span></a>
										<ul class="dropdown-menu multi-column columns-3">
											<div class="row">
												<div class="col-sm-3 multi-gd-img">
													<ul class="multi-column-dropdown">
														<li>
															<a href="womens.html">女装</a>
														</li>
														<li>
															<a href="womens.html">皮夹</a>
														</li>
														<li>
															<a href="womens.html">鞋类</a>
														</li>
														<li>
															<a href="womens.html">手表</a>
														</li>
														<li>
															<a href="womens.html">化妆品</a>
														</li>
														<li>
															<a href="womens.html">包包</a>
														</li>
														<li>
															<a href="womens.html">帽子</a>
														</li>
													</ul>
												</div>
												<div class="col-sm-3 multi-gd-img">
													<ul class="multi-column-dropdown">
														<li>
															<a href="womens.html">珠宝 & 首饰</a>
														</li>
														<li>
															<a href="womens.html">太阳眼镜</a>
														</li>
														<li>
															<a href="womens.html">香水</a>
														</li>
														<li>
															<a href="womens.html">化妆品</a>
														</li>
														<li>
															<a href="womens.html">上衣</a>
														</li>
														<li>
															<a href="womens.html">手提包</a>
														</li>
														<li>
															<a href="womens.html">泳衣</a>
														</li>
													</ul>
												</div>
												<div class="col-sm-6 multi-gd-img multi-gd-text ">
													<a href="womens.html"><img src="<%=request.getContextPath()%>/images/woo.jpg" alt=" " /></a>
												</div>
												<div class="clearfix"></div>
											</div>
										</ul>
									</li>
									<li class=" menu__item">
										<a class="menu__link" href="${pageContext.request.contextPath }/product/electronics.action">数 码</a>
									</li>
									<li class=" menu__item">
										<a class="menu__link" href="codes.html">限时抢购</a>
									</li>
									<li class=" menu__item">
										<a class="menu__link" href="../contact.jsp">联系我们</a>
									</li>
								</ul>
							</div>
						</div>
					</nav>
				</div>
				<div class="top_nav_right">
					<div class="cart box_1">
						<a href="checkout.html">
							<h3> <div class="total">
								<i class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></i>
								<span class="simpleCart_total"></span> (<span id="simpleCart_quantity" class="simpleCart_quantity"></span> 件)</div>
								
							</h3>
						</a>
						<p>
							<a href="javascript:;" class="simpleCart_empty">清 空 购 物 车</a>
						</p>

					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>

</body>
</html>