<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商品信息表</title>
</head>
<link rel="stylesheet" type="text/css" href="css/back/style.css">
<!--[if lt IE 9]>
<script src="js/html5.js"></script>
<![endif]-->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js" ></script>
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/product_js/function_product.js" ></script>
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
<section><jsp:include page="index_back.jsp"></jsp:include></section>
<section class="rt_wrap content mCustomScrollbar">
 <div class="rt_content">
      <div class="page_title">
       <h2 class="fl">商品信息表</h2>
       <a href="${pageContext.request.contextPath }/product/categories.action" class="fr top_rt_btn add_icon">添加商品</a>
      </div>
      <form action="${pageContext.request.contextPath}/product/search1.action" method="post">
      <section class="mtb">       						
		<!--搜索下拉-->										
		<select id="country" class="select" name="country" onChange="change_country(this.value)" class="frm-field required"> 
			<option value="null">商品分类</option>
			 <c:forEach var="category" items="${categorylist}"> 
			 <option value="${category.categoryId}">${category.categoryName}</option>
			 </c:forEach>								
		</select> 					
       <input type="text" id="productName" name="productName"  class="textbox textbox_225" placeholder="输入产品关键词或产品货号..."/>
       <input type="submit" value="查询" class="group_btn"/>       
      </section>
      </form>
      <table class="table">
       <tr>
        <th>缩略图</th>
        <th>产品名称</th>
        <th>商品描述</th>
        <th>单价</th>
        <th>库存</th>
        <th>上新日期</th>
        <th>操作</th>
       </tr>
       <c:forEach var="pdt" items="${list }">
       <tr>
        <td class="center"><img src="${pageContext.request.contextPath }/images/${pdt.fileName }" width="50" height="50"/></td>
        <td>${pdt.productName }</td>
        <td class="center">${pdt.productDescrpt }</td>
        <td class="center"><strong class="">${pdt.productPrice }</strong></td>
        <td class="center">${pdt.productStock }</td>       
        <td class="center">${pdt.productCreateTime }</td>
        <td class="center">
         <a href="#" title="预览" class="link_icon" target="_blank">&#118;</a>
         <a href="${pageContext.request.contextPath }/product/getPdtById.action?productId=${pdt.productId}" title="修改" class="link_icon">&#101;</a>
         <a href="#" title="删除" onclick="delelePdt(${pdt.productId})" class="link_icon">&#100;</a>
        </td>
       </tr>
       </c:forEach>
      </table>
      <aside class="paging">
       <a href="${pageContext.request.contextPath}/product/list.action?page=1">首页</a>
       <a href="${pageContext.request.contextPath}/product/list.action?page=${page-1}">上一页</a>
       <a href="${pageContext.request.contextPath}/product/list.action?page=1">1</a>
       <a href="${pageContext.request.contextPath}/product/list.action?page=2">2</a>
       <a href="${pageContext.request.contextPath}/product/list.action?page=3">3</a>
       <a href="${pageContext.request.contextPath}/product/list.action?page=4">4</a>
       <a href="${pageContext.request.contextPath}/product/list.action?page=5">5</a>
       <a href="${pageContext.request.contextPath}/product/list.action?page=${page+1}">下一页</a>
       <a href="${pageContext.request.contextPath}/product/list.action?page=${totalPage }">最后一页</a>
      </aside>
 </div>
</section>

</body>
</html>