<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<title>Account</title>
<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<%--
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-2.1.4.min.js"></script>
--%>

	<!-- Custom Theme files -->
<!--theme-style-->
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css" media="all" />
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Fashion Mania Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- start menu -->
<link href="<%=request.getContextPath()%>/css/memenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/memenu.js"></script>
<script>$(document).ready(function(){$(".memenu").memenu();});</script>
<script src="<%=request.getContextPath()%>/js/simpleCart.min.js"> </script>
<script src="<%=request.getContextPath()%>/js/user_js/user.js" type="text/javascript"></script>
<!-- slide -->
</head>
<body>
<!--header-->
<div class="header">
	<div class="header-top">
		<div class="container">
		<div class="col-md-4 world">
					<%--<ul >
						<li>
						<select class="in-drop">
							  <option>英语</option>
							  <option>日语</option>
							  <option>法语</option>
							</select></li>
						<li><select class="in-drop1">
							  <option>Dollar</option>
							  <option>Euro</option>
							  <option>Yen</option>
							</select>
						</li>
					</ul>--%>
				</div>
				<div class="col-md-4 logo">
					<a href="<%=request.getContextPath()%>/product/productlist.action"><img src="<%=request.getContextPath()%>/images/logo.png" alt=""></a>
				</div>
		
			<div class="col-md-4 header-left">		
					<p class="log"><a href="<%=request.getContextPath()%>/account"  >Login</a>
						<span>or</span><a  href="<%=request.getContextPath()%>/register"  >Signup</a></p>
					<div class="cart box_1">
						<a href="checkout.html">
						<h3> <div class="total">
							<span class="simpleCart_total"></span></div>
							<img src="<%=request.getContextPath()%>/images/cart.png" alt=""/></h3>
						</a>
						<p><a href="javascript:;" class="simpleCart_empty">Empty Cart</a></p>

					</div>
					<div class="clearfix"> </div>
			</div>
				<div class="clearfix"> </div>
		</div>
		</div>
		<div class="container">
			<div class="head-top">
				<div class="col-md-2 number">
					<span><i class="glyphicon glyphicon-phone"></i>187 7898 9157</span>
				</div>
		  <div class="col-md-8 h_menu4">
				<ul class="memenu skyblue">
					  <li class=" grid"><a  href="index.jsp">Home</a></li>
				      <li><a  href="#">Men</a>
				      	<div class="mepanel">
						<div class="row">
							<div class="col1">
								<div class="h_nav">
									<h4>All Clothing</h4>
									<ul>
										<li><a href="products.html">Shirts</a></li>
										<li><a href="products.html">Sports Wear</a></li>
										<li><a href="products.html">Shorts</a></li>
										<li><a href="products.html">Suits & Blazers</a></li>
										<li><a href="products.html">Formal Shirts</a></li>
										<li><a href="products.html">Sweatpants</a></li>
										<li><a href="products.html">Swimwear</a></li>
										<li><a href="products.html">Trousers & Chinos</a></li>
										<li><a href="products.html">T-Shirts</a></li>
										<li><a href="products.html">Underwear & Socks</a></li>
										
									</ul>	
								</div>							
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>Footwear</h4>
									<ul>
										<li><a href="products.html">Formal Shoes</a></li>
										<li><a href="products.html">Boots</a></li>
										<li><a href="products.html">Sports Shoes</a></li>
										<li><a href="products.html">Casual Shoes</a></li>
										<li><a href="products.html">Running Shoes</a></li>
										<li><a href="products.html">Sneakers</a></li>
										<li><a href="products.html">Loafers</a></li>
										<li><a href="products.html">Slippers</a></li>
										<li><a href="products.html">Sandals</a></li>
										<li><a href="products.html">Flip-flops</a></li>
									
									</ul>	
								</div>							
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>Popular Brands</h4>
									<ul>
										<li><a href="products.html">Levis</a></li>
										<li><a href="products.html">Persol</a></li>
										<li><a href="products.html">Nike</a></li>
										<li><a href="products.html">Edwin</a></li>
										<li><a href="products.html">New Balance</a></li>
										<li><a href="products.html">Jack & Jones</a></li>
										<li><a href="products.html">Paul Smith</a></li>
										<li><a href="products.html">Ray-Ban</a></li>
										<li><a href="products.html">Wood Wood</a></li>
									</ul>	
								</div>												
							</div>
						  </div>
						</div>
					</li>
				    <li class="grid"><a  href="#">	Women</a>
					  	<div class="mepanel">
						<div class="row">
							<div class="col1">
								<div class="h_nav">
									<h4>All Clothing</h4>
									<ul>
										<li><a href="products.html">Shirts & Tops</a></li>
										<li><a href="products.html">Sports Wear</a></li>
										<li><a href="products.html">Kurtas & Kurties</a></li>
										<li><a href="products.html">Suits & Blazers</a></li>
										<li><a href="products.html">Sarees</a></li>
										<li><a href="products.html">Sweatpants</a></li>
										<li><a href="products.html">Swimwear</a></li>
										<li><a href="products.html">Night-Suits</a></li>
										<li><a href="products.html">T-Shirts</a></li>
										<li><a href="products.html">Jeans</a></li>
										
									</ul>	
								</div>							
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>Footwear</h4>
									<ul>
										<li><a href="products.html">Heels</a></li>
										<li><a href="products.html">Flats</a></li>
										<li><a href="products.html">Sports Shoes</a></li>
										<li><a href="products.html">Casual Shoes</a></li>
										<li><a href="products.html">Running Shoes</a></li>
										<li><a href="products.html">Wedges</a></li>
										<li><a href="products.html">Boots</a></li>
										<li><a href="products.html">Pumps</a></li>
										<li><a href="products.html">Slippers</a></li>
										<li><a href="products.html">Flip-flops</a></li>
									
									</ul>
								</div>							
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>Popular Brands</h4>
									<ul>
										<li><a href="products.html">Levis</a></li>
										<li><a href="products.html">Persol</a></li>
										<li><a href="products.html">Nike</a></li>
										<li><a href="products.html">Edwin</a></li>
										<li><a href="products.html">New Balance</a></li>
										<li><a href="products.html">Jack & Jones</a></li>
										<li><a href="products.html">Paul Smith</a></li>
										<li><a href="products.html">Ray-Ban</a></li>
										<li><a href="products.html">Wood Wood</a></li>
									</ul>	
								</div>												
							</div>
						  </div>
						</div>
			    </li>
				<li><a  href="typo.html">Blog</a></li>				
				<li><a class="color6" href="contact.html">Conact</a></li>
			  </ul> 
			</div>
		<div class="col-md-2 search">		
			<a class="play-icon popup-with-zoom-anim" href="#small-dialog"><i class="glyphicon glyphicon-search"> </i> </a>
		</div>
		<div class="clearfix"> </div>
			<!---pop-up-box---->
					  <script type="text/javascript" src="<%=request.getContextPath()%>/js/modernizr.custom.js"></script>
					<link href="<%=request.getContextPath()%>/css/popuo-box.css" rel="stylesheet" type="text/css" media="all"/>
					<script src="<%=request.getContextPath()%>/js/jquery.magnific-popup.js" type="text/javascript"></script>
					<!---//pop-up-box---->
				<div id="small-dialog" class="mfp-hide">
				<div class="search-top">
						<div class="login">
							<input type="submit" value="">
							<input type="text" value="Type something..." onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}">		
						</div>
						<p>	Shopping</p>
					</div>				
				</div>
				 <script>
						$(document).ready(function() {
						$('.popup-with-zoom-anim').magnificPopup({
							type: 'inline',
							fixedContentPos: false,
							fixedBgPos: true,
							overflowY: 'auto',
							closeBtnInside: true,
							preloader: false,
							midClick: true,
							removalDelay: 300,
							mainClass: 'my-mfp-zoom-in'
						});
																						
						});
				</script>			
	<!---->		
		</div>
	</div>
