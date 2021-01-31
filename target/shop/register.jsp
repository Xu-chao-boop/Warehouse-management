<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Admin注册界面</title>
    <link href="css/register.css" rel='stylesheet' type='text/css' />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Creative Sign In & Sign Up Forms Responsive, Login form web template, Sign up Web Templates,Profile widgets,Flat icon hover effects,Flat Registration Forms  Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
    <!-- //end-smoth-scrolling -->

</head>

<body>
<h1 >智慧仓储管理系统（WMS）</h1>
<div class="message warning">
    <div class="inset agile">
        <div class="sap_tabs w3ls-tabs">
            <div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
                <ul class="resp-tabs-list">
                    <li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>管理员注册</span></li>

                </ul>
                <div class="clear"> </div>

                <div class="resp-tabs-container">
                    <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
                        <div class="login-agileits-top">
                            <form action="#" method="post">
                                <p>姓名</p>
                                <input type="text" name="name"/>
                                <p>Id</p>
                                <input type="text" name="id"/>
                                <p>密码</p>
                                <input type="password" name="password"/>
                                <p>确认密码</p>
                                <input type="password" name="repassword" placeholder=""/>

                                <input type="submit" value="立即注册">

                              </form>
                            </br>
                            <span>若已存在账号，请点击</span>
                            </br>
                            <a href="#" style="color:blue">登录</a>


                        </div>
                      </div>
                </div>
            </div>
        </div>
   </div>

    <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
    <script>
        $(document).ready(function (c) {
            $('.alert-close').on('click', function (c) {
                $('.message').fadeOut('slow', function (c) {
                    $('.message').remove();
                });
            });
        });
    </script>
    <script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
    <!-- ResponsiveTabs js -->
    <script type="text/javascript">
        $(document).ready(function () {
            $('#horizontalTab').easyResponsiveTabs({
                type: 'default',
                width: 'auto',
                fit: true
            });
        });
    </script>

</body>
</html>
