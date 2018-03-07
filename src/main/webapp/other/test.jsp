<%@page contentType="text/html" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.3.min.js"></script>


<body>
<h2 align="center">无纸化打印!</h2>
    <div>
        <form id="submitApp"  action="" method="post">
            <table>
                <tr>
                    <td>版本号：</td><td><input name="httpVersion"  type="text" id="appVersion" onchange="changeselct()"/>
                </td>
                </tr>
                <tr>
                    <td>是否必须升级：</td>
                    <td>
                        <select  disabled="disabled"  name="isMustUpdate"  id="isSelect" style="width: 190px;height: 30px;padding-left: -30px" >
                            <option value="">请选择</option>
                            <option value="Y">是</option>
                            <option value="N">否</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><input type="button"  value="立即提交" onclick="formSubmit()"/></td> <td><input   type="reset" value="重置"/></td>
                </tr>
            </table>
        </form>
    </div>
</body>
<script type="text/javascript">
    function changeselct() {
        //alert(1);

        var  appVsion = $('#appVersion').val();

         if (appVsion >= 1.5){
            $("#isSelect option[value='Y']").attr("selected","selected");//根据值让option选中
         }

    };
    //提交表单
    function formSubmit () {
        $("#isSelect").removeAttr("disabled");
        jQuery.ajax({
            url:"/goods/user/appAdd.action",
            type:"post",
            dataType:"json",
            data:jQuery('#submitApp').serialize(),
            success:function (data) {
                if (data.result == "Y"){
                    alert("添加成功");
                }
            },error:function () {
                alert("异常错误");
            }
        });
    };
</script>
</html>
