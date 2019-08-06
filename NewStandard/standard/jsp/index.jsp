<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/head.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<script src="<%=basePath%>resources/js/antifake/flexible.js"></script>
<link rel="stylesheet"
	href="<%=basePath%>resources/css/antifake-new/common.css">
<link rel="stylesheet"
	href="<%=basePath%>resources/css/antifake-new/home.css">
<link rel="stylesheet"
	href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css">
<jsp:include page="../common/public.jsp"></jsp:include>
<title>${scansSession.business.name}</title>
</head>
<body>
	<div id="page">
		<div class="content">
			<div class="goodsPic-box">
				<ul>
					<c:forEach items="${advertisements}" var="advertisement">
						<li><img src="<%=basePath%>${advertisement.path}"
							alt="${advertisement.title}" class="pic" /></li>
					</c:forEach>
				</ul>
			</div>
			<div class="goods-box">
				<div class="goods-info">
					<div class="pic-box">
						<img src="<%=basePath%>${scansSession.business.logopath}" alt="" />
					</div>
					<div class="info-box">
						<div class="title">${scansSession.product.name}</div>
						<ul class="info-list">
							<li class="info-item">编号：<span>${scansSession.product.productNo}</span></li>
							<li class="info-item">生产日期：<span></span></li>
							<li class="info-item">保质期：<span>${scansSession.product.SHELF_LIFE}</span></li>
							<li class="info-item">出品商：<span>${scansSession.product.manufacturer}</span></li>
						</ul>
					</div>
				</div>
				<div class="scale-info">
					<div class="scale-num">
						该验证码被扫描<span>${scanCount}</span>次
					</div>
					<div class="company">
						由<span>${scansSession.business.name}</span>官方验证
					</div>
				</div>
			</div>
			<div class="nav-wrapper">
				<ul class="nav-box">
					<li class="navList-item">
						<ul class="nav-list">
							<c:if test="${menu.appMenu[4].isDisplay==1 }">
								<li class="nav-item">
									<a href="<%=basePath%>${(empty scansSession.product)? '#':'antifake/productInfo'}">
										<div class="nav-pic nav-pic1"></div> 
										<c:if test="${!empty menu.appMenu[4].menuAlias }">
											<div class="nav-title">${ menu.appMenu[4].menuAlias}</div>
										</c:if>
										<c:if test="${empty menu.appMenu[4].menuAlias }">
											<div class="nav-title">${menu.appMenu[4].menuName}</div>
										</c:if>
									</a>
								</li>
							</c:if>
							<c:if test="${menu.appMenu[5].isDisplay==1 }">
								<li class="nav-item">
									<a href="<%=basePath%>${(empty scansSession.product)? '#':'antifake/goodsResource'}">
										<div class="nav-pic nav-pic2"></div>
										<c:if test="${!empty menu.appMenu[5].menuAlias }">
											<div class="nav-title">${menu.appMenu[5].menuAlias}</div>
										</c:if>
											<c:if test="${empty menu.appMenu[5].menuAlias }">
											<div class="nav-title">${menu.appMenu[5].menuName}</div>
										</c:if>
									</a>
								</li>
							</c:if>
							<c:if test="${menu.appMenu[6].isDisplay==1 }">
								<li class="nav-item">
									<a href="<%=basePath%>member/activity">
										<div class="nav-pic nav-pic3"></div>
										<c:if test="${!empty menu.appMenu[6].menuAlias }">
											<div class="nav-title">${menu.appMenu[6].menuAlias}</div>
										</c:if> 
										<c:if test="${empty menu.appMenu[6].menuAlias }">
											<div class="nav-title">${menu.appMenu[6].menuName}</div>
										</c:if>
									</a>
								</li>
							</c:if>
							<c:if test="${menu.appMenu[7].isDisplay==1 }">
								<li class="nav-item">
									<a href="<%=basePath%>outlet/offlineStore">
										<div class="nav-pic nav-pic4"></div>
										<c:if test="${!empty menu.appMenu[7].menuAlias }">
											<div class="nav-title">${menu.appMenu[7].menuAlias}</div>
										</c:if> 
										<c:if test="${empty menu.appMenu[7].menuAlias }">
											<div class="nav-title">${menu.appMenu[7].menuName}</div>
										</c:if>
									</a>
								</li>
							</c:if>
							<c:if test="${menu.appMenu[8].isDisplay==1 }">
								<li class="nav-item">
									<a href="<%=basePath%>${(empty scansSession.business)? '#':'antifake/companyIntroduce'}">
										<div class="nav-pic nav-pic5"></div>
										<c:if test="${!empty menu.appMenu[8].menuAlias }">
											<div class="nav-title">${menu.appMenu[8].menuAlias}</div>
										</c:if> 
										<c:if test="${empty menu.appMenu[8].menuAlias }">
											<div class="nav-title">${menu.appMenu[8].menuName}</div>
										</c:if>
									</a>
								</li>
							</c:if>
							<c:if test="${menu.appMenu[9].isDisplay==1 }">
								<li class="nav-item">
									<a href="<%=basePath%>research/index">
										<div class="nav-pic nav-pic6"></div>
										<c:if test="${!empty menu.appMenu[9].menuAlias }">
											<div class="nav-title">${menu.appMenu[9].menuAlias}</div>
										</c:if> 
										<c:if test="${empty menu.appMenu[9].menuAlias }">
											<div class="nav-title">${menu.appMenu[9].menuName}</div>
										</c:if>
									</a>
								</li>
							</c:if>
							<c:if test="${menu.appMenu[10].isDisplay==1 }">
								<li class="nav-item">
									<a href="<%=basePath%>latersale/index">
										<div class="nav-pic nav-pic7"></div>
										<c:if test="${!empty menu.appMenu[10].menuAlias }">
											<div class="nav-title">${menu.appMenu[10].menuAlias}</div>
										</c:if> 
										<c:if test="${empty menu.appMenu[10].menuAlias }">
											<div class="nav-title">${menu.appMenu[10].menuName}</div>
										</c:if>
									</a>
								</li>
							</c:if>
							<c:if test="${menu.appMenu[11].isDisplay==1 }">
								<li class="nav-item">
									<a href="<%=basePath%>mall/orderHome">
										<div class="nav-pic nav-pic8"></div>
										<c:if test="${!empty menu.appMenu[11].menuAlias }">
											<div class="nav-title">${menu.appMenu[11].menuAlias}</div>
										</c:if> 
										<c:if test="${empty menu.appMenu[11].menuAlias }">
											<div class="nav-title">${menu.appMenu[11].menuName}</div>
										</c:if>
									</a>
								</li>
							</c:if>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- footer -->
	<div class="footer">
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
	<!-- 中奖 -->
	<c:if test="${!empty actionResult.winFlg}">
		<c:if test="${actionResult.winFlg eq 'Y'}">
			<div class="mask prize-box" style="display: block;">
				<div class="tips">
					<div class="tipBox">
						<p>人品爆发啦</p>
						<p class="prize">
							恭喜获得 <span class="prize-name"> <c:if
									test="${actionResult.winactPrizeType == 1 }">
									${actionResult.actPrizeValue}元红包
								</c:if> <c:if
									test="${actionResult.winactPrizeType == 2 || actionResult.winactPrizeType == 3 || actionResult.winactPrizeType == 4 || actionResult.winactPrizeType == 5}">
									${actionResult.winActPrizeName}
								</c:if> <%-- <c:if test="${actionResult.winactPrizeType == 3 }">${actionResult.actPrizeValue}个积分</c:if> --%>
							</span>!
						</p>
						<c:choose>
							<c:when test="${actionResult.winactPrizeType == 3 }">
								<p>积分已经充入您的账户</p>
							</c:when>
							<c:when
								test="${actionResult.winactPrizeType == 4 || actionResult.winactPrizeType == 5 }">
								<p>奖券已经放入您的账户</p>
							</c:when>
							<c:otherwise>
								<p>
									请到<span>我的信息&gt;中奖订单</span>中查看领取
								</p>
							</c:otherwise>
						</c:choose>
						<a href="#" class="btn close_btn"></a> <a href="#"
							class="btn check_btn">确定</a>
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
</body>
</html>
<script src="<%=basePath%>resources/js/antifake/zepto.min.js"></script>
<script type="text/javascript"
	src="https://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript"
	src="<%=basePath%>resources/js/antifake/jquery.js"></script>
