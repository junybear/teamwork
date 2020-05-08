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
                        <h4>매물</h4>
                        <div class="bt-option">
                            <a href="/"><i class="fa fa-home"></i> Home</a>
                            <span>매물</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Property Section Begin -->
    <section class="property-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h4>매물 리스트</h4>
                    </div>
                </div>
            </div>
            <div class="row">
            <c:forEach items="${saleBoard}" var="slist">
                <div class="col-lg-4 col-md-6">
                    <div class="property-item">
	                        <div class="pi-pic set-bg" data-setbg="/upload-images/${ slist.imageList[0].thumbImage }">
	                            <div class="label">${ slist.list }</div>
	                        </div>
                        <div class="pi-text">
                            <a href="#" class="heart-icon"><span class="icon_heart_alt"></span></a>
                            <div class="pt-price">${ slist.price }원</div>
                            <h5><a href="detail?no=${ slist.no }&pageNo=${ pager.pageNo }">${ slist.stitle }</a></h5>
                            <p><span class="icon_pin_alt"></span>${ slist.address }</p>
                            <ul>
                            	<li><i class="fa fa-object-group"></i><fmt:formatDate value="${ slist.bdate }"
											pattern="yyyy년 MM월 dd일" /></li>
											<br>
                                <li><i class="fa fa-bathtub"></i>${ slist.bathroom }</li>
                                <li><i class="fa fa-bed"></i>${ slist.bedroom }</li>
                                <li><i class="fa fa-automobile"></i>${ slist.parking }</li>
                            </ul>
                            <div class="pi-agent">
                                <div class="pa-item">
                                    <div class="pa-info">
                                        <img src="/img/property/posted-by/pb-1.jpg" alt="">
                                        <h6>${ slist.swriter }</h6>
                                    </div>
                                    <div class="pa-text">
                                        	${ slist.sphone }
                                    </div>
                                </div>
                            </div>
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
             
                <div class="col-lg-12">
                    <div class="loadmore-btn">
                    <c:choose>
            <c:when test="${ not empty logionbroker }">
            <a href="/sale/write">글쓰기</a>
            </c:when>
            <c:otherwise>
           
           
            </c:otherwise>
            </c:choose>
        
                    </div>
                </div>
                <!-- 페이저 처리 하기 -->
            </div>
        </div>
    </section>
    <!-- Property Section End -->

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