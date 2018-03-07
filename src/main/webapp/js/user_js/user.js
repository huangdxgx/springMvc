/**
 * Created with mine Date: 13-7-30 Time: 下午4:03
 */

//用户登录验证
function loginsubmit() {
    //alert(1);
    jQuery.ajax({
        url: "/Goods/user/login.action",//提交路径
        type:"post",//提交方式
        //要发送的数据
        data:jQuery('#loginform').serialize(),
        dataType:"json",//服务器返回的数据类型"xml  html  script  json  text"
        success:function(data){
           // alert(data.state);
            if (data.state =="user") {
                alert("登录成功");
                //mainform给表单起得名字
                document.loginform.action="/Goods/product/productlist.action";
                document.loginform.submit();//提交表单
            }else if (data.state =="admin"){
                alert("欢迎登录后台管理界面");
                document.loginform.action="/Goods/user/userlist.action";
                document.loginform.submit();//提交表单
            } else if (data.state=="N"){
                $("#userName").select();
                $("#pwd").select();
                $('#checklogin').html("用户名或密码不正确").css({"display":"block","color":"red"});
                return false;
            }
        },
        error:function(){
            alert("异常错误");
        }
    });
};

//管理员登录
function adminLogin() {
    if ($('#J_codetext').val()=='') {
        $('#checkAdmin').html("验证码不正确").css("color","red");
    }else {
        jQuery.ajax({
            url :"/Goods/user/login.action",
            type : "post",
            dataType :"json",
            data :jQuery('#adminlogin').serialize(),
            success : function(data) {
                if (data.state=="admin") {
                    alert("登录成功");
                    window.location.href="/Goods/manager/index_back.jsp";
                }else if (data.state=="Y") {
                    alert("登录成功");
                    window.location.href="/Goods/product/productlist.action";
                }else if (data.state=="N") {
                    $('#checkAdmin').html('用户名或密码不正确').css("color","red");
                    return false;
                }
            },
            error:function(){
                alert("异常错误");
            }
        });
    }

};

//焦点到表单框把错误信息隐藏
function spanhiden() {
    $('#checkAdmin').html('');
};
//注销用户
function logout() {
    if(confirm("是否注销？")){
        jQuery.ajax({
            url :"/Goods/user/loginout.action",
            type : "post",
            dataType :"json",
            data : {},
            success : function(data) {
                if(data.state=="Y"){
                    alert("注销成功");
                    window.location.href="/Goods/product/productlist.action";
                }
            },
            error:function(){
                alert("异常错误");
            }
        });
    }
};


//登录框焦点聚集
function checklogin() {
    $('#checklogin').css({"display":"none","color":"red"});
};
function notnull(nana) {
    if ($("#userName").val()=="") {
        $("#checklogin").html("用户名不能为空").css({"display":"block","color":"red"});
        return false;
    }else if($("#pwd").val()==""){
        $("#checklogin").html("密码不能为空").css({"display":"block","color":"red"});
        return false;
    }
};
//验证用户是否存在
function checkName(name) {
    if (name.value=="") {
        $('#registerName').html("用户名不能为空").css({"display":"block","color":"red"});
        return false;
    }else {
        jQuery.ajax({
            url :"/Goods/user/checkName.action?loginName="+name.value,
            type : "post",
            dataType :"json",
            data : {},
            success : function(data) {
                if(data.state=="Y"){
                    $('#registerName').html("可注册").css({"display":"block","color":"green"});
                    return true;
                }else if (data.state=="N") {
                    $('#registerName').html("用户已存在").css({"display":"block","color":"red"});
                    $('#loginName').val("");
                    return false;
                }
            },
            error:function(){
                alert("异常错误");
            }
        });
    }
};

//用户注册
function  reguserSubmit() {
    jQuery.ajax({
        url:"/Goods/user/registerUser.action",
        type:"post",
        dataType:"json",
        data:jQuery('#reguserform').serialize(),
        success:function (data) {
            if (data.state=="Y"){
                alert("注册成功")
                window.location.href="/Goods/product/productlist.action";
            }else  if (data.state == "N"){
                alert("注册失败");
                return false;
            }
        },error:function () {
            alert("异常错误");
        }
    });
};
//注册框焦点聚集
function register() {
    $('#registerName').css("display","none");
    $('#registerPwd').css("display","none");
    $('#registerPwd1').css("display","none");
};
//注册确认密码
function checkPwd(pwd) {
    if ($('#regPwd').val()=="") {
        $('#registerPwd').html("密码不能为空").css({"display":"block","color":"red"});
        return false;
    }else if ($('#regPwd1').val()=="") {
        $('#registerPwd1').html("密码不能为空").css({"display":"block","color":"red"});
        return false;
    }else {
        if ($('#regPwd').val()!=$('#regPwd1').val()) {
            $('#registerPwd').html("前后密码不一致").css({"display":"block","color":"red"});
            return false;
        }
    }

};

