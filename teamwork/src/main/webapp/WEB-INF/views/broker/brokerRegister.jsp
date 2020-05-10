<%@ page pageEncoding="utf-8" 
		 contentType="text/html; charset=utf-8" %>
<%@taglib prefix='c' 
		  uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<jsp:include page="/WEB-INF/views/includes/header.jsp" />




    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section spad set-bg" data-setbg="/resources/img/breadcrumb-contact-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h4>중개인 회원가입</h4>
                        <div class="bt-option">
                            <a href="./index.html"><i class="fa fa-home"></i> Home</a>
                            <span>중개인 회원가입</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Contact Form Section Begin -->
    <section class="contact-form-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="cf-content">
                        <div class="cc-title">
                            <h4>중개인 회원가입</h4>
                            
                        </div>

                       <form action="/broker/brokerInsert" method="post" class="cc-form" id="usercheck" name="member" role="form">

                            <div class="mx-auto" style="width: 200px;">
                            
                            	<div id="divInputId" >
                            	<label >아이디</label>
                                <input autocomplete="off" type="text"  placeholder="id" name="mid" id="mid" class="inputcss">
                                <div  id="id_check"></div>
                               <!--  <button type="button" class="site-btn" id="idck">중 복</button> -->
                                </div>
                                <div>
                                <label >비밀번호</label>
                                <input autocomplete="off" type="password" placeholder="password" name="password" id="password" class="inputcss">
                                <div class="eheck_font" id="password_check"></div>
                                </div>
                               <div>
                               <label >이메일</label>
                                <input autocomplete="off" type="text" placeholder="email" name="email" id="email" class="inputcss">
                                <div class="eheck_font" id="email_check"></div>
                                </div>
                               <div> 
                               <label >주민등록번호 앞자리</label>
                               <input autocomplete="off" type="text" placeholder="생년월일" name="birthday" id="birthday" class="inputcss">
                               <div class="eheck_font" id="birthday_check"></div>
                               </div>
                               
                               <div>
                               <label >휴대폰 번호</label>
                                <input autocomplete="off" type="text" placeholder="xxx-xxxx-xxxx" name="phone" id="phone" class="inputcss"> 
                                <div class="eheck_font" id="phone_check"></div>
                                </div>
                                <div> 
                                <label >성별</label>
                               <input type="radio"  value ="m" placeholder="Website" name="gender">남
                                <input type="radio"  value ="w" placeholder="Website" name="gender">여
                                 </div>
                                 
                                 <div>
                               <label >사업자 번호</label>
                                <input autocomplete="off" type="text" placeholder="xxx-xx-xxxxx" name="corporate" id="corporate" class="inputcss" required>
                                <div class="eheck_font" id="corporate_check"></div>
                                </div>
                                
                                <div>
                               <label >사업장 명</label>
                                <input autocomplete="off" type="text" placeholder="xxx-xxxx-xxxx" name="corporateName" id="corporateName" class="inputcss" required>
                                <div class="eheck_font" id="phone_check"></div>
                                </div>
                                
                                <div>
                               <label >사업장 주소</label> 
                               <input type="text" id="sample4_roadAddress"  placeholder="주소" name="corporateAddress"  class="corporateAddresscss" required readonly>
							   <input type="button" onclick="sample4_execDaumPostcode()" value="주소 찾기" class="site-btn"><br>
							   <span id="guide" style="color:#999;display:none"></span>

							</div>
                                
                                <div>
                               <label >사업자 대표</label>
                                <input autocomplete="off" type="text" placeholder="xxx-xxxx-xxxx" name="corporateCeo" id="corporateCeo" class="inputcss" required>
                                <div class="eheck_font" id="corporateCeo_check"></div>
                                </div>
                                




                                
                            </div>
                            
                            <button type="submit" class="site-btn" >회원가입</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Contact Form Section End -->

    <!-- Contact Section Begin -->
    <section class="contact-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="contact-info">
                        <div class="ci-item">
                            <div class="ci-icon">
                                <i class="fa fa-map-marker"></i>
                            </div>
                            <div class="ci-text">
                                <h5>Address</h5>
                                <p>160 Pennsylvania Ave NW, Washington, Castle, PA 16101-5161</p>
                            </div>
                        </div>
                        <div class="ci-item">
                            <div class="ci-icon">
                                <i class="fa fa-mobile"></i>
                            </div>
                            <div class="ci-text">
                                <h5>Phone</h5>
                                <ul>
                                    <li>125-711-811</li>
                                    <li>125-668-886</li>
                                </ul>
                            </div>
                        </div>
                        <div class="ci-item">
                            <div class="ci-icon">
                                <i class="fa fa-headphones"></i>
                            </div>
                            <div class="ci-text">
                                <h5>Support</h5>
                                <p>Support.aler@gmail.com</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="cs-map">
            <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d735515.5813275519!2d-80.41163541934742!3d43.93644386501528!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x882a55bbf3de23d7%3A0x3ada5af229b47375!2sMono%2C%20ON%2C%20Canada!5e0!3m2!1sen!2sbd!4v1583262687289!5m2!1sen!2sbd"
                height="450" style="border:0;" allowfullscreen=""></iframe>
        </div>
    </section>
    <!-- Contact Section End -->

        <!-- Footer Section Begin -->
    <jsp:include page="/WEB-INF/views/includes/footer.jsp" />
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="/js/jquery-3.3.1.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/js/jquery.magnific-popup.min.js"></script>
    <script src="/js/mixitup.min.js"></script>
    <script src="/js/jquery-ui.min.js"></script>
    <script src="/js/jquery.nice-select.min.js"></script>
    <script src="/js/jquery.slicknav.js"></script>
    <script src="/js/owl.carousel.min.js"></script>
    <script src="/js/jquery.richtext.min.js"></script>
    <script src="/js/image-uploader.min.js"></script>
    <script src="/js/main.js"></script>
    <style>
    .inputcss {
    width: 200px; border: 4px solid #00C89E;
    }
    .corporateAddresscss {
    width: 300px; border: 4px solid #00C89E;
    }
    </style>
    
    <script type="text/javascript">

  //모든 공백 체크 정규식
    var empJ = /\s/g;
    //아이디 정규식
    var idJ = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
    // 비밀번호 정규식
    var pwJ = /^[A-Za-z0-9]{4,12}$/;
    // 사업자 대표 이름 정규식
    var corporateCeoJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
    // 이메일 검사 정규식
    var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    // 휴대폰 번호 정규식
    var phoneJ = /^\d{3}-\d{3,4}-\d{4}$/;;
    
	var birthJ = /([0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1,2][0-9]|3[0,1]))/
	//사업자번호 정규식
	var corporateJ = /^\d{3}-\d{2}-\d{5}$/;;

 
		var idck = 0;
		$(document).ready(function() {

			$("#mid").blur(function() {

		if($('#mid').val()==''){
			$('#id_check').text('아이디를 입력하세요.');
			$('#id_check').css('color', 'red');
			} else if(idJ.test($('#mid').val())!=true){
				$('#id_check').text('5~20자의 소문자영문, 숫자만 사용 가능합니다.');
				$('#id_check').css('color', 'red');
			} else if($('#mid').val()!=''){
			

				
	var mid = $("#mid").val();

		$.ajax({
 			async : true,
 			type : "POST",
 			data : mid,
 			url : "/user/idCheck",
 	 		dataType : "json",
 	 		contentType: "application/json; charset=UTF-8",
 	 		success : function(data) {
				if (data.cnt > 0) {
					$('#id_check').text('중복된 아이디 입니다.');
					$('#id_check').css('color', 'red');
					$("#usercheck").attr("disabled", true);

				
				
			} else{
				if(idJ.test(mid)){
					$('#id_check').text('사용가능한 아이디 입니다.');
					$('#id_check').css('color', 'blue');
					$("#usercheck").attr("disabled", false);
					}
					else if(mid==''){
					$('#id_check').text('아이디를 입력해주세요.');
					$('#id_check').css('color', 'red');
					$("#usercheck").attr("disabled", true);
					}
					else{
					$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다.");
					$('#id_check').css('color', 'red');
					$("#usercheck").attr("disabled", true);
					}
			}
			}
		
			});
			}
				});

			$('#password').blur(function() {
				if (pwJ.test($('#password').val())) {
				console.log('true');
				$('#password_check').text('');
				} else if ($('#password').val()==''){
					$('#password_check').text('비밀번호를 입력하세요.');
					$('#password_check').css('color', 'red');
				}else {
				console.log('false');
				$('#password_check').text('4~12자의 숫자 , 문자로만 사용 가능합니다.');
				$('#password_check').css('color', 'red');
				}
				});
			
			$('#email').blur(function() {
				if (mailJ.test($('#email').val())) {
				console.log('true');
				$('#email_check').text('');
				} else if ($('#email').val()==''){
					$('#email_check').text('이메일을 입력하세요.');
					$('#email_check').css('color', 'red');
				}else {
				console.log('false');
				$('#email_check').text('이메일 양식이 틀렸습니다.');
				$('#email_check').css('color', 'red');
				}
				});
			
			$('#birthday').blur(function() {
				if (birthJ.test($('#birthday').val())) {
				console.log('true');
				$('#birthday_check').text('');
				} else if ($('#birthday').val()==''){
					$('#birthday_check').text('생년월일을 입력하세요.');
					$('#birthday_check').css('color', 'red');
				}else {
				console.log('false');
				$('#birthday_check').text('생년월일 입력양식이 틀렸습니다.');
				$('#birthday_check').css('color', 'red');
				}
				});
			
			$('#phone').blur(function() {
				if (phoneJ.test($('#phone').val())) {
				console.log('true');
				$('#phone_check').text('');
				} else if ($('#phone').val()==''){
					$('#phone_check').text('핸드폰 번호를 입력하세요');
					$('#phone_check').css('color', 'red');
				}else {
				console.log('false');
				$('#phone_check').text('핸드폰 번호 입력양식이 틀렸습니다.');
				$('#phone_check').css('color', 'red');
				}
				});

			$('#corporate').blur(function() {
				if (corporateJ.test($('#corporate').val())) {
				console.log('true');
				$('#corporate_check').text('');
				} else if ($('#corporate').val()==''){
					$('#corporate_check').text('사업자 번호를 입력하세요');
					$('#corporate_check').css('color', 'red');
				}else {
				console.log('false');
				$('#corporate_check').text('사업자 번호 입력양식이 틀렸습니다.');
				$('#corporate_check').css('color', 'red');
				}
				});

			$('#corporateCeo').blur(function() {
				if (corporateCeoJ.test($('#corporateCeo').val())) {
				console.log('true');
				$('#corporateCeo_check').text('');
				} else if ($('#corporateCeo').val()==''){
					$('#corporateCeo_check').text('이름을 입력하세요');
					$('#corporateCeo_check').css('color', 'red');
				}else {
				console.log('false');
				$('#corporateCeo_check').text('이름을 입력하세요.');
				$('#corporateCeo_check').css('color', 'red');
				}
				});

	/* function DosignUp() {
	var inputId = $("#mid").val();
	var inputPwd = $("#password").val();
	var inputEmail = $("#email").val();
	var inputBirthday = $("#birthday").val();
	var inputPhone = $("#phone").val();

	if(inputId.length == 0) { alert("아이디를 입력해 주세요."); $("#mid").focus(); return; }
	if(idck == 0) { alert("아이디 중복 체크를 해주세요."); $("#mid").focus(); return; }

	if(inputPwd.length == 0) { alert("비밀번호를 입력해 주세요."); $("#password").focus(); return;}

	if(inputEmail.length == 0) { alert("이메일을 입력해주세요."); $("#email").focus(); return;}

	if(inputBirthday.length == 0) { alert("생년월일을 입력해 주세요."); $("#birthday").focus(); return;}

	if(inputPhone.length == 0) { alert("전화번호를 입력해 주세요."); $("#phone").focus(); return;}

	if(confirm("회원가입")) {
		alert("가입");
	}
		} */

	$('form').on('submit',function(){
	var inval_Arr = new Array(6).fill(false);

	if (idJ.test($('#mid').val())){
		inval_Arr[0] =  true;
		} else {

			inval_Arr[0] = false;
			alert('아이디를 확인하세요');
			return false;
			}

	if(pwJ.test($('#password').val())){
		inval_Arr[1] = true;
		} else {
		inval_Arr[1] = false;
		alert('비밀번호를 확인하세요');
		return false;
			}
	

	if (mailJ.test($('#email').val())){
		console.log(phoneJ.test($('#email').val()));
		inval_Arr[2] = true;
		} else {
		inval_Arr[2] = false;
		alert('이메일을 확인하세요.');
		return false;
		}
	
	if (birthJ.test($('#birthday').val())){
		console.log(birthJ.test($('#birthday').val()));
		inval_Arr[3] = true;
		} else {
		inval_Arr[3] = false;
		alert('생년월일을 확인하세요');

		return false; 
			} 
		// 휴대폰번호 정규식
		if (phoneJ.test($('#phone').val())) {
		console.log(phoneJ.test($('#phone').val()));
		inval_Arr[4] = true;
		} else {
		inval_Arr[4] = false;
		alert('휴대폰 번호를 확인하세요.');
		return false;
		}
		
		//성별 확인
		if(member.gender[0].checked==false&&member.gender[1].checked==false){
		inval_Arr[5] = false;
		alert('성별을 확인하세요.');
		return false;
		} else{
		inval_Arr[5] = true;
		}
		
		
		var validAll = true;
		for(var i = 0; i < inval_Arr.length; i++){
		if(inval_Arr[i] == false){
		validAll = false;
		}
		}
		if(validAll == true){ // 유효성 모두 통과
		alert('회원가입이 완료되었습니다.');
		} else{
		alert('정보를 다시 확인하세요.')
		/* return false; */
		}


		});
		
	
			
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