<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="format-detection" content="telephone=no, email=no"/>
    <script src="<%=basePath%>resources/js/antifake/flexible.js"></script>
    <link rel="stylesheet" href="<%=basePath%>resources/css/antifake/personal.css">
    <link rel="stylesheet" href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <jsp:include page="../common/public.jsp"></jsp:include>
    <title>${scansSession.business.name}</title>
    <style type="text/css">
        .info_item a{
            display: block;
            width: 9.0133rem;
            line-height: 3em;
            margin-left: 0.5rem;
            font-size: 16px;
        }
        .info_item a span{
            margin-right:6.2rem; 
        }
    </style>
</head>
<body>
    <div id="page">
        <div class="header">
            <div class="back"><a href="<%=basePath%>member/userInfo"><i class="fa fa-chevron-left" aria-hidden="true"></i></a></div>
            <div class="title">
                <h1>系统信息</h1>
            </div>
        </div>
        <div class="content">
            <ul class="info_list">
                <li class="info_item">
                    <a href="<%=basePath%>member/personalInfo">
                        <span>我的信息</span>
                        <i class="fa fa-chevron-right" aria-hidden="true"  style="color: #666666"></i>
                    </a>
                </li>
                <li class="info_item">
                    <a href="<%=basePath%>member/task">
                        <span>我的任务</span>
                        <i class="fa fa-chevron-right" aria-hidden="true" style="color: #666666"></i>
                    </a>
                </li>
                <li class="info_item">
                    <a href="<%=basePath%>member/userSafe">
                        <span>我的安全</span>
                        <i class="fa fa-chevron-right" aria-hidden="true" style="color: #666666"></i>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</body>

</html>