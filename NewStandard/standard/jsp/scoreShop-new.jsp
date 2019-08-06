<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/head.jsp"%>
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
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<meta name="format-detection" content="telephone=no, email=no" />
	<script src="<%=basePath%>resources/js/antifake/flexible.js"></script>
	<link rel="stylesheet" href="<%=basePath%>resources/css/antifake-new/common.css">
	<link rel="stylesheet" href="<%=basePath%>resources/css/antifake-new/scoreStore.css">
	<link rel="stylesheet" href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<c:if test="${ErpriseRole != 2 && ErpriseRole != 4}">
	<link rel="stylesheet" href="<%=basePath%>resources/css/antifake/basicIndex.css">
	</c:if>
	<jsp:include page="../common/public.jsp"></jsp:include>
	<title>${scansSession.business.name}</title>
</head>

<body>
	<div id="page">
		<div class="content">
			<div class="mainInfo-box">
				<div class="searchBar">
					<form action="<%=basePath%>shop/index" method="post" id="searchForm">
						<i class="fa fa-search" aria-hidden="true"></i> <input type="text" class="search" id="searchIt" name="productName"
						 value="${query.scoreProductName}" placeholder="请输入商品名称">
					</form>
				</div>
				<ul>
					<c:forEach items="${advertisements}" var="advertisement">
						<li style="width: 100%;height: 4.2rem;"><img data-original="<%=basePath%>${advertisement.path}" alt="${advertisement.title}"
							 style="width: 100%;height: 4.4rem;" class="pic lazy"></li>
					</c:forEach>
				</ul>
			</div>
			<div class="nav-box">
				<ul class="nav-list">
					<li class="nav-item">
						<a href="<%=basePath%>member/scoreService"> 
							<div class="images"></div>
							<p>积分服务</p>
						</a>
					</li>
					<li class="nav-item">
						<a href="<%=basePath%>member/convert"">
							<div class="images"></div>
							<p>我能兑换</p>
						</a>
					</li>
					<li class="nav-item">
						<a href="<%=basePath%>member/shoppingCar"">
							<div class="images"></div>
							<p>购物车</p>
						</a>
					</li>
					<li class="nav-item">
						<a href="<%=basePath%>shop/myOrder">
							<div class="images"></div>
							<p>我的订单</p>
						</a>
					</li>
				</ul>
			</div>
			<div class="goods-box">
				<div class="title">积分商品</div>
				<ul class="goods-list">
					<c:forEach items="${productBeans}" var="product">
						<li class="goods-item">
							<a href="<%=basePath%>shop/shopDetail/${product.id}">
								<div class="pic-box">
									<img data-original="<%=basePath%>${product.imagePath}" alt="" class="lazy" >
								</div>
								<h4 class="name-box">${product.name}</h4>
								<p class="price-box">
									<i class="price-icon"></i>	
									<span>${product.discountScoreNum}</span>
								</p>
							</a>
						</li>
					</c:forEach>
				</ul>
				<c:if test="${empty productBeans}">
					<div class="noShop">
						<img src="<%=basePath%>resources/images/antifake/kongt.png" alt="">
						<p>暂无商品！</p>
					</div>
				</c:if>
			</div>
		</div>
	</div>
	<div class="footer">
		<ul class="tab-list">
			<!-- 1 -->
			<c:if test="${menu.appMenu[0].isDisplay==1 }">
				<li class="tab-item">
					<c:if test="${empty scansSession.outlet}">
						<c:if test="${scansSession.actScodeExists eq 'N'}">
							<a href="<%=basePath%>antifake/index">
								<i class="icon tab-icon index"></i>
								<c:if test="${!empty menu.appMenu[0].menuAlias }">
								<p>${menu.appMenu[0].menuAlias}</p>
							</c:if>
							<c:if test="${empty menu.appMenu[0].menuAlias }">
								<p>${menu.appMenu[0].menuName}</p>
							</c:if>
							</a>
						</c:if>
						<c:if test="${scansSession.actScodeExists eq 'Y'}">
							<a href="<%=basePath%>act/index">
								<i class="icon tab-icon index"></i>
								<c:if test="${!empty menu.appMenu[0].menuAlias }">
								<p>${menu.appMenu[0].menuAlias}</p>
							</c:if>
							<c:if test="${empty menu.appMenu[0].menuAlias }">
								<p>${menu.appMenu[0].menuName}</p>
							</c:if>
							</a>
						</c:if>
					</c:if>
					<c:if test="${!empty scansSession.outlet}">
						<a href="<%=basePath%>outlet/index">
							<i class="icon tab-icon index"></i>
							<c:if test="${!empty menu.appMenu[0].menuAlias }">
								<p>${menu.appMenu[0].menuAlias}</p>
							</c:if>
							<c:if test="${empty menu.appMenu[0].menuAlias }">
								<p>${menu.appMenu[0].menuName}</p>
							</c:if>
						</a>
					</c:if>
				</li>
			</c:if>
			<!-- 2 -->
			<c:if test="${menu.appMenu[1].isDisplay==1 }">
				<li class="tab-item">
					<c:if test="${ErpriseRole eq 2 || ErpriseRole eq 4}">
						<a href="<%=basePath%>${(empty scansSession.outlet)? 'antifake/companyGoods':'outlet/companyGoods'}">
							<i class="icon tab-icon minShop"></i>
							<c:if test="${!empty menu.appMenu[1].menuAlias }">
								<p>${menu.appMenu[1].menuAlias}</p>
							</c:if>
							<c:if test="${empty menu.appMenu[1].menuAlias }">
								<p>${menu.appMenu[1].menuName}</p>
							</c:if> 
						</a>
					</c:if>
				</li>
			</c:if>
			<!-- 3 -->
			<c:if test="${menu.appMenu[2].isDisplay==1 }">
				<li class="tab-item active">
					<a href="#"> 
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
</body>
</html>
<script src="http://res.wx.qq.com/open/js/jweixin-1.1.0.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/js/antifake/jquery.js"></script>
<script src="<%=basePath%>resources/js/antifake/jquery.lazyload.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/js/antifake/common.js"></script>
<script type="text/javascript">
	$(function(){
		//footer宽度设置
		let length = $(".tab-list").children().length;
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
	$("#searchIt").focusout(function () {
		var flag = "${flag}";
		//首次进来flag无值，二次进来fla为2
		if ($("#searchIt").val() != "" && $("#searchIt").val() != null) {
			showTips(true, "正在查询~", 800);
			$("#searchForm").submit();
		}
		if (($("#searchIt").val() == "" || $("#searchIt").val() == null) && flag == 2) {
			showTips(true, "正在查询~", 800);
			$("#searchForm").submit();
		}
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
				signature: res.signature, // 必填，签名，见附录1
				jsApiList: ['onMenuShareTimeline', 'onMenuShareAppMessage'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
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
					desc: '积分商城', // 分享描述
					link: '${shareLink}', // 分享链接，该链接域名或路径必须与当前页面对应的公众号JS安全域名一致
					imgUrl: '<%=basePath%>${scansSession.business.logopath}', // 分享图标
					success: function () {
						// 用户确认分享后执行的回调函数
						$.ajax({
							url: '<%=basePath%>antifake/shareReturn',
							data: {
								"shareType": 4,
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
								"shareType": 4,
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
</script>