function bindEvents() {

    // $("#header").load("header.html");
    // $("#footer").load("footer.html");


    // 检测客户浏览器为IE8以下则提醒
    var DEFAULT_VERSION = 8.0;
    var ua = navigator.userAgent.toLowerCase();
    var isIE = ua.indexOf("msie") > -1;
    var safariVersion;
    if (isIE) {
        safariVersion = ua.match(/msie ([\d.]+)/)[1];
    }
    if (safariVersion <= DEFAULT_VERSION) {
        // 进行你所要的操作
        $("html").before('<div class="low_version">系统检测到您的浏览器版本太低，不能实现完美体验，请及时升级浏览器版本！推荐使用Chrome浏览器。</div>');
    };

    //第一次进入页面先取userUrl
    userUrl = sessionStorage.getItem('setUrl');
    console.log(userUrl);
    //第一次进入官网的来源url存入sessionStorage
    if (!userUrl) {
        var setUrl = window.location.href; /* 获取完整URL */
        sessionStorage.setItem("setUrl", setUrl); //存入参数
        userUrl = sessionStorage.getItem('setUrl');
    }
    //获取来源url？后面的参数
    if (userUrl.indexOf("?") > -1) {
        // console.log("地址包含？")
        var str = userUrl.split("?")[1] || "";
        console.log(str);
        var a = document.getElementsByTagName("a"); //这部分是在网站各个地址之间跳转带上后面的参数
        for (var i = 0; i < a.length; i++) {
            a[i].href += (a[i].href.indexOf("?") > -1 ? "&" : "?") + str;
        }
    }



    //demo预约演示页
    // function GetQueryString(name) { //获取地址栏里from后的参数-最早截取方式，不能获取客户进入页面时的参数
    //      var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
    //      var r = window.location.search.substr(1).match(reg);
    //      if(r!=null)return  unescape(r[2]); return null;
    //     }
    //     var myfrom = GetQueryString("from")
    var val1 = "获知途径：搜索引擎；来源：" + str;
    // var val2 = "获知途径：新闻媒体；来源：" + str;
    // var val3 = "获知途径：微信等科箭自媒体；来源：" + str;
    // var val4 = "获知途径：展会等线下活动；来源：" + str;
    // var val5 = "获知途径：朋友推荐；来源：" + str;
    // var val6 = "获知途径：其他；来源：" + str;

    $("#REMARK").append("<option value = " + val1 + ">搜索引擎</option>");
    $("#home #REMARK").append("<option value = " + val1 + ">TMS聚合页</option>");
    $("#REMARK").find("option").attr("selected", true);
    // $("#REMARK").append("<option value = " + val2 + ">新闻媒体</option>");
    // $("#REMARK").append("<option value = " + val3 + ">微信等科箭自媒体</option>");
    // $("#REMARK").append("<option value = " + val4 + ">展会等线下活动</option>");
    // $("#REMARK").append("<option value = " + val5 + ">朋友推荐</option>");
    // $("#REMARK").append("<option value = " + val6 + ">其他</option>");

    $(".make-btn").on('click', function () {
        var visit = $('input:radio[name="VISIT_TYPE"]:checked').val();
        var myPhone = /^(((13[0-9]{1})|(14[0-9]{1})|(15[0-9]{1})|(16[0-9]{1})|(17[0-9]{1})|(18[0-9]{1})|(19[0-9]{1}))+\d{8})$/; //手机号码验证
        $("#TEL").val($("#PHONE").val()); //这句要保留否则提交失败

        //判断内容是否已输入
        if (!$("#FULL_NAME").val().length > 0) {
            $("#name-tip").fadeIn('slow');
            setTimeout(function () {
                $("#name-tip").fadeOut('slow');
            }, 1000)
            $("#FULL_NAME").focus();
        } else if (!$("#COMPANY").val().length > 0) {
            $("#COMPANY-tip").fadeIn('slow');
            setTimeout(function () {
                $("#COMPANY-tip").fadeOut('slow');
            }, 1000)
            $("#COMPANY").focus();
        } else if (!$("#POSITION").val().length > 0) {
            $("#POSITION-tip").fadeIn('slow');
            setTimeout(function () {
                $("#POSITION-tip").fadeOut('slow');
            }, 1000)
            $("#POSITION").focus();
        } else if ((!$("#PHONE").val().length > 0) || (!myPhone.test($("#PHONE").val()))) {
            $("#phone-tip").fadeIn('slow');
            setTimeout(function () {
                $("#phone-tip").fadeOut('slow');
            }, 1500)
            $("#PHONE").focus();
        }
        /*else if (!$("#ADDRESS").val().length > 0) {
                        alert('请输入联系地址！');
                        $("#ADDRESS").focus();
                    }*/
        else {
            var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/; //邮箱格式
            // var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;       //手机号码

            if (!filter.test($("#EMAIL").val())) {
                $("#email-tip").fadeIn('slow');
                setTimeout(function () {
                    $("#email-tip").fadeOut('slow');
                }, 1500)
                $("#EMAIL").focus();
            }
            // else if (!$("#REMARK").val().length > 0) {
            // $("#REMARK-tip").fadeIn('slow');
            //     setTimeout(function(){
            //         $("#REMARK-tip").fadeOut('slow');
            //     },1000)
            // $("#REMARK").focus();
            // } //2019-1-15默认选择搜索引擎字段并保留客户来源字符串
            else {
                $(".make-layer").fadeIn('slow');
                $.ajax({
                    type: "POST",
                    dataType: 'JSONP',
                    jsonpCallback: 'CallBack',
                    url: 'https://app.360scm.com/SCM.Cloud.TenantManage/TenantApply/InsertTenantApply',
                    //url: 'http://223.255.14.186:9999/SCM.Cloud.TenantManage-IronMan/TenantApply/InsertTenantApply',
                    data: $("#TenantApplyForm").serialize() + '&visit=' + visit,

                    success: function (data) {
                        if (data.Flag) {
                            result = data.message;
                            console.log(result);
                            // localStorage.setItem('userValue', $("#FULL_NAME").val());
                            setTimeout(function () {
                                $("#FULL_NAME").val('')
                                $("#COMPANY").val('')
                                $("#POSITION").val('')
                                $("#PHONE").val('')
                                $("#EMAIL").val('')
                                window.location.href = "#" + $("#FULL_NAME").val() + "预约成功";
                            }, 2500);
                            console.log('成功');
                            $(".make-layer .tishi").hide();
                            $(".make-layer .win").show();
                            setTimeout(function () {
                                $(".make-layer").fadeOut('slow', function () {
                                    $(".make-layer .tishi").show();
                                    $(".make-layer .win").hide();
                                });
                            }, 2000)

                        } else {
                            // debugger;
                            console.log('申请提交失败');
                            $("#demo .make-layer").hide();
                            alert("预约失败，请稍后重试");
                            // $('#WarningMsg').html('申请提交失败。' + data.Msg);
                        }
                    },
                    error: function (a, b, c) {
                        console.log(a, b, c);
                    }
                });
            }
        }
    })


    //supply页面Power SCM Cloud的观看视频按钮
    $('#supply #playVideobtn').on('click', function () {
        $("#myVideoBox").modal('show');
        $("#videoR1").attr('src', "https://video.360scm.com/c106f76ca07042ad99d7903c2b6ef2b1/a1d14ded62bf4669a79bf8198927c404-8555df4e854f5745a0dc0d606b18c69f-ld.mp4")[0].play();
    });



    //video页面及首页客户实例的视频播放按钮
    $('.fa-play-circle-o').on('click', playVideo);


    // 着陆页下载白皮书按钮-20200408-joyce说网站视频和资料查看去掉注册逻辑
    // $('.download-btn').on('click', download);

    //user2017页面的视频播放遮罩按钮
    $('#user2017 .iframe-mask').on('click', showMakeBox);

    //video页面与user2017页面模态框注册按钮
    $('#regbtn').on('click', SaveApply);

    //着陆页白皮书下载按钮
    $('#book-regbtn').on('click', SaveBookApply);


    // 视频暂停--控制所有弹出框正播放的视频
    $("#video-close").on('click', function () {
        $("#videoR1")[0].pause();
        $("#myVideoBox").modal('hide');
    });

    // 解决方案--加减图标切换
    $("#solve .bt-title a span").on('click', function () {
        $(this).toggleClass('glyphicon-minus');
    });

    //首页科箭一体化云平台
    $("#home .box-iocn").on('mouseover', function () {
        $(".box-iocn .ceng").css("background", "#fff");
    });
    $("#home .box-iocn").on('mouseout', function () {
        $(".box-iocn .ceng").css("background", "transparent");
    });

    //首页可灵活配置的SaaS产品
    $("#home .features ul li").on('mouseover', function () {
        $(".features .ceng").css("background", "#e8e5e5");
        $("#box2-img").attr('src', "/templates/KeJian/img/home/" + this.id + ".png");
    });
    $("#home .features").on('mouseout', function () {
        $(".features .ceng").css("background", "transparent");
        $("#box2-img").attr('src', "/templates/KeJian/img/home/" + "saas-one" + ".png");
    });

    /*云套件页面滚动监听动画*/
    var arr = [".supply-item-1", true, ".supply-item-2", true, ".supply-item-3", true, ".supply-item-4", true, ".supply-item-5", true, ".supply-item-6", true];
    $(document).scroll(function () {
        var viewHeight = document.body.clientHeight;
        for (var i = 0; i <= arr.length; i += 2) {

            var scrollTop = $(this).scrollTop();
            var divTop = $(arr[i]).offset() ? $(arr[i]).offset().top : '0';
            var divHeight = $(arr[i]).height();
            //console.log(divHeight);

            if (arr[i + 1] && (scrollTop >= divTop - 340)) {
                $(arr[i] + " div").each(
                    function () {
                        if ($(this).hasClass("move-box")) {
                            $(this).addClass("move-box-in");
                        }
                    }
                );
                arr[i + 1] = false;
                //console.log(i+1)
            }
        }
    });


    /*智能商业数据分析页面滚动监听动画*/
    var arrBI = [".BI-item-1", true, ".BI-item-2", true, ".BI-item-3", true, ".BI-item-4", true, ".BI-item-5", true];
    $(document).scroll(function () {
        var viewHeight = document.body.clientHeight;
        for (var i = 0; i <= arrBI.length; i += 2) {
            var scrollTop = $(this).scrollTop();
            var divTop = $(arrBI[i]).offset() ? $(arrBI[i]).offset().top : '0';
            var divHeight = $(arrBI[i]).height();

            if (arrBI[i + 1] && (scrollTop >= divTop - 300)) {
                $(arrBI[i] + " div").each(
                    function () {
                        if ($(this).hasClass("move-box")) {
                            $(this).addClass("move-box-in");
                        }
                    }
                );
                arrBI[i + 1] = false;
                //console.log(i+1);
            }
        }
    });

    // 首页banner及客户实例轮播图-此处的自动轮播主要是区分产品页logo展示区不自动轮播而写
    setTimeout(function () {
        var mySwiper = new Swiper('#home .swiper-container', {
            loop: true,
            paginationClickable: true, //点击分页器切换
            autoplay: 5000,
            autoplayDisableOnInteraction: false,

            // 如果需要分页器
            pagination: '.swiper-pagination',
        })
    }, 1000);

    // 20200420增加AIbanner轮播
    setTimeout(function () {
        var AISwiper = new Swiper('#AI .swiper-container', {
            loop: true,
            paginationClickable: true, //点击分页器切换
            autoplay: 5000,
            autoplayDisableOnInteraction: false,

            // 如果需要分页器
            pagination: '.swiper-pagination',
        })
    }, 1000);

    // 2018用户大会视频轮播图-此处的自动轮播主要是区分产品页logo展示区不自动轮播而写
    setTimeout(function () {
        var mySwiper = new Swiper('#user-video .swiper-container', {
            loop: true,
            paginationClickable: true, //点击分页器切换
            autoplay: 5000,
            autoplayDisableOnInteraction: false,

            // 如果需要分页器
            pagination: '.swiper-pagination',
        })
    }, 1000);
    // 荣誉资质轮播图-此处的自动轮播主要是区分产品页logo展示区不自动轮播而写
    setTimeout(function () {
        var mySwiper = new Swiper('#company .swiper-container', {
            loop: true,
            paginationClickable: true, //点击分页器切换
            autoplay: 5000,
            autoplayDisableOnInteraction: false,

            // 如果需要分页器
            pagination: '.swiper-pagination',
        })
    }, 1000);
    // 产品页box轮播图-此处的自动轮播主要是区分产品页logo展示区不自动轮播而写
    setTimeout(function () {
        var mySwiper = new Swiper('.product-slide .swiper-container', {
            loop: true,
            paginationClickable: true, //点击分页器切换
            autoplay: 5000,
            autoplayDisableOnInteraction: false,

            // 如果需要分页器
            pagination: '.swiper-pagination',
        })
    }, 1000);
    // 供应链云套件及预约管理轮播图-此处的自动轮播主要是区分产品页logo展示区不自动轮播而写
    setTimeout(function () {
        var mySwiper = new Swiper('.box-slide .swiper-container', {
            loop: true,
            autoplayStopOnLast: false,
            paginationClickable: true, //点击分页器切换
            autoplay: 5000,
            autoplayDisableOnInteraction: false,

            // 如果需要分页器
            pagination: '.swiper-pagination',
        })
    }, 1000);
}