</div>
<!--//header-->
<div class="account">
	<div class="container">
		<h1>Account</h1>
		<div class="account_grid">
			   <div class="col-md-6 login-right">
				<form id="loginform" name="loginform" action="" method="post">
					<span id="checklogin"></span>
					<span>用户名</span>
					<input type="text" name="loginName" id="userName" onblur="notnull()" onfocus="checklogin()" placeholder="请输入用户名 " required="">

					<span>密码</span>
					<input type="password"  name="loginPwd" id="pwd" onblur="notnull()" value=""  onfocus="checklogin()" placeholder="请输入密码" required="" >
					<div class="word-in">
				  		<a class="forgot" href="#">忘 记 密 码?</a>
				 		 <input type="button"  onclick="loginsubmit()" value="Login">
				  	</div>
			    </form>
			   </div>	
			    <div class="col-md-6 login-left">
			  	 <h4>NEW CUSTOMERS</h4>
					<p title="通过使用我们的商店创建一个帐户，您将能够更快地完成结帐过程，存储多个发货地址，查看并跟踪您的帐户中的订单等等.">By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.</p>
<%--
				 <p>通过使用我们的商店创建一个帐户，您将能够更快地完成结帐过程，存储多个发货地址，查看并跟踪您的帐户中的订单等等.</p>
