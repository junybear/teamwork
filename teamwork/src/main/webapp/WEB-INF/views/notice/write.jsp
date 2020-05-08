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
                        <h4>공지사항작성</h4>
                        <div class="bt-option">
                            <a href="/"><i class="fa fa-home"></i> Home</a>
                            <span>공지사항</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Property Submit Section Begin -->
    <section class="property-submit-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="property-submit-form">
                        <form action="write" method="post">
                            <div class="pf-title">
                                <h4>Title</h4>
                                <input type="text" name="title" placeholder="Your Title*">
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
                                
                                <textarea class="texteditor-content" name="content"></textarea>
                                
                            </div>
                            <button type="submit" class="site-btn">등록</button>
                            
                            <input type="hidden" name="mno" value="${ loginuser.mno }">
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
</body>

</html>