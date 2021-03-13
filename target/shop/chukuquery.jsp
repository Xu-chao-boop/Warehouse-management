<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="assets/css/font-awesome.min.css" />
    <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
  <link rel="stylesheet" href="assets/css/jquery-ui-1.10.3.full.min.css">
  <link rel="stylesheet" href="assets/css/ace.min.css" />
  <link rel="stylesheet" href="css/style.css"/>
<title>出库记录</title>
</head>

<body>
<div class="page-content">
 <!--角色管理-->
 <div class="Role_Manager_style">
  <div class="Manager_style">
    <div class="title_name">用户操作</div>
      <li><label class="label_name">仓库编号</label>
      <select id="searchName" name="warehouse" size="1" style="width:200px; margin-left:10px;height: 30px"  >
          <option value="">--请选择仓库--</option>
          <option value="一号仓库">一号仓库</option>
          <option value="二号仓库">二号仓库</option>
          <option value="三号仓库">三号仓库</option>
      </select>
          <button  type="button" class="btn btn-primary" style="margin-left: 100px" onclick="viewAll('${path}')">查询</button>
          <button class="btn btn-danger" type="button" style="margin-left: 12px" onclick="deleteAll('${path}' , 'all')">删除所有</button>
      </li>


  </div>
  </div>
  <!---->
  <div class="Manager_style">
    <div class="title_name">出库记录</div>
    <div class="Role_list">
     <table id="Role_list" cellpadding="0" cellspacing="0" class="table table-striped table-bordered table-hover">
      <thead>
       <tr>
         <th style="text-align:center" width="5%"><input type="checkbox" class="choose_all"></th>
        <th>序列</th>
        <th>货物ID</th>
        <th>货物名称</th>
        <th>货物类型</th>
        <th>货物规格</th>
        <th>出库仓库</th>
        <th>出库数量</th>
        <th>客户</th>
        <th>出库时间</th>
        <th>经办人</th>
        <th>操作</th>
       </tr>
      </thead>
      <tbody>
      <c:forEach items="${vo.list}" var="goodsOut">
       <tr class="data" align="center">
        <td class="datachoose"><input type="checkbox" class="single"></td>
        <td class="id">${goodsOut.xulie}</td>
        <td>${goodsOut.id}</td>
        <td>${goodsOut.name}</td>
        <td>${goodsOut.type}</td>
        <td>${goodsOut.specification}</td>
        <td>${goodsOut.warehouse}</td>
        <td>${goodsOut.number}</td>
        <td>${goodsOut.custom}</td>
        <td>${goodsOut.outtime}</td>
        <td>${goodsOut.username}</td>
        <td>
         <button type="button" class="btn btn-warning" onclick="deleteAll('${path}','${goodsOut.xulie}')">删除记录</button></td>
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
 </div>

</div>

<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/layer/layer.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/index.js"></script>

</body>

<%--分页  首页--%>
<script>
    //查询所有商品信息
    function viewAll(url) {
        var query = $("#searchName").val();
        if(query == undefined){
            query = "";
        }

        //跳转
        window.location.href='${pageContext.request.contextPath}/goodsOut?method=viewAll&query='+query;

    }

    //分页  首页
    function first(url) {
        //获取查询条件
        var query = $("#searchName").val();
        //获取当前页
        var pageNow = $("#pageNow").val();
        pageNow = 1;

        //跳转
        window.location.href='${pageContext.request.contextPath}/goodsOut?method=viewAll&query='+query+"&pageNow="+pageNow;
    }

    //分页  末页
    function last(url,myPages) {
        //获取查询条件
        var query = $("#searchName").val();
        //获取当前页
        var pageNow = $("#pageNow").val();
        pageNow = myPages;

        //跳转
        window.location.href='${pageContext.request.contextPath}/goodsOut?method=viewAll&query='+query+"&pageNow="+pageNow;
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
        window.location.href='${pageContext.request.contextPath}/goodsOut?method=viewAll&query='+query+"&pageNow="+pageNow;
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
        window.location.href='${pageContext.request.contextPath}/goodsOut?method=viewAll&query='+query+"&pageNow="+pageNow;

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
        window.location.href='${pageContext.request.contextPath}/goodsOut?method=viewAll&query='+query+"&pageNow="+pageNow;
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
                    s = s + "&xulie="+id;

                }
            });
            window.location.href = '${pageContext.request.contextPath}/goodsOut?method=delete'+s;  //&id=1&id=2&id=3
        }else{
            //单项删除  http://localhost:8899/items?code=delete&id=1
            window.location.href = '${pageContext.request.contextPath}/goodsOut?method=delete&xulie='+str;
        }

    }
</script>
</html>
