<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/common/head.jsp" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta name="format-detection" content="telephone=no"/>
    <script src="<%=basePath%>resources/js/antifake/flexible.js"></script>
    <link rel="stylesheet" href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=basePath%>resources/css/antifake/home.css">
    <link rel="stylesheet" href="<%=basePath%>resources/css/commonsfx.css">
    <link rel="stylesheet" href="<%=basePath%>resources/css/indexSfx.css">
    <jsp:include page="../common/public.jsp"></jsp:include>
    <title>${scansSession.business.name}</title>
</head>
	<body>
	    <a class="bannersfx">
            <ul>
                <c:forEach items="${advertisements}" var="advertisement">
                    <li><img width="100%" src="<%=basePath%>${advertisement.path}" alt="${advertisement.title}" class="pic"></li>
                </c:forEach>
            </ul>
        </a> 
		<!--扫码信息-->
        <div class="QRcodesfx">
            <c:if test="${ scansSession.scodeStatus eq '1' or scansSession.scodeStatus eq '2'  }">
                <h2><strong>${scansSession.product.name}</strong></h2>
                <div>该验证码被扫描<strong><span>${scanCount}</span></strong>次</div>
                <div>由<strong><span>${scansSession.business.name}</span></strong>官方验证</div>
            </c:if>		
        </div>
        <!--分界线-->
        <div class="null"></div>
        <!--功能模块-->
        <div class="modulesfx-box carousel slide" id="myCarousel">
            <div class="carouselsfx-inner">
            <!--项目-->
                <ul  class="item active">
                   <c:if test="${menu.appMenu[6].isDisplay==1 }">
                      <a href="<%=basePath%>member/activity">
                        <div class="nav-pic nav-pic1"></div>
                        <c:if test="${!empty menu.appMenu[6].menuAlias }">
                            <span>${menu.appMenu[6].menuAlias}</span>
                        </c:if>
                        <c:if test="${empty menu.appMenu[6].menuAlias }">
                            <span>${menu.appMenu[6].menuName}</span>
                        </c:if>
                      </a>
                    </c:if>
                    <c:if test="${menu.appMenu[7].isDisplay==1 }">
                    <a href="<%=basePath%>outlet/offlineStore">
                        <div class="nav-pic nav-pic2"></div>
                        <c:if test="${!empty menu.appMenu[7].menuAlias }">
                            <span>${menu.appMenu[7].menuAlias}</span>
                        </c:if>
                        <c:if test="${empty menu.appMenu[7].menuAlias }">
                            <span>${menu.appMenu[7].menuName}</span>
                            </c:if>
                    </a>
                    </c:if>
                    <c:if test="${menu.appMenu[8].isDisplay==1 }">
                    <a href="<%=basePath%>${(empty scansSession.business)? '#':'antifake/companyIntroduce'}">
                        <div class="nav-pic nav-pic3"></div>
                        <c:if test="${!empty menu.appMenu[8].menuAlias }">
                            <span>${menu.appMenu[8].menuAlias}</span>
                        </c:if>
                        <c:if test="${empty menu.appMenu[8].menuAlias }">
                            <span>${menu.appMenu[8].menuName}</span>
                        </c:if>
                    </a>
                    </c:if>
                    <c:if test="${menu.appMenu[9].isDisplay==1 }">
                    <a href="<%=basePath%>research/index">
                        <div class="nav-pic nav-pic4"></div>
                        <c:if test="${!empty menu.appMenu[9].menuAlias }">
                            <span>${menu.appMenu[9].menuAlias}</span>
                        </c:if>
                        <c:if test="${empty menu.appMenu[9].menuAlias }">
                            <span>${menu.appMenu[9].menuName}</span>
                        </c:if>
                    </a>
                    </c:if>
                    <c:if test="${menu.appMenu[10].isDisplay==1 }">
                    <a href="<%=basePath%>latersale/index">
                        <div class="nav-pic nav-pic5"></div>
                        <c:if test="${!empty menu.appMenu[10].menuAlias }">
                            <span>${menu.appMenu[10].menuAlias}</span>
                        </c:if>
                        <c:if test="${empty menu.appMenu[10].menuAlias }">
                            <span>${menu.appMenu[10].menuName}</span>
                        </c:if>
                    </a>
                    </c:if>
                    <c:if test="${menu.appMenu[11].isDisplay==1 }">
                        <a href="<%=basePath%>mall/orderHome">
                            <div class="nav-pic nav-pic6"></div>
                            <c:if test="${!empty menu.appMenu[11].menuAlias }">
                                <span>${menu.appMenu[11].menuAlias}</span>
                            </c:if>
                            <c:if test="${empty menu.appMenu[11].menuAlias }">
                                <span>${menu.appMenu[11].menuName}</span>
                            </c:if>
                        </a>
                    </c:if>
                </ul>
            </div>		
        </div>
        <!--分界线-->
        <div class="null"></div>
        <!--溯源信息-->
        <div class="tabtitlesfx tabtitlesfx2">
            <div>
                <span>溯源信息</span>
                <span>/产品认证</span>
            </div>
        </div>
        <div class="sumsfx">
            <c:forEach items="${productTraceability}" var="productTraceability" varStatus="status">
                <c:if test="${status.count==1}">
                    <div class="listsfx am-gallery-item">
                        <div class="linesfx"></div>
                        <img src="<%=basePath%>resources/images/antifake/1.png" style="width:16px"/>
                        <div class="time-a">${productTraceability.createTime} 
                            <c:if test="${!empty productTraceability.processName}">
                            &nbsp;[${productTraceability.processName}]
                            </c:if>
                        </div> 
                        <p>${productTraceability.Remarks}</p>
                        <c:if test="${!empty productTraceability.imgPath}">
                            <div class="pic"  value = "0">
                                <img class="imgs" src="${productTraceability.imgPath}"/>
                            </div>
                        </c:if>
                        <c:if test="${!empty productTraceability.videoPath}">
                            <div class="vidBox" style="width:46%;height:150px"><span class="timer"></span></div>
                            <video class="video" controls width = "46%" height="150px" preload="auto">
                                <source src="${productTraceability.videoPath}" type="video/mp4"></source>
                                您的浏览器不支持视频播放点击这里下载视频： <a href="myvideo.webm">下载视频</a>
                            </video>
                        </c:if>
                    </div>
                </c:if>
                <c:if test="${status.count!=1}">
                    <div class="listsfx am-gallery-item">
                        <div class="linesfx"></div>
                        <img src="<%=basePath%>resources/images/antifake/2.png" style="width:16px"/>
                        <div class="time-a">${productTraceability.createTime} 
                            <c:if test="${!empty productTraceability.processName}">
                            &nbsp;[${productTraceability.processName}]
                            </c:if> 
                        </div>
                        <p>${productTraceability.Remarks}</p>
                        <c:if test="${!empty productTraceability.imgPath}">
                            <div class="pic" value = "0">
                                <img class="imgs" src="${productTraceability.imgPath}"/>
                            </div>
                        </c:if>
                        <c:if test="${!empty productTraceability.videoPath}">
                            <div class="vidBox" style="width:46%;height:150px"><span class="timer"></span></div>
                            <video class="video" controls width = "46%" height="150px" preload="auto">
                                <source src="${productTraceability.videoPath}" type="video/mp4"></source>
                                您的浏览器不支持视频播放点击这里下载视频： <a href="myvideo.webm">下载视频</a>
                            </video>
                        </c:if>
                    </div>
                </c:if>
            </c:forEach>
            <!-- <c:if test="${!empty productTraceability}">
                </div>
            </c:if> -->
        </div>
	    <!--产品认证总-->
        <div class="parametersfx-sum" style="display: none;margin-top: 0.21rem;">
            <!--产品参数-->
            <div class="parametersfx-box">
                <h2><strong>产品参数</strong></h2>
                <div class="parametersfx-item flex-cont">
                    <span> 品牌：</span><span>${empty productId?scansSession.product.businessBrand.name:productMessage.product[0].brandName}</span>
                </div>
                <div class="parametersfx-item flex-cont">
                    <span> 分类：</span><span>${empty productId?scansSession.product.businessCustomType.name:productMessage.product[0].classifyName}</span>
                </div>
                <div class="parametersfx-item flex-cont">
                    <span> 等级：</span><span>${empty productId?scansSession.product.prdGrade:productMessage.product[0].prdGrade}</span>
                </div>
                
                <div class="parametersfx-item flex-cont">
                    <span> 产品型号：</span><span>${empty productId?scansSession.product.prdType:productMessage.product[0].prdType}</span>
                </div>
                <div class="parametersfx-item flex-cont">
                    <span> 原料配方：</span><span>${empty productId?scansSession.product.rawMaterial:productMessage.product[0].rawMaterial}</span>
                </div>
                <div class="parametersfx-item flex-cont">
                    <span> 生产批次：</span><span>${scansSession.detail.saleBatNo}</span>
                </div>
                <div class="parametersfx-item flex-cont">
                    <span> 保质期：</span><span>${empty productId?scansSession.product.SHELF_LIFE:productMessage.product[0].SHELF_LIFE}</span>
                </div>
                <div class="parametersfx-item flex-cont">
                    <span> 出厂商：</span><span>${empty productId?scansSession.product.manufacturer:productMessage.product[0].manufacturers}</span>
                </div>
                <div class="parametersfx-item flex-cont">
                    <span> 出厂商地址：</span><span>${empty productId?scansSession.product.producingArea:productMessage.product[0].productArea}</span>
                </div>
            </div>
                <div class="pmsfx-box">产品详情</div>
            <div class="pmsfx-img">
                <ul class="detail-list">
                        ${empty productId?scansSession.product.detail:productMessage.product[0].detail}
                </ul>
            </div>	
        </div>
        <c:if test="${!empty actionResult.winFlg}">
            <c:if test="${actionResult.winFlg eq 'Y'}">
                <div class="mask prize-box" style="display: block;">
                    <div class="tips">
                        <div class="tipBox">
                            <p>人品爆发啦</p>
                            <p class="prize">恭喜获得<span class="prize-name">
                                <c:if test="${actionResult.winactPrizeType == 1 }">
                                    ${actionResult.actPrizeValue}元红包
                                </c:if>
                                <c:if test="${actionResult.winactPrizeType == 2 || actionResult.winactPrizeType == 3 || actionResult.winactPrizeType == 4 || actionResult.winactPrizeType == 5}">
                                    ${actionResult.winActPrizeName}
                                </c:if>
                                <%-- <c:if test="${actionResult.winactPrizeType == 3 }">
                                    ${actionResult.actPrizeValue}个积分
                                </c:if> --%>
                                </span>!
                            </p>
                            <c:choose>
                                <c:when test="${actionResult.winactPrizeType == 3 }">
                                    <p>积分已经充入您的账户</p>
                                </c:when>
                                <c:when test="${actionResult.winactPrizeType == 4 || actionResult.winactPrizeType == 5 }">
                                    <p>奖券已经放入您的账户</p>
                                </c:when>
                                <c:otherwise>
                                    <p>请到<span>我的信息&gt;中奖订单</span>中查看领取</p>
                                </c:otherwise>
                            </c:choose>
                            <a href="#" class="btn close_btn"></a>
                            <a href="#" class="btn check_btn">确定</a>
                        </div>
                    </div>
                </div>
            </c:if>
            <c:if test="${actionResult.winFlg eq 'N'}">
                <div class="mask lose-box">
                    <div class="tips">
                        <div class="tipBox">
                            <p>啊哦，没中奖！</p>
                            <p class="prize">与幸运女神擦肩而过</p>
                            <a href="#" class="btn close_btn"></a>
                        </div>
                    </div>
                </div>
            </c:if>
        </c:if>
        <!--底部nav-->
        <div class="foot">
            <ul class="tab-list">
                <!-- 1 -->
                <c:if test="${menu.appMenu[0].isDisplay==1 }">
                <li class="tab-item active">
                    <a href="#">
                        <i class="icon tab-icon index"></i>
                        <c:if test="${!empty menu.appMenu[0].menuAlias }">
                            <p>${menu.appMenu[0].menuAlias}</p>
                        </c:if>
                        <c:if test="${empty menu.appMenu[0].menuAlias }">
                            <p>${menu.appMenu[0].menuName}</p>
                        </c:if>
                    </a>
                </li>
                </c:if>
                <!-- 2 -->
                <c:if test="${menu.appMenu[1].isDisplay==1 }">
                    <li class="tab-item">
                        <a href="<%=basePath%>${(empty scansSession.business)? '#':'antifake/companyGoods'}">
                            <i class="icon tab-icon minShop"></i>
                            <c:if test="${!empty menu.appMenu[1].menuAlias }">
                                <p>${menu.appMenu[1].menuAlias}</p>
                            </c:if>
                            <c:if test="${empty menu.appMenu[1].menuAlias }">
                                <p>${menu.appMenu[1].menuName}</p>
                            </c:if>
                        </a>
                    </li>
                </c:if>
                <!-- 3 -->
                <c:if test="${menu.appMenu[2].isDisplay==1 }">
                <li class="tab-item">
                    <a href="<%=basePath%>${(empty scansSession.business)? '#':'shop/'}"> 
                        <i class="icon tab-icon scoreShop"></i>
                        <c:if test="${!empty menu.appMenu[2].menuAlias }">
                            <p>${menu.appMenu[2].menuAlias}</p>
                        </c:if>
                        <c:if test="${empty menu.appMenu[2].menuAlias }">
                            <p>${menu.appMenu[2].menuName}</p>
                        </c:if>
                    </a>
                </li>
                </c:if>
                <!-- 4 -->
                <c:if test="${menu.appMenu[3].isDisplay==1 }">
                <li class="tab-item">
                    <a href="<%=basePath%>${(empty memberSession)? '#':'member/'}">
                        <i class="icon tab-icon myMessage"></i>
                        <c:if test="${!empty menu.appMenu[3].menuAlias }">
                            <p>${menu.appMenu[3].menuAlias}</p>
                        </c:if>
                        <c:if test="${empty menu.appMenu[3].menuAlias }">
                            <p>${menu.appMenu[3].menuName}</p>
                        </c:if>
                    </a>
                </li>
                </c:if>
            </ul>
        </div>
        <!--撑高div-->
        <div style="width: 100%;height: 2rem; background: #FFFFFF;overflow: hidden;"></div>
    </body>
