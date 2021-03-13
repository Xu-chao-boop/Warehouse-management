//注册页面校验
$(function () {
    $("#addUsertForm").validate({
         //规则
        rules:{
            "userName":{
                "required":true
            },
            "id":{
                "required":true,
                "validateId":true
            },
            "password":{
                "required":true,
                "rangelength":[6,12]
            },
            "repassword":{
                "required":true,
                "equalTo":"#password"
            },
            "phone":{
                "required":true,
                "rangelength":[11,11]
            },
            "email":{
                "required":true
            }


        },

        //信息
        messages:{
            "userName":{
                "required":"姓名不能为空"
            },
            "id":{
                "required":"id不能为空",
                "validateId":"id编号已占用"
            },
            "password":{
                "required":"密码不能为空",
                "rangelength":"密码长度为6~12"
            },
            "repassword":{
                "required":"确认密码不能为空",
                "equalTo":"两次输入密码不一致"
            },
            "phone":{
                "required":"电话号码不能为空",
                "rangelength":"电话号码格式不正确"
            },
            "email":{
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

/**
 *  自定义校验规则：
 *  $.validator.addMethod("校验规则名称",function(输入框中的值,标签对象,输入参数){});
 */
$.validator.addMethod("validateId",function(value,element,params){
    var flag = false;
    //ajax异步刷新到后台查询数据
    $.ajax({
        async:false,  //若为true，异步；若false，同步
        type:"post",
        url:$("#path").val()+"/user?method=validate",
        data:{"id":value},
        dataType:"json",
        success:function (rs) {
            flag = rs.flag;
        }
    });
    return !flag;  //flag为true，代表存在此id；false为不存在此id
});