bindEvents()


//获取客户IP -- 最终实现由后台来获取
// function getUserIP(onNewIP) { //  onNewIp - your listener function for new IPs
//     //compatibility for firefox and chrome
//     var myPeerConnection = window.RTCPeerConnection || window.mozRTCPeerConnection || window.webkitRTCPeerConnection;
//     var pc = new myPeerConnection({
//         iceServers: []
//     }),
//         noop = function () { },
//         localIPs = {},
//         ipRegex = /([0-9]{1,3}(\.[0-9]{1,3}){3}|[a-f0-9]{1,4}(:[a-f0-9]{1,4}){7})/g,
//         key;

//     function iterateIP(ip) {
//         if (!localIPs[ip]) onNewIP(ip);
//         localIPs[ip] = true;
//     }

//     //create a bogus data channel
//     pc.createDataChannel("");

//     // create offer and set local description
//     pc.createOffer().then(function (sdp) {
//         sdp.sdp.split('\n').forEach(function (line) {
//             if (line.indexOf('candidate') < 0) return;
//             line.match(ipRegex).forEach(iterateIP);
//         });

//         pc.setLocalDescription(sdp, noop, noop);
//     }).catch(function (reason) {
//         // An error occurred, so handle the failure to connect
//     });

//     //sten for candidate events
//     pc.onicecandidate = function (ice) {
//         if (!ice || !ice.candidate || !ice.candidate.candidate || !ice.candidate.candidate.match(ipRegex)) return;
//         ice.candidate.candidate.match(ipRegex).forEach(iterateIP);
//     };
// }

