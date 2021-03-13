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
    <script src="js/enterhuowu.validate.js" type="text/javascript"></script>
    <title>货物入库</title>

    <style>
        label.error{
            background: url(images/unchecked.gif) no-repeat 10px 3px;
            padding-left: 30px;
            color:red;
        }
    </style>
</head>

<body>
<div class="page-content">
    <div class="Manager_style">
        <span class="title_name">货物入库</span>
        <form id="entergoodsForm" action="${pageContext.request.contextPath}/goods?method=enter" method="post">
            <div class="project_style">
                <ul class="Add_Manager_style clearfix">
                    <li><label class="label_name">入库货物</label>
                        <input name="name" type="text" placeholder="请输入货物名称" class="text"
                               <%--onchange="validateName('${path}')"--%> value="${goods.name}" style=" width:350px; "/><br/>
                    </li>
                    <li>
                        <label class="label_name">货物类型</label>
                        <input name="type" type="text" placeholder="请输入货物类型" class="text" value="${goods.type}" style=" width:350px; "/>
                    </li>
                    <li>
                        <label class="label_name">货物规格</label>
                        <input name="specification" type="text" placeholder="请输入货物规格"
                               value="${goods.number}" class="text" style=" width:350px; "/>
                    </li>
                    <li><label class="label_name">入库仓库</label><select name="warehouse" size="1" style="width:350px; margin-left:10px" >
                        <option value="">--请选择第几号仓库--</option>
                        <option value="一号仓库">一号仓库</option>
                        <option value="二号仓库">二号仓库</option>
                        <option value="三号仓库">三号仓库</option>
                    </select></li>
                    <li>
                        <label class="label_name">入库数量</label>
                        <input name="number" type="text" placeholder="请输入数量"
                               value="${goods.number}" class="text" style=" width:350px; "/>
                    </li>
                    <li>
                        <label class="label_name">供应商</label>
                        <input name="supplier" type="text" placeholder="请输入供应商名称"
                               value="${goods.supplier}" class="text" style=" width:350px; "/>
                    </li>
                    <li>
                        <label class="label_name">入库时间</label>
                        <input name="entertime" type="date" class="form-control"
                               value="${goods.entertime}" id="entertime" style="width:360px;"/>
                    </li>
                    <li>
                        <label class="label_name">经办人</label>
                        <input name="username" type="text" placeholder="请输入操作人姓名" value="${goods.username}" class="text" style=" width:350px; "/>
                    </li>
                </ul>
            </div>
            <br/>
            <div class="btn_operating"><button type="submit" class="btn btn-info" id="submit" >提交入库</button></div>
        </form>
 </div>

</body>

</html>
