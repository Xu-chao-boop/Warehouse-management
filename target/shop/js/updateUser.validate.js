//注册页面校验
$(function () {
    $("#updateUserForm").validate({
         //规则
        rules:{
            "用户姓名":{
                "required":true
            },
            "手机号":{
                "required":true,
                "rangelength":[11,11]
            },
            "邮箱":{
                "required":true
            }


        },

        //信息
        messages:{
            "用户姓名":{
                "required":"姓名不能为空"
            },

            "手机号":{
                "required":"电话号码不能为空",
                "rangelength":"电话号码格式不正确"
            },
            "邮箱":{
                "required":"邮箱不能为空"
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
