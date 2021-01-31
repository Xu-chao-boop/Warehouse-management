<%--
  Created by IntelliJ IDEA.
  User: ac
  Date: 2021/1/30
  Time: 22:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<head>
    <title>仓库管理系统</title>
    <link rel="shortcut icon" href="/wms/media/favicon.ico" />
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="../css/AdminLTE.min.css">
    <link rel="stylesheet" type="text/css" href="../css/skin-green.min.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap-table.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" type="text/css" href="../css/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="../css/mainPage.css">
</head>
<body class="hold-transition skin-green sidebar-mini">

<div class="wrapper">

    <header class="main-header">
        <!-- Logo -->
        <a href="/wms/main" class="logo" style="background-color: #1065aa;">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini">WMS</span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg">仓库管理系统</span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" style="background-color: #168be9;">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>

            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <!-- User Account: style can be found in dropdown.less -->
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="margin-right: 20px">

                            <span class="hidden-xs">admin</span>
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu" style="width: 100px;padding: 10px;">
                            <!-通过session获取的name的值-->

                            <li>
                                <a href="javascript:void(0)" id="signOut"> <span
                                        class="glyphicon glyphicon-off"></span>注销登录</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- sidebar menu: : style can be found in sidebar.less -->
            <ul class="sidebar-menu" data-widget="tree">
                <li class="header">菜单栏</li>
                <li class="treeview">
                    <a href="#">
                        <i class="glyphicon glyphicon-certificate"></i> <span>库存管理</span>
                        <span class="pull-right-container">
                                <i class="glyphicon glyphicon-menu-right pull-right"></i>
                            </span>
                    </a>
                    <ul class="treeview-menu">
                        <li class="menu_item" name="pagecomponent/storageManagement.jsp">
                            <a href="#"><i class="fa fa-circle-o"></i>库存查询</a>
                        </li>
                        <li class="menu_item" name="pagecomponent/stockRecordManagement.html">
                            <a href="#"><i class="fa fa-circle-o"></i>出入库记录</a>
                        </li>
                    </ul>
                </li>
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-star-o"></i> <span>出入库管理</span>
                        <span class="pull-right-container">
                                <i class="glyphicon glyphicon-menu-right pull-right"></i>
                            </span>
                    </a>
                    <ul class="treeview-menu">
                        <li class="menu_item" name="pagecomponent/stock-inManagement.jsp">
                            <a href="#"><i class="fa fa-truck"></i> 货物入库</a>
                        </li>
                        <li class="menu_item" name="pagecomponent/stock-outManagement.jsp">
                            <a href="#"><i class="fa fa-truck"></i> 货物出库</a>
                        </li>
                    </ul>
                </li>
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-book"></i> <span>基础数据</span>
                        <span class="pull-right-container">
                                <i class="glyphicon glyphicon-menu-right pull-right"></i>
                            </span>
                    </a>
                    <ul class="treeview-menu">
                        <li class="menu_item" name="pagecomponent/supplierManagement.jsp">
                            <a href="#"><i class="fa fa-circle-o"></i> 供应商管理</a>
                        </li>
                        <li class="menu_item" name="pagecomponent/customerManagement.jsp">
                            <a href="#"><i class="fa fa-circle-o"></i> 客户信息管理</a>
                        </li>
                        <li class="menu_item" name="pagecomponent/goodsManagement.jsp">
                            <a href="#"><i class="fa fa-circle-o"></i> 货物信息管理</a>
                        </li>
                        <li class="menu_item" name="pagecomponent/repositoryManagement.jsp">
                            <a href="#"><i class="fa fa-circle-o"></i> 仓库信息管理</a>
                        </li>

                        <li class="menu_item" name="pagecomponent/repositoryAdminManagement.jsp">
                            <a href="#"><i class="fa fa-circle-o"></i> 用户管理</a>
                        </li>

                    </ul>
                </li>
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-cogs"></i> <span>系统维护</span>
                        <span class="pull-right-container">
                                <i class="glyphicon glyphicon-menu-right pull-right"></i>
                            </span>
                    </a>
                    <ul class="treeview-menu">
                        <li class="menu_item" name="pagecomponent/passwordModification.jsp">
                            <a href="#"><i class="fa fa-wrench"></i> 更改密码</a>
                        </li>

                        <li class="menu_item" name="pagecomponent/userOperationRecorderManagement.html">
                            <a href="#"><i class="fa fa-circle-o"></i> 系统日志</a>
                        </li>
                        <li class="menu_item" name="pagecomponent/accessRecordManagement.html">
                            <a href="#"><i class="fa fa-circle-o"></i> 登陆日志</a>
                        </li>

                    </ul>
                </li>
            </ul>
        </section>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Main content -->
        <section class="content">

        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 1.1.0
        </div>
        <strong>Copyright &copy; 2021 All rights reserved.</strong>
    </footer>
</div>



<!-- jQuery 3 -->
<script type="text/javascript" src="../js/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script type="text/javascript" src="../js/adminlte.min.js"></script>

<script type="text/javascript"
        src="../js/jquery-ui.min.js"></script>
<script type="text/javascript"
        src="../js/bootstrapValidator.min.js"></script>
<script type="text/javascript"
        src="../js/bootstrap-table.min.js"></script>
<script type="text/javascript"
        src="../js/bootstrap-table-zh-CN.min.js"></script>
<script type="text/javascript"
        src="../js/jquery.md5.js"></script>
<script type="text/javascript"
        src="../js/mainPage.js"></script>
<script type="text/javascript"
        src="../js/ajaxfileupload.js"></script>
<script type="text/javascript"
        src="../js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript"
        src="../js/bootstrap-datetimepicker.zh-CN.js"></script>

</body>
</html>

