//登录页面校验
$(function () {
    $("#outGoodsForm").validate({

        //规则
        rules:{
            "id":{
                "required":true,
                "digits":true,
                "validateId":true
            },
            "number":{
                "required":true,
                "digits":true
            }

        },

        //信息
        messages:{
            "id":{
                "required":"货物id不能为空",
                "digits":"请输入数字",
                "validateId":"不存在此商品id,请仔细核对"
            },
            "number":{
                "required":"货物数量不能为空",
                "digits":"请输入符合要求的整数"
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
        url:$("#path").val()+"/goodsOut?method=validate",
        data:{"id":value},
        dataType:"json",
        success:function (rs) {
            flag = rs.flag;
        }
    });
    return !flag;  //flag为true，代表存在此id；false为不存在此id
});