--%>
				 <a class="acount-btn" href="<%=request.getContextPath()%>/register">Create an Account</a>
			   </div>
			   <div class="clearfix"> </div>
			 </div>
	</div>
</div>

<!--footer-->
<div class="footer">
	<div class="container">
		<div class="footer-top">
			<div class="col-md-4 top-footer1">
				<h2>Newsletter</h2>
					<form>
						<input type="text" value="" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='';}">
						<input type="submit" value="SUBSCRIBE">
					</form>
			</div>
			<div class="clearfix"> </div>	
		</div>	
	</div>
	<div class="footer-bottom">
		<div class="container">
				<div class="col-md-3 footer-bottom-cate">
					<h6>Categories</h6>
					<ul>
						<li><a href="#">Curabitur sapien</a></li>
						<li><a href="#">Dignissim purus</a></li>
						<li><a href="#">Tempus pretium</a></li>
						<li><a href="#">Dignissim neque</a></li>
						<li><a href="#">Ornared id aliquet</a></li>
						
					</ul>
				</div>
				<div class="col-md-3 footer-bottom-cate">
					<h6>Feature Projects</h6>
					<ul>
						<li><a href="#">Curabitur sapien</a></li>
						<li><a href="#">Dignissim purus</a></li>
						<li><a href="#">Tempus pretium</a></li>
						<li><a href="#">Dignissim neque</a></li>
						<li><a href="#">Ornared id aliquet</a></li>
						
					</ul>
				</div>
				<div class="col-md-3 footer-bottom-cate">
					<h6>Top Brands</h6>
					<ul>
						<li><a href="#">Curabitur sapien</a></li>
						<li><a href="#">Dignissim purus</a></li>
						<li><a href="#">Tempus pretium</a></li>
						<li><a href="#">Dignissim neque</a></li>
						<li><a href="#">Ornared id aliquet</a></li>
						<li><a href="#">Ultrices id du</a></li>
						<li><a href="#">Commodo sit</a></li>
						
					</ul>
				</div>
				<div class="col-md-3 footer-bottom-cate cate-bottom">
					<h6>Our Address</h6>
					<ul>
						<li>Aliquam metus  dui. </li>
						<li>orci, ornareidquet</li>
						<li> ut,DUI.</li>
						<li>nisi, dignissim</li>
						<li>gravida at.</li>
						<li class="phone">PH : 6985792466</li>
					</ul>
				</div>
				<div class="clearfix"> </div>
				<p class="footer-class">Copyright &copy; 2015.Company name All rights reserved.<a target="_blank" href="http://www.cssmoban.com/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>
			</div>
	</div>
</div>

<!--//footer-->
</body>
</html>