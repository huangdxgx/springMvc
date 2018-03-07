<%@page contentType="text/html" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%-- <meta http-equiv="refresh" content="0;url=${pageContext.request.contextPath}/user/httpInfo.action"/>
 --%><title>测试</title>
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<!--  <script type="text/javascript">
		$(function () {
        $.ajax({
  			type: 'POST',
  			url:"${pageContext.request.contextPath}/user/httpInfo.action",
  			data: {},
  			success: function(data){	
  				//alert(data.result);		
				if(data.result =="y"){
				window.location.href="/Goods/user/httpInfo.jsp";
				}								
			},
			error:function(){
				alert("异常错误");
			},
  			dataType: "text"
			});
    }); -->
	
	
	<!-- //$(window).load(function(){	})(jQuery); -->
   
</script> 
</head>
	<table>
		<thead>
	 		<tr style="text-align:center">
	 			<th>地区ID</th>
	 			<th>版本</th>
	 			<th>操作系统类型</th>
	 			<th>是否必须升级</th>
	 			<th>升级地址</th>
	 			<th>操作</th>
			</tr>
		</thead>
		<tbody>

		  <c:forEach items="${httplist}" var="httplist">
			<tr>
				<td><input type="text" name="regionId" value="${httplist.regionId}"/></td>
				<td><input type="text" name="httpVersion" value="${httplist.httpVersion}"/></td>
				<td><input type="text" name="systemType" value="${httplist.systemType}"/></td>
				<td><input type="text" name="isMustUpdate" value="${httplist.isMustUpdate}"/></td>
				<td><input type="text" name="updateIp" value="${httplist.updateIp}"/></td>
				<td	style="text-align:center"  ><a>增加</a><a>删除</a></td>
			</tr>
		</c:forEach>  
		</tbody>
	</table>
<body>

</body>
</html>