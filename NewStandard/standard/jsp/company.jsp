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
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="format-detection" content="telephone=no" />
<script src="http://res.wx.qq.com/open/js/jweixin-1.1.0.js"></script>
<script src="<%=basePath%>resources/js/antifake/flexible.js"></script>
<link rel="stylesheet" href="<%=basePath%>resources/css/antifake-new/common.css">
<link rel="stylesheet" href="<%=basePath%>resources/css/antifake-new/company.css">
<link rel="stylesheet" href="<%=basePath%>resources/css/antifake/new/tanchuang.css" />
<link rel="stylesheet" href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>${scansSession.business.name}</title>
	<style type="text/css">
		.banner{
			position: relative;
			overflow: auto;
		}
		.banner ul{
			width: 100%;
			height:100%;
		}
		.banner ul li{
			width: 100%;
			height:100%;
			float: left;
		}
	</style>
</head>
<body>
	<div id="page">
		<div class="content">
			<div class="mainInfo-box banner">
				<div class="searchBar">
					<form action="<%=basePath%>antifake/companyGoods" method="post" id="searchForm">
						<i class="fa fa-search" aria-hidden="true"></i>
						<input type="text" class="search" id="searchId" name="productName" value="${query.productName}" placeholder="请输入商品名称">
					</form>
					<a href="<%=basePath%>cart/productList" class="shoppingCar"> 
						<img src="<%=basePath%>resources/images/antifake/canpinxinxi-gouwuche.png"/>
						<c:if test="${cartCount!=0}">
							<span>${cartCount}</span>
						</c:if>
					</a>	
				</div>
				<ul>
					<c:forEach items="${advertisements}" var="advertisement">
						<li>
							<img src="<%=basePath%>${advertisement.path}" style="width: 100%; height: 4.4rem;">
						</li>
					</c:forEach>
				</ul>
			</div>
			<div class="nav-box">
				<div class="title-box">
					<div class="title">
						<img src="<%=basePath%>resources/img/new/new.png" alt="" class="title-pic lazy"> 产品系列
					</div>
				</div>
				<ul class="nav-list">
					<c:forEach items="${brands}" var="brand">
						<li class="nav-item">
							<a href="<%=basePath%>antifake/brandDtl?brandName=${brand.name}&id=${brand.id}">
								<img data-original="<%=basePath%>${brand.businessPhotos.path}" alt="" class="product-pic lazy">
								<div class="title">${brand.name}</div>
							</a>
						</li>
					</c:forEach>
				</ul>
				<c:if test="${empty brands}"></c:if>
					<div class="noShop">
						<img src="<%=basePath%>resources/images/antifake/kongt.png" alt="">
						<p>暂无商品</p>
					</div>
				</c:if>
			</div>
			<div class="goods-box">
				<div class="title-box">
					<div class="title">
						<img data-original="<%=basePath%>resources/img/new/new.png" alt="" class="title-pic lazy"> 精品推荐
					</div>
				</div>
				<div class="goods-list">
					<c:forEach var="p" items="${product }">
						<c:if test="${!empty p.productId }">
							<li class="goods-item">
								<a href="<%=basePath %>antifake/productInfo?productId=${p.productId}">
									<div class="goods-pic">
										<img  class="lazy" data-original="<%=basePath%>${p.defaultPicture}" alt="">
									</div>
									<div class="goods-info">
										<div class="name">${p.productName}</div>
										<div class="price">
											市场价：¥<span>${empty p.newPrice?0:p.newPrice}</span>
										</div>
										<div class="discountPrize">
											¥<span>${empty p.newPrice?0:p.newPrice}</span>
										</div>
									</div>
								</a>
								<c:if test="${p.shelvesStatus==1 }">
									<div class="saveMoney" id="${p.productId}">
										<span><img src="<%=basePath%>resources/images/antifake/gouwuchehong.png"/></span>
									</div> 
									<input type="hidden" id="prize${p.productId}" value="${empty p.newPrice?0:p.newPrice}" /> 
									<input type="hidden" id="prdSp${p.productId}" value="${p.specifications}" /> 
									<input type="hidden" id="pic${p.productId}" value="${p.defaultPicture}">
								</c:if>
								<c:if test="${p.shelvesStatus!=1 }">
									<div class="saveMoney-no">
										<span><img src="<%=basePath%>resources/images/antifake/gouwuchehui.png" onclick="shelves()"/></span>
									</div>
								</c:if>
							</li>						     
						</c:if>
					</c:forEach>
				</div>
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
				<li class="tab-item active">
					<a href="#">
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
	<!---------------- 弹出层 ----------------->
	<div class="mask">
		<div class="wrapper-box">
			<div class="goodsInfo">
				<div class="pic-box">
					<img alt="" id="pic1">
				</div>
				<div class="info-box">
					<div class="price">
						￥<span id="prdPrize1">20</span>
					</div>
					<div class="specification">
						规格：<span id="prdSp1">袋</span>
					</div>
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
</body>
</html>
<script type="text/javascript" src="<%=basePath%>resources/js/antifake/jquery.js"></script>
<script src="<%=basePath%>resources/js/antifake/jquery.lazyload.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/js/antifake/common.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/js/antifake/unslider.js"></script>
<script type="text/javascript">
	$(function(){
		let banner = $(".banner")
		banner.unslider({
            speed: 500,
			delay: 3000,
			keys: false,
			dots: true,
			loop: true
        })
	})
	function shelves(){
		alert("该商品暂未上架，请选择其他商品购买！");
		return;
	}
	let search = $("#searchId") 
	search.focusout(function () {
		var flag = "${flag}";
		if (search.val() != "" && search.val() != null) {
			showTips(true, "正在查询~", 800);
			$("#searchForm").submit();
		}
		if ((search.val() == "" || search.val() == null) && flag == 2) {
			showTips(true, "正在查询~", 800);
			$("#searchForm").submit();
		}
	});
	$(function () {
		let minus = $(".goodsNum .num-operation .btn-minus") 
			add = $(".goodsNum .num-operation .btn-add")
			sure = $(".btn-sure");
		minus.click(function () {
			var num = parseInt($(this).parent().children("input").val());
			if (num == 1) {
				alert("数量最少为1");
				return;
			}
			num = num - 1;
			$(this).parent().children("input").val(num)
		});
		add.click(function () {
			var num = parseInt($(this).parent().children("input").val());
			num = num + 1;
			$(this).parent().children("input").val(num)
		});
		sure.click(function () {
			var prdId = $("#prdId").val();
			var prdCount = $("#prdCount").val();
			var prdPrize = $("#prdPrize").val();
			var shelf = "${shelfFlag}";
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
		let close = $(".btn-close")
			mask = $(".mask")
		close.click(function () {
			mask.hide();
		})
		$(".saveMoney").click(function () {
			mask.show();
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

		});
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
		};

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
								data : {
									"shareType" : 1,
									"productId" : '${productId}',
									"link" : '${shareLink}',
									"toShare" : 2
								},
								encode : false
							});
						},
						cancel : function() {
							// 用户取消分享后执行的回调函数
						}
					});
				});
			}
		});
</script>