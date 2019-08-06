<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/head.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="format-detection" content="telephone=no" />
    <script src="<%=basePath%>resources/js/antifake/flexible.js"></script>
    <link rel="stylesheet" href="<%=basePath%>resources/css/antifake-new/companyIntroduce.css">
    <link rel="stylesheet" href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <jsp:include page="../common/public.jsp"></jsp:include>
    <title>${scansSession.business.name}</title>
</head>
<body>
<div id="page">
    <%-- <div class="header">
        <div class="back">
        <c:if test="${empty scansSession.outlet}">
      	<c:if test="${scansSession.actScodeExists eq 'N'}">
      	<a href="<%=basePath%>antifake/index">
        </c:if>
        <c:if test="${scansSession.actScodeExists eq 'Y'}">
      	<a href="<%=basePath%>act/index">
        </c:if>
        </c:if>
        
        <c:if test="${!empty scansSession.outlet}">
        <a href="<%=basePath%>outlet/index">
        </c:if>
        <i class="fa fa-chevron-left" aria-hidden="true">
        </i>
        </a>
        </div>
        <div class="title"><h1>${scansSession.business.name}</h1></div>
    </div> --%>
    <div class="content">
            <div class="header" >
                <a href="<%=basePath%>antifake/index"></a>
                <h4>公司介绍</h4>
            </div>
            <div class="banner">
                <img src="<%=basePath%>${!empty adPath?adPath:'resources/images/antifake/company_introduce.png'}" alt="">        
            </div>
            <div class="board">
            <c:if test="${menu.appMenu[12].isDisplay==1 }">
                <c:if test="${!empty menu.appMenu[12].menuAlias }">
                            <span class="boardCheck" id="appProfiles">${menu.appMenu[12].menuAlias}</span>
                        </c:if>
                        <c:if test="${empty menu.appMenu[12].menuAlias }">
                            <span class="boardCheck" id="appProfiles">${menu.appMenu[12].menuName}</span>
                        </c:if>
                        </c:if>
                <c:if test="${menu.appMenu[13].isDisplay==1 }">
                <c:if test="${!empty menu.appMenu[13].menuAlias }">
                <span id="appCulture">${menu.appMenu[13].menuAlias }</span>
                </c:if>
                 <c:if test="${empty menu.appMenu[13].menuAlias }">
                <span id="appCulture">${menu.appMenu[13].menuName }</span>
                </c:if>
                </c:if>
                <c:if test="${menu.appMenu[14].isDisplay==1 }">
                <c:if test="${!empty menu.appMenu[14].menuAlias }">
                <span id="appCooperation">${menu.appMenu[14].menuAlias }</span>
                </c:if>
                 <c:if test="${empty menu.appMenu[14].menuAlias }">
                <span id="appCooperation">${menu.appMenu[14].menuName }</span>
                </c:if>
                </c:if>
            </div>
            <div class="comp-cont">
                <div class="comp-cont1" id="Profiles">
                    <div class="textBox">
                        <p>${AppProfiles}</p>
                        <!-- <p>1.山---太白山，中华龙脉，秦岭主峰，父亲山。</p>
                        <p>2.水---天池 （大爷海、二爷海、三爷海），汤峪河，地温泉</p>
                        <p>3.神---太白金星（东方启明星，夕位于西方称“太白），在太阳系中、既接近太阳又接近地球的星星、二十八星宿之一、远古“太白族人”的化身。</p>
                        <p>4.人---诗仙、酒仙--李白，张载（眉伯、张子、横渠先生）药王孙思邈。</p> -->
                        <c:if test="${empty AppProfiles}">
                            <div class="noShop">
                                <img src="<%=basePath%>resources/images/antifake/kong.png" alt="">
                            </div>
                        </c:if>
                    </div>
                </div>
                <div class="comp-cont1" id="Culture">
                    <div class="textBox">
                        <p>${AppCulture}</p>
                        <!-- <p>1.山---太白山，中华龙脉，秦岭主峰，父亲山。</p>
                        <p>2.水---天池 （大爷海、二爷海、三爷海），汤峪河，地温泉</p>
                        <p>3.神---太白金星（东方启明星，夕位于西方称“太白），在太阳系中、既接近太阳又接近地球的星星、二十八星宿之一、远古“太白族人”的化身。</p>
                        <p>4.人---诗仙、酒仙--李白，张载（眉伯、张子、横渠先生）药王孙思邈。</p> -->
                        <c:if test="${empty AppCulture}">
                            <div class="noShop">
                                <img src="<%=basePath%>resources/images/antifake/kong.png" alt="">
                            </div>
                        </c:if>
                    </div>
                </div>
                <div class="comp-cont1" id="Cooperation">
                    <div class="textBox">
                        <p>${AppCooperation}</p>
                        <!-- <p>1.山---太白山，中华龙脉，秦岭主峰，父亲山。</p>
                        <p>2.水---天池 （大爷海、二爷海、三爷海），汤峪河，地温泉</p>
                        <p>3.神---太白金星（东方启明星，夕位于西方称“太白），在太阳系中、既接近太阳又接近地球的星星、二十八星宿之一、远古“太白族人”的化身。</p>
                        <p>4.人---诗仙、酒仙--李白，张载（眉伯、张子、横渠先生）药王孙思邈。</p> -->
                        <c:if test="${empty AppCooperation}">
                            <div class="noShop">
                                <img src="<%=basePath%>resources/images/antifake/kong.png" alt="">
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
</div>
</body>
</html>
<script src="<%=basePath%>resources/js/antifake/jquery.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function(){
        let html;
        showContent();
        let span = $(".board span");
        span.click(function (e){ 
            $(this).parents().children().removeClass("boardCheck");
            $(this).addClass("boardCheck");
        });
    	$('#appProfiles').click(function(){
    	    showContent();
    	});
    	$('#appCulture').click(function(){
    		$("#Profiles").hide();
    		$("#Culture").show();
    		$("#Cooperation").hide();
    	})
    	$('#appCooperation').click(function(){
    		$("#Profiles").hide();
    		$("#Culture").hide();
    		$("#Cooperation").show();
           
    	});
      
    })
    function showContent(){
        $("#Profiles").show();
    	$("#Culture").hide();
    	$("#Cooperation").hide();
    }
    
</script>