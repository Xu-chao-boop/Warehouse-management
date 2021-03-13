//登录页面校验
$(function () {
    $("#login-form").validate({

        //规则
        rules:{
            "userID":{
                "required":true
            },
            "password":{
                "required":true,
                "rangelength":[6,12]
            },
            "checkCode":{
                "required":true
            }

        },

        //信息
        messages:{
            "userID":{
                "required":"用户id不能为空"
            },
            "password":{
                "required":"密码不能为空",
                "rangelength":"密码长度至少为6位"
            },
            "checkCode":{
                "required":"校验码不能为空"
            }

        },

        /**
         * errorPlacement  指定错误信息出现的位置
         * 第一个参数error： 错误信息
         * 第二个参数element：产生错误的标签元素
         */
        errorPlacement: function (error, element) {
            //如果是radio或checkbox
            if (element.is(':radio') || element.is(':checkbox')) {
                //将错误信息添加到当前元素的祖父节点后面
                error.appendTo(element.parent().parent());
            } else {
                //将错误信息直接插入到当前元素的后面
                error.insertAfter(element);
            }
        }
    });
});

