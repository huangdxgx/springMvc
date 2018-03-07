<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
</script>
<script src="${pageContext.request.contextPath}/js/ueditor.config.js"></script>
<script src="${pageContext.request.contextPath}/js/ueditor.all.min.js"> </script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/product_js/function_product.js" ></script>
<body>
<section><jsp:include page="index_back.jsp"></jsp:include></section>
<section class="rt_wrap content mCustomScrollbar">
 <div class="rt_content">
      <div class="page_title">
       <h2 class="fl">商品更新(别名：修改页面)</h2>
       <a class="fr top_rt_btn">返回产品列表</a>
      </div>
     <section>
     <form action="${pageContext.request.contextPath}/product/updatePdt.action" enctype="multipart/form-data" method="post">
      <ul class="ulColumn2">
      <li><input type="hidden" name="productId" value="${pdt.productId }" /></li>
       <li>
        <span class="item_name" style="width:120px;">商品名称：</span>
        <input type="text" name="productName" value="${pdt.productName }" class="textbox textbox_295" placeholder="商品名称..."/>
        <span class="errorTips">错误提示信息...</span>
       </li>
       <li>
        <span class="item_name" style="width:120px;">商品价格：</span>
        <input type="text" name="productPrice" value="${pdt.productPrice }" class="textbox" placeholder="商品价格..."/>
        <span class="errorTips">错误提示信息...</span>
       </li>
       <!-- <li>
        <span class="item_name" style="width:120px;">分类：</span>
        <select class="select">
         <option>选择产品分类</option>
        </select>
        <span class="errorTips">错误提示信息...</span>
       </li> -->
       <li>
        <span class="item_name" style="width:120px;">库存：</span>
       <input type="text"  name="productStock" value="${pdt.productStock }" onclick="" placeholder="商品库存...">
        <span class="errorTips">错误提示信息...</span>
       </li>
       <li>
        <span class="item_name" style="width:120px;">上新日期：</span>
       <input type="text" name="productCreateTime" value="${pdt.productCreateTime }" onclick="" placeholder="商品上新日期...">
        <span class="errorTips">错误提示信息...</span>
       </li>
       <li>
         <span class="item_name" style="width:120px;">上传图片：</span>
        <!--<label class="uploadImg">
         <input type="file" name="fileName"/>
         <span>上传图片</span>
        </label> -->
        <input type="file" name="image" value="/images/${pdt.fileName }"/>
       </li>
       <li>
        <span class="item_name" style="width:120px;">商品描述：</span>
        <input type="text" name="productDescrpt" value="${pdt.productDescrpt }" class="textbox textbox_295" placeholder="商品描述..."/>
        <span class="errorTips">错误提示信息...</span>
       </li>
       <!-- <li>
        <span class="item_name" style="width:120px;">产品详情：</span>
        <script id="editor" type="text/plain" placeholder="商品上新日期..." style="width:1024px;height:500px;margin-left:120px;margin-top:0;"></script>
           ueditor可删除下列信息
           <div id="btns" style="margin-left:120px;margin-top:8px;">
            <div>
                <button onclick="getAllHtml()">获得整个html的内容</button>
                <button onclick="getContent()">获得内容</button>
                <button onclick="setContent()">写入内容</button>
                <button onclick="setContent(true)">追加内容</button>
                <button onclick="getContentTxt()">获得纯文本</button>
                <button onclick="getPlainTxt()">获得带格式的纯文本</button>
                <button onclick="hasContent()">判断是否有内容</button>
                <button onclick="setFocus()">使编辑器获得焦点</button>
                <button onmousedown="isFocus(event)">编辑器是否获得焦点</button>
                <button onmousedown="setblur(event)" >编辑器失去焦点</button>
        
            </div>
            <div>
                <button onclick="getText()">获得当前选中的文本</button>
                <button onclick="insertHtml()">插入给定的内容</button>
                <button id="enable" onclick="setEnabled()">可以编辑</button>
                <button onclick="setDisabled()">不可编辑</button>
                <button onclick=" UE.getEditor('editor').setHide()">隐藏编辑器</button>
                <button onclick=" UE.getEditor('editor').setShow()">显示编辑器</button>
                <button onclick=" UE.getEditor('editor').setHeight(300)">设置高度为300默认关闭了自动长高</button>
            </div>
        
            <div>
                <button onclick="getLocalData()" >获取草稿箱内容</button>
                <button onclick="clearLocalData()" >清空草稿箱</button>
            </div>
        
        </div>
       </li> -->
       <li>
        <span class="item_name" style="width:120px;"></span>
        <!-- <input type="submit" class="link_btn"/> -->
        <input type="submit" id="" value="提交" onclick=""/>
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