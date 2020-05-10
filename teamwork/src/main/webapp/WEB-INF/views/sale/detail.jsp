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
                                        <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">매물 정보</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">매물 상세 정보</a>
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
                                                    <span class="type-name">매물 주소</span>
                                                    <span class="type-value">${ saleBoard.address }</span>
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
                        <div id="map" style="width:500px;height:400px;"></div>
                    </div>
                </div>
            </div>
            <br><br><br>
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
    
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2c12571eebb6a33ecaacc7659dba942d&libraries=services"></script>
    
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

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${ saleBoard.address }', function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">매물</div>'
	        });
	        infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
    </script>
    
</body>

</html>

