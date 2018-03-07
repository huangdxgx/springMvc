<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<title>商品上新</title>
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
	//选择下拉列表的类型ID	
	$(function(){
		$("#cid").change(
				function() {
					var selected=$("#cid option:selected").attr("value");
					   //select选中的值写入input框（隐藏）
					   $("#selected").val(selected);
				});
	});
</script>
<script src="${pageContext.request.contextPath}/js/ueditor.config.js"></script>
<script src="${pageContext.request.contextPath}/js/ueditor.all.min.js"> </script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/index_search.js"></script>
<body>
<section><jsp:include page="index_back.jsp"></jsp:include></section>
<section class="rt_wrap content mCustomScrollbar">
 <div class="rt_content">
      <div class="page_title">
       <h2 class="fl">商品上新(别名：增加页面)</h2>
       <a style="position: relative;left: 1000px;" href="${pageContext.request.contextPath}/product/list.action" class="fr top_rt_btn">返回产品列表</a>
      </div>
     <section>
     <form action="${pageContext.request.contextPath}/product/addPdt.action" enctype="multipart/form-data" method="post">
      <ul class="ulColumn2">
       <li>
        <span class="item_name" style="width:120px;">商品名称：</span>
        <input type="text" name="productName" class="textbox textbox_295" placeholder="商品名称..."/>
        <!-- <span class="errorTips">错误提示信息...</span> -->
       </li>
       <li>
        <span class="item_name" style="width:120px;">商品价格：</span>
        <input type="text" name="productPrice" class="textbox" placeholder="商品价格..."/>
        <!-- <span class="errorTips">错误提示信息...</span> -->
       </li> 
    
     <li class="section_room">
    
        <span class="item_name" style="width:120px;">商品分类：</span>    
        <select class="select" id="cid">
         <!-- <option>选择产品分类</option> -->
         <option value="null" >商品分类</option>		 
        </select>
          <!-- <span class="errorTips">错误提示信息...</span> -->              
          <input type="hidden" id="selected" name="cid" value="">          
       </li>             
       <li>
        <span class="item_name" style="width:120px;">库存：</span>
       <input type="text"  name="productStock" onclick="" value="" placeholder="商品库存...">
        <!-- <span class="errorTips">错误提示信息...</span> -->
       </li>
       <li>
        <span class="item_name" style="width:120px;">上新日期：</span>
       <input type="text" name="productCreateTime" onclick="" value="" placeholder="商品上新日期...">
        <!-- <span class="errorTips">错误提示信息...</span> -->
       </li>
       <li>
         <span class="item_name" style="width:120px;">上传图片：</span>
        <!--<label class="uploadImg">
         <input type="file" name="fileName"/>
         <span>上传图片</span>
        </label> -->
        <input type="file" name="image"/>
       </li>
       <li>
        <span class="item_name" style="width:120px;">商品描述：</span>
        <input type="text" name="productDescrpt" class="textbox textbox_295" placeholder="商品描述..."/>
        <!-- <span class="errorTips">错误提示信息...</span> -->
       </li>
      
       <li>
        <span class="item_name" id="submitcontext" style="width:120px;"></span>
        <!-- <input type="submit" class="link_btn"/> -->
        <input  type="submit" value="提交"/>
       </li>
      </ul>
      </form>
     </section>
 </div>
</section>
<script type="text/javascript">

    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');


    function isFocus(e){
        alert(UE.getEditor('editor').isFocus());
        UE.dom.domUtils.preventDefault(e)
    }
    function setblur(e){
        UE.getEditor('editor').blur();
        UE.dom.domUtils.preventDefault(e)
    }
    function insertHtml() {
        var value = prompt('插入html代码', '');
        UE.getEditor('editor').execCommand('insertHtml', value)
    }
    function createEditor() {
        enableBtn();
        UE.getEditor('editor');
    }
    function getAllHtml() {
        alert(UE.getEditor('editor').getAllHtml())
    }
    function getContent() {
        var arr = [];
        arr.push("使用editor.getContent()方法可以获得编辑器的内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getContent());
        alert(arr.join("\n"));
    }
    function getPlainTxt() {
        var arr = [];
        arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getPlainTxt());
        alert(arr.join('\n'))
    }
    function setContent(isAppendTo) {
        var arr = [];
        arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
        UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
        alert(arr.join("\n"));
    }
    function setDisabled() {
        UE.getEditor('editor').setDisabled('fullscreen');
        disableBtn("enable");
    }

    function setEnabled() {
        UE.getEditor('editor').setEnabled();
        enableBtn();
    }

    function getText() {
        //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
        var range = UE.getEditor('editor').selection.getRange();
        range.select();
        var txt = UE.getEditor('editor').selection.getText();
        alert(txt)
    }

    function getContentTxt() {
        var arr = [];
        arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
        arr.push("编辑器的纯文本内容为：");
        arr.push(UE.getEditor('editor').getContentTxt());
        alert(arr.join("\n"));
    }
    function hasContent() {
        var arr = [];
        arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
        arr.push("判断结果为：");
        arr.push(UE.getEditor('editor').hasContents());
        alert(arr.join("\n"));
    }
    function setFocus() {
        UE.getEditor('editor').focus();
    }
    function deleteEditor() {
        disableBtn();
        UE.getEditor('editor').destroy();
    }
    function disableBtn(str) {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            if (btn.id == str) {
                UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
            } else {
                btn.setAttribute("disabled", "true");
            }
        }
    }
    function enableBtn() {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
        }
    }

    function getLocalData () {
        alert(UE.getEditor('editor').execCommand( "getlocaldata" ));
    }

    function clearLocalData () {
        UE.getEditor('editor').execCommand( "clearlocaldata" );
        alert("已清空草稿箱")
    }
</script>
</body>
</html>