<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">

<jsp:include page="/WEB-INF/views/includes/header.jsp"/>

<body>
    
    <!-- Blog Hero Section Begin -->
    <form action="write" method="post">
    <section class="blog-hero-section set-bg" data-setbg="/img/blog/bh-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="bh-text">
                    
                        <h4>${ noticeBoard.title }</h4>
                           <ul>
                           	<li>Number<span>${ noticeBoard.no }</span></li>
                               <li>by <span>관리자</span></li>
                               <li><fmt:formatDate value="${ noticeBoard.ndate }"
											pattern="yyyy년 MM월 dd일" /></li>
                           </ul>
                    </div>
                    
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Hero Section End -->

    <!-- Blog Details Section Begin -->
    <section class="blog-details-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 m-auto p-0">
                    <div class="blog-details-content">
                    
                       
                        <div class="bc-quote">
                            <div class="bq-icon">
                                <i class="fa fa-quote-left"></i>
                            </div>
                            <div class="bq-text">
                                <p>${ noticeBoard.content }</p>
                            </div>
                        </div>
                        
                        </div>
                    </div>
                </div>
            </div>
            <div class="text-center">
		            <input type="button" id="listBtn" class="site-btn" value="목록">	
            		<input type="button" id="deleteBtn" class="site-btn" value="삭제">
            </div>
            
            
    </section>
    </form>
    <!-- Blog Details Section End -->

    <!-- Contact Section Begin -->
    
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
			$('#deleteBtn').on('click', function(event) {
				
				var yes = confirm("공지사항 '${ noticeBoard.title }' 글을 삭제할까요?");
				if (!yes) {
					return;
				}
				
				var form =
					makeForm('delete', ${ noticeBoard.no }, ${ param.pageNo });
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