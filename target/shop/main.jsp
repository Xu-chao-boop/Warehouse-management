<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8" />
    <title>科箭智慧仓储管理系统</title>
    <link rel="shortcut icon" href="images/jaiobiao.png"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/css/font-awesome.min.css" />
    <!--[if IE 7]>
    <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
    <![endif]-->
    <!--<link rel="stylesheet" href="http://fonts.useso.com/css?family=Open+Sans:400,300" />-->
    <link rel="stylesheet" href="assets/css/ace.min.css" />
    <link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
    <link rel="stylesheet" href="assets/css/ace-skins.min.css" />
    <link rel="stylesheet" href="css/style.css"/>
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
    <link rel="stylesheet" href="font/iconfont.css" />
    <![endif]-->
    <script src="assets/js/ace-extra.min.js"></script>
    <!--[if lt IE 9]>
    <script src="assets/js/html5shiv.js"></script>
    <script src="assets/js/respond.min.js"></script>
    <![endif]-->
    <!--[if !IE]> -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="js/updatePwd.validate.js" type="text/javascript"></script>

    <!-- <![endif]-->
    <style>
        label.error{
            background: url(images/unchecked.gif) no-repeat 10px 3px;
            padding-left: 30px;
            color:red;
        }

    </style>
</head>

<body>
<div class="navbar navbar-default" id="navbar">
    <script type="text/javascript">
        try{ace.settings.check('navbar' , 'fixed')}catch(e){}
    </script>
    <div class="navbar-container" id="navbar-container">
        <div class="navbar-header pull-left">
            <a href="#" class="navbar-brand">
                <small>
                    <img src="images/qt-logo2.png">
                </small>
            </a><!-- /.brand -->
        </div><!-- /.navbar-header -->
        <div class="navbar-header pull-right" role="navigation">
            <div class="get_time" ><span id="time"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>欢迎光临,${sessionScope.user.name}用户</span></div>
            <c:if test="${sessionScope.user!=null}">
                <ul class="nav ace-nav">
                    <li><a href="javascript:ovid(0)" class="change_Password">修改密码</a></li>
                    <li><a href="javascript:ovid(0)" id="Exit_system">退出系统</a></li>
                </ul><!-- /.ace-nav -->
            </c:if>

        </div><!-- /.navbar-header -->
    </div><!-- /.container -->
</div>


