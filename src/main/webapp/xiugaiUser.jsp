<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="assets/css/ace.min.css" />
  <link rel="stylesheet" href="css/style.css"/>
<title>用户信息修改</title>
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
 <div class="user_Manager_style">
 <div class=" Manager_style">
  <span class="title_name">用户信息修改</span>
  <form id="updateUserForm" action="${pageContext.request.contextPath}/user?method=update" method="post">
  <div class="add_user_style clearfix">
   <div class="xinxi-xs clearfix">
   <label class="label_name lf">用户名称：</label><span class="lf">${sessionScope.user.name}</span>
   <label class="label_name lf">备注：</label ><span class="lf">您无权限操作用户ID</span>
   </div>
   <ul>
    <li hidden="hidden">
     <label class="label_name">用户ID</label>
     <input name="id" type="text" placeholder="id"
            class="text" value="${user.id}" style=" width:350px; "/>
    </li>
    <li><label class="label_name">用户姓名：</label> <input name="用户姓名" type="text" class="text_add" placeholder="请输入真实姓名" value="${user.name}" required="required"></li>
    <li><label class="label_name">手&nbsp;&nbsp;机&nbsp;号：</label> <input name="手机号" type="text" class="text_add" placeholder="请输入手机号" value="${user.phone}" required="required"></li>
    <li><label class="label_name">邮箱：</label> <input name="邮箱" type="email" class="" placeholder="请输入邮箱地址" value="${user.email}" required="required"></li>

    <div class="Remark"><br/><br/><br/><br/><label class="label_name">备注:</label><textarea name="beizhu" cols="" rows="" style=" width:700px; height:100px; padding:5px;">${user.beizhu}</textarea></div>
   </ul>
  </div>
  <br/>
  <br/>
   <div class=""><button id="submit" type="submit" class="btn btn-primary" style="margin-left: 350px">确定修改</button></div>
  </form>
 </div>
</div>
</div>

<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script src="js/jquery.validate.min.js" type="text/javascript"></script>
<script src="js/updateUser.validate.js" type="text/javascript"></script>


    <!-- <![endif]-->
    <!--[if IE]>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

<script type="text/javascript">
 window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->
<script src="assets/js/bootstrap.min.js"></script>
 <script src="assets/layer/layer.js" type="text/javascript"></script>
</body>
</html>
