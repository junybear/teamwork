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
                        <h4>로그인</h4>
                        <div class="bt-option">
                            <a href="./index.html"><i class="fa fa-home"></i> Home</a>
                            <span>로그인</span>
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
                            <h4>로그인</h4>
                            
                        </div>
                       
                       <form action="/user/loginSelect" name="form1" method="post" class="cc-form">
                            <div class="group-input">
                                <input autocomplete="off" type="text" placeholder="ID" name="mid" id="mid" style="border: 4px solid #00C89E;">
                                <input type="password" placeholder="PASSWORD" name="password" id="password" style="border: 4px solid #00C89E;">
                             
                            
                                
                        
                            <input type="submit" value="LOGIN" class="site-btn" id="loginbtn" style="font-size: 19px;color: #ffffff;" >
                                      <div>
                                  
                                <c:if test="${msg == false }">
                        <p style="color: teal;">로그인 실패!! 아이디,비밀번호를 확인하세요</p>
                          </c:if>
                          <c:if test="${ loginuser != null}">
                        </c:if>
                        </div>
                       
                            </div>
                       
                       
                        </form>
                      
                       <a href="#" onclick="javascript:void(window.open('/user/findIdView','비밀번호 찾기','width=1000,height=800, toolbar=no, menbar=no, scrollbars=no, resizable=no'))" class="acss">아이디 찾기</a>
                       <a href="#" onclick="javascript:void(window.open('/user/findPasswordView','비밀번호 찾기','width=1000,height=800, toolbar=no, menbar=no, scrollbars=no, resizable=no'))" class="acss">비밀번호 찾기</a>
                        
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

a.acss {
font-size: 14px;color: #ffffff;background: #00C89E;border: none;
font-weight: 600;text-transform: uppercase;letter-spacing: 0.5px;
display: inline-block;
padding: 10px 15px;

}

</style>
    
    <script type="text/javascript">

    $(function(){
      
    	
		$("#loginbtn").on('click', function(){
			var mid = $("#mid").val();
	    	var password = $("#password").val();

    	if(!mid){
			alert("아이디를 입력하세요");
			$("#mid").focus();
			return false;
        	}else if(!password){
			alert("비밀번호를 입력하세요");
			$("#password").focus();
			return false;
            	}
    	//login(mid,password);
		});

	function login(mid,password){

	$.ajax({

		url: "/user/loginCheck",
		type: "POST",
		data : { mid : mid,
				password : password
				},
		success:function(data){
			if(data == 2){
				 console.log("data:"+ data);
				alert("아이디 혹은 비밀번호가 맞지 않습니다");
				return false;
				}else if(data == 3){
					 console.log("data:"+ data);
					location.href="/";
					}

			}
	

		});
			
			}


        });

/* var msg = "${msg}";
if (msg === "REGISTERED"){
	alert("회원가입이 완료되었습니다.");
} else if (msg == "FAILURE") {
	alert("아이디와 비밀번호를 확인해주세요")
}  */

</script>
    
</body>

</html>