// // Usage

// getUserIP(function (ip) {
//     // console.log("IP为: " + ip);
// });




function playVideo() {  //20200407joyce说ben要求全部放开视频白皮书等注册逻辑
    //var userKey = localStorage.getItem('userMark');
    //if (userKey != '1') {
    //    $('#RegMakeBox').modal('show');
    //    $('#RegFrom').val(this.title);
    // let userId = $(this).data('user-id')
    // if (!userId) {
    //     alert("您还没有登录，请登录后再查看");
    //     $(window).attr('location','/user/login');
    // $('#RegMakeBox').modal('show');
    // $('#RegFrom').val(this.title);
    //} else
    {
        $('#myVideoBox').modal('show');
        this.url = $(this).data('url')
        if (this.url) {
            $('#myVideoBox').modal('show');
            $("#videoR1").attr('src', this.url)[0].play();
            return
        }

        if (this.id == "publicity") { //科箭Power TMS Cloud
            this.url = 'https://video.360scm.com/12ad0597e27543a1bab4aefac4df9d74/e3f79d52f9294710afa5dbddc64aca36-50703bfca7878a20edd7cdcb9f41a414-ld';
        }
        if (this.id == "yiyao") { //杭州医药冷链峰会-科箭副总许效军访谈
            this.url = 'https://video.360scm.com/f3754157952b444abc822554c5f5e287/838965a8cd944f7e9709a1e309f5fc7a-0cc571f7bbb4c8bdc05fdb95231be867-ld';
        }
        if (this.id == "yanfeng") { //延锋江森
            this.url = 'https://video.360scm.com/21ce8f72d7f34e9cb73deac5fb8b9b59/c6370ecfc2454d469f5b387de0e7708d-231974a1f9e49544ba9c277ec5569132-ld';
        }
        if (this.id == "kaola") { //网易考拉
            this.url = 'https://video.360scm.com/671d4f4ff92d4d86a5de9a4d78c31592/c9db93df71fe4960a0b703e194d9ec1c-2cc6aa085bb5b4627f68f3ba4367886a-ld';
        }
        if (this.id == "chongqing") { //科箭TMS云-重庆物流信息平台
            this.url = 'https://video.360scm.com/ea3fe3aaaef44102a0497d0acb6fe1b6/932b23bb89374156932e4b3eeead0d0a-24d8b36ffae570a3cee520c7aebcee24-ld';
        }
        if (this.id == "weiruan") { //科箭TMS云-携手微软Azure云平台
            this.url = 'https://video.360scm.com/df119a861a744c319562c33eef1cdcad/e136923c2ae54fc0a07d6f242072b539-d9a6f12a423cbd8f736f94162e33af68-ld';
        }
        if (this.id == "noll") { //诺尔
            this.url = 'https://video.360scm.com/63078cf80c7b48ccab1ec1078697b41e/e4142b8c589b49f292c87cc63d9bd66d-7019390218523b5e45a1adf3b977f4a7-ld';
        }
        if (this.id == "yy-jason") { //2017医药供应链论坛科箭副总许效军演讲
            this.url = 'https://video.360scm.com/4bef3405487d4c9296532b2cbf8f7927/173f50b052de49128e02e917b729dd6f-9ba59aa7c10b6e94f60ef0215ecafe89-ld';
        }
        if (this.id == "SCMCloud") { //科箭Power SCM Cloud
            this.url = 'https://video.360scm.com/c106f76ca07042ad99d7903c2b6ef2b1/a1d14ded62bf4669a79bf8198927c404-8555df4e854f5745a0dc0d606b18c69f-ld';
        }
        if (this.id == "hayao") { //哈药
            this.url = 'https://video.360scm.com/3a971a6816d24afd982b1dbb6677e130/48f46328e043489699516de28d6036ea-6a221d68a56156441fc643a7fc444aa2-ld';
        }
        if (this.id == "stec") { //上实
            this.url = 'https://video.360scm.com/7ab44e82b483479f9e071a247d84fc4e/c2593e31a03a459f9e400f8889163164-69ee864bd6763dcb106616ec6227b187-ld';
        }
        if (this.id == "yiyaolenglian") { //医药冷链展会金总采访
            this.url = 'https://video.360scm.com/340157713b1b4af1bc36a5a9da302bf9/da33189246f042029d5405b1a0fc8ce5-f963c65205b854d5eaaba0579e8acc88-ld';
        }
        if (this.id == "Saint-Gobain") { //科箭+圣戈班final
            this.url = 'https://video.360scm.com/c63efb708e5f482da71333f4bc08e2ad/1479a4a435a34038af0a1f1bef9c5007-7190ce877c03df821b544e2b810e56f8-ld';
        }
        if (this.id == "kevin-1904") { //Kevin用友直播视频-19年4月
            this.url = 'https://video.360scm.com/911a492368bb4900849122ba42611cc9/0ed9553a5c6a474abb3949ea04e4daf3-7d651aef18ddce6d6f488af843acd4c2-ld';
        }
        if (this.id == "Joyce-1904") { //第四届医药供应链峰会-科箭市场营销副总朱庆华采访-19年4月
            this.url = 'https://video.360scm.com/402561540f6142e5a561e3030aaacfad/5bbe5431a1cf43cc95b3285981bf1d53-f609418b16f4b11fd9be0c2222e78c5d-ld';
        }
        if (this.id == "2018video1") { //2018用户大会视频-ben主题演讲
            this.url = 'https://video.360scm.com/ba867eafa5d3431daa8a17b7752f2452/f6250db0aa024ad7baea3b930a379f8f-73d769ef435dae021f24b0125e1c70a9-ld';
        }
        if (this.id == "2018video2") { //2018用户大会视频-阿里云演讲
            this.url = 'https://video.360scm.com/d3f1c52a914349a8a10b229eb07a8c77/7f99297a7f86481bb84bb559f2dc62d2-ddb3330cfe286bce9a4c189fa9157fae-ld';
        }
        if (this.id == "2018video3") { //2018用户大会视频3-毕马威演讲
            this.url = 'https://video.360scm.com/d2b2c254d15f4e20bd5c484a1f3b24d5/b597bf69351b486aa697ff9b44db0d9c-1c1a1daaf93818f20cb9fccf9c291c9b-ld';
        }
        if (this.id == "2018video4") { //2018用户大会视频4-圆桌讨论
            this.url = 'https://video.360scm.com/d2b732513c504f8bb22c9541a5b10006/d1ebe8e515c64a52a21f3d8c2c06943e-f22a397f4a48a9fcb3830a9c2d1644e0-ld';
        }
        if (this.id == "2018video5") { //2018用户大会视频4-麦德龙演讲
            this.url = 'https://video.360scm.com/2cbc7bc6c2ea499b97832bb7feee94d0/b4ea0d61a54c4db68090df7dd5be5c3b-ff252eba7d93b77ffab2b8c8f91ae93d-ld';
        }
        if (this.id == "2018HiddenVideo") { //2018用户大会视频4-麦德龙演讲
            this.url = 'https://video.360scm.com/7b9bd05603ab4bae912bae05aa6a0c6e/df8baf03076b4e4e8dc8ab53cfc1185c-19cdf9f3f46be99e60d54f567a7e7794-ld';
        }
        if (this.id == "metro-flow") { //2019麦德龙流程
            this.url = 'https://video.360scm.com/af3b62e207fc4af4876dcc1ea03714b0/cc992087c68443d4afdb91e5d9ba967d-88f6fadcfebfaec4000f3933435b00b6-ld';
        }
        if (this.id == "Rambo") { //2019合同物流峰会兰鹏演讲
            this.url = 'https://video.360scm.com/70f6c3e0927943e1a8f1f066df78c489/ac475f53d79143208e33cb2c8db88b20-1fa15f2ff3dabb3cd43f7d989578d044-ld';
        }
        if (this.id == "2019video1") { //2019用户大会-刘斌演讲
            this.url = 'https://video.360scm.com/6450c53ff6924432a234ce9b93040143/12d39e2b6b2848eb9557bfca7f435dfa-e39ae25099f957591c57c13bd9d2bb59-ld';
        }
        if (this.id == "2019video2") { //2019用户大会-王勇演讲
            this.url = 'https://video.360scm.com/32d1081da0cd4e6b887f8e0123799c2d/a8e4b74560a844858fd22f79c0594712-e121da5a09330a5d9b5910ac3b80e1e2-ld';
        }
        if (this.id == "2019video3") { //2019用户大会-银杏谷演讲
            this.url = 'https://video.360scm.com/4f5aec7c061d448ebded11ba292d087c/1079d6d4f90e4cd38a4b26962945dec2-681e0ac6f8acca8b66fc3e903a1eb5da-ld';
        }
        if (this.id == "2019video4") { //2019用户大会-德勤演讲
            this.url = 'https://video.360scm.com/dfb02f62ad3444bca0f1d8b6a6ab0e50/4e69b7bdb7ed4d1fa854ee8df18e87e5-f806f5b64f0ed84fa1fe918f429cd278-ld';
        }
        if (this.id == "2019video5") { //2019用户大会-阿里演讲
            this.url = 'https://video.360scm.com/cc7f373a6a354a05a42648b24e962643/4772affccc804064960ec88491d8babc-b6255ce07e6c7ceb473f48ca1b30fee1-ld';
        }
        if (this.id == "2019video6") { //2019用户大会-万纬演讲
            this.url = 'https://video.360scm.com/f047ef74618b44fdbfa9959f4cdb9b7d/14aec996d02045acb9f39d2d62feb7a0-2c657436b06eba3ff91b32c7d1092b28-ld';
        }
        if (this.id == "2019video7") { //2019用户大会-斑马演讲
            this.url = 'https://video.360scm.com/d77f2b3c3a1b40d0a2ca0feabef84fb5/c338d400a9f14b8cbaf842ebd1e6d9b3-45b03d68b59601c975150f339c96b83a-ld';
        }
        if (this.id == "2019video8") { //2019用户大会-安道拓演讲
            this.url = 'https://video.360scm.com/c70f700ea3f84d0ea3061bc670c1ddc3/3a94873646c342ce9d6be4c47983b073-bd0b574176cb32123102da935d48346d-ld';
        }
        if (this.id == "2019video9") { //2019用户大会-谢勇强演讲
            this.url = 'https://video.360scm.com/5672dfd86bfe4e16884043111fd6e659/7fd240f2da904d979006a86ca136cc16-118cd0f126b3864c7bc4942e6fadb2de-ld';
        }
        if (this.id == "2019video10") { //2019用户大会-百特麦演讲
            this.url = 'https://video.360scm.com/00fe838db2434df6be693b737123f786/78f0e84c4e354db58d79f72e2c9e0e32-3bea7e8778271cf4b76d51f6e8535309-ld';
        }
        if (this.id == "鱼跃-user2019") { //2019用户大会客户采访-鱼跃
            this.url = 'https://video.360scm.com/bcba3961757b49d59d4870e3e29d55ab/c63ea5ff26fc4777afd70045efb8ee61-439964c711fb866f97ece537203604d4-ld';
        }
        if (this.id == "东松-user2019") { //2019用户大会客户采访-东松
            this.url = 'https://video.360scm.com/5237905e62f944149634ed75dde7ddb6/f7d1a46bcbae45bc941bc4af4d48ad8a-c6170d08be0d8dad67125d665c3a9961-ld';
        }
        if (this.id == "德利得-user2019") { //2019用户大会客户采访-德利得
            this.url = 'https://video.360scm.com/fddab612c6f3439cab8d7b6c44d1908f/bbbe0fcded704ab9b133ebf33dc646b1-d6132c69656acd2a83fbc977951f9afe-ld';
        }
        if (this.id == "全盛-user2019") { //2019用户大会客户采访-全盛
            this.url = 'https://video.360scm.com/a3fb59cebb3f4f78b00ddf1d98100ec0/26c131f9223a4397bbe3af1f6909b0e6-b7f0991fafab0496fb0c041b7c9e8a41-ld';
        }
        if (this.id == "贝业-user2019") { //2019用户大会客户采访-贝业
            this.url = 'https://video.360scm.com/7a53b8356e394106ab4dfa290e91b4e1/34258d72c97c461a93fb858d8e69e3b6-95994faab019c6a869aab02f62c8979e-ld';
        }
        if (this.id == "安宜达-user2019") { //2019用户大会客户采访-安宜达
            this.url = 'https://video.360scm.com/a96a96bfa33a4cbe88ecb57036c4f756/c12c1170dfed4ed5865a34dbf47a4767-a3ebd9357d6dd82733be05c5e32d11a6-ld';
        }
        if (this.id == "20200228") { //2020数链沙龙第一期
            this.url = 'https://video.360scm.com/ae6e5df3a8444a158c22fefd24b9fdad/77a7f6caa452477da5014b3bf1310868-8ed79854b8f051cf08dfd8cd0ef84fd0-ld';
        }
        if (this.id == "20200305") { //2020数链沙龙第二期
            this.url = 'https://video.360scm.com/9dbd4c8e19494b99930e39f3a07b6d99/2b723b874e7d4058a451cc683c7c5ad7-313ae2fda36a6d4a7227b4c0555a3fb0-ld';
        }
        if (this.id == "20200319") { //2020数链沙龙第三期
            this.url = 'https://video.360scm.com/d48bc52cbd6c4b1cb2699de254431f8e/81a7ec3fbc9646498ed8a345af664938-bcf8265d4a9f35ce318985204bb782f3-ld';
        }
        if (this.id == "20200410") { //2020数链沙龙第四期
            this.url = 'https://video.360scm.com/fc94247028b446869931b04ef6fefd04/246b1afaa40847babc228a89e811aa34-499d53befea5eebf617c9a9ecb0259cb-ld';
        }
        if (this.id == "20200515") { //2020数链沙龙第五期
            this.url = 'https://video.360scm.com/f01a1e35aa5841128b156898c3d7fc22/3f0e75b1cf454aea95fbe2309007f422-aba48e15afa9569ef7337639201e05c5-ld';
        }
        if (this.id == "20200619") { //2020数链沙龙第六期
            this.url = 'https://video.360scm.com/40f029894c0c4c099ea727fde9ed2e4f/2fa0ef0053e5424ea882524448a199b2-c15697a2752c60d2383ee4fde3a0e62c-ld';
        }
        if (this.id == "20200701") { //2020全球消费品零售供应链年会-兰鹏演讲
            this.url = 'https://video.360scm.com/774370a96a5e4a13a852b0d88a9b6be8/95346ef443c84fd2996c03b5dacf074e-e3aa95edbf0cfc213611f1b66b3ed75c-ld';
        }
        if (this.id == "20200810") { //科箭产品及客户案例介绍
            this.url = 'https://video.360scm.com/d5163b42617845ada1158d8573403f50/ecee3e749b3249ff95d0d10a213016a0-49847c76e19b1d24ae6e0387529c5b53-ld';
        }
        if (this.id == "20200826") { //2020VCI供应链转型峰会任捷演讲
            this.url = 'https://video.360scm.com/f377b11506d54140a22076e8a0bc9b1a/9dfc5bd551a94cde98109f3dfe741e4b-dd70b6e62802e89305356bd35122f905-ld';
        }
        if (this.id == "达能-WMS云") { //首页：达能-WMS云
            this.url = 'https://video.360scm.com/fcf5611716e74f37b3a063d678b4be6a/16abaa17c98e4d0d902c7afccbf84808-d3f1b292eb68e7736ef17efe4fd680c0-ld';
        }
        if (this.id == "中科云谷-WMS云") { //首页：中科云谷-WMS云
            this.url = 'https://video.360scm.com/0396ed44292a4c988de6dc8905b83286/1c90def5b373411087ebe9bb265cc24e-8ce3f2d2f04e4a97cf48edeeb7eacba9-ld';
        }
        $("#videoR1").attr('src', this.url + ".mp4")[0].play();
    }
}

