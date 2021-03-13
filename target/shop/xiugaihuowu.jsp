<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="assets/css/ace.min.css" />
  <link rel="stylesheet" href="css/style.css"/>
<title>修改货物信息</title>
</head>

<body>
  <div class="page-content">
   <div class="user_Manager_style">

     <div class=" Manager_style">
       <span class="title_name">修改货物信息</span>
       <div class="add_user_style clearfix">
        <div class="xinxi-xs clearfix">
        <label class="label_name lf">操作管理员名称：</label><span class="lf">${sessionScope.user.name}</span>
        <label class="label_name lf">操作仓库：</label ><span class="lf">${goods.warehouse}</span>
        </div>
       </div>

    <form id="xiuwuFrom" action="${pageContext.request.contextPath}/goods?method=update" method="post">
         <div class="project_style">
          <ul class="Add_Manager_style clearfix">
           <li>
            <label class="label_name">货物id</label>
            <input name="id" type="text" placeholder="id" readonly="readonly"
                   class="text" value="${goods.id}" style=" width:350px; "/>
           </li>
           <li>
            <label class="label_name">入库货物</label>
            <input name="name" type="text" placeholder="请输入货物名称"
                   class="text"   required="required" value="${goods.name}"
                   onchange="validateUpdateName('${path}' , '${goods.name}')"style=" width:350px; "/><br/>
               <span style="color: red;margin-left: 100px">${requestScope.msg}</span>
           </li>
           <li>
            <label class="label_name">货物类型</label>
            <input name="type" type="text" placeholder="请输入货物类型"
                   class="text" required="required" value="${goods.type}" style=" width:350px; "/>
           </li>
           <li>
            <label class="label_name">货物规格</label>
            <input name="specification" type="text" placeholder="请输入货物规格"
                   class="text" required="required" value="${goods.specification}" style=" width:350px; "/>
           </li>
           <li>
            <label class="label_name">入库数量</label>
            <input name="number" type="text" placeholder="请输入数量"
                   class="text" required="required" value="${goods.number}" style=" width:350px; "/>
           </li>
           <li>
            <label class="label_name">供应商</label>
            <input name="supplier" type="text" placeholder="请输入供应商名称"
                   class="text" required="required" value="${goods.supplier}" style=" width:350px; "/>
           </li>
           <li>
            <label class="label_name">入库时间</label>
            <input name="entertime" type="date" class="form-control"
                   id="entertime" value="${goods.entertime}" style="width:350px; margin-left:30px"/>
           </li>
          </ul>
         </div>
         <br/>

         <div class="btn_operating" style="margin-left: 150px">
          <button type="submit" class="btn btn-info" style="left: -20px"  <%--onclick="javascript:location.href='#'" --%>>确定修改</button>
         <button type="button" class="btn btn-info" style="margin-left: -10px" onclick="javascript:location.href='${pageContext.request.contextPath}/goods?method=viewAll'">返回</button>
         </div>
    </form>

  </div>
  <script src="assets/js/jquery.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
  <script src="assets/js/bootstrap.min.js"></script>
   <script src="assets/layer/layer.js" type="text/javascript"></script>
  <script type="text/javascript"></script>
  </div>
   </div>
</body>



</html>
