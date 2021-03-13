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
		<script type="text/javascript" src="./statics/js/org.min.js" data-main="indexMain"></script>
		<script type="text/javascript" src="./statics/js/form.min.js"></script>
		<title>亿库企业仓储管理网站</title>
		<link rel="shortcut icon" href="images/cangku.jpeg"/>

	</head>

	<body>
		<div class="bodyMask"> </div>
		<div id="header" class="index_nav">

			<div class="content">
				<a href="index.html" id="logo"><img src="./statics/images/1504859476522.jpg" height="40" /></a>
				<ul id="nav">
					<li class="navitem">
						<a class="nav-a  active " href="index.jsp" target="_self"><span data-title="首页">首页</span></a>
					</li>

					</li>
					<li class="navitem">
						<a class="nav-a " href="login.jsp" target="_self"><span data-title="后台管理">后台管理</span></a>
					</li>
				</ul>
				<div class="clear"></div>
			</div>
			<a id="headSHBtn" href="#"><i class="fa fa-bars"></i></a>
		</div>
		<div id="sitecontent">
			<div id="indexPage">
				<div id="mslider" class="module">

					<ul class="slider" data-options-height="650" data-options-auto="0" data-options-mode="0" data-options-pause="4" data-options-ease="ease-out">

						<li style="background-image:url(./statics/images/1505093953575.png)">
							<div id="tempImage_1"></div><img style="display:none" src="./statics/images/1505093953575.png" alt="" />
							<div class="mask"></div>
							<a target="_blank">
								<div>
									<p class="title ellipsis"></p>
								</div>
								<div class="sliderArrow fa fa-angle-down"></div>
							</a>
						</li>
					</ul>
				</div>
				<div id="mindex" data-options-ease="Expo.easeInOut" data-options-speed="1" data-options-sscreen="0"></div>
				<div id="mproject" class="module">
					<div class="bgmask"></div>
					<div class="content layoutnone">
						<div class="header wow">
							<p class="title">产品展示</p>
							<p class="subtitle">Product</p>
						</div>
						<div id="category" class="hide wow">
							<span style="font-size: 15px">高效仓储</span>&nbsp;&nbsp;
							<span style="font-size: 15px">高效海运</span>&nbsp;&nbsp;
							<span style="font-size: 15px">精准汽运</span>
						</div>
						<!--yyLayout masonry-->
						<div class="module-content" id="projectlist">
							<div class="projectSubList" id="projectSubList_">
								<div class="projectSubHeader">
									<p class="title"></p>
									<p class="subtitle"></p>
								</div>
								<div class="wrapper">
									<ul class="content_list" data-options-sliders="3" data-options-margin="15" data-options-ease="1" data-options-speed="1">
										<li id="projectitem_0" class="projectitem wow">
											<a class="projectitem_content">
												<div class="projectitem_wrapper">
													<div class="project_img"><img src="./statics/images/1504081734702.jpg" alt="国际空运" width="650" height="385" /></div>
													<div class="project_info">
														<div>
															<p class="title">高效仓储</p>
															<p class="subtitle">高效的存储货物是仓储管理最重要的第一步</p>

														</div>
													</div>
												</div>
											</a>
										</li>
										<li id="projectitem_1" class="projectitem wow">
											<a class="projectitem_content" target="_blank">
												<div class="projectitem_wrapper">
													<div class="project_img"><img src="./statics/images/1504081877799.png" alt="高校海运" width="650" height="385" /></div>
													<div class="project_info">
														<div>
															<p class="title">高效海运</p>
															<p class="subtitle">支持国内海运发货，快运综合性海运输物流服务</p>
														</div>
													</div>
												</div>
											</a>
										</li>
										<li id="projectitem_2" class="projectitem wow">
											<a class="projectitem_content" target="_blank">
												<div class="projectitem_wrapper">
													<div class="project_img"><img src="./statics/images/1504081952983.png" alt="精准汽运" width="650" height="385" /></div>
													<div class="project_info">
														<div>
															<p class="title">精准汽运</p>
															<p class="subtitle">精准汽运，采用高安全系数车辆可以直达全国</p>
														</div>
													</div>
												</div>
											</a>
										</li>
									</ul>
								</div>
								<!--wrapper-->
							</div>
							<!--projectSubList-->

						</div>
						<!--projectlist-->
						<div class="clear"></div>
					</div>
				</div>
				<!--project-->
				<div id="mpage" class="module bgShow" style="background-image:url(./statics/images/1504954127839.png);">
					<div class="bgmask"></div>
					<div class="content">
						<div class="module-content">
							<div class="wrapper">
								<ul class="slider one">
									<li>
										<div class="header wow" data-wow-delay=".2s">
											<p class="title">关于我们</p>
											<p class="subtitle">ABOUT US</p>
										</div>
										<div class="des-wrap">
											<p class="description wow" data-wow-delay=".3s">仓储现居中国市场重要地位，在入库业务、出库业务、仓库调拨、库存调拨、综合批次管理、即时库存等业务领域亿库企业一直贯彻着先进的意识，以最优的服务做到行业领先
											</p>
										</div>
										<a href="#" class="more wow" data-wow-delay=".5s">MORE<i class="fa fa-angle-right"></i></a>
										<div class="fimg wow" style="background-image:url(./statics/images/1505102361596.jpg)"></div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>

		<div id="footer">
			<p>COPYRIGHT (©) 2021 亿库企业仓储管理网站</p>
		</div>

	</body>

</html>