function download() {
    var userMark = localStorage.getItem('userMark');
    //如果没有注册就展示表单
    //console.log(event);
    if (userMark != '1') {
        alert("您还没有注册，请注册后再下载白皮书");
        $(location).attr('href', '#');
        $("#UserName").focus();
        // $('#RegFrom').val('白皮书注册');
    } else {
        // 此处写下载方法
        $(location).attr('href', 'share.asp');
        // setTimeout(function () {
        //     $('#share img').trigger('click')
        // },2000);
    }
}

function showMakeBox() { //用户大会视频
    $('.iframe-mask').css({
        "display": "none"
    });
    console.info($(this));
    if (!userId) {
        alert("您还没有登录，请登录后再查看");
        // $(window).attr('location','/user/login');
    }
    //
    //
    // var userKey = localStorage.getItem('userMark');
    // $('.iframe-mask').css({
    //     "display": "none"
    // });
    // //如果没有注册就展示表单
    // if (userKey != '1') {
    //     $('#RegMakeBox').modal('show');
    //     $('.iframe-mask').css({
    //         "display": "block"
    //     });
    // }
}


//2017用户大会图片 循环展示15张图片
var tem = "";
for (var i = 0; i <= 14; i++) {
    tem += "<li class='col-xs-12 col-sm-6 col-md-4' data-toggle='modal' data-target='#userImgBox'><img src='/templates/KeJian/img/resources/" + i + ".jpg' class='img-responsive' alt='2017科箭用户大会照片' style='cursor:pointer'></li>";
}
$("#userImg").append(tem);