<div class="main-container" id="main-container">
    <script type="text/javascript">
        try{ace.settings.check('main-container' , 'fixed')}catch(e){}
    </script>
    <div class="main-container-inner">
        <a class="menu-toggler" id="menu-toggler" href="#">
            <span class="menu-text"></span>
        </a>
        <div class="sidebar" id="sidebar">
            <script type="text/javascript">
                try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
            </script>
            <div class="sidebar-shortcuts" id="sidebar-shortcuts">
                <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
                    智慧仓储管理系统（WMS）
                </div>

                <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
                    <span class="btn btn-success"></span>
                    <span class="btn btn-info"></span>
                    <span class="btn btn-warning"></span>
                    <span class="btn btn-danger"></span>
                </div>
            </div><!-- #sidebar-shortcuts -->
            <c:if test="${sessionScope.user!=null}">
                <ul class="nav nav-list" id="nav_list">
                    <li class="home"><a href="main.jsp" name="home.html" class="iframeurl" title=""><i class="icon-dashboard"></i><span class="menu-text"> 系统首页 </span></a></li>
                    <li><a href="#" class="dropdown-toggle"><i class="icon-desktop"></i><span class="menu-text"> 出入库管理 </span><b class="arrow icon-angle-down"></b></a>
                        <ul class="submenu">
                            <li class="home"><a href="javascript:void(0)" name="goodsEnter.jsp"  title="货物入库" class="iframeurl"><i class="icon-double-angle-right"></i>货物入库</a></li>
                            <li class="home"><a href="javascript:void(0)" name="goodsOut.jsp" title="货物出库"  class="iframeurl"><i class="icon-double-angle-right"></i>货物出库</a></li>
                           <%-- <li class="home"><a href="javascript:void(0)" name="暂存项目.html" title="暂存项目"  class="iframeurl"><i class="icon-double-angle-right"></i>暂存项目</a></li>
                            <li class="home"><a href="javascript:void(0)" name="模板维护.html" title="模板维护"  class="iframeurl"><i class="icon-double-angle-right"></i>模板维护</a></li>--%>
                            <li class="home"><a href="${pageContext.request.contextPath}/goods?method=viewAll" title="库存信息管理"  class="iframeurl" target="content"><i class="icon-double-angle-right"></i>库存查询</a></li>
                            <li class="home"><a href="${pageContext.request.contextPath}/goods?method=viewOneHouse" title="一号仓库货物信息"  class="iframeurl" target="content"><i class="icon-double-angle-right"></i>（仓库）一号仓库</a></li>
                            <li class="home"><a href="${pageContext.request.contextPath}/goods?method=viewTwoHouse" title="二号仓库货物信息"  class="iframeurl" target="content"><i class="icon-double-angle-right"></i>（仓库）二号仓库</a></li>
                            <li class="home"><a href="${pageContext.request.contextPath}/goods?method=viewThreeHouse" title="三号仓库货物信息"  class="iframeurl" target="content"><i class="icon-double-angle-right"></i>（仓库）三号仓库</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" class="dropdown-toggle"><i class="icon-list"></i><span class="menu-text"> 订单查询 </span><b class="arrow icon-angle-down"></b></a>
                        <ul class="submenu">
                            <li class="home"><a href="${pageContext.request.contextPath}/goods?method=viewEnter" title="入库订单"  class="iframeurl" target="content"><i class="icon-double-angle-right"></i>入库订单</a></li>
                            <li class="home"><a href="${pageContext.request.contextPath}/goodsOut?method=viewAll" title="出库订单"  class="iframeurl" target="content"><i class="icon-double-angle-right"></i>出库订单</a></li>

                            <%--<li class="home"><a href="javascript:void(0)" name="cangkuxinxi.jsp" title="仓库信息展示"  class="iframeurl"><i class="icon-double-angle-right"></i>仓库信息</a></li>
                            <li class="home"><a href="javascript:void(0)" name="bingzhuangtu.jsp" title="仓库货物类型统计"  class="iframeurl"><i class="icon-double-angle-right"></i>货物类型统计图</a></li>--%>
                           <%-- <li class="home"><a href="javascript:void(0)" name="已加油订单.html" title="已加油订单"  class="iframeurl"><i class="icon-double-angle-right"></i>（权限）已加油订单</a></li>
                            <li class="home"><a href="javascript:void(0)" name="已完结订单.html" title="已完结订单"  class="iframeurl"><i class="icon-double-angle-right"></i>已完结订单</a></li>
                            <li class="home"><a href="javascript:void(0)" name="异常订单.html" title="异常订单"  class="iframeurl"><i class="icon-double-angle-right"></i>异常订单</a></li>
                            <li class="home"><a href="javascript:void(0)" name="异常订单处理.html" title="异常订单处理"  class="iframeurl"><i class="icon-double-angle-right"></i>（权限）异常订单处理</a></li>
                            <li class="home"><a href="javascript:void(0)" name="供应商评价.html" title="供应商评价"  class="iframeurl"><i class="icon-double-angle-right"></i>供应商评价</a></li>
                            <li class="home"><a href="javascript:void(0)" name="订单评价.html" title="订单评价"  class="iframeurl"><i class="icon-double-angle-right"></i>（评价）订单评价</a></li>--%>
                        </ul>
                    </li>
                    <li>
                        <a href="#" class="dropdown-toggle"><i>&nbsp;&nbsp;<img src="images/tongji.png"></i>&nbsp;&nbsp;&nbsp;<span class="menu-text"> 数据统计 </span><b class="arrow icon-angle-down"></b></a>
                        <ul class="submenu">
                           <li class="home"><a href="javascript:void(0)" name="cangkuxinxi.jsp" title="仓库信息展示"  class="iframeurl"><i class="icon-double-angle-right"></i>仓库信息</a></li>
                            <li class="home"><a href="javascript:void(0)" name="bingzhuangtu.jsp" title="仓库货物类型统计"  class="iframeurl"><i class="icon-double-angle-right"></i>货物类型统计图</a></li>
                                <%-- <li class="home"><a href="javascript:void(0)" name="已加油订单.html" title="已加油订单"  class="iframeurl"><i class="icon-double-angle-right"></i>（权限）已加油订单</a></li>
                                 <li class="home"><a href="javascript:void(0)" name="已完结订单.html" title="已完结订单"  class="iframeurl"><i class="icon-double-angle-right"></i>已完结订单</a></li>
                                 <li class="home"><a href="javascript:void(0)" name="异常订单.html" title="异常订单"  class="iframeurl"><i class="icon-double-angle-right"></i>异常订单</a></li>
                                 <li class="home"><a href="javascript:void(0)" name="异常订单处理.html" title="异常订单处理"  class="iframeurl"><i class="icon-double-angle-right"></i>（权限）异常订单处理</a></li>
                                 <li class="home"><a href="javascript:void(0)" name="供应商评价.html" title="供应商评价"  class="iframeurl"><i class="icon-double-angle-right"></i>供应商评价</a></li>
                                 <li class="home"><a href="javascript:void(0)" name="订单评价.html" title="订单评价"  class="iframeurl"><i class="icon-double-angle-right"></i>（评价）订单评价</a></li>--%>
                        </ul>
                    </li>

                     <%--   <li>
                          <a href="#" class="dropdown-toggle"><i>&nbsp;&nbsp;<img src="images/tongji.png"></i>&nbsp;&nbsp;&nbsp;<span class="menu-text"> 关于更多 </span><b class="arrow icon-angle-down"></b></a>
                          <ul class="submenu">
                              <li class="home"><a href="javascript:void(0)" name="about_us.jsp" title="关于我们" class="iframeurl"><i class="icon-double-angle-right"></i>关于我们</a></li>

                          </ul>
                      </li>--%>

                    <li><a href="#" class="dropdown-toggle"><i class="icon-edit"></i><span class="menu-text"> 信息管理 </span><b class="arrow icon-angle-down"></b></a>
                        <ul class="submenu">
                           <%-- <li class="home"><a href="javascript:void(0)" name="菜单管理.html" title="菜单管理" class="iframeurl"><i class="icon-double-angle-right"></i>菜单管理</a></li>
                            <li class="home"><a href="javascript:void(0)" name="角色管理.html" title="角色管理"  class="iframeurl"><i class="icon-double-angle-right"></i>角色管理</a></li>--%>
                            <li class="home"><a href="javascript:void(0)" name="xiugaiUser.jsp" title="个人信息管理" class="iframeurl"><i class="icon-double-angle-right"></i>个人信息管理</a></li>

                          <!--根据用户权限显示用户管理-->
                          <li class="home"><a href="javascript:void(0)" name="adminnLogin.jsp" title="权限用户管理" class="iframeurl" target="content"><i class="icon-double-angle-right"></i>管理员权限管理</a></li>
                               <li class="home"><a href="${pageContext.request.contextPath}/supplier?method=viewAll" title="供应商信息管理"  class="iframeurl" target="content"><i class="icon-double-angle-right"></i>供应商信息管理</a></li>
                               <li class="home"><a href="${pageContext.request.contextPath}/customer?method=viewAll" title="客户信息管理"  class="iframeurl" target="content"><i class="icon-double-angle-right"></i>客户信息管理</a></li>
                               <li class="home"><a href="javascript:void(0)" name="about_us.jsp" title="关于我们" class="iframeurl"><i class="icon-double-angle-right"></i>关于我们</a></li>
                               <!--结束-->

                           <%-- <li class="home"><a href="javascript:void(0)" name="bingzhuangtu.jsp" title="供应商管理" class="iframeurl"><i class="icon-double-angle-right"></i>供应商管理</a></li>
                            <li class="home"><a href="javascript:void(0)" name="船只管理.html" title="船只管理" class="iframeurl"><i class="icon-double-angle-right"></i>船只管理</a></li>
                            <li class="home"><a href="javascript:void(0)" name="产品管理.html" title="产品管理" class="iframeurl"><i class="icon-double-angle-right"></i>产品管理</a></li>
                        </ul>--%>
                    </li>
                </ul><!-- /.nav-list -->


            </c:if>

            <div class="sidebar-collapse" id="sidebar-collapse">
                <i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
            </div>
            <script type="text/javascript">
                try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
            </script>
        </div>
        <div class="main-content">
            <script type="text/javascript">
                try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
            </script>
            <div class="breadcrumbs" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li>
                        <i class="icon-home home-icon"></i>
                        <a href="main.jsp">首页</a>
                    </li>
                    <li class="active"><span class="Current_page"></span></li>
                    <li class="active" id="parentIframe"><span class="parentIframe"></span></li>
                </ul>
            </div>

            <c:if test="${sessionScope.user!=null}">
                <iframe id="iframe" name="content" style="border:0; width:100%; background-color:#FFF;"  frameborder="0" src="zhuye.jsp">  </iframe>
            </c:if>

            <c:if test="${sessionScope.user==null}">
              <h1>您还未登录，请点击<a href="${pageContext.request.contextPath}/login.jsp" style="color:lightseagreen">登录</a>或<a href="${pageContext.request.contextPath}/shouye.jsp" style="color:lightskyblue">返回</a>首页</h1>
            </c:if>


            <c:set value="${pageContext.request.contextPath}" scope="application" var="path"></c:set>
            <!-- /.page-content -->
        </div><!-- /.main-content -->

     <!--底部样式-->
