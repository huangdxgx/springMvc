<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户信息管理</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/back/style.css">
<!--[if lt IE 9]>
<script src="js/html5.js"></script>
<![endif]-->
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
	function  goToCurrentPage(TempPage) {
	   // alert(TempPage);
	    if (TempPage !=null && TempPage != ""){
            window.location.href="${pageContext.request.contextPath }/user/userlist.action?curruentPage="+$('#gocurruentPage').val();
        }
    };
</script>
<body>
<section><jsp:include page="index_back.jsp"></jsp:include></section>
<section class="rt_wrap content mCustomScrollbar">
 <div class="rt_content">
      <div class="page_title">
       <h2 class="fl">会员列表</h2>
      <!--  <a href="user_detail.html" class="fr top_rt_btn add_icon">添加新用户</a> -->
      </div>
       <form action="${pageContext.request.contextPath }/user/getUserAnyway.action" method="post" >
      <section class="mtb">
       <select class="select">
        <option>会员等级</option>
        <option>普通会员</option>       
       </select>      
       <input type="text" name="name" class="textbox textbox_225" placeholder="输入用户名/手机号..."/>
       <input type="submit" value="查询" class="group_btn"/>       
      </section>
      </form>
      <table class="table">     
      <c:if test="${not empty userlist }">
       <tr>
        <th>Id</th>       
        <th>用户名</th>
        <th>登录名</th>
        <th>密码</th>
        <th>手机号码</th>
        <th>性别</th>
        <th>收货地址</th>
        <th>用户类型</th>
        <th>操作</th>
       </tr>
       </c:if>
       <c:choose>     
      	<c:when test="${not empty userlist }">
       <c:forEach  var="user" items="${userlist }">
       <tr>
        <td class="center">${user.userId }</td>       
        <td class="center">${user.userName }</td>
        <td><a href="${pageContext.request.contextPath }/user/getUserDetail.action?userId=${user.userId }">${user.loginName }</a></td>
         <td>${user.loginPwd }</td>
        <td class="center">${user.userPhone }</td>
        <td class="center"><c:choose><c:when test="${user.userSex==1 }">女</c:when><c:when test="${user.userSex==0 }">男</c:when></c:choose></td>
        <td class="center">${user.userAddress }<c:if test="${not empty user.userAddress }"><a title="已验证" class="link_icon">&#89;</a></c:if></td>
        <td class="center"><c:if test="${user.userStatus=='2' }">普通会员</c:if><c:if test="${user.userStatus=='1' }">超级管理员</c:if></td>
        <td class="center">
         <a href="javascript:deleteAdmin(${user.userId })" title="删除" class="link_icon">&#100;</a>&nbsp;
         <c:if test="${user.userStatus=='1' }"><a href="${pageContext.request.contextPath }/user/getAdmin.action?userId=${user.userId }" title="修改" class="link_icon">&#100;</a></c:if> 
        </td>
       </tr>
       </c:forEach>
       </c:when>
       <c:when test="${empty userlist }"><span style="position:absolute; left: 50%;top:90%; bottom:500px; ">无此记录！</span> </c:when>
       </c:choose>
      </table>
      <!-- 分页 -->
      <c:if test="${not empty userlist }">
      <aside class="paging">
       <a href="${pageContext.request.contextPath }/user/userlist.action?curruentPage=1">首页</a>
       <a href="${pageContext.request.contextPath }/user/userlist.action?curruentPage=${page.curruentPage-1}">上一页</a>
       <c:choose>
       <c:when test="${page.curruentPage>=3 }">
       	<a>…</a>
       	<a href="${pageContext.request.contextPath }/user/userlist.action?curruentPage=${page.curruentPage-1}">${page.curruentPage-1 }</a>
       </c:when> 
       <c:when test="${page.curruentPage>=2}">
       	<a href="${pageContext.request.contextPath }/user/userlist.action?curruentPage=${page.curruentPage-1}">${page.curruentPage-1}</a>
       </c:when>
        </c:choose>
       <a href="${pageContext.request.contextPath }/user/userlist.action?curruentPage=${page.curruentPage}">${page.curruentPage}</a>
       <c:choose>
       	<c:when test="${page.curruentPage+1<page.totalPage }">
       	 <a href="${pageContext.request.contextPath }/user/userlist.action?curruentPage=${page.curruentPage+1}">${page.curruentPage+1}</a>
       	 <a>…</a>
       	 </c:when>
       	 <c:when test="${page.curruentPage+1<=page.totalPage}">
       	 	<a href="${pageContext.request.contextPath }/user/userlist.action?curruentPage=${page.curruentPage+1}">${page.curruentPage+1}</a>
       	 </c:when>
       </c:choose>
       <a href="${pageContext.request.contextPath }/user/userlist.action?curruentPage=${page.curruentPage+1}">下一页</a>
       <a>跳到</a>
       <input  id="gocurruentPage" type="text" name="curruentPage">
       <a href="javascript:goToCurrentPage($('#gocurruentPage').val())">GO</a>
       <a href="${pageContext.request.contextPath }/user/userlist.action?curruentPage=${page.totalPage}">最后一页</a>
       <a>当前是第${page.curruentPage}页</a>
      </aside>
      </c:if>
 </div>
</section>

</body>
</html>