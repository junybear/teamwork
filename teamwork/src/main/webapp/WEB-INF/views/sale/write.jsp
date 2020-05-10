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
                                <h4>매물 제목</h4>
                                <input type="text" name="stitle" placeholder="제목을 적어주세요" required>
                            </div>
                            
                            <div class="pf-title">
                                <h4>주소</h4>
                                <input type="text" id="sample4_roadAddress"  placeholder="주소를 찾아주세요" name="address"  class="corporateAddresscss" required readonly>
							   <input type="button" onclick="sample4_execDaumPostcode()" value="주소 찾기" class="site-btn"><br>
							   <span id="guide" style="color:#999;display:none"></span>
                            </div>
                            
                            <div class="pf-title">
                                <h4>가격</h4>
                                <input type="text" name="price" placeholder="가격을 적어주세요" required>
                            </div>
                            
                            
	                           
                            <div class="pf-summernote">
                                <h4>상세 정보</h4>
                                <ul class="nav nav-tabs" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link texteditor-switch" data-toggle="tab" href="#tabs-1" role="tab">Text</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link texteditor-switch active" data-toggle="tab" href="#tabs-2" role="tab">Visual</a>
                                    </li>
                                </ul>
                                
                                <textarea class="texteditor-content" name="scontent" placeholder="상세정보 입력" required></textarea>
                                
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
    
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
               
                document.getElementById("sample4_roadAddress").value = roadAddr;
                
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
</body>

</html>