//点击图片模态框里显示对应大图片
$(document).on('click', '#userImg li', function () {
    var index = $(this).index();
    $("#userImgBox img").attr('src', '/templates/KeJian/img/resources/' + index + '.jpg');
});

//点击关闭按钮隐藏模态框
$(".close").click(function () {
    $("#userImgBox").modal('hide');
});


//2019用户大会图片 循环展示15张图片
var tem = "";
for (var i = 0; i <= 14; i++) {
    tem += "<li class='col-xs-12 col-sm-6 col-md-4' data-toggle='modal' data-target='#userImgBox2019'><img src='/templates/KeJian/img/resources/2019-" + i + ".jpg' class='img-responsive' alt='2019科箭用户大会照片' style='cursor:pointer'></li>";
}
$("#userImg2019").append(tem);

//点击图片模态框里显示对应大图片
$(document).on('click', '#userImg2019 li', function () {
    var index = $(this).index();
    $("#userImgBox2019 img").attr('src', '/templates/KeJian/img/resources/2019-' + index + '.jpg');
});

//点击关闭按钮隐藏模态框
$(".close2019").click(function () {
    $("#userImgBox2019").modal('hide');
});

//2020用户大会图片 循环展示21张图片
var tem = "";
for (var i = 0; i <= 20; i++) {
    tem += "<li class='col-xs-12 col-sm-6 col-md-4' data-toggle='modal' data-target='#userImgBox2020'><img src='/templates/KeJian/img/UserConferences/2020/2020-" + i + ".jpg' class='img-responsive' alt='2020科箭用户大会照片' style='cursor:pointer'></li>";
}
$("#userImg2020").append(tem);

