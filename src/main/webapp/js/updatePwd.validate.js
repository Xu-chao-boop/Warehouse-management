//注册页面校验
$(function () {
    $("#updatePwdForm").validate({
         //规则
        rules:{
            "原密码":{
                "required":true,
                "rangelength":[6,12]
            },
            "新密码":{
                "required":true,
                "rangelength":[6,12]
            },
            "再次确认密码":{
                "required":true,
                "equalTo":"#Nes_pas"
            }

        },

        //信息
        messages:{
            "原密码":{
                "required":"原密码不能为空",
                "rangelength":"密码长度为6~12"
            },
            "新密码":{
                "required":"新密码不能为空",
                "rangelength":"新密码长度为6~12"
            },
            "再次确认密码":{
                "required":"密码不能为空",
                "equalTo":"两次输入新密码不一致"
            }

        },

    });
});

