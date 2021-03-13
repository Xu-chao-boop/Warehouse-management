<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="assets/css/font-awesome.min.css" />
  <!--[if IE 7]>
    <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
  <![endif]-->
  <link rel="stylesheet" href="assets/css/jquery-ui-1.10.3.full.min.css">
  <link rel="stylesheet" href="assets/css/ace.min.css" />
  <link rel="stylesheet" href="css/style.css"/>


    <title>用户管理</title>
    <style>
        label.error{
            background: url(images/unchecked.gif) no-repeat 10px 3px;
            padding-left: 30px;
            color:red;
        }
    </style>

</head>

<body>
<%-- 隐藏域：存储项目发布路径 --%>
<input type="hidden" id="path" value="${pageContext.request.contextPath}" />

<h4 style="color: orangered;margin-top: 20px;margin-left: 20px">欢迎进入管理员操作界面：${sessionScope.admin.name}管理员</h4>
<div class="page-content">
 <!--用户管理-->
 <div class="user_Manager_style">

  <div class="Manager_style add_user_info">
    <div class="title_name">添加用户</div>
     <button class="btn btn-primary" type="button" id="Add_user_btn">添加用户</button>
     <button class="btn btn-primary" type="button" id="exit" onclick="javascript:location.href='${path}/admin?method=exit'" style="margin-left: 20px">退出账号</button>
      <br/>
      <br/>
      <h4 style="color: red">${requestScope.msg}</h4>
     <div id="Add_user_style" style="display:none">

     <form id="addUsertForm" action="${pageContext.request.contextPath}/user?method=regist" method="post">
    <div class="add_user_style clearfix">
<!--    <div class="reset_style"><input name="reset" type="reset" value="重置" /class="btn btn-warning"> </div>-->
     <ul class="clearfix">
      <li><label class="label_name">用户ID</label> <input name="id" type="text"  placeholder="请输入id编号" id="id"/></li>
      <li><label class="label_name">用户名</label> <input name="userName" type="text" placeholder="请输入您的真实姓名" id="name"/></li>
      <li><label class="label_name">登录密码</label><input name="password" type="password"  placeholder="请输入密码" id="password"/></li>
      <li><label class="label_name">确认密码</label><input name="repassword" type="password"  placeholder="请再次确认密码" id="repassword"/></li>
      <li><label class="label_name">电话号码</label> <input name="phone" type="text"  placeholder="请输入电话号码" id="phone"/></li>
      <li><label class="label_name">Email</label> <input name="email" type="email"  placeholder="请输入邮箱" id="email"/></li>
     </ul>
     <br/>
     <div class="Remark"><label class="label_name">备注</label><textarea name="beizhu" cols="" rows="" style=" width:700px; height:100px; padding:5px;"></textarea></div>
    </div><!--onclick="return checkNull()"-->

             <div class="btn_operating">
                 <button type="submit" class="btn btn-info" id="submit" style="margin-left: 140px">添加</button>
                 <button type="button" class="btn btn-info" onclick="javascript:location.href='${path}/user?method=viewAll'">取消</button>
             </div>
      </form>

    </div>
    </div>


      <div class="Manager_style">
    <div class="title_name">用户列表</div>
    <div class="Role_list">
     <table id="Role_list" cellpadding="0" cellspacing="0" class="table table-striped table-bordered table-hover">

            <div>
                <ul class="search_content clearfix">
                    <li>
                        <label class="lf">用户名</label>
                        <input id="searchName" name="uname" type="text" placeholder="Search by name" value="${vo.query}" class="text_add" style="width:200px"/>
                        <button id="btn_search" type="button" class="btn_search" onclick="viewAll('${path}')" style="width:90px;height: 27px;margin-left: 10px;background-color: lightskyblue">查询</button>
                    </li>
                </ul>
            </div>
           <br/>
           <br/>

      <thead>
       <tr>
		   <th width="80">用户ID</th>
           <th>用户名</th>
           <th>电话号码</th>
		   <th>邮箱</th>
		   <th width="20%">备注</th>
           <th>操作</th>
	   </tr>
      </thead>
      <tbody>
<c:forEach items="${vo.list}" var="user">
       <tr>
       <td>${user.id}</td>
       <td>${user.name}</td>
       <td>${user.phone}</td>
       <td>${user.email}</td>
	   <td>${user.beizhu}</td>
       <td>
        <button  type="button" class="btn btn-warning" onclick="javascript:location.href='${path}/user?method=delete&id=${user.id}'">删除</button>
        </td>
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
<%--<script src="assets/js/jquery.min.js" type="text/javascript"></script>--%>
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script src="js/jquery.validate.min.js" type="text/javascript"></script>
<script src="js/addUser.validate.js" type="text/javascript"></script>

    <!-- <![endif]-->
    <!--[if IE]>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<![endif]-->
    <!--[if !IE]> -->

    <!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->

<script src="assets/js/bootstrap.min.js"></script>
 <script type="text/javascript" src="assets/layer/layer.js"></script>
<script type="text/javascript">
function hide1(){
document.getElementById('ycxz').style.display='';
document.getElementById('gys_name').style.display='none';
  
}
function display1(){
document.getElementById('ycxz').style.display='none';
document.getElementById('gys_name').style.display='';
} 
/***判断用户添加文本**/
 $('#Add_user_btn').on('click', function(){
	   layer.open({
        type: 1,
        title: '添加用户',
		maxmin: true, 
		shadeClose: true, //点击遮罩关闭层
        area : ['860px' , '400px'],
        content:$('#Add_user_style'),

	 cancel: function(index){
		   layer.alert('确定退出？',{
               title: '提示框',				
			  icon:1,		
			  });
		
	}

    });
});


</script>

<script>
    //查询所有商品信息
    function viewAll(url) {
        var query = $("#searchName").val();
        if(query == undefined){
            query = "";
        }

        //跳转
        window.location.href='${pageContext.request.contextPath}/user?method=viewAll&query='+query;

    }

    //分页  首页
    function first(url) {
        //获取查询条件
        var query = $("#searchName").val();
        //获取当前页
        var pageNow = $("#pageNow").val();
        pageNow = 1;

        //跳转
        window.location.href='${pageContext.request.contextPath}/user?method=viewAll&query='+query+"&pageNow="+pageNow;
    }

    //分页  末页
    function last(url,myPages) {
        //获取查询条件
        var query = $("#searchName").val();
        //获取当前页
        var pageNow = $("#pageNow").val();
        pageNow = myPages;

        //跳转
        window.location.href='${pageContext.request.contextPath}/user?method=viewAll&query='+query+"&pageNow="+pageNow;
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
        window.location.href='${pageContext.request.contextPath}/user?method=viewAll&query='+query+"&pageNow="+pageNow;
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
        window.location.href='${pageContext.request.contextPath}/user?method=viewAll&query='+query+"&pageNow="+pageNow;

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
        window.location.href='${pageContext.request.contextPath}/user?method=viewAll&query='+query+"&pageNow="+pageNow;
    }

</script>
</body>


</html>
