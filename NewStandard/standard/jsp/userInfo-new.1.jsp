<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script>
	var ctx = '${ctx}';
</script>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<script src="${ctx}/resources/js/flexible.js"></script>
	<link rel="stylesheet" href="${ctx}/resources/css/first-usersInfo-new.css">
	<link rel="stylesheet" href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<title>${scansSession.business.name}</title>
</head>

<body>
	<header>
		<div class="Icon">
			<c:if test="${sessionScope.memberSession.userPic == '/resources/images/activity/default_header.jpg'}">
				<img src="${ctx}/resources/img/toux.png" alt="">
			</c:if>
			<c:if test="${sessionScope.memberSession.userPic != '/resources/images/activity/default_header.jpg'}">
				<img src="${sessionScope.memberSession.userPic}" alt="">
			</c:if>
		</div>
		<!-- <a href="${ctx}/member/personalInfo">
			<div class="set">
				<img src="${ctx}/resources/img/set.png" />
			</div>
		</a> -->
		<div class="user-name">${sessionScope.memberSession.memberCode}</div>
		<div class="user-iphone">${sessionScope.memberSession.telphone}</div>
		<div class="glasses">
			<img src="${ctx}/resources/img/yan.png" alt="头像" />
		</div>
	</header>
	<div class="list-1">
		<div>
			<a href="${ctx}/member/redPack">
				<div class="value">${totalRedPack}</div>
				<div class="unit">红包账户(元)</div>
			</a>
		</div>
		<div class="line"></div>
		<div>
			<a href="#">
				<div class="value">${totalScore}</div>
				<div class="unit">当前积分</div>
			</a>
		</div>
	</div>
	<!--信息中心列表-->
	<div class="list-2">
		<a href="${ctx}/member/personalInfo">
			<div class="list-2-box">
				<div class="images images1"></div> 
				<span class="Message-1">个人资料</span>
			</div>
		</a>
		<!-- <a href="${ctx}/mall/orderHome">
			<div class="list-2-box">
				<div class="images"></div> 
				<span class="Message-1">订单中心</span>
			</div>
		</a> -->
		<div class="line"></div>
		<a href="${ctx}/member/task">
			<div class="list-2-box">
				<div class="images images2"></div> 
				<span class="Message-1">我的任务</span> 
			</div>
		</a> 
		<a href="${ctx}/member/managAddress">
			<div class="list-2-box">
				<div class="images images3"></div> 
				<span class="Message-1">收货地址</span>
			</div>
		</a>
		<div class="line"></div>
		<a href="${ctx}/member/userSafe">
			<div class="list-2-box">
				<div class="images images4"></div>
				<span class="Message-1">账户安全</span>
			</div>
		</a> 
		<a href="${ctx}/member/actionOrder" style="border-bottom: none;">
			<div class="list-2-box">
				<div class="images images5"></div> 
				<span class="Message-1">中奖信息</span>
			</div>
		</a>
		<div class="line"></div>
		<a href="${ctx}/member/rebate" style="border-bottom: none;">
			<div class="list-2-box">
				<div class="images images6"></div>
				<span class="Message-1">返利中心</span>
			</div>
		</a>
	</div>
	<div class="footer">
		<ul class="tab-list">
			<!-- 1 -->
			<c:if test="${menu.appMenu[0].isDisplay==1 }">
			<li class="tab-item">
				<c:if test="${empty scansSession.outlet}">
					<c:if test="${scansSession.actScodeExists eq 'N'}">
						<a href="${ctx}/antifake/index"> 
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
						<a href="${ctx}/act/index"> 
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
					<a href="${ctx}/outlet/index"> 
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
						<a href="${ctx}/${(empty scansSession.outlet)? 'antifake/companyGoods':'outlet/companyGoods'}">
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
				<li class="tab-item">
					<a href="${ctx}/${'shop/'}">
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
				<li class="tab-item active">
					<a href="#"> 
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
<script src="${ctx}/resources/js/jquery.min.js"></script>
<script src="${ctx}/resources/js/mui.min.js"></script>
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
		};
	})
</script>