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
	<script src="${ctx}/resources/js/jquery.min.js"></script>
	<script src="${ctx}/resources/js/flexible.js"></script>
	<script src="${ctx}/resources/js/mui.min.js"></script>
	<link rel="stylesheet" href="${ctx}/resources/css/first-usersInfo-new.css">
	<link rel="stylesheet" href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<title>${scansSession.business.name}</title>
</head>

<body>
	<!--头部-->
	<header>
		<div class="Icon">

			<c:if test="${sessionScope.memberSession.userPic == '/resources/images/activity/default_header.jpg'}">
				<img src="${ctx}/resources/img/toux.png" alt="">
			</c:if>
			<c:if test="${sessionScope.memberSession.userPic != '/resources/images/activity/default_header.jpg'}">
				<img src="${sessionScope.memberSession.userPic}" alt="">
			</c:if>

		</div>
		<!--设置图标-->
		<a href="${ctx}/member/personalInfo">
			<div class="set">
				<img src="${ctx}/resources/img/set.png" />
			</div>
		</a>
		<div class="user-name">${sessionScope.memberSession.memberCode}</div>
		<div class="user-iphone">${sessionScope.memberSession.telphone}</div>
		<div class="glasses">
			<img src="${ctx}/resources/img/yan.png" alt="头像" />
		</div>
	</header>
	<div class="list-1">
		<div>
			<a href="${ctx}/member/redPack">
				<!--返利信息-->
				<div class="value">${totalRedPack}</div>
				<div class="unit">红包账户(元)</div>
			</a>
		</div>
		<div class="line"></div>
		<div>
			<a href="#">
				<!--积分信息-->
				<div class="value">${totalScore}</div>
				<div class="unit">当前积分</div>
			</a>
		</div>
	</div>
	<!--信息中心列表-->
	<div class="list-2">
		<a href="${ctx}/member/personalInfo">
			<div class="imges">
				<img src="${ctx}/resources/img/data-i.png" />
			</div> <span class="Message-1">个人资料</span> <span class="Message-2">查看/修改资料详情</span>
		</a>
		<div></div>
		<a href="${ctx}/member/task">
			<div class="imges">
				<img src="${ctx}/resources/img/task.png" />
			</div> <span class="Message-1">我的任务</span> <span class="Message-2" style="color: #007AFF;">任务进行中</span>
		</a> <a href="${ctx}/member/managAddress">
			<div class="imges">
				<img src="${ctx}/resources/img/site.png" />
			</div> <span class="Message-1">收货地址</span> <span class="Message-2">地址管理</span>
		</a>
		<div></div>
		<a href="${ctx}/member/userSafe">
			<div class="imges">
				<img src="${ctx}/resources/img/account.png" />
			</div> <span class="Message-1">账户安全</span> <span class="Message-2">尚未绑定邮箱</span>
		</a> <a href="${ctx}/member/actionOrder" style="border-bottom: none;">
			<div class="imges">
				<img src="${ctx}/resources/img/win.png" />
			</div> <span class="Message-1">中奖信息</span> <span class="Message-2">最新中奖记录</span>
		</a>
		<div></div>
		<a href="${ctx}/member/rebate" style="border-bottom: none;">
			<div class="imges">
				<img src="${ctx}/resources/img/rebate.png" />
			</div> <span class="Message-1">返利中心</span> <span class="Message-2">查看返利详情</span>
		</a>
	</div>

	<div class="footer">
		<ul class="tab-list">
			<li class="tab-item">
				<!-- write by jianbin  2017.06.16 -->
				<c:if test="${empty scansSession.outlet}">
					<c:if test="${scansSession.actScodeExists eq 'N'}">
						<a href="${ctx}/antifake/index"> <i class="icon tab-icon"></i>
							<p>首页</p>
						</a>
					</c:if>
					<c:if test="${scansSession.actScodeExists eq 'Y'}">
						<a href="${ctx}/act/index"> <i class="icon tab-icon"></i>
							<p>首页</p>
						</a>
					</c:if>
				</c:if>
				<c:if test="${!empty scansSession.outlet}">
					<a href="${ctx}/outlet/index"> <i class="icon tab-icon"></i>
						<p>首页</p>
					</a>
				</c:if>
			</li>
			<li class="tab-item">
				<c:if test="${ErpriseRole eq 2 || ErpriseRole eq 4}">
					<a href="${ctx}/${(empty scansSession.outlet)? 'antifake/companyGoods':'outlet/companyGoods'}">
						<i class="icon tab-icon"></i>
						<p>微商城</p>
					</a>
				</c:if>
			</li>
			<li class="tab-item"><a href="${ctx}/${'shop/'}"> <i class="icon tab-icon"></i>
					<p>积分商城</p>
				</a></li>
			<li class="tab-item active"><a href="#"> <i class="icon tab-icon"></i>
					<p>我的信息</p>
				</a></li>
		</ul>
	</div>
</body>

</html>