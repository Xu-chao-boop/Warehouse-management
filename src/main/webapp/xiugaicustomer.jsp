<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="assets/css/ace.min.css" />
  <link rel="stylesheet" href="css/style.css"/>
<title>修改客户信息</title>
</head>

<body>
  <div class="page-content">
   <div class="user_Manager_style">

     <div class=" Manager_style">
       <span class="title_name">修改客户信息</span>
       <div class="add_user_style clearfix">
        <div class="xinxi-xs clearfix">
        <label class="label_name lf">操作管理员名称：</label><span class="lf">${sessionScope.user.name}</span>
        </div>
       </div>

    <form id="xiuSupplierFrom" action="${pageContext.request.contextPath}/customer?method=update" method="post">
         <div class="project_style">
          <ul class="Add_Manager_style clearfix">
           <li>
            <label class="label_name">客户ID</label>
            <input name="id" type="text" placeholder="id" readonly="readonly"
                   class="text" value="${customer.id}" style=" width:350px; "/>
           </li>
           <li>
            <label class="label_name">客户名称</label>
            <input name="customer" type="text" placeholder="请输入客户名称" class="text"
                   required="required" value="${customer.customer}" style=" width:350px; "/><br/>
               <span style="color: red;margin-left: 100px">${requestScope.msg}</span>
           </li>
           <li>
            <label class="label_name">负责人</label>
            <input name="name" type="text" placeholder="请输入负责人姓名"
                   class="text" required="required" value="${customer.name}" style=" width:350px; "/>
           </li>
           <li>
            <label class="label_name">联系电话</label>
            <input name="phone" type="text" placeholder="请输入联系电话"
                   class="text" required="required" value="${customer.phone}" style=" width:350px; "/>
           </li>
          </ul>
         </div>
         <br/>

         <div class="btn_operating" style="margin-left: 150px">
          <button type="submit" class="btn btn-info" style="left: -20px"  <%--onclick="javascript:location.href='#'" --%>>确定修改</button>
         <button type="button" class="btn btn-info" style="margin-left: -10px" onclick="javascript:location.href='${pageContext.request.contextPath}/customer?method=viewAll'">返回</button>
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
