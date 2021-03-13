<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>Admin注册界面</title>
    <link rel="shortcut icon" href="images/cangku.jpeg"/>
    <link href="css/bootstrap.regist.css" rel="stylesheet">
    <link href="css/materialdesignicons.min.css" rel="stylesheet">
    <link href="css/style.min.css" rel="stylesheet">
    <script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/jquery.md5.js"></script>
    <script src="js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="js/addUser.validate.js" type="text/javascript"></script>

    <style>
        body {
            display: -webkit-box;
            display: flex;
            -webkit-box-pack: center;
            justify-content: center;
            -webkit-box-align: center;
            align-items: center;
            height: 100%;
        }
        .login-box {
            display: table;
            table-layout: fixed;
            overflow: hidden;
            max-width: 700px;
        }
        .login-left {
            display: table-cell;
            position: relative;
            margin-bottom: 0;
            border-width: 0;
            padding: 45px;
        }
        .login-left .form-group:last-child {
            margin-bottom: 0px;
        }
        .login-right {
            display: table-cell;
            position: relative;
            margin-bottom: 0;
            border-width: 0;
            padding: 45px;
            width: 50%;
            max-width: 50%;
            background: #67b26f!important;
            background: -moz-linear-gradient(45deg,#67b26f 0,#4ca2cd 100%)!important;
            background: -webkit-linear-gradient(45deg,#67b26f 0,#4ca2cd 100%)!important;
            background: linear-gradient(45deg,#67b26f 0,#4ca2cd 100%)!important;
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#67b26f', endColorstr='#4ca2cd', GradientType=1 )!important;
        }
        .login-box .has-feedback.feedback-left .form-control {
            padding-left: 38px;
            padding-right: 12px;
        }
        .login-box .has-feedback.feedback-left .form-control-feedback {
            left: 0;
            right: auto;
            width: 38px;
            height: 38px;
            line-height: 38px;
            z-index: 4;
            color: #dcdcdc;
        }
        .login-box .has-feedback.feedback-left.row .form-control-feedback {
            left: 15px;
        }
        @media (max-width: 576px) {
            .login-right {
                display: none;
            }
        }

        label.error{
            background: url(images/unchecked.gif) no-repeat 10px 3px;
            padding-left: 30px;
            color:red;
        }

    </style>
</head>

<body style="background-image: url(images/registerbackground.png); background-size: cover;">

<%-- 隐藏域：存储项目发布路径 --%>
<input type="hidden" id="path" value="${pageContext.request.contextPath}" />

<div class="bg-translucent p-10">
    <div class="login-box bg-white clearfix">
        <div class="login-left">
            <form id="registForm" action="${pageContext.request.contextPath}/user?method=regist" method="post">
                <h2 style="text-align: center">注册界面</h2>
                <div class="form-group has-feedback feedback-left">
                    <label>姓名</label>
                    <input type="text" id="name" placeholder="请输入您的真实姓名" class="form-control" name="name" />
                </div>
                <div class="form-group has-feedback feedback-left">
                    <label>Id编号</label>
                    <input type="text" placeholder="请输入id编号" class="form-control" name="id" id="id" />

                </div>
                <div class="form-group has-feedback feedback-left">
                    <label>密码</label>
                    <input type="password" placeholder="请输入密码" class="form-control" name="password" id="password" />

                </div>
                <div class="form-group has-feedback feedback-left">
                    <label>确认密码</label>
                    <input type="password" placeholder="请再次确认密码" class="form-control" name="repassword" />

                </div>

                <div class="form-group">
                    <button class="btn btn-block btn-primary" type="submit">立即注册</button>
                </div>
            </form>
        </div>
        <div class="login-right">
            <h3 class="text-white m-tb-15">智慧仓储管理系统（WMS）</h3>
            <br/>
            <br/>
            <h4 class="text-white">已存在账号,立即<a href="${pageContext.request.contextPath}/login.jsp">登录</a></h4>
        </div>
    </div>
</div>

</body>
</html>
