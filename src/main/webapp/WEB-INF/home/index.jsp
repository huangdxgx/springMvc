<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
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
<!-- slide -->
<script src="<%=request.getContextPath()%>/js/responsiveslides.min.js"></script>
    <%--user.js--%>
 <script src="<%=request.getContextPath()%>/js/user_js/user.js" type="text/javascript"></script>

   <script>
    $(function () {
      $("#slider").responsiveSlides({
      	auto: true,
      	speed: 500,
        namespace: "callbacks",
        pager: true,
      });
    });
  </script>
</head>
<body>
<!--header-->
<jsp:include page="../home/header.jsp"/>
<!--banner-->
<div class="banner">
	<div class="col-sm-3 banner-mat">
		<img class="img-responsive"	src="<%=request.getContextPath()%>/images/ba1.jpg" alt="">
	</div>
	<div class="col-sm-6 matter-banner">
	 	<div class="slider">
	    	<div class="callbacks_container">
	      		<ul class="rslides" id="slider">
	        		<li>
	          			<img src="<%=request.getContextPath()%>/images/1.jpg" alt="">
	       			 </li>
			 		 <li>
	          			<img src="<%=request.getContextPath()%>/images/2.jpg" alt="">
	       			 </li>
					 <li>
	          			<img src="<%=request.getContextPath()%>/images/1.jpg" alt="">
	        		</li>	
	      		</ul>
	 	 	</div>
		</div>
	</div>
	<div class="col-sm-3 banner-mat">
		<img class="img-responsive" src="<%=request.getContextPath()%>/images/ba.jpg" alt="">
	</div>
	<div class="clearfix"> </div>
</div>
<!--//banner-->
<%--
<div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >手机网站模板</a></div>
--%>
<!--content-->
<div class="content">
	<div class="container">
		<div class="content-top">
			<h1>Recent Products</h1>
			<div class="content-top1">
				<div class="col-md-3 col-md2">
					<div class="col-md1 simpleCart_shelfItem">
						<a href="single.html">
							<img class="img-responsive" src="<%=request.getContextPath()%>/images/pi.png" alt="" />
						</a>
						<h3><a href="single.html">Tops</a></h3>
						<div class="price">
								<h5 class="item_price">$300</h5>
								<a href="#" class="item_add">Add To Cart</a>
								<div class="clearfix"> </div>
						</div>
					</div>
				</div>	
			<div class="col-md-3 col-md2">
					<div class="col-md1 simpleCart_shelfItem">
						<a href="single.html">
							<img class="img-responsive" src="<%=request.getContextPath()%>/images/pi2.png" alt="" />
						</a>
						<h3><a href="single.html">T-Shirt</a></h3>
						<div class="price">
								<h5 class="item_price">$300</h5>
								<a href="#" class="item_add">Add To Cart</a>
								<div class="clearfix"> </div>
						</div>
						
					</div>
				</div>	
			<div class="col-md-3 col-md2">
					<div class="col-md1 simpleCart_shelfItem">
						<a href="single.html">
							<img class="img-responsive" src="<%=request.getContextPath()%>/images/pi4.png" alt="" />
						</a>
						<h3><a href="single.html">Shirt</a></h3>
						<div class="price">
								<h5 class="item_price">$300</h5>
								<a href="#" class="item_add">Add To Cart</a>
								<div class="clearfix"> </div>
						</div>
						
					</div>
				</div>	
			<div class="col-md-3 col-md2">
					<div class="col-md1 simpleCart_shelfItem">
						<a href="single.html">
							<img class="img-responsive" src="<%=request.getContextPath()%>/images/pi1.png" alt="" />
						</a>
						<h3><a href="single.html">Tops</a></h3>
						<div class="price">
								<h5 class="item_price">$300</h5>
								<a href="#" class="item_add">Add To Cart</a>
								<div class="clearfix"> </div>
						</div>
						
					</div>
				</div>	
			<div class="clearfix"> </div>
			</div>

			<div class="content-top1">
				<div class="col-md-3 col-md2">
					<div class="col-md1 simpleCart_shelfItem">
						<a href="single.html">
							<img class="img-responsive" src="<%=request.getContextPath()%>/images/pi3.png" alt="" />
						</a>
						<h3><a href="single.html">Shirt</a></h3>
						<div class="price">
								<h5 class="item_price">$300</h5>
								<a href="#" class="item_add">Add To Cart</a>
								<div class="clearfix"> </div>
						</div>
						
					</div>
				</div>	
			<div class="col-md-3 col-md2">
					<div class="col-md1 simpleCart_shelfItem">
						<a href="single.html">
							<img class="img-responsive" src="<%=request.getContextPath()%>/images/pi5.png" alt="" />
						</a>
						<h3><a href="single.html">T-Shirt</a></h3>
						<div class="price">
								<h5 class="item_price">$300</h5>
								<a href="#" class="item_add">Add To Cart</a>
								<div class="clearfix"> </div>
						</div>
						
					</div>
				</div>	
			<div class="col-md-3 col-md2">
					<div class="col-md1 simpleCart_shelfItem">
						<a href="single.html">
							<img class="img-responsive" src="<%=request.getContextPath()%>/images/pi6.png" alt="" />
						</a>
						<h3><a href="single.html">Jeans</a></h3>
						<div class="price">
								<h5 class="item_price">$300</h5>
								<a href="#" class="item_add">Add To Cart</a>
								<div class="clearfix"> </div>
						</div>
						
					</div>
				</div>	
			<div class="col-md-3 col-md2">
					<div class="col-md1 simpleCart_shelfItem">
						<a href="single.html">
							<img class="img-responsive" src="<%=request.getContextPath()%>/images/pi7.png" alt="" />
						</a>
						<h3><a href="single.html">Tops</a></h3>
						<div class="price">
								<h5 class="item_price">$300</h5>
								<a href="#" class="item_add">Add To Cart</a>
								<div class="clearfix"> </div>
						</div>
						
					</div>
				</div>	
			<div class="clearfix"> </div>
			</div>	
		</div>
	</div>
</div>
<!--//content-->
<!--footer-->
<jsp:include page="../home/footer.jsp" />
<!--//footer-->
</body>
</html>