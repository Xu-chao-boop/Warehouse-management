//登录页面校验
$(function () {
    $("#entergoodsForm").validate({

        //规则
        rules:{
            "name":{
                "required":true
            },
            "type":{
                "required":true
            },
            "specification":{
                "required":true
            },
            "warehouse":{
                "required":true

            },
            "number":{
                "required":true,
                "digits":true
            },
            "supplier":{
                "required":true
            },
            "entertime":{
                "required":true
            },
            "username":{
                "required":true
            }

        },

        //信息
        messages:{
            "name":{
                "required":"货物名称不能为空"
            },
            "type":{
                "required":"货物类型不能为空"
            },
            "specification":{
                "required":"货物规格不能为空"
            },
            "warehouse":{
                "required":"请选择仓库号"
            },
            "number":{
                "required":"货物数量不能为空",
                "digits":"请输入符合要求的整数"
            },
            "supplier":{
                "required":"供应商不能为空"
            },
            "entertime":{
                "required":"入库时间不能为空"
            },
            "username":{
                "required":"经办人不能为空"
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