</html>
<script type="text/javascript" src="<%=basePath%>resources/js/antifake/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/js/antifake/jquery.lazyload.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/js/antifake/zepto.min.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/js/antifake/unslider.js"></script>
<script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript">
$(function(){
		$(".tabtitlesfx2 span:first").css("color","black");
		$(".tabtitlesfx2 span:last").css("color","#edab39");
		//点击图片
        let flag =false	
        $(".imgs").click(function(){	
            if(flag ==false){
                $(this).parents(".pic").css({"width":"69%","height":"5.6rem"})
                flag=true
            }else{
                $(this).parents(".pic").css({"width":"46%","height":"2.88rem"})
                flag = false
            }
        });
        //footer宽度设置
        let length = $(".tab-list").children().length;
        if(length == 2){
            $(".foot .tab-list .tab-item").css({
                width:"50%"
            })
        }else if (length == 3) {
            $(".foot .tab-list .tab-item").css({
                width:"33.33%"
            })
        }else if( length == 4 ){
            $(".foot .tab-list .tab-item").css({
                width:"25%"
            })
        }else if( length == 1){
            $(".foot .tab-list .tab-item").css({
                width:"100%"
            })
        };
	});
    
 	$('.tabtitlesfx2 span:first').click(function(){
 		$('.sumsfx').show();
 		$('.parametersfx-sum').hide();
 		$(".tabtitlesfx2 span:first").css("color","black");
 		$(".tabtitlesfx2 span:last").css("color","#edab39");
 	})
 	$('.tabtitlesfx2 span:last').click(function(){
 		$('.sumsfx').hide();
 		$('.parametersfx-sum').show();
 		$(".tabtitlesfx2 span:first").css("color","#edab39");
 		$(".tabtitlesfx2 span:last").css("color","black");
 	})
    var scodeStatus = "${scansSession.scodeStatus}";
    var loactionRemark = "${scansSession.loactionRemark}";
    function getLocation() {
        if (loactionRemark == 'N') {
            wx.getLocation({
                type: 'gcj02',  // 默认为wgs84的gps坐标，如果要返回直接给openLocation用的火星坐标，可传入'gcj02'
                success: function (res) {
                    var latitude = res.latitude; // 纬度，浮点数，范围为90 ~ -90
                    var longitude = res.longitude; // 经度，浮点数，范围为180 ~ -180。
                    var speed = res.speed; // 速度，以米/每秒计
                    var accuracy = res.accuracy; // 位置精度
                    var latlon = 'latitude=0&longitude=0';
                    latlon = 'latitude=' + latitude + "&longitude=" + longitude;
                    ajaxAddress(latlon);
                }
            });
        }
    }
    function ajaxAddress(latlon) {
        $.ajax({
            url: '<%=basePath%>antifake/scanAddress',
            data: latlon,
            dataType: 'json',
            success: function () {

            }
        });
    }
    function showError(error) {
        showPosition(null);
    }
    function showPosition(position) {
        var latlon = 'latitude=0&longitude=0';
        if (position != null) {
            latlon = 'latitude=' + position.coords.latitude + "&longitude=" + position.coords.longitude;
        }
        /* if ( scodeStatus!=null && (scodeStatus == '5' || scodeStatus == '6')  ) */
        if (scodeStatus != null && (scodeStatus == '1' || scodeStatus == '2')) {
            $.ajax({
                url: '<%=basePath%>antifake/scanAddress',
                data: latlon,
                dataType: 'json',
                success: function () {
                    
                }
            });
        }
    };
    $(function(){
        // 视频
        let video = $("video")
            vidBox = $(".vidBox")
        //开始播放
        vidBox.click(function(){
            $(this).css("display","none")
            $(this).next("video").css({"display":"block"})
            $(this).context.nextElementSibling.play()
        });
        //转换时间
        let sec_to_time = function(s) {
        let t;
        if(s > -1){
            var hour = Math.floor(s/3600);//小时
            var min = Math.floor(s/60) % 60;//分钟
            var sec = s % 60;//秒
            if(hour <= 0){
                t = ""
            } else {
                t = hour + ":";
            }
            if(min < 10){
                t += "0";
            }
            t += min + ":";
            if(sec < 10){
                t += "0";
            }
                t += Math.floor(sec).toFixed(0);
            }
            return t;
        }
        //获取video的时长
        video.bind('loadedmetadata', function() {
            let span  =$(this).prev().children();
            let times = (sec_to_time($(this)[0].duration));	
            span.text(times)
        });
         //播放结束
        video.bind("ended",function(){
            $(this).css({"display":"none"});
            $(this).prev(".vidBox").css("display","block")
        })
        //判断全屏
			document.addEventListener("fullscreenchange",function(){
				video.css({"display":"none"});
				video.prev(".vidBox").css("display","block")
			}, false);
			document.addEventListener("mozfullscreenchange",function(){
				video.css({"display":"none"});
				video.prev(".vidBox").css("display","block")
			}, false);
			document.addEventListener("webkitfullscreenchange",function(){
				video.css({"display":"none"});
				video.prev(".vidBox").css("display","block")}, false);
			document.addEventListener("msfullscreenchange",function(){
				video.css({"display":"none"});
				video.prev(".vidBox").css("display","block")
			}, false);
            for(let i = 0; i<video.length; i++ ){
                video[i].addEventListener("x5videoexitfullscreen",function(){
                    video.css({"display":"none"})
                    video.prev(".vidBox").css("display","block")
                }) 
            }
            for(let i = 0; i<video.length; i++ ){
				video[i].addEventListener("pause",function(){
					video.css({"display":"none"})
					video.prev(".vidBox").css("display","block")
				})
            }
	})
    $(function () {
        $('.pic_box').unslider({
            speed: 500,
            delay: 3000,
            keys: true
        });
        $.ajax({
            url: '<%=basePath%>antifake/signtrue',
            data: 'iurl=' + encodeURIComponent(location.href.split('#')[0]),
            dataType: 'json',
            success: function (res) {
                wx.config({
                    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
                    appId: res.appId, // 必填，公众号的唯一标识
                    timestamp: res.timestamp, // 必填，生成签名的时间戳
                    nonceStr: res.nonceStr, // 必填，生成签名的随机串
                    signature: res.signature,// 必填，签名，见附录1
                    jsApiList: ['onMenuShareTimeline', 'onMenuShareAppMessage', 'getLocation'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
                });
                wx.ready(function () {
                    getLocation();
                });
                wx.error(function (res) {
                    //	alert('抱歉，微信配置出问题');
                    // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。
                });
                wx.checkJsApi({
                    jsApiList: ['onMenuShareTimeline', 'onMenuShareAppMessage'], // 需要检测的JS接口列表，所有JS接口列表见附录2,
                    success: function (res) {
                        // 以键值对的形式返回，可用的api值true，不可用为false
                        // 如：{"checkResult":{"chooseImage":true},"errMsg":"checkJsApi:ok"}
                        console.log(res);
                    }
                });
                wx.ready(function () {
                    // 分享给朋友
                    wx.onMenuShareAppMessage({
                        title: '${scansSession.business.name}', // 分享标题
                        desc: '', // 分享描述
                        link: '${shareLink}', // 分享链接，该链接域名或路径必须与当前页面对应的公众号JS安全域名一致
                        imgUrl: '<%=basePath%>${scansSession.business.logopath}', // 分享图标
                        success: function () {
                            // 用户确认分享后执行的回调函数
                            $.ajax({
                                url: '<%=basePath%>antifake/shareReturn',
                                data: {
                                    "shareType": 3,
                                    "productId": '${productId}',
                                    "link": '${shareLink}',
                                    "toShare": 1
                                },
                                encode: false
                            });
                        },
                        cancel: function () {
                            // 用户取消分享后执行的回调函数
                        }
                    });
                    wx.onMenuShareTimeline({
                        title: '${scansSession.business.name}', // 分享标题
                        link: '${shareLink}', // 分享链接，该链接域名或路径必须与当前页面对应的公众号JS安全域名一致
                        imgUrl: '<%=basePath%>${scansSession.business.logopath}', // 分享图标
                        success: function () {
                            // 用户确认分享后执行的回调函数
                            $.ajax({
                                url: '<%=basePath%>antifake/shareReturn',
                                data: {
                                    "shareType": 3,
                                    "productId": '${productId}',
                                    "link": '${shareLink}',
                                    "toShare": 2
                                },
                                encode: false
                            });
                        },
                        cancel: function () {
                            // 用户取消分享后执行的回调函数
                        }
                    });
                });
            }
        });
        // 活动显示图
        $(".close_btn").click(function () {
            $(".mask").hide();
        });
        $(".check_btn").click(function () {
            $(".mask").hide();
        });
    });
</script>
