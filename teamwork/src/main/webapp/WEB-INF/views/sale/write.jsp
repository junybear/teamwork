<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html lang="ko">

<jsp:include page="/WEB-INF/views/includes/header.jsp"/>
    <!-- Header End -->

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section spad set-bg" data-setbg="/img/breadcrumb-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h4>매물 올리기</h4>
                        <div class="bt-option">
                            <a href="/"><i class="fa fa-home"></i> Home</a>
                            <span>매물 등록</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Property Submit Section Begin -->
    <section class="search-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-10">
                    <div class="property-submit-form">
                        <form action="write" method="post" enctype="multipart/form-data"> <!-- enctype = 파일업로드 -->
                        <div class="pf-title">
                        <h4>매물 유형</h4>
                        <table id="option-table">
                        	<tr>
                        		<th>유형</th>
                        		<td>
                        			<select class="sm-width" name="list" id="list">
				                        <option>원룸</option>
				                        <option>투룸</option>
				                        <option>아파트</option>
				                        <option>빌라</option>
				                        <option>오피스텔</option>
				                    </select>
                        		</td>
                        	
                        		<th>욕실</th>
                        		<td>
	                        		<select class="sm-width" name="bathroom" id="bathroom">
				                        <option>1개</option>
				                        <option>2개</option>
				                        <option>3개</option>
				                    </select>
				                </td>
                        	
                        		<th>침실</th>
                        		<td>
                        			<select class="sm-width" name="bedroom" id="bedroom">
				                        <option>1개</option>
				                        <option>2개</option>
				                        <option>3개</option>
				                    </select>
                        		</td>
                        	
                        		<th>주차 가능 댓수</th>
                        		<td>
                        			<select class="sm-width" name="parking" id="parking">
				                        <option>1대</option>
				                        <option>2대</option>
				                        <option>3대</option>
				                    </select>
                        		</td>
                        	</tr>
                        </table>
                        </div>
                           

                            <div class="pf-title">
                                <h4>Title</h4>
                                <input type="text" name="stitle" placeholder="제목을 적어주세요">
                            </div>
                            
                            <div class="pf-title">
                                <h4>Address</h4>
                                <input type="text" name="address" placeholder="주소를 적어주세요">
                            </div>
                            
                            <div class="pf-title">
                                <h4>Price</h4>
                                <input type="text" name="price" placeholder="가격을 적어주세요">
                            </div>
                            
                            
	                           
                            <div class="pf-summernote">
                                <h4>Content</h4>
                                <ul class="nav nav-tabs" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link texteditor-switch" data-toggle="tab" href="#tabs-1" role="tab">Text</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link texteditor-switch active" data-toggle="tab" href="#tabs-2" role="tab">Visual</a>
                                    </li>
                                </ul>
                                
                                <textarea class="texteditor-content" name="scontent"></textarea>
                                
                            </div>
                            
                            <div class="x">
                                <h4>사진올리기</h4>
                                	<input type="file" id="images" name="images" multiple>
                            </div>
                            	<div class="select_img"> <img src="" /></div>
                            
                            <button type="submit" class="site-btn">등록</button>
                            <input type="hidden" name="mno" value="${ loginuser.mno }">
                            <input type="hidden" name="swriter" value="${ loginuser.mid }">
                            <input type="hidden" name="sphone" value="${ loginuser.phone }">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Property Submit Section End -->

    
<jsp:include page="/WEB-INF/views/includes/footer.jsp"/>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="/js/jquery-3.3.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/jquery.magnific-popup.min.js"></script>
    <script src="/js/mixitup.min.js"></script>
    <script src="/js/jquery-ui.min.js"></script>
    <script src="/js/jquery.nice-select.min.js"></script>
    <script src="/js/jquery.slicknav.js"></script>
    <script src="/js/owl.carousel.min.js"></script>
    <script src="/js/jquery.richtext.min.js"></script>
    <script src="/js/image-uploader.min.js"></script>
    <script src="/js/main.js"></script>
    
    <script type="text/javascript">
		$(function() {
			$('#option-table td').css("padding-left", "20px");
			$('#option-table th').css("padding-left", "40px");
			$('#option-table th:first').css("padding-left", "0px");
			

			$("#images").change(function(){
			   if(this.files && this.files[0]) {
			    var reader = new FileReader;
			    reader.onload = function(data) {
			     $(".select_img img").attr("src", data.target.result).width(300);        
			    }
			    reader.readAsDataURL(this.files[0]);
			   }
			  });
			<%=request.getRealPath("/") %>

			
		});
    </script>
</body>

</html>