//用户个人中心修改
function updateUser() {
    jQuery.ajax({
        url :"/Goods/user/updateUser.action",
        type : "post",
        dataType :"json",
        data :jQuery('#updateform').serialize(),
        success : function(data) {
            if (data.state=="Y") {
                alert("修改成功");
                window.location.href="/Goods/user/users.action";
            }else if (data.state=="N") {
                alert("修改失败！");
                window.location.href="/Goods/user/users.action";
            }
        },
        error:function(){
            alert("异常错误");
        }
    });

};

//取消修改
function cancel() {
    window.location.href="/Goods/user/users.action";
};

//注销用户
function deletUser() {
    if (confirm("确定注销您当前的用户吗？")) {
        jQuery.ajax({
            url :"/Goods/user/deleteUser.action",
            type : "post",
            dataType :"json",
            data :{},
            success : function(data) {
                if (data.state=="Y") {
                    alert("用户已注销");
                    window.location.href="/Goods/product/productlist.action";
                }else if (data.state=="N") {
                    alert("修改失败！");
                    window.location.href="/Goods/user/users.action";
                }
            },
            error:function(){
                alert("异常错误");
            }
        });
    }

};


//修改时不能存在登录名相同
function checkloginName(updatename,username) {
    //alert(updatename.value+":"+username);
    if (updatename.value!=username) {
        jQuery.ajax({
            url :"/Goods/user/checkName.action?loginName="+updatename.value,
            type : "post",
            dataType :"json",
            data :{},
            success : function(data) {
                if (data.state=="N") {
                    var eBox=$(updatename).parent().find("span");
                    eBox.html("用户已存在").css("color","red");
                    updatename.value=username;
                    return false;
                }else if (data.state=="Y") {
                    return true;
                }
            },
            error:function(){
                alert("异常错误");
            }
        });
    }
};

//删除管理员
function deleteAdmin(id) {
    alert(id);
    if (confirm("是否注销账号？")) {
        jQuery.ajax({
            url :"/Goods/user/deleteAdmin.action?userId="+id,
            type : "post",
            dataType :"json",
            data :{},
            success : function(data) {
                if (data.state=="Y") {
                    alert("删除成功");
                    window.location.href="/Goods/user/userlist.action";
                    return true;
                }else if (data.state=="N") {
                    alert("删除失败！");
                    return false;
                }
            },
            error:function(){
                alert("异常错误");
            }
        });
    }
};

//详情页返回后台用户页面
function comeback() {
    window.location.href="/Goods/user/userlist.action";
};

function loginoutAdmin() {
    if (confirm("是否退出系统？")) {
        jQuery.ajax({
            url :"/Goods/user/loginoutAdmin.action",
            type : "post",
            dataType :"json",
            data :{},
            success : function(data) {
                if (data.state=="Y") {
                    window.location.href="/Goods/manager/login.jsp";
                    return true;
                }
            },error:function(){
                alert("异常错误");
            }
        });
    }
}
//
function checkform() {
    var mobile=$('#mobile').val();
    var flag=true;
    var eBox=$(mobile).parent().find("span");
    if(!/\d{11}/.test(mobile)) {
        eBox.html("手机号码格式不正确").css("color","red") ;
        return false;
    }
};




/*//提交表单方法
function checkForm(){
    var flag=true;

    $(this).find("textarea[class='text']").each(function(i,dom){
        if(!checkItem($(dom))) flag = false;
    })
    $(this).find("input[class='text tiny']").each(function(i,dom){
        if(!checkItem($(dom))) flag = false;
    })


}*/