//点击图片模态框里显示对应大图片
$(document).on('click', '#userImg2020 li', function() {
    var index = $(this).index();
    $("#userImgBox2020 img").attr('src', '/templates/KeJian/img/UserConferences/2020/2020-' + index + '.jpg');
});

//点击关闭按钮隐藏模态框
$(".close2020").click(function() {
    $("#userImgBox2020").modal('hide');
});


//视频观看注册信息
function SaveApply() {
    //var visit = $('input:radio[name="VISIT_TYPE"]:checked').val();
    var myPhone = /^(((13[0-9]{1})|(14[0-9]{1})|(15[0-9]{1})|(16[0-9]{1})|(17[0-9]{1})|(18[0-9]{1})|(19[0-9]{1}))+\d{8})$/; //手机号码验证

    //判断内容是否已输入
    if (!$("#UserName").val().length > 0) {
        $("#name-tip").fadeIn('slow');
        setTimeout(function () {
            $("#name-tip").fadeOut('slow');
        }, 1000)
        $("#UserName").focus();
    } else if (!$("#Company").val().length > 0) {
        $("#company-tip").fadeIn('slow');
        setTimeout(function () {
            $("#company-tip").fadeOut('slow');
        }, 1000)
        $("#Company").focus();
    } else if (!$("#Position").val().length > 0) {
        $("#position-tip").fadeIn('slow');
        setTimeout(function () {
            $("#position-tip").fadeOut('slow');
        }, 1000)
        $("#Position").focus();
    } else if ((!$("#Phone").val().length > 0) || (!myPhone.test($("#Phone").val()))) {
        $("#phone-tip").fadeIn('slow');
        setTimeout(function () {
            $("#phone-tip").fadeOut('slow');
        }, 1500)
        $("#Phone").focus();
    }
    /*else if (!$("#ADDRESS").val().length > 0) {
            alert('请输入联系地址！');
            $("#ADDRESS").focus();
        }*/
    else {

        var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/; //邮箱格式
        if (!filter.test($("#Email").val())) {
            $("#email-tip").fadeIn('slow');
            setTimeout(function () {
                $("#email-tip").fadeOut('slow');
            }, 1500)
            $("#Email").focus();
        } else {
            $.ajax({
                type: "POST",
                dataType: 'JSONP',
                jsonpCallback: 'CallBack',
                url: 'http://app.360scm.com/SCM.Cloud.TenantManage/TenantApply/InsertTenantApply',
                //url: 'http://223.255.14.186:9999/SCM.Cloud.TenantManage-IronMan/TenantApply/InsertTenantApply',
                data: $("#TenantApplyForm").serialize(),
                success: function (data) {
                    console.log("提交成功");
                    //alert('注册成功');
                    localStorage.setItem('userMark', 1);
                    $('#RegMakeBox').modal('hide');
                    $("#success-layer").fadeIn('slow');
                    setTimeout(function () {
                        $("#success-layer").fadeOut('slow');
                    }, 5000)

                    // if (data.Flag) {
                    //     result = data.message;
                    //     console.log(result);
                    //     $("#demo .tishi").hide();
                    //     $("#demo .win").show();
                    //     setTimeout(function () {
                    //         $("#demo .make-layer").fadeOut('slow', function () {
                    //             $("#demo .tishi").show();
                    //             $("#demo .win").hide();
                    //         });
                    //     }, 2000)
                    //
                    // } else {
                    //     // debugger;
                    //     console.log('申请提交失败');
                    //     $("#demo .make-layer").hide();
                    //     alert("预约失败，请稍后重试");
                    //     // $('#WarningMsg').html('申请提交失败。' + data.Msg);
                    // }
                },
                error: function (a, b, c) {
                    console.log(a, b, c);
                }
            });

            // $.ajax({
            //     type: "POST", //提交的方法
            //     url: "/SaveVedioUserInfo.asp", //提交的地址
            //     data: $('#TenantApplyForm').serialize(), // 序列化表单值
            //     async: false,
            //     error: function (request) { //失败的话
            //         //alert("注册失败");
            //         alert("服务器异常！");
            //     },
            //     success: function (response, status, xhr) { //成功
            //         console.log("提交成功");
            //         //alert('注册成功');
            //         localStorage.setItem('userMark', 1);
            //         $('#RegMakeBox').modal('hide');
            //         $("#success-layer").fadeIn('slow');
            //         setTimeout(function () {
            //             $("#success-layer").fadeOut('slow');
            //         }, 5000)
            //     }
            // });
        }
    }
}
// 白皮书下载用户注册
function SaveBookApply() {
    //var visit = $('input:radio[name="VISIT_TYPE"]:checked').val();
    var myPhone = /^(((13[0-9]{1})|(14[0-9]{1})|(15[0-9]{1})|(16[0-9]{1})|(17[0-9]{1})|(18[0-9]{1})|(19[0-9]{1}))+\d{8})$/; //手机号码验证

    //判断内容是否已输入
    if (!$("#UserName").val().length > 0) {
        $("#name-tip").fadeIn('slow');
        setTimeout(function () {
            $("#name-tip").fadeOut('slow');
        }, 1000)
        $("#UserName").focus();
    } else if ((!$("#Phone").val().length > 0) || (!myPhone.test($("#Phone").val()))) {
        $("#phone-tip").fadeIn('slow');
        setTimeout(function () {
            $("#phone-tip").fadeOut('slow');
        }, 1500)
        $("#Phone").focus();
    } else {
        var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/; //邮箱格式

        if (!filter.test($("#Email").val())) {
            $("#email-tip").fadeIn('slow');
            setTimeout(function () {
                $("#email-tip").fadeOut('slow');
            }, 1000)
            $("#Email").focus();
        } else if (!$("#Company").val().length > 0) {
            $("#company-tip").fadeIn('slow');
            setTimeout(function () {
                $("#company-tip").fadeOut('slow');
            }, 1000)
            $("#Company").focus();
        } else {
            $.ajax({
                type: "POST",
                dataType: 'JSONP',
                jsonpCallback: 'CallBack',
                url: 'http://app.360scm.com/SCM.Cloud.TenantManage/TenantApply/InsertTenantApply',
                //url: 'http://223.255.14.186:9999/SCM.Cloud.TenantManage-IronMan/TenantApply/InsertTenantApply',
                data: $("#TenantApplyForm").serialize(),
                success: function (data) {
                    console.log("提交成功");
                    //alert('注册成功');
                    localStorage.setItem('userMark', 1);
                    $('#RegMakeBox').modal('hide');
                    $("#success-layer").fadeIn('slow');
                    setTimeout(function () {
                        $("#success-layer").fadeOut('slow');
                    }, 5000)

                    // if (data.Flag) {
                    //     result = data.message;
                    //     console.log(result);
                    //     $("#demo .tishi").hide();
                    //     $("#demo .win").show();
                    //     setTimeout(function () {
                    //         $("#demo .make-layer").fadeOut('slow', function () {
                    //             $("#demo .tishi").show();
                    //             $("#demo .win").hide();
                    //         });
                    //     }, 2000)
                    //
                    // } else {
                    //     // debugger;
                    //     console.log('申请提交失败');
                    //     $("#demo .make-layer").hide();
                    //     alert("预约失败，请稍后重试");
                    //     // $('#WarningMsg').html('申请提交失败。' + data.Msg);
                    // }
                },
                error: function (a, b, c) {
                    console.log(a, b, c);
                }
            });
            // $.ajax({
            //     type: "POST", //提交的方法
            //     url: "/SaveVedioUserInfo.asp", //提交的地址
            //     data: $('#TenantApplyForm').serialize(), // 序列化表单值
            //     async: false,
            //     error: function (request) { //失败的话
            //         //alert("注册失败");
            //         alert("服务器异常！");
            //     },
            //     success: function (response, status, xhr) { //成功
            //         console.log("提交成功");
            //         //alert('注册成功');
            //         localStorage.setItem('userMark', 1);
            //         $(location).attr('href', 'share.asp');
            //     }
            // });
        }
    }
}

