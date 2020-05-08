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
                        <h4>아이디 찾기</h4>
                        <div class="bt-option">
                            <a href="./index.html"><i class="fa fa-home"></i> Home</a>
                            <span>아이디 찾기</span>
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
                            <h4>아이디 찾기</h4>
                            
                        </div>
                       
                       <form action="/user/findId" name="form1" method="post">
                            <div class="group-input">
                                <input autocomplete="off" type="text" placeholder="email" name="email" id="email" required style="width: calc(33.33% - 20px); border: 4px solid #00C89E;">
                                <input autocomplete="off" type="text" placeholder="phone" name="phone" id="phone" required style="width: calc(33.33% - 20px); border: 4px solid #00C89E;">
                             
                                
                            </div>
                            
                               <br>
                             <button type="submit" id="findBtn" class="buttoncss">찾기</button>
                            <button type="button" onclick="window.close();" class="buttoncss">취소</button>
                           
                    		
                       
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

button.buttoncss {
font-size: 14px;color: #ffffff;background: #6495ED;border: none;
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