<script src="<%=basePath%>resources/js/antifake/common.js"></script>
<script type="text/javascript"
	src="<%=basePath%>resources/js/antifake/unslider.js"></script>
<script type="text/javascript">
   $(function () {
   	let goodsBox = $('.goodsPic-box')
   	goodsBox.unslider({
   		speed: 500,
   		delay: 3000,
   		keys: true,
   		dots: false,
   		loop: true
   	})
   	// 活动显示图
   	let close = $(".close_btn")
   	check = $(".check_btn")
   	mask = $(".mask")
   	close.click(function () {
   		mask.hide()
   	});
   	check.click(function () {
   		mask.hide()
   	});

	//footer宽度设置
	let length = $(".tab-list").children().length;
	console.log(length)
	if(length == 2){
		$(".footer .tab-list .tab-item").css({
			width:"50%"
		})
	}else if (length == 3) {
		$(".footer .tab-list .tab-item").css({
			width:"33.33%"
		})
	}else if( length == 4 ){
		$(".footer .tab-list .tab-item").css({
			width:"25%"
		})
	}else if( length == 1){
		$(".footer .tab-list .tab-item").css({
			width:"100%"
		})
	}
   });
   var scodeStatus = "${scansSession.scodeStatus}";
   var loactionRemark = "${scansSession.loactionRemark}";
   function getLocation() {
   	if (loactionRemark == 'N') {
   		wx.getLocation({
   			type: 'gcj02', // 默认为wgs84的gps坐标，如果要返回直接给openLocation用的火星坐标，可传入'gcj02'
   			success: function (res) {
   				var latitude = res.latitude; // 纬度，浮点数，范围为90 ~ -90
   				var longitude = res.longitude; // 经度，浮点数，范围为180 ~ -180。
   				var speed = res.speed; // 速度，以米/每秒计
   				var accuracy = res.accuracy; // 位置精度
   				var latlon = 'latitude=0&longitude=0';
   				latlon = 'latitude=' + latitude + "&longitude=" + longitude;
   				ajaxAddress(latlon);
   			}
   		})
   	}
   };
   function ajaxAddress(latlon) {
   	$.ajax({
   		url: '<%=basePath%>antifake/scanAddress',
   		data: latlon,
   		dataType: 'json',
   		success: function () {
   			
   		}
   	})
   };
   function showError(error) {
   	showPosition(null);
   };
   function showPosition(position) {
   	var latlon = 'latitude=0&longitude=0';
   	if (position != null) {
   		latlon = 'latitude=' + position.coords.latitude + "&longitude=" + position.coords.longitude;
   	}
   	if (scodeStatus != null && (scodeStatus == '1' || scodeStatus == '2')) {
   		$.ajax({
   			url: '<%=basePath%>antifake/scanAddress',
   			data: latlon,
   			dataType: 'json',
   			success: function () {

   			}
   		})
   	}
   };
   $(function () {
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
   				signature: res.signature, // 必填，签名，见附录1
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
   })
</script>