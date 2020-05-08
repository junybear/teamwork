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
                        <h4>비밀번호 찾기</h4>
                        <div class="bt-option">
                            <a href="./index.html"><i class="fa fa-home"></i> Home</a>
                            <span>비밀번호 찾기</span>
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
                            <h4>비밀번호 찾기</h4>                            
                        </div>                       
                       <form action="/user/findPassword" name="form1" method="post"  onsubmit="return findCheck();" >
                            <div class="group-input">
                                <input autocomplete="off" type="text" placeholder="ID" name="mid" id="mid" style="width: calc(33.33% - 20px); border: 4px solid #00C89E;" required>
                                <input autocomplete="off" type="text" placeholder="EMAIL" name="email" id="email" class="input-check-email" style="width: calc(33.33% - 20px); border: 4px solid #00C89E;" required>                               
                            </div> 
                            <br>                          
                            <input type="submit" value="발송" class="inputcss">                                    
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Contact Form Section End -->

    
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
font-size: 14px;color: #ffffff;background: #00C89E;border: none;
font-weight: 600;text-transform: uppercase;letter-spacing: 0.5px;
display: inline-block;
padding: 10px 15px;

}

</style>
    
    <c:if test="${check eq 1 }">
   <script>
      alert("이메일로 임시 비밀번호가 발송되었습니다! 이메일을 확인해주세요!");
      window.close();
   </script>
</c:if>
<c:if test="${ check eq 0 }">
   <script>
      alert("해당 정보를 가진 회원이 존재하지 않습니다!");
      
   </script>
</c:if>

<script>
function findCheck() {
   var form = document.form1;
   
   if (form.email.value == "" || form.email.value == null) {
      alert("이메일을 입력해주세요!");
      email.focus();
      return false;
   }
   
   if (form.mid.value == "" || form.mid.value == null) {
      alert("아이디를 입력해주세요!");
      form.mid.focus();
      return false;
   }

}

//email check function
function email_check(email) {    
    var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    return (email != '' && email != 'undefined' && regex.test(email)); 
}

//check when email input lost foucus
$(".input-check-email").blur(function(){
  var email = $(this).val();

  // if value is empty then exit
  if( email == '' || email == 'undefined') return;

  // valid check
  if(!email_check(email)) {
     $("#result-check").text('Not valid email.');
    $(this).focus();
    return false;
  }
  else {
     $("#result-check").text('Email address test OK.');
  }
});
</script>




    
</body>

</html>