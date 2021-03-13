<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/css/font-awesome.min.css" />
    <!--[if IE 7]>
    <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
    <![endif]-->
    <link rel="stylesheet" href="assets/css/jquery-ui-1.10.3.full.min.css">
    <link rel="stylesheet" href="assets/css/ace.min.css" />
    <link rel="stylesheet" href="css/style.css"/>
    <script src="assets/js/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
    <script src="js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="js/outGoods.validate.js" type="text/javascript"></script>
    <title>货物出库</title>

    <style>
        label.error{
            background: url(images/unchecked.gif) no-repeat 10px 3px;
            padding-left: 30px;
            color:red;
        }
    </style>
</head>

<body>
<%-- 隐藏域：存储项目发布路径 --%>
<input type="hidden" id="path" value="${pageContext.request.contextPath}" />

<div class="page-content">
    <div class="Manager_style">
        <span class="title_name">货物出库</span>
        <form id="outGoodsForm" action="${pageContext.request.contextPath}/goodsOut?method=out" method="post">
            <div class="project_style">
                <ul class="Add_Manager_style clearfix">
                    <li>
                        <label class="label_name">货物ID</label>
                        <input name="id" type="text" placeholder="请输入货物id" class="text" value="${goodsOut.id}" style=" width:350px; "/>
                    </li>
                    <li>
                        <label class="label_name">出库数量</label>
                        <input name="number" type="text" required="required" placeholder="请输入数量" value="${goodsOut.number}" class="text" style=" width:350px; "/>
                        <br/>
                        <span style="color: red;margin-left: 110px">${requestScope.msg}</span>
                    </li>
                    <li>
                        <label class="label_name">客户</label>
                        <input name="custom" type="text" required="required" placeholder="请输入客户名称" value="${goodsOut.custom}" class="text" style=" width:350px; "/>
                    </li>
                    <li>
                        <label class="label_name">经办人</label>
                        <input name="username" type="text" required="required" placeholder="请输入操作人姓名" value="${goodsOut.username}" class="text" style=" width:350px; "/>
                    </li>
                    <li>
                        <label class="label_name">出库时间</label>
                        <input name="outTime" type="date" required="required" class="form-control" value="${goodsOut.outtime}" id="outTime" style="width:360px;"/>
                    </li>
                </ul>
            </div>
            <br/>
            <div class="btn_operating"><button type="submit" class="btn btn-info" id="submit" >提交出库</button></div>
        </form>
 </div>
</div>
</body>

</html>
