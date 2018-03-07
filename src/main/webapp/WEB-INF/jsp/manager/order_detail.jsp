<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>订单详情表</title>
</head>
<link rel="stylesheet" type="text/css" href="css/back/style.css">
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
<section><jsp:include page="index_back.jsp"></jsp:include>></section>
<section class="rt_wrap content mCustomScrollbar">
 <div class="rt_content">
      <div class="page_title">
       <h2 class="fl">订单详情表</h2>
      </div>
      <table class="table">
       <tr>
        <td>收件人：DeathGhost</td>
        <td>联系电话：18300000000</td>
        <td>收件地址：陕西省西安市雁塔区丈八路2000集都市印象18栋2160室</td>
        <td>付款时间：2016-02-01 13:56</td>
       </tr>
       <tr>
        <td>下单时间：2016-02-01 13:56</td>
        <td>付款时间：2016-02-01 13:56</td>
        <td>确认时间：2016-02-01 13:56</td>
        <td>评价时间时间：---</td>
       </tr>
       <tr>
        <td>订单状态：<a>已付款，待发货</a></td>
        <td colspan="3">订单备注：<mark>帮我检查好呀~谢谢~</mark></td>
        </tr>
      </table>
      <table class="table">
       <tr>
        <td class="center"><img src="upload/goods01.jpg" width="50" height="50"/></td>
        <td>这里是产品名称</td>
        <td class="center">A15902</td>
        <td class="center"><strong class="rmb_icon">59.00</strong></td>
        <td class="center">
         <p>颜色：蓝色</p>
         <p>尺码：XXL码</p>
        </td>
        <td class="center"><strong>1</strong></td>
        <td class="center"><strong class="rmb_icon">59.00</strong></td>
        <td class="center">包</td>
       </tr>
       <tr>
        <td class="center"><img src="upload/goods02.jpg" width="50" height="50"/></td>
        <td>这里是产品名称</td>
        <td class="center">A15902</td>
        <td class="center"><strong class="rmb_icon">59.00</strong></td>
        <td class="center">
         <p>颜色：蓝色</p>
         <p>尺码：XXL码</p>
        </td>
        <td class="center"><strong>2</strong></td>
        <td class="center"><strong class="rmb_icon">118.00</strong></td>
        <td class="center">包</td>
       </tr>
       <tr>
        <td class="center"><img src="upload/goods03.jpg" width="50" height="50"/></td>
        <td>这里是产品名称</td>
        <td class="center">A15902</td>
        <td class="center"><strong class="rmb_icon">59.00</strong></td>
        <td class="center">
         <p>颜色：蓝色</p>
         <p>尺码：XXL码</p>
        </td>
        <td class="center"><strong>1</strong></td>
        <td class="center"><strong class="rmb_icon">59.00</strong></td>
        <td class="center">包</td>
       </tr>
      </table>
      <aside class="mtb" style="text-align:right;">
       <label>管理员操作：</label>
       <input type="text" class="textbox textbox_295" placeholder="管理员操作备注"/>
       <input type="button" value="待审核" class="group_btn"/>
       <input type="button" value="审核通过" class="group_btn"/>
       <input type="button" value="卖家发货" class="group_btn"/>
       <input type="button" value="已收货" class="group_btn"/>
      </aside>
 </div>
</section>

</body>
</html>