$(document).ready(function () {
    // 版权截止年份自动获取
    setTimeout(function () {
        var date = new Date();
        var year = date.getFullYear();
        $("#Copyright").text("2003-" + year)
    }, 100)


    //导航栏点击一下折叠起来
    $(".navbar-nav .may").click(function () {
        $("#navbar").collapse('hide');
    });

    // 判断不同设备，控制导航栏触发类型
    if (navigator.userAgent.search(/android|ipad|iphone|blackberry|symbianos|windows phone|ucweb|bb10/i) !== -1) return;
    var s = $(".solution");
    s.hover(function () {
        // debugger;
        $(this).addClass("open").find("a[data-toggle*='dropdown']").attr("aria-expanded", "true");
    }, function () {
        $(this).removeClass("open").find("a[data-toggle*='dropdown']").attr("aria-expanded", "false");
    });

    // 导航条顶部距离
    $("#myNav").affix({
        offset: {
            top: 80
        }
    });


    //定义何时触发折叠
    $(".navbar-nav .dropdown-menu .may").click(function () {
        $("#bs-example-navbar-collapse-1").collapse('hide');
    }); //小屏下二级菜单点击后折叠整个菜单

    $(".navbar-nav li").not(".solution").click(function () {
        $("#bs-example-navbar-collapse-1").collapse('hide');
    }); //小屏下没有二级菜单点击后折叠整个菜单

    //波浪效果
    function a() {
        var a = $(window).width(),
            b = (768 - a) / 768 + 1,
            c = 1;
        fmhPara = $(".feature-mi").height() < 641 || $(".feature-ai").height() < 641 || $(".feature-bi").height() < 641 ? 0 : 1, 768 > a ? ($(".mi-headline-bg").css("height", $(".feature-mi").height() + 28 * b * c + "px"), $(".ai-headline-bg").css("height", $(".feature-ai").height() + 28 * b * c + "px"), $(".bi-headline-bg").css("height", $(".feature-bi").height() + 28 * b * c + "px"), $(".ee-headline-bg").css("height", $(".feature-ee").height() + parseInt($(".feature-ee").css("padding-top")) + 20 * b + "px")) : ($(".mi-headline-bg").removeAttr("style"), $(".ai-headline-bg").removeAttr("style"), $(".bi-headline-bg").removeAttr("style"), $(".ee-headline-bg").removeAttr("style"))
    }
    setTimeout(function () {
        a()
    }, 100), $(window).resize(function () {
        a()
    })
}),
    function (a, b) {
        "use strict";
        "function" == typeof define && "object" == typeof define.amd ? define([], function () {
            return b(a)
        }) : a.SineWaves = b(a)
    }(this, function () {
        "use strict";

        function a(a) {
            if (this.options = i.defaults(this.options, a), this.el = this.options.el, delete this.options.el, !this.el) return false; //throw "No Canvas Selected";鍒樻槑鎺掗敊娉ㄩ攢
            if (this.ctx = this.el.getContext("2d"), this.waves = this.options.waves, delete this.options.waves, !this.waves || !this.waves.length) throw "No waves specified";
            this.dpr = window.devicePixelRatio || 1, this.updateDimensions(), window.addEventListener("resize", this.updateDimensions.bind(this)), this.setupUserFunctions(), this.easeFn = i.getFn(n, this.options.ease, "linear"), this.rotation = i.degreesToRadians(this.options.rotate), i.isType(this.options.running, "boolean") && (this.running = this.options.running), this.setupWaveFns(), this.loop()
        }

        function b(a, b) {
            return i.isType(a, "number") ? a : (a = a.toString(), a.indexOf("%") > -1 ? (a = parseFloat(a), a > 1 && (a /= 100), b * a) : a.indexOf("px") > -1 ? parseInt(a, 10) : void 0)
        }
        Function.prototype.bind || (Function.prototype.bind = function (a) {
            if ("function" != typeof this) throw new TypeError("Function.prototype.bind - what is trying to be bound is not callable");
            var b = Array.prototype.slice.call(arguments, 1),
                c = this,
                d = function () {},
                e = function () {
                    return c.apply(this instanceof d && a ? this : a, b.concat(Array.prototype.slice.call(arguments)))
                };
            return d.prototype = this.prototype, e.prototype = new d, e
        });
        for (var c = ["ms", "moz", "webkit", "o"], d = 0; d < c.length && !window.requestAnimationFrame; ++d) window.requestAnimationFrame = window[c[d] + "RequestAnimationFrame"], window.cancelAnimationFrame = window[c[d] + "CancelAnimationFrame"] || window[c[d] + "CancelRequestAnimationFrame"];
        if (!window.requestAnimationFrame) {
            var e = 0;
            window.requestAnimationFrame = function (a) {
                var b = (new Date).getTime(),
                    c = Math.max(0, 16 - (b - e)),
                    d = window.setTimeout(function () {
                        a(b + c)
                    }, c);
                return e = b + c, d
            }
        }
        window.cancelAnimationFrame || (window.cancelAnimationFrame = function (a) {
            clearTimeout(a)
        });
        var f = Math.PI / 180,
            g = 2.6 * Math.PI,
            h = Math.PI / 2,
            i = {},
            j = i.isType = function (a, b) {
                var c = {}.toString.call(a).toLowerCase();
                return c === "[object " + b.toLowerCase() + "]"
            },
            k = i.isFunction = function (a) {
                return j(a, "function")
            },
            l = i.isString = function (a) {
                return j(a, "string")
            },
            m = (i.isNumber = function (a) {
                return j(a, "number")
            }, i.shallowClone = function (a) {
                var b = {};
                for (var c in a) a.hasOwnProperty(c) && (b[c] = a[c]);
                return b
            }),
            n = (i.defaults = function (a, b) {
                j(b, "object") || (b = {});
                var c = m(a);
                for (var d in b) b.hasOwnProperty(d) && (c[d] = b[d]);
                return c
            }, i.degreesToRadians = function (a) {
                if (!j(a, "number")) throw new TypeError("Degrees is not a number");
                return a * f
            }, i.getFn = function (a, b, c) {
                return k(b) ? b : l(b) && k(a[b.toLowerCase()]) ? a[b.toLowerCase()] : a[c]
            }, {});
        n.linear = function (a, b) {
            return b
        }, n.sinein = function (a, b) {
            return b * (Math.sin(a * Math.PI - h) + 1) * .5
        }, n.sineout = function (a, b) {
            return b * (Math.sin(a * Math.PI + h) + 1) * .5
        }, n.sineinout = function (a, b) {
            return b * (Math.sin(a * g - h) + 1) * .5
        };
        var o = {};
        o.sine = function (a) {
            return Math.sin(a)
        }, o.sin = o.sine, o.sign = function (a) {
            return a = +a, 0 === a || isNaN(a) ? a : a > 0 ? 1 : -1
        }, o.square = function (a) {
            return o.sign(Math.sin(a * g))
        }, o.sawtooth = function (a) {
            return 2 * (a - Math.floor(a + .5))
        }, o.triangle = function (a) {
            return Math.abs(o.sawtooth(a))
        }, a.prototype.options = {
            speed: 10,
            rotate: 0,
            ease: "Linear",
            wavesWidth: "95%"
        }, a.prototype.setupWaveFns = function () {
            for (var a = -1, b = this.waves.length; ++a < b;) this.waves[a].waveFn = i.getFn(o, this.waves[a].type, "sine")
        }, a.prototype.setupUserFunctions = function () {
            i.isFunction(this.options.resizeEvent) && (this.options.resizeEvent.call(this), window.addEventListener("resize", this.options.resizeEvent.bind(this))), i.isFunction(this.options.initialize) && this.options.initialize.call(this)
        };
        var p = {
            timeModifier: 1,
            amplitude: 50,
            wavelength: 50,
            segmentLength: 10,
            lineWidth: 1,
            strokeStyle: "rgba(255, 255, 255, 0.2)",
            type: "Sine"
        };
        return a.prototype.getDimension = function (a) {
            return i.isNumber(this.options[a]) ? this.options[a] : i.isFunction(this.options[a]) ? this.options[a].call(this, this.el) : "width" === a ? this.el.clientWidth : "height" === a ? this.el.clientHeight : void 0
        }, a.prototype.updateDimensions = function () {
            var a = this.getDimension("width"),
                c = this.getDimension("height");
            this.width = this.el.width = a * this.dpr, this.height = this.el.height = c * this.dpr, this.el.style.width = a + "px", this.el.style.height = c + "px", this.waveWidth = b(this.options.wavesWidth, this.width), this.waveLeft = (this.width - this.waveWidth) / 2, this.yAxis = this.height / 2
        }, a.prototype.clear = function () {
            this.ctx.clearRect(0, 0, this.width, this.height)
        }, a.prototype.time = 0, a.prototype.update = function (a) {
            this.time = this.time - .007, "undefined" == typeof a && (a = this.time);
            var b = -1,
                c = this.waves.length;
            for (this.clear(), this.ctx.save(), this.rotation > 0 && (this.ctx.translate(this.width / 2, this.height / 2), this.ctx.rotate(this.rotation), this.ctx.translate(-this.width / 2, -this.height / 2)); ++b < c;) {
                var d = this.waves[b].timeModifier || 1;
                this.drawWave(a * d, this.waves[b])
            }
            this.ctx.restore(), b = void 0, c = void 0
        }, a.prototype.getPoint = function (a, b, c) {
            var d = a * this.options.speed + (-this.yAxis + b) / c.wavelength,
                e = c.waveFn.call(this, d, o),
                f = this.easeFn.call(this, b / this.waveWidth, c.amplitude);
            return d = b + this.waveLeft, e = f * e + this.yAxis, {
                x: d,
                y: e
            }
        }, a.prototype.drawWave = function (a, b) {
            b = i.defaults(p, b), this.ctx.lineWidth = b.lineWidth * this.dpr, this.ctx.strokeStyle = b.strokeStyle, this.ctx.lineCap = "butt", this.ctx.lineJoin = "round", this.ctx.beginPath(), this.ctx.moveTo(0, this.yAxis), this.ctx.lineTo(this.waveLeft, this.yAxis);
            var c, d;
            for (c = 0; c < this.waveWidth; c += b.segmentLength) d = this.getPoint(a, c, b), this.ctx.lineTo(d.x, d.y), d = void 0;
            c = void 0, b = void 0, this.ctx.lineTo(this.width, this.yAxis), this.ctx.stroke()
        }, a.prototype.running = !0, a.prototype.loop = function () {
            this.running === !0 && this.update(), window.requestAnimationFrame(this.loop.bind(this))
        }, a.prototype.Waves = o, a.prototype.Ease = n, a
    }), $(function () {
    var a = new SineWaves({
            el: document.getElementById("waves"),
            speed: 4,
            width: function () {
                var a = $(document).width();
                return 1.4 * $("#waves").parent().width()
            },
            height: function () {
                return $("#waves").parent().height()
            },
            wavesWidth: "130%", //150
            ease: "SineInOut",
            waves: [{
                timeModifier: .5,
                lineWidth: 2,
                amplitude: 150,
                wavelength: 200,
                segmentLength: 1
            }, {
                timeModifier: .5,
                lineWidth: 2,
                amplitude: 100,
                wavelength: 150,
                segmentLength: 1
            }, {
                timeModifier: .5,
                lineWidth: 2,
                amplitude: 50,
                wavelength: 80,
                segmentLength: 1
            }],
            initialize: function () {},
            resizeEvent: function () {
                var a = this.ctx.createLinearGradient(0, 0, this.width, 0);
                a.addColorStop(0, "rgba(255, 255, 255, 0)"), a.addColorStop(.1, "rgba(255, 255, 255, 0.2)"), a.addColorStop(1, "rgba(255, 255, 255, 0)");
                for (var b = -1, c = this.waves.length; ++b < c;) this.waves[b].strokeStyle = a;
                b = void 0, c = void 0, a = void 0
            }
        }),
        b = $("#waves"),
        c = $(document).scrollTop(),
        d = $(document).scrollTop() + $(window).height(),
        e = b.offset().top + b.height(),
        f = b.offset().top;
    (c > e || f > d) && (a.running = !1, a.update()), $(window).bind("scroll", function () {
        c = $(document).scrollTop(), d = $(document).scrollTop() + $(window).height(), e = b.offset().top + b.height(), f = b.offset().top, c > e || f > d ? (a.running = !1, a.update()) : (a.running = !0, a.update())
    })
});
