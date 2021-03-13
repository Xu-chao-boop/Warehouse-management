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

        /**
         * errorPlacement  指定错误信息出现的位置
         * 第一个参数error： 错误信息
         * 第二个参数element：产生错误的标签元素
         */
      /*  errorPlacement: function (error, element) {
            //如果是radio或checkbox
            if (element.is(':radio') || element.is(':checkbox')) {
                //将错误信息添加到当前元素的祖父节点后面
                error.appendTo(element.parent().parent());
            } else {
                //将错误信息直接插入到当前元素的后面
                error.insertAfter(element);
            }
        }*/
    });
});

