<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Aler Template">
    <meta name="keywords" content="Aler, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Aler | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700,800,900&display=swap"
        rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/css/style.css" type="text/css">
    <link rel="stylesheet" href="/css/richtext.min.css" type="text/css">
    <link rel="stylesheet" href="/css/image-uploader.min.css" type="text/css">
    <link rel="stylesheet" href="/css/slicknav.min.css" type="text/css">
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Offcanvas Menu Wrapper Begin -->
    <div class="offcanvas-menu-overlay"></div>
    <div class="offcanvas-menu-wrapper">
        <div class="canvas-close">
            <span class="icon_close"></span>
        </div>
        <div class="logo">
            <a href="/">
                <img src="/img/logo.png" alt="">
            </a>
        </div>
        <div id="mobile-menu-wrap"></div>
        <div class="om-widget">
             <c:choose>
            <c:when test="${loginuser.authority eq 'u' }">
            <h6 class="active" style="color: teal;">${loginuser.mid }님이 로그인중 입니다.</h6>
            </c:when>
          <c:when test="${loginuser.authority eq 'b' }">
            <h6 class="active" style="color: teal;">"중개인" ${loginuser.mid }님이 로그인중 입니다.</h6>
            </c:when>
            <c:otherwise>        
            </c:otherwise>
            </c:choose> 
            
            <c:choose>
            <c:when test="${ empty loginuser }">
             
            <a href="/user/login" class="hw-btn">login</a>
            </c:when>
            <c:otherwise>
            
            <a href="/user/logout" class="hw-btn">logout</a>
           
            </c:otherwise>
            </c:choose>
        </div>
        <div class="om-social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-youtube-play"></i></a>
            <a href="#"><i class="fa fa-instagram"></i></a>
            <a href="#"><i class="fa fa-pinterest-p"></i></a>
        </div>
    </div>
    <!-- Offcanvas Menu Wrapper End -->

    <!-- Header Section Begin -->
    <header class="header-section">
        <div class="hs-top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-2">
                        <div class="logo">
                            <a href="/"><img src="/img/logo.png" alt=""></a>
                        </div>
                    </div>
                    <div class="col-lg-10">
                        <div class="ht-widget">
             <c:choose>
            <c:when test="${loginuser.authority eq 'u' }">
            <h6 class="active" style="color: teal;">${loginuser.mid }님이 로그인중 입니다.</h6>
            </c:when>
          <c:when test="${loginuser.authority eq 'b' }">
            <h6 class="active" style="color: teal;">"중개인" ${loginuser.mid }님이 로그인중 입니다.</h6>
            </c:when>
            <c:otherwise>        
            </c:otherwise>
            </c:choose> 
         
            <c:choose>
            <c:when test="${ empty loginuser }">
            <a href="/user/login" class="hw-btn">login</a>
            </c:when>
            <c:otherwise>
           
            <a href="/user/logout" class="hw-btn">logout</a>
            </c:otherwise>
            </c:choose>
                        </div>
                    </div>
                </div>
                <div class="canvas-open">
                    <span class="icon_menu"></span>
                    
                </div>
            </div>
        </div>
        <div class="hs-nav">
            <div class="container">
                <div class="row">
                    <div class="col-lg-9">
                        <nav class="nav-menu">
                            <ul>
                                <li class="active"><a href="/">Home</a></li>
                                <li><a href="/notice/list">공지사항</a></li>
                                <li><a href="/sale/list">매물</a>
                                    <ul class="dropdown">
                                        <li><a href="./property.html">Property Grid</a></li>
                                        <li><a href="./profile.html">Property List</a></li>
                                        <li><a href="./property-details.html">Property Detail</a></li>
                                        <li><a href="./property-comparison.html">Property Comperison</a></li>
                                        <li><a href="./property-submit.html">Property Submit</a></li>
                                    </ul>
                                </li>
                                <c:choose>
                                <c:when test="${loginuser.authority eq 'u' }">
                               <li><a href="/user/userProfileModifyView">회원 정보 수정</a></li>
                                </c:when>
                                <c:when test="${loginuser.authority eq 'b' }">
                                <li><a href="/broker/brokerProfileModifyView">중개인 정보 수정</a></li>
                                </c:when>
                                <c:otherwise> 
                                        
            					</c:otherwise>
            					</c:choose>
                               
                                
                                <c:choose>
                                 <c:when test="${ empty loginuser }">
            					<li><a href="/user/register">회원가입</a></li>
                                <li><a href="/broker/brokerRegister">중개인 회원가입</a></li>
            					</c:when>
            					<c:otherwise>
                                
                                </c:otherwise>
                                </c:choose>
                            </ul>
                        </nav>
                    </div>
                    <div class="col-lg-3">
                        <div class="hn-social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-youtube-play"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-pinterest-p"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- Header End -->