<div class="footer_style" id="footerstyle">
    <p class="lf">版权所有：上海科箭仓储管理物流公司  沪ICP备11031116号</p>
    <p class="rf">地址：上海市徐汇区宜山路 700号 A4号楼401室  咨询热线：400-875-0808 技术热线：400-812-5516</p>
</div>
<!--修改密码样式-->
<div class="change_Pass_style" id="change_Pass">
    <form id="updatePwdForm" action="${pageContext.request.contextPath}/user?method=updatePwd" method="post">
        <ul class="xg_style">
            <li><label class="label_name">原&nbsp;&nbsp;密&nbsp;码</label><input name="原密码" type="password" class="" id="password"></li>
            <li><label class="label_name">新&nbsp;&nbsp;密&nbsp;码</label><input name="新密码" type="password" class="" id="Nes_pas"></li>
            <li><label class="label_name">确认密码</label><input name="再次确认密码" type="password" class="" id="c_mew_pas"></li>
            <br/>
            <li><button class="submit" type="submit" style="background-color: #6aaedf;border: #000000;margin-left: 130px">确认修改</button></li>

        </ul>
    </form>
    <!--       <div class="center"> <button class="btn btn-primary" type="button" id="submit">确认修改</button></div>-->
</div>
<!-- /.main-container -->
<!-- basic scripts -->
<script src="js/jquery.js" type="text/javascript"></script>
<!--[if !IE]> -->
<script type="text/javascript">
    window.jQuery || document.write("<script src='assets/js/jquery-2.0.3.min.js'>"+"<"+"script>");