//// dom加载完后运行
//$(function() {
// 获取焦点方法
function focusItem(dom) {
    //$(dom).parent().parent().addClass("current");
    var eBox = $(dom).parent().find("span");
    eBox.removeClass("error").text("");
}
// 失去焦点消除背景，且验证信息方法
function checkItem(dom) {
    var eBox = $(dom).parent().find("span");
    eBox.css('color','red');
    var name = $(dom).attr("name");
    var value = $(dom).val();
    var errorMessage = "";
    switch (name) {
        case "loginName":
            if (value == "") {
                errorMessage = "用户名不能为空";
                isError = false;
            } else if (!/[a-zA-Z0-9]+/.test(value)) {
                errorMessage = "用户名只能是英文字母或者数字";
            } else {
                isError = true;
            }
            break;
        case "userName":

            if (value == "") {
                errorMessage = "真实姓名不能为空";
            } else if (value.length > 10) {
                errorMessage = "真实姓名长度最长10个汉字";

            } else {
                isError = false;
            }
            break;
        case "loginPwd":
            if (value == "") {
                errorMessage = "密码不能为空";

            } else {
                isError = false;
            }
            break;
        case "confirmPassword":
            if (value == "") {
                errorMessage = "确认密码不能为空";
            } else if (value != $("#password").val()) {
                errorMessage = "两次输入的密码不相同";
            } else {
                isError = false;
            }
            break;
        case "userAddress":
            if (value == "") {
                errorMessage = "地址不能为空";
            } else {
                isError = false;
            }
            break;
        case "birthday":
            if ((value != "") && !/\d{4}[-]\d{1,2}[-]\d{1,2}/.test(value)) {
                errorMessage = "出生日期格式只能是yyyy-mm-dd";
            } else {
                isError = false;
            }
            break;
        case "identityCode":
            if ((value != "") && !/((\d{17}\w{1})|(\d{15}))/.test(value)) {
                errorMessage = "身份证号码格式不正确";
            } else {
                isError = false;
            }
            break;
        case "email":
            if ((value != "")
                && !/^[a-z0-9]+\@([a-z0-9]+\.)+[a-z0-9]{2,4}$/i.test(value)) {
                errorMessage = "邮件地址格式不正确";
            } else {
                isError = false;
            }
            break;
        case "userPhone":
            if ((value == "") || !/\d{11}/.test(value)) {
                errorMessage = "手机号码格式不正确";
            } else {
                isError = false;
            }
            break;
        case "name":
            if (value == "") {
                errorMessage = "名称不能为空";
            } else {
                isError = false;
            }
            break;
        case "price":
            if ((value == "") || !(/^\d+(\.\d+)?$/.test(value))) {
                errorMessage = "不能为空且只能为正数";
            } else {
                isError = false;
            }
            break;
        case "stock":
            if ((value == "") || !(/^[0-9]*[1-9][0-9]*$/.test(value))) {
                errorMessage = "不能为空且只能为正整数";
            } else {
                isError = false;
            }
            break;
        case "photo":
            if (value == "") {
                errorMessage = "不能为空";
            } else {
                isError = false;
            }
            break;
        case "content":
            if (value == "") {
                errorMessage = "不能为空";
            } else if (value.length > 500) {
                errorMessage = "字数不能大于500";0.1
            } else {
                isError = false;
            }
            break;
        case "title":
            if (value == "") {
                errorMessage = "不能为空";
            } else if (value.length > 20) {
                errorMessage = "字数不能大于20";
            } else {
                isError = false;
            }
            break;
        default:
            isError = false;
            break;
    }
    if (isError) {
        eBox.text(errorMessage);
        eBox.addClass("error");
        return false;
    }
    return true;
}


/*
// 点击换验证码
$("#changeCode").click(function() {
    $("#safeCode").attr("src", "Number.jsp?id=" + Math.random());
});
// 注册页面验证
$("#regForm").find("input[class='text']").bind({
    focus : function() {
        focusItem(this)
    },
    blur : function() {
        checkItem(this)
    }
})
// 表单提交事件
$("#loginForm").submit(checkForm);
$("#regForm").submit(checkForm);

// 删除商品
$(".delete").find("a").click(function() {
    var tr = $(this).parent().parent();
    if (confirm("确定要删除吗？")) {
        location.href = $(this).attr("self_url");
        if (tr)
            tr.remove();
    } else {
        return false;
    }
});
// 后台删除
$(".manageDel").find("a").click(function() {
    var $tr = $(this).parent().parent().parent();
    if (confirm("确定要删除吗？")) {
        location.href = $(this).attr("self_url");
        if ($tr)
            $tr.remove();
    } else {
        return false;
    }
});

});*/

