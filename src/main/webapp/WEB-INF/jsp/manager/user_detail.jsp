<%@ page language="java" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html>	
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户详情</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/back/style.css">
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.mCustomScrollbar.concat.min.js"></script>
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
</head>
<body>
<section><jsp:include page="index_back.jsp"></jsp:include></section>
<section class="rt_wrap content mCustomScrollbar">
 <div class="rt_content1">
      <div class="page_title">
       <h2 class="fl">会员详情</h2>      
      </div>
      <ul class="ulColumn21">
       <li>
        <span class="item_name1" style="width:120px;">头像：</span>
        <label class="uploadImg1">        
         <c:if test="${empty user.userPhoto }"><span>无头像</span></c:if>
         <c:if test="${not empty user.userPhoto }"><img alt="" src="/picture/${user.userPhoto }" width=100 height=100/></c:if>
        </label>
       </li>
       <li>
        <span class="item_name1" style="width:120px;">会员名称：</span>
        <span class="item_name1" style="width:200px;">${user.userName }</span>              
       </li>
       <li>
        <span class="item_name1" style="width:120px;">登录名：</span>
        <span class="item_name1" style="width:200px;">${user.loginName }</span>              
       </li>
        <li>
        <span class="item_name1" style="width:120px;">性别：</span>
        <c:if test="${user.userSex ==0 }"> <span class="item_name1" style="width:200px;">男</span> </c:if>
        <c:if test="${user.userSex ==1 }"> <span class="item_name1" style="width:200px;">女</span> </c:if>                    
       </li>
       <li>
        <span class="item_name1" style="width:120px;">登陆密码：</span>
        <span class="item_name1" style="width:200px;">${user.loginPwd }</span>
       </li>
       <li>
        <span class="item_name1" style="width:120px;">会员等级：</span>
       <c:if test="${user.userStatus==2 }"><span class="item_name1" style="width:200px;">普通会员</span></c:if>
       <c:if test="${user.userStatus==1 }"><span class="item_name1" style="width:200px;">管理员</span></c:if>
       </li>      
       <li>
        <span class="item_name1" style="width:120px;">手机号码：</span>
        <span class="item_name1" style="width:200px;">${user.userPhone }</span>
       </li>
   
       <li>
        <span class="item_name1" style="width:120px;">收货地址：</span>
        <span class="item_name1" style="width:200px;">${user.userAddress }</span>       
       </li>      
       <li>
        <span class="item_name1" style="width:120px;"></span>
        <input type="button" onclick="comeback()" class="link_btn1" value="返回"/>
       </li>
      </ul>
 </div>
</section>
</body>
</html>