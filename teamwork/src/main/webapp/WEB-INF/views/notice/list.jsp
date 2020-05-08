<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">

<jsp:include page="/WEB-INF/views/includes/header.jsp"/>

<body>
  

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section spad set-bg" data-setbg="/img/breadcrumb-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h4>공지사항</h4>
                        <div class="bt-option">
                            <a href="./index.html"><i class="fa fa-home"></i> Home</a>
                            <span>공지사항</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Blog Section Begin -->
    <section class="blog-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                <c:forEach items="${noticeBoard}" var="nlist">
                    <div class="blog-item-list">
                         <div class="blog-item large-blog">
                            <div class="bi-pic">
                                <img src="/img/blog/2020_guide_notice.jpg">
                            </div>
	                            <div class="bi-text">
	                                <h4><a href="detail?no=${ nlist.no }&pageNo=${ pager.pageNo }">${ nlist.title }</a></h4>
	                                <ul>
	                                	<li>Number<span>${ nlist.no }</span></li>
	                                    <li>by <span>관리자</span></li>
	                                    <li><fmt:formatDate value="${ nlist.ndate }"
											pattern="yyyy년 MM월 dd일" /></li>
	                                </ul>
			                        </div>	
		                        </div>
	                        </div>
	                        </c:forEach>	
                        
                    <div class="blog-pagination property-pagination ">
                        
                        <ul>
                        	<div class="icon">
                       		 		<li>${ pager }</li>
                       		 </div>
                        </ul>
                    </div>
                     <div class="subscribe-form">
                            <div class="section-title sidebar-title-b">
                            </div>
                            <form action="list" method="get">
                            	<input type="button" value="공지사항작성" class="site-btn" onclick="location.href='write'"/>
                            </form>
                        </div>
                        
                </div>
                <div class="col-lg-4">
                    
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->

    <!-- Contact Section Begin -->
    <section class="contact-section">
        <div class="container">
            
        </div>
        <div class="cs-map">
            
        </div>
    </section>
    <!-- Contact Section End -->

    <!-- Footer Section Begin -->
    <jsp:include page="/WEB-INF/views/includes/footer.jsp"/>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="/resources/js/jquery-3.3.1.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/jquery.magnific-popup.min.js"></script>
    <script src="/resources/js/mixitup.min.js"></script>
    <script src="/resources/js/jquery-ui.min.js"></script>
    <script src="/resources/js/jquery.nice-select.min.js"></script>
    <script src="/resources/js/jquery.slicknav.js"></script>
    <script src="/resources/js/owl.carousel.min.js"></script>
    <script src="/resources/js/jquery.richtext.min.js"></script>
    <script src="/resources/js/image-uploader.min.js"></script>
    <script src="/resources/js/main.js"></script>
    
    <script type="text/javascript">
		$(function(){
			var newBno = '${ newBno }';
		});
		
    </script>
</body>

</html>