<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="assets/css/ace.min.css" />
  <link rel="stylesheet" href="css/style.css"/>
<title>管理员登录界面</title>
</head>

<body>
<div class="page-content">
 <div class="user_Manager_style">

  <form action="${pageContext.request.contextPath}/admin?method=login" method="post">
 <div class=" Manager_style">
  <span class="title_name">管理员权限管理</span>
  <div class="add_user_style clearfix">

   <div class="xinxi-xs clearfix">
   <label class="label_name lf">界面说明：</label><span class="lf">登录后进行对用户信息管理</span>
   <label class="label_name lf">备注：</label >
<c:if test="${sessionScope.user.id==2001}">
  <span class="lf" style="color: #0FB25F">您是管理员，可进行此操作</span>
</c:if>
<c:if test="${sessionScope.user.id!=2001}">
    <span class="lf" style="color: red">您不是管理员，无权限进行此操作</span>
</c:if>
   </div>
   <br/>
   <ul>
    <li><label class="label_name">ID：</label> <input name="id" type="text" class="text_add" placeholder="管理员id" required="required"><i style="color:#F60; ">*</i></li>
    <li><label class="label_name">密码：</label> <input name="password" type="password" class="" placeholder="请输入密码" required="required"><i style="color:#F60; ">*</i></li>
   </ul>
  </div>

  <span style="color: red;margin-left: 100px">${requestScope.msg}</span>
  <div class=""><br/><button id="submit" type="submit" class="btn btn-primary" style="margin-left: 200px;width: 80px">确定</button></div>
 </div>
  </form>
</div>
</div>

<script src="assets/js/jquery.min.js"></script>
    <!-- <![endif]-->
    <!--[if IE]>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<
<script type="text/javascript">
 window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->
<script src="assets/js/bootstrap.min.js"></script>
 <script src="assets/layer/layer.js" type="text/javascript"></script>
</body>
</html>
