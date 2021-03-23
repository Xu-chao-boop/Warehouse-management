<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin登录界面</title>
    <link rel="shortcut icon" href="images/jaiobiao.png"/>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/login1.css">

    <script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/jquery.md5.js"></script>
    <script src="js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="js/login.validate.js" type="text/javascript"></script>

    <style>
        label.error{
            background: url(images/unchecked.gif) no-repeat 10px 3px;
            padding-left: 30px;
            color:red;
        }

        a:hover{
            color: #0b6cbc;
        }
    </style>
</head>

<body>
<!-- 定义容器 -->
<div class="container">
    <div class="row" style="margin-top: 150px">

        <div class="col-lg-2 col-md-3 col-sm-2"></div>
        <!-- 这一列为登陆表单 -->
        <div class="col-lg-8 col-md-6 col-sm-8">
            <div class="row login-row">
                <div class="col-lg-6 left-block">
                    <img class="login-left-img visible-lg"
                         src="../images/loginLeft.png" />
                </div>
                <div class="col-lg-6 right-block">
                    <div class="panel" style="height: 100%;">
                        <div class="panel-title" style="text-align: center;margin-bottom: 30px;">
                            <h2>智慧仓储管理系统（WMS）</h2>
                        </div>
                        <div class="panel-title" style="text-align: center">
                            <h4>用户登录</h4>
                        </div>
                        <div class="panel-body" style="margin-bottom: 30px">
                            <!-- 表单 -->
                            <form id="login-form" class="form-horizontal" action="${pageContext.request.contextPath}/user?method=login" method="post">
                                <div class="form-group">
                                    <label for="userID">用户ID</label>
                                    <input type="text" class="form-control form-control-sm"
                                           id="userID" name="userID" placeholder="请输入用户ID" />
                                </div>
                                <div class="form-group">
                                    <label for="password">密码</label>
                                    <input type="password" class="form-control form-control-sm"
                                           id="password" name="password" placeholder="请输入密码" />
                                </div>
                                <div class="form-group">
                                    <label for="checkCode">验证码</label>
                                    <div class="row">
                                        <div class="col-xs-8">
                                            <input type="text" class="form-control"
                                                   id="checkCode" name="checkCode" placeholder="请输入验证码" />
                                        </div>
                                        <div class="col-xs-4" style="text-align: right;">
                                            <a href="javascript:reloadCode();">
                                                <img  style="width: 100px" id="imagecode" src="<%= request.getContextPath()%>/ImageServlet">
                                            </a>
                                        </div>
                                    </div>
                                </div>

                               <span style="color: red">${requestScope.msg}</span>
                                <div style="margin-top: 20px">
                                    <button id="submit" type="submit" class="btn btn-block btn-success form-control" style="background-color: #168be9;">登录</button>
                                    <br/>
                                    <h4 style="color: lightskyblue;margin-left: 80px;"><<&nbsp; <a id="return" href="shouye.jsp" style="color: lightskyblue">返回上一页</a>&nbsp; >></h4>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-2 col-md-3 col-sm-2"></div>
    </div>
</div>

<script>

    function reloadCode() {
        var time = new Date().getTime();
        document.getElementById("imagecode").src = "<%= request.getContextPath()%>/ImageServlet?d=" + time;
    }

</script>
</body>
</html>
