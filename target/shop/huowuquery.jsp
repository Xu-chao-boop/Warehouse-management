<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>库存查询</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <!--[if IE 7]>
    <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
    <![endif]-->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/css/ace.min.css" />
    <link rel="stylesheet" href="css/style.css"/>
</head>

<body>
<div class="page-content">
    <h3 class="header smaller lighter blue">库存查询</h3>
    <div class="search_style">
        <div class="title_names">搜索查询</div>
        <ul class="search_content clearfix">
            <li><label class="lf">货物名称</label><input id="searchName" name="gname" type="text" placeholder="Search by name" value="${vo.query}" class="text_add" style="width:200px;height: 35px"/></li>
            <div class="col-md-4 col-lg-4">
                <button id="btn_search" type="button" class="btn btn-info" style="width: 90px" onclick="viewAll('${path}')">查询</button>
                <button class="btn btn-danger" type="button" style="margin-left: 12px" onclick="deleteAll('${path}' , 'all')">删除所有</button>
            </div>
        </ul>
    </div>
    <div class="">
        <table id="" class="table table-striped table-bordered table-hover">
            <thead>
            <tr align="center">
                <th style="text-align:center" width="5%"><input type="checkbox" class="choose_all"></th>
                <th>货物ID</th>
                <th>货物名称</th>
                <th>货物类型</th>
                <th>货物规格</th>
                <th>入库仓库</th>
                <th>库存数量</th>
                <th>供应商</th>
                <th>入库时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody id="test">
            <c:forEach items="${vo.list}" var="goods">
                <tr class="data" align="center">
                    <td class="datachoose"><input type="checkbox" class="single"></td>
                    <td class="id">${goods.id}</td>
                    <td>${goods.name}</td>
                    <td>${goods.type}</td>
                    <td>${goods.specification}</td>
                    <td>${goods.warehouse}</td>
                    <td>${goods.number}</td>
                    <td>${goods.supplier}</td>
                    <td>${goods.entertime}</td>
                    <td><button type="button" class="btn btn-info" onclick="javascript:location.href='${path}/goods?method=viewOne&id=${goods.id}'">修改</button>
                    <button type="button" class="btn btn-warning" onclick="deleteAll('${path}','${goods.id}')" <%--onclick="javascript:location.href='${path}/goods?method=delete&id=${goods.id}'"--%>>删除</button></td>
                </tr>
            </c:forEach>
            </tbody>

        </table>
    </div>

    <%-- 分页按钮 --%>
    <tr align="center">
        <td colspan="8">
            <input class="btn btn-success" type="button" value="首页"
                   onclick="first('${path}')"/>&nbsp;&nbsp;
            <input class="btn btn-success" type="button" id="pre" value="上一页"
                   onclick="pre('${path}')"/>&nbsp;&nbsp;
            <!-- 当前页 -->
            <input type="text" id="pageNow" value="${vo.pageNow}" style="text-align:center"/>&nbsp;&nbsp;
            <input class="btn btn-success" type="button" value="跳转"
                   onclick="skip('${path}',${vo.myPages})"/>&nbsp;&nbsp;
            <input class="btn btn-success" type="button" id="next" value="下一页"
                   onclick="next('${path}',${vo.myPages})"/>&nbsp;&nbsp;
            <input class="btn btn-success" type="button" value="末页"
                   onclick="last('${path}',${vo.myPages})"/>&nbsp;&nbsp;
        </td>
    </tr>
</div>


<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/layer/layer.js" type="text/javascript" ></script>
<script src="assets/laydate/laydate.js" type="text/javascript"></script>
<script type="text/javascript"></script>
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/index.js"></script>

</body>

<%--<script>
    var data = "";
    $.ajax({
        type:"get",
        url:"/goods?method=viewAll",
        contentType:"json",
        success:function (rs) {
            for (var i in rs.list) {  //i是集合的下标
                //console.log("i = "+i)
                data += "<tr>"+"<td>"+i.id+"</td>"+"<td>"+i.name+"</td>"+"<td>"+i.type+"</td>"+"<td>"+
                    i.specification +"</td>"+"<td>"+i.warehouse+"</td>"+"<td>"+i.number+"</td>"+"<td>"+
                    i.supplier+"</td>"+"<td>"+i.entertime+"</td>"+"</tr>";
            }
            $("#test").html(data);
        }
    });
</script>--%>

<%--分页  首页--%>
<script>
    //查询所有商品信息
    function viewAll(url) {
        var query = $("#searchName").val();
        if(query == undefined){
            query = "";
        }

        //跳转
        window.location.href='${pageContext.request.contextPath}/goods?method=viewAll&query='+query;

    }

    //分页  首页
    function first(url) {
        //获取查询条件
        var query = $("#searchName").val();
        //获取当前页
        var pageNow = $("#pageNow").val();
        pageNow = 1;

        //跳转
        window.location.href='${pageContext.request.contextPath}/goods?method=viewAll&query='+query+"&pageNow="+pageNow;
    }

    //分页  末页
    function last(url,myPages) {
        //获取查询条件
        var query = $("#searchName").val();
        //获取当前页
        var pageNow = $("#pageNow").val();
        pageNow = myPages;

        //跳转
        window.location.href='${pageContext.request.contextPath}/goods?method=viewAll&query='+query+"&pageNow="+pageNow;
    }

    //分页  上一页
    function pre(url) {
        //获取查询条件
        var query = $("#searchName").val();
        //获取当前页
        var pageNow = $("#pageNow").val();
        if(pageNow<=1){
            alert("已至首页");
        }else{
            pageNow = pageNow - 1;
        }

        //跳转
        window.location.href='${pageContext.request.contextPath}/goods?method=viewAll&query='+query+"&pageNow="+pageNow;
    }

    //分页  下一页
    function next(url,myPages) {
        //获取查询条件
        var query = $("#searchName").val();
        //获取当前页
        var pageNow = $("#pageNow").val();
        if(pageNow>=myPages){
            alert("已至末页");
        }else{
            pageNow = pageNow - (-1);
        }

        //跳转
        window.location.href='${pageContext.request.contextPath}/goods?method=viewAll&query='+query+"&pageNow="+pageNow;

    }

    //分页  跳转
    function skip(url,myPages) {
        //获取查询条件
        var query = $("#searchName").val();
        //获取当前页
        var pageNow = $("#pageNow").val();
        if(pageNow<1 || pageNow>myPages){
            alert("超出范围");
            pageNow = 1;
        }

        //跳转
        window.location.href='${pageContext.request.contextPath}/goods?method=viewAll&query='+query+"&pageNow="+pageNow;
    }

    //删除货物
    function deleteAll(url,str) {

        if(str=="all"){
            //多选删除   http://localhost:8899/items?code=delete&id=1&id=2
            var s = "";
            $(".single").each(function () {
                if($(this).prop("checked")){
                    var id = $(this).parents(".data").find(".id").text();
                    // &id=1&id=2
                    s = s + "&id="+id;

                }
            });
            window.location.href = '${pageContext.request.contextPath}/goods?method=delete'+s;  //&id=1&id=2&id=3
        }else{
            //单项删除  http://localhost:8899/items?code=delete&id=1
            window.location.href = '${pageContext.request.contextPath}/goods?method=delete&id='+str;
        }

    }
</script>
</html>