</script>
<!-- <![endif]-->
<!--[if IE]>
<script type="text/javascript">
    window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>"+"<"+"script>");
</script>
<![endif]-->
<script type="text/javascript">
    if("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"script>");
</script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/typeahead-bs2.min.js"></script>
<!-- page specific plugin scripts -->
<!--[if lte IE 8]>
<script src="assets/js/excanvas.min.js"></script>
<![endif]-->
<!-- ace scripts -->
<script src="assets/js/ace-elements.min.js"></script>
<script src="assets/js/ace.min.js"></script>
<script src="assets/layer/layer.js" type="text/javascript"></script>
<!-- inline scripts related to this page -->
<script type="text/javascript">
    jQuery(document).ready(function(){
        //初始化宽度、高度
        $("#main-container").height($(window).height()-76);
        $("#iframe").height($(window).height()-155);
        $(".sidebar").height($(window).height()-99);
        var thisHeight = $("#nav_list").height($(window).height()-185);
        $(".submenu").height($(thisHeight).height()-160);
        $("#nav_list").children(".submenu").css("height",thisHeight);

        //当文档窗口发生改变时 触发
        $(window).resize(function(){
            $("#main-container").height($(window).height()-76);
            $("#iframe").height($(window).height()-155);
            $(".sidebar").height($(window).height()-99);
            var thisHeight = $("#nav_list").height($(window).height()-185);
            $(".submenu").height($(thisHeight).height()-160);
            $("#nav_list").children(".submenu").css("height",thisHeight);
        });
        $(".iframeurl").bind("click",function(){
            var cid = $(this).attr("name");
            var cname = $(this).attr("title");
            $("#iframe").attr("src",cid).ready();
            $("#Bcrumbs").attr("href",cid).ready();
            $(".Current_page a").attr('href',cid).ready();
            $(".Current_page").html(cname).ready();
            $("#parentIframe").html(""). css("display","none").ready();
        });

    });

    /*********************点击事件*********************/
    $( document).ready(function(){
        $('#nav_list').find('li.home').click(function(){
            $('#nav_list').find('li.home').removeClass('active');
            $(this).addClass('active');
        });

    })
    //时间设置
    function currentTime(){
        var d=new Date(),str='';
        str+=d.getFullYear()+'年';
        str+=d.getMonth() + 1+'月';
        str+=d.getDate()+'日';
        str+=d.getHours()+'时';
        str+=d.getMinutes()+'分';
        str+= d.getSeconds()+'秒';
        return str;
    }
    setInterval(function(){$('#time').html(currentTime)},1000);

    //修改密码
    $('.change_Password').on('click', function(){
        layer.open({
            type: 1,
            title:'修改密码',
            area: ['400px','300px'],
            shadeClose: true,
            content: $('#change_Pass'),
            yes:function(index, layero){
                if ($("#password").val()==""){
                    layer.alert('原密码不能为空!',{
                        title: '提示框',
                        icon:0
                    });
                    return false;
                }
                if ($("#Nes_pas").val()==""){
                    layer.alert('新密码不能为空!',{
                        title: '提示框',
                        icon:0,

                    });
                    return false;
                }

                if ($("#c_mew_pas").val()==""){
                    layer.alert('确认新密码不能为空!',{
                        title: '提示框',
                        icon:0,

                    });
                    return false;
                }
                if(!$("#c_mew_pas").val || $("#c_mew_pas").val() != $("#Nes_pas").val() )
                {
                    layer.alert('密码不一致!',{
                        title: '提示框',
                        icon:0,

                    });
                    return false;
                }
                else{
                    layer.alert('修改成功！',{
                        title: '提示框',
                        icon:1,
                    });
                    layer.close(index);
                }
            }
        });
    });
    $('#Exit_system').on('click', function(){
        layer.confirm('是否确定退出系统？', {
                btn: ['是','否'] //按钮
            },
            function(){
                location.href="${pageContext.request.contextPath}/user?method=logout";
           });
    });
</script>

</body>
<%--<script>
    function viewAll() {
        window.location.href='${pageContext.request.contextPath}/goods?method=viewAll';
    }
</script>--%>

</html>