//	/* 登录验证码 */
//	$(function () {
//		var a = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, "a", "b", "c", "d", "e", "f",
//				"g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r",
//				"s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D",
//				"E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P",
//				"Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z" ];
//		function setCheckCode() {// 随机产生四个随机数
//			var str1 = a[Math.floor(Math.random() * a.length)];// 随机产生的数用floor去小数。
//			var str2 = a[Math.floor(Math.random() * a.length)];
//			var str3 = a[Math.floor(Math.random() * a.length)];
//			var str4 = a[Math.floor(Math.random() * a.length)];
//			$('#check-code>div:nth-child(1)').html(str1);// html（str1）把原本的内容进行替换//div下的第一个孩子节点nth-child(1)
//			$('#check-code>div:nth-child(2)').html(str2);
//			$('#check-code>div:nth-child(3)').html(str3);
//			$('#check-code>div:nth-child(4)').html(str4);
//			$('#check-box').css('background-color', randomColor());// 验证码框随机产生颜色
//			setRandomFont();// 设置随机码的字体大小和粗细
//			var val = str1 + str2 + str3 + str4;// 拼接四个验证码
//			$('#check-code').attr('class', val);// 把取得验证码放到一个类中
//			// alert($('#验证码').attr('class')); 验证码框的值 区分大小写
//		}
//		setCheckCode();
//
//		function setRandomFont() {
//			fonts = Math.floor(Math.random() * 5) + 15;// 随机数把验证码字体大小变化
//			fontw = Math.floor(Math.random() * 10) * 25;// 随机数把字体加粗程度变化
//
//			$('#check-code>div:nth-child(1)').css({
//				'color' : randomColor(),
//				'font-size' : fonts,
//				'font-weight' : fontw
//			});
//			$('#check-code>div:nth-child(2)').css({
//				'color' : randomColor(),
//				'font-size' : fonts,
//				'font-weight' : fontw
//			});
//			$('#check-code>div:nth-child(3)').css({
//				'color' : randomColor(),
//				'font-size' : fonts,
//				'font-weight' : fontw
//			});
//			$('#check-code>div:nth-child(4)').css({
//				'color' : randomColor(),
//				'font-size' : fonts,
//				'font-weight' : fontw
//			});
//		}
//
//		function randomColor() {// 使用rbg[0-255]范围取色
//			var r = Math.floor(Math.random() * 255);
//			var g = Math.floor(Math.random() * 255);
//			var b = Math.floor(Math.random() * 255);
//			var str = "rgb(" + r.toString() + "," + g.toString() + ","
//					+ b.toString() + ")";
//			return str;
//		}
//		// 点击验证码框产生随机验证码
//		$('#check-code').click(function() {
//			$(this).css("cursor", "pointer");
//			setCheckCode();
//		});
//		$('.check-choosed').click(function() {
//			$(this).css("cursor", "pointer");
//			setCheckCode();
//		});
//
//		$('#check-text').focus(function() {
//			$(this).css("background-color", "yellow");
//		});
//		/* 登录验证码检验 */
//		function check() {// 返回一个boolean值判断输入正确与否
//			var flag = true;
//			var val0 = $('#check-code').attr('class');
//			var text_val = $("#check-text").val();
//			if (val0 == text_val) {
//				return flag;
//			} else {
//				alert("验证码有误！");
//				flag = false;
//				return flag;
//			}
//		}
//		$('#check-click').click(function() {// 调用check()函数，为假清空表单的值，为真不处理。
//			if (!check() == true) {
//				$("#check-text").select();
//				setCheckCode();
//			} else {
//			}
//		});
//
//	});

//	/* tab切换浏览记录/正在热卖 */
//	$(function() {
//		$('.lefter .last-view #tab_top ul li').click(
//				function() {
//					$(this).css({
//						'background-color' : '#e61a3a',
//						'color' : 'white'
//					});
//					$(this).siblings("li").css({
//						'background-color' : 'white',
//						'color' : 'black'
//					});
//					$(".lefter .last-view .tab_body  .content").hide();
//					$(".lefter .last-view .tab_body  .content").eq(
//							$(this).index()).show();
//				});
//	});
//});
