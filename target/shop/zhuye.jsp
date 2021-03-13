<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="keywords" content="网站模板,集团模板网站,企业网站模板,集团网站,企业网站">
<meta name="description" content="">
<meta content="yes" name="apple-mobile-web-app-capable" />
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<meta content="telephone=no" name="format-detection" />
<link rel="stylesheet" type="text/css" href="./statics/css/lib.css">
<link rel="stylesheet" type="text/css" href="./statics/css/style.css">
<link rel="stylesheet" type="text/css" href="./statics/css/4101.css">
<script type="text/javascript" src="./statics/js/jquery-1.11.3.min.js"></script>
<script>
	$(function() {
		if(!$("#mindex").length) {
			$('body').addClass('sscreen')
		}
	})
</script>
<script type="text/javascript" src="./statics/js/org.min.js" data-main="baseMain"></script>
<script type="text/javascript" src="./statics/js/form.min.js"></script>
<title>主页</title>

	<style>
		h1{
			margin-left: 40px;
			margin-top: 40px
		}
	</style>
</head>

<body>
       <h1 style="color: #0c5460">欢迎进入科箭智慧仓储管理系统（WMS）</h1>
		<div id="sitecontent">
                <div class="npagePage Pageservice">
				<div id="banner">
					<div style="   background-image:url(images/faxianjiazhi.jpg);"></div>
				</div>
				<div class="content">
					<div class="header">
						<p class="title">基本功能</p>
						<p class="subtitle">BASIC FUNCTION</p>
					</div>
					<div id="servicelist">
						<ul class="wrap">
							<li class="serviceitem">
								<a href="goodsEnter.jsp" target="content">
									<p class="service_img"><img src="./statics/images/1504592460464.jpg" width="320" height="120" /></p>
									<div class="service_info">
										<p class="title">货物入库</p>
										<p class="description">明确货物入库工作业务的操作步骤及标准，规范仓库人员操作动作，提高货物入库的高效性...</p>
									</div>
								</a>
								<%--<a href="#" target="_blank" class="details">more<i class="fa fa-angle-right"></i></a>--%>
							</li>
							<li class="serviceitem">
								<a href="${pageContext.request.contextPath}/goods?method=viewAll" target="content">
									<p class="service_img"><img src="./statics/images/1504592472734.jpg" width="320" height="120" /></p>
									<div class="service_info">
										<p class="title">库存查询</p>
										<p class="description">精确且快速查询对应的货物相关信息，即时掌握货物的存储情况，方便出入库的调拨... </p>
									</div>
								</a>
								<%--<a href="#" target="_blank" class="details">more<i class="fa fa-angle-right"></i></a>--%>
							</li>
							<li class="serviceitem">
								<a href="goodsOut.jsp" target="content">
									<p class="service_img"><img src="./statics/images/1504592518169.jpg" width="320" height="120" /></p>
									<div class="service_info">
										<p class="title">货物出库</p>
										<p class="description">一个服务好的快递员每天会准时过来收货,短时间内给你安排出货,及时调出货物... </p>
									</div>
								</a>
								<%--<a href="#" target="_blank" class="details">more<i class="fa fa-angle-right"></i></a>--%>
							</li>
						</ul>
						<div class="clear"></div>
					</div>
					<div id="pages"></div>
				</div>
			</div>
		</div>

	</body>

</html>