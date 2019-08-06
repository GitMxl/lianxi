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
	<meta name="format-detection" content="telephone=no" />
	<script src="http://res.wx.qq.com/open/js/jweixin-1.1.0.js"></script>
	<script src="<%=basePath%>resources/js/antifake/flexible.js"></script>
	<link rel="stylesheet" href="<%=basePath%>resources/css/antifake-new/common.css">
	<link rel="stylesheet" href="<%=basePath%>resources/css/antifake-new/company.css">
	<link rel="stylesheet" href="<%=basePath%>resources/css/antifake/new/tanchuang.css" />
	<link rel="stylesheet" href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<title>${scansSession.business.name}</title>
</head>

<body>
	<div id="page">
		<div class="content">
			<div class="mainInfo-box">
				<div class="searchBar">
					<form action="">
						<form action="<%=basePath%>antifake/companyGoods" method="post">
							<i class="fa fa-search" aria-hidden="true"></i>
							<input type="text" class="search" name="productName" value="${empty productName?'':productName}" placeholder="请输入商品名称">
						</form>
					</form>
				</div>
				<c:if test="${!empty advertisements}">
					<c:forEach items="${advertisements}" var="advertisement">
						<img src="<%=basePath%>${advertisement.path}" style="width: 100%; height: 4.4rem;">
					</c:forEach>
				</c:if>
			</div>
			<div class="nav-box">
				<div class="title-box">
					<div class="title">
						<img src="<%=basePath%>resources/img/new/new.png" alt="" class="title-pic"> 产品系列
					</div>
				</div>
				<ul class="nav-list">
					<c:forEach items="${brands}" var="brand">
						<li class="nav-item">
							<a href="<%=basePath%>antifake/brandDtl?brandName=${brand.name}&id=${brand.id}">
								<img src="<%=basePath%>${brand.businessPhotos.path}" alt="" class="product-pic">
								<div class="title">${brand.name}</div>
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div class="goods-box">
				<div class="title-box">
					<div class="title">
						<img src="<%=basePath%>resources/img/new/new.png" alt="" class="title-pic"> 新品推荐
					</div>
				</div>
				<div class="goods-list">
					<c:forEach var="p" items="${product }">
						<c:if test="${!empty p.productId }">
							<li class="goods-item">
								<a href="<%=basePath %>antifake/productInfo?productId=${p.productId}">
									<div class="goods-pic">
										<img src="<%=basePath%>${p.defaultPicture}" alt="">
									</div>
									<div class="goods-info">
										<div class="name">${p.productName}</div>
										<div class="price">
											市场价：¥<span>${empty p.newPrice?0:p.newPrice}</span>
										</div>
										<div class="discountPrize">
											¥<span>${empty p.newPrice?0:p.newPrice}</span>
										</div>
								</a>
								<div class="saveMoney" id="${p.productId}">
									<span><img src="<%=basePath%>resources/images/antifake/gouwuchehong.png" /></span>
								</div>
								<input type="hidden" id="prize${p.productId}" value="${empty p.newPrice?0:p.newPrice}" />
								<input type="hidden" id="prdSp${p.productId}" value="${p.specifications}" />
								<input type="hidden" id="pic${p.productId}" value="${p.defaultPicture}">
				
							</li>
						</c:if>
					</c:forEach>
				</div>		
			</div>
		</div>
	</div>
	<div class="footer">
		<ul class="tab-list">
			<li class="tab-item">
				<c:if test="${empty scansSession.outlet}">
					<c:if test="${scansSession.actScodeExists eq 'N'}">
						<a href="<%=basePath%>antifake/index">
							<i class="icon tab-icon"></i>
							<p>首页</p>
						</a>
					</c:if>
					<c:if test="${scansSession.actScodeExists eq 'Y'}">
						<a href="<%=basePath%>act/index">
							<i class="icon tab-icon"></i>
							<p>首页</p>
						</a>
					</c:if>
				</c:if>
				<c:if test="${!empty scansSession.outlet}">
					<a href="<%=basePath%>outlet/index">
						<i class="icon tab-icon"></i>
						<p>首页</p>
					</a>
				</c:if>
			</li>
			<li class="tab-item active">
				<a href="#"><i class="icon tab-icon"></i>
					<p>微商城</p>
				</a>
			</li>
			<li class="tab-item">
				<a href="<%=basePath%>${(empty scansSession.business)? '#':'shop/'}"> 
					<i class="icon tab-icon"></i>
					<p>积分商城</p>
				</a>
			</li>
			<li class="tab-item">
				<a href="<%=basePath%>${(empty memberSession)? '#':'member/'}">
					<i class="icon tab-icon"></i>
					<p>我的信息</p>
				</a>
			</li>

		</ul>
	</div>

	<!---------------- 弹出层 ----------------->
	<div class="mask">
		<div class="wrapper-box">
			<div class="goodsInfo">
				<div class="pic-box">
					<img src="../images/goods.png" alt="" id="pic1">
				</div>
				<div class="info-box">
					<div class="price">￥<span id="prdPrize1">20</span></div>
					<div class="specification">规格：<span id="prdSp1">袋</span></div>
				</div>
			</div>
			<div class="goodsNum">
				<span>选择数量</span>
				<div class="num-operation">
					<a href="javascript:;" class="btn btn-minus">&#8722;</a>
					<input type="text" value="1" id="prdCount">
					<a href="javascript:;" class="btn btn-add">&#43;</a>
				</div>
			</div>
			<div class="btn-wrapper">
				<a href="javascript:;" class="btn btn-sure">确定</a>
				<input type="hidden" id="prdId">
				<input type="hidden" id="prdPrize">
			</div>
			<div class="close-wrapper">
				<a href="javascript:;" class="btn btn-close"></a>
			</div>
		</div>
	</div>
	<!---------------- 弹出层 ----------------->
</body>

<script type="text/javascript" src="<%=basePath%>resources/js/antifake/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/js/antifake/common.js"></script>
<script>
	$(function () {
		$(".goodsNum .num-operation .btn-minus").click(function () {
			var num = parseInt($(this).parent().children("input").val());
			if (num == 1) {
				alert("数量最少为1");
				return;
			}
			num = num - 1;
			$(this).parent().children("input").val(num)
		})
		$(".goodsNum .num-operation .btn-add").click(function () {
			var num = parseInt($(this).parent().children("input").val());
			num = num + 1;
			$(this).parent().children("input").val(num)
		})

		$(".btn-sure").click(function () {
			var prdId = $("#prdId").val();
			var prdCount = $("#prdCount").val();
			var prdPrize = $("#prdPrize").val();
			$.ajax({
				url: '<%=basePath%>mall/addToCar',
				data: {
					"prdId": prdId,
					"prdCount": prdCount,
					"prdPrize": prdPrize
				},
				encode: false,
				success: function (data) {
					//alert(data);
					if (data == true) {
						showTips(true, "已经加入购物车~", 1000);
						$(".mask").hide();
					}
					if (data != true) {
						//showTips(false, "已经超过库存数量",1000);
						alert("已经超过库存数量,当前可添加量:" + data);
					}
				},
				error: function () {
					showTips(false, "抱歉，系统出错", 1000);
				}
			});
		})
		$(".btn-close").click(function () {
			$(".mask").hide();
		})
		$(".saveMoney").click(function () {
			$(".mask").show();
			var prdId = $(this).attr("id");
			$("#prdId").val(prdId);
			var prdPrize = $("#prize" + prdId).val();
			$("#prdPrize").val(prdPrize);
			$("#prdPrize1").text(prdPrize);
			var prdSp = $("#prdSp" + prdId).val();
			//alert(prdSp);
			$("#prdSp1").text(prdSp);
			var prdPic = $("#pic" + prdId).val();
			//alert(prdPic);
			$("#pic1").attr("src", prdPic);

		})
	})
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
					desc: '', // 分享描述
					link: '${shareLink}', // 分享链接，该链接域名或路径必须与当前页面对应的公众号JS安全域名一致
					imgUrl: '<%=basePath%>${scansSession.business.logopath}', // 分享图标
					success: function () {
						// 用户确认分享后执行的回调函数
						$.ajax({
							url: '<%=basePath%>antifake/shareReturn',
							data: {
								"shareType": 1,
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
								"shareType": 1,
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

</html>