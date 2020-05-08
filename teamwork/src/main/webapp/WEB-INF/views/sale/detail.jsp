<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">

<jsp:include page="/WEB-INF/views/includes/header.jsp"/>

<body>

    <!-- Property Details Section Begin -->
    
    <section class="property-details-section">
        <div class="property-pic-slider owl-carousel">
            <div class="ps-item">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="row">
                                <div class="col-lg-12 p-0">
                                    <div class="ps-item-inner large-item set-bg" data-setbg="/img/property/slider/ps-1.jpg"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="row">
                                <div class="col-sm-6 p-0">
                                    <div class="ps-item-inner set-bg" data-setbg="/img/property/slider/ps-2.jpg"></div>
                                </div>
                                <div class="col-sm-6 p-0">
                                    <div class="ps-item-inner set-bg" data-setbg="/img/property/slider/ps-2.jpg"></div>
                                </div>
                                <div class="col-sm-6 p-0">
                                    <div class="ps-item-inner set-bg" data-setbg="/img/property/slider/ps-4.jpg"></div>
                                </div>
                                <div class="col-sm-6 p-0">
                                    <div class="ps-item-inner set-bg" data-setbg="/img/property/slider/ps-5.jpg"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="ps-item">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="row">
                                <div class="col-lg-12 p-0">
                                    <div class="ps-item-inner large-item set-bg" data-setbg="/img/property/slider/ps-1.jpg"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="row">
                                <div class="col-sm-6 p-0">
                                    <div class="ps-item-inner set-bg" data-setbg="/img/property/slider/ps-2.jpg"></div>
                                </div>
                                <div class="col-sm-6 p-0">
                                    <div class="ps-item-inner set-bg" data-setbg="/img/property/slider/ps-2.jpg"></div>
                                </div>
                                <div class="col-sm-6 p-0">
                                    <div class="ps-item-inner set-bg" data-setbg="/img/property/slider/ps-4.jpg"></div>
                                </div>
                                <div class="col-sm-6 p-0">
                                    <div class="ps-item-inner set-bg" data-setbg="/img/property/slider/ps-5.jpg"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <form action="write" method="post">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="pd-text">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="pd-title">
                                    <a href="#" class="heart-icon"><span class="icon_heart_alt"></span></a>
                                    <div class="label">${ saleBoard.list }</div> 
                                    <div class="pt-price">${ saleBoard.price }</div>
                                    <h3>${ saleBoard.stitle }</h3>
                                    <p><span class="icon_pin_alt"></span>${ saleBoard.address }</p>
                                </div>
                            </div>
                            
                        </div>
                        <div class="pd-board">
                            <div class="tab-board">
                                <ul class="nav nav-tabs" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">Overview</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">Description</a>
                                    </li>
                                    
                                </ul><!-- Tab panes -->
                                <div class="tab-content">
                                    <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                        <div class="tab-details">
                                            <ul class="left-table">
                                                <li>
                                                    <span class="type-name">매물 유형</span>
                                                    <span class="type-value">${ saleBoard.list }</span>
                                                </li>
                                                <li>
                                                    <span class="type-name">판매자 ID</span>
                                                    <span class="type-value">${ saleBoard.swriter }</span>
                                                </li>
                                                <li>
                                                    <span class="type-name">판매가격</span>
                                                    <span class="type-value">${ saleBoard.price }</span>
                                                </li>
                                                <li>
                                                    <span class="type-name">중개인 전화번호</span>
                                                    <span class="type-value">${ saleBoard.sphone }</span>
                                                </li>
                                            </ul>
                                            <ul class="right-table">
                                             	<li>
                                                    <span class="type-name">글 작성날짜</span>
                                                    <span class="type-value"><fmt:formatDate value="${ saleBoard.bdate }"
													pattern="yyyy년 MM월 dd일" /></span>
                                                </li>
                                                <li>
                                                    <span class="type-name">침실 갯수</span>
                                                    <span class="type-value">${ saleBoard.bedroom }</span>
                                                </li>
                                                <li>
                                                    <span class="type-name">욕실 갯수</span>
                                                    <span class="type-value">${ saleBoard.bathroom }</span>
                                                </li>
                                                <li>
                                                    <span class="type-name">주차가능 댓수</span>
                                                    <span class="type-value">${ saleBoard.parking }</span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="tabs-2" role="tabpanel">
                                        <div class="tab-desc">
                                            <p>${ saleBoard.scontent }</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="pd-widget">
                            <h4>Floor plans</h4>
                            <c:forEach var="img" items="${ saleBoard.imageList }">
                            	<img src="/upload-images/${ img.savedName }" alt="" style="margin:5px">
                            </c:forEach>                            
                        </div>
                    </div>
                </div>
            </div>
            <div class="text-center">
		            <input type="button" id="listBtn" class="site-btn" value="목록">
		            
		            <c:if test="${ logionbroker.mid == saleBoard.swriter }">	
            		<input type="button" id="deleteBtn" class="site-btn" value="삭제">
            		</c:if>
            </div>
        </div>
        </form>
    </section>
    
    <!-- Property Details Section End -->

    

    <jsp:include page="/WEB-INF/views/includes/footer.jsp"/>

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
			$('#deleteBtn').on('click', function(event) {
				
				var yes = confirm("매물 '${saleBoard.stitle }' 글을 삭제할까요?");
				if (!yes) {
					return;
				}
				
				var form =
					makeForm('delete', ${ saleBoard.no }, ${ param.pageNo });
				form.submit();
			});
			
			$('#listBtn').on('click', function(event) {
				location.href = "list?pageNo=${ param.pageNo }";
			});

			function makeForm(action, no, pageNo, method="get") {
				var form = $('<form></form>');
				form.attr({
					'action': action,
					'method': method
				});
				form.append($('<input>').attr({
					"type": "hidden",
					"name": "no",
					"value" : no })
				);
				form.append($('<input>').attr({
					"type": "hidden",
					"name": "pageNo",
					"value" : pageNo })
				);
				
				form.appendTo("body");
				
				return form;
			}
			
		});

		
		
    </script>
    
</body>

</html>

