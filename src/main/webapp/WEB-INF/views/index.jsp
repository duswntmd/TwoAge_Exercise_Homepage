<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page session="false"%>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : 'ID='+=loginId}"/>
<!DOCTYPE html>
<!--
App by FreeHTML5.co
Twitter: http://twitter.com/fh5co
URL: http://freehtml5.co
-->
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>sungkyul</title>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <meta name="description" content="Free HTML5 Website Template by FreeHTML5.co" />--%>
<%--    <meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />--%>
<%--    <meta name="author" content="FreeHTML5.co" />--%>

<%--    <!-- Facebook and Twitter integration -->--%>
<%--    <meta property="og:title" content=""/>--%>
<%--    <meta property="og:image" content=""/>--%>
<%--    <meta property="og:url" content=""/>--%>
<%--    <meta property="og:site_name" content=""/>--%>
<%--    <meta property="og:description" content=""/>--%>
<%--    <meta name="twitter:title" content="" />--%>
<%--    <meta name="twitter:image" content="" />--%>
<%--    <meta name="twitter:url" content="" />--%>
<%--    <meta name="twitter:card" content="" />--%>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>

    <!-- Bootstrap  -->
    <link rel="stylesheet" href="css/bootstrap.css">
    <!-- Owl Carousel  -->
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <!-- Animate.css -->
    <link rel="stylesheet" href="css/animate.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">

    <!-- Theme style  -->
    <link rel="stylesheet" href="css/style.css">

    <style>
    .nav ul li ul {

    display: none;
    position: absolute;
    width: 250px;
    }
    .navbar-nav {
        position: relative; /* 부모 요소에 relative를 설정합니다. */
    }

    .navbar-nav .submenu {
        position: absolute;
        /*top: 100%; !* 부모 요소의 아래쪽에 위치하도록 설정합니다. *!*/
        /*left: 0;*/
        display: none; /* 초기에는 보이지 않도록 설정합니다. */
    }

    .navbar-nav .nav-item:hover .submenu  {
        display: block; /* 부모 요소에 호버될 때 하위 메뉴가 나타나도록 설정합니다. */
    }
    </style>
</head>
<body>


<div id="page-wrap">


    <!-- ==========================================================================================================
                                                       HERO
         ========================================================================================================== -->

    <div id="fh5co-hero-wrapper">
        <nav class="container navbar navbar-expand-lg main-navbar-nav navbar-light">
<%--            <a class="navbar-brand" href="<c:url value='/'/>">HP</a>--%>
            <a class="navbar-brand" href="<c:url value='/'/>">HP</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
<%--                <ul class="navbar-nav nav-items-center ml-auto mr-auto">--%>
                <ul class="navbar-nav nav-items-center ml-auto">
                    <li class="nav-item active">
                        <a class="nav-link " href="#" onclick="$('#fh5co-slider').goTo();return false;">운동모델<i class='fa '></i></a>
                        <ul class="submenu navbar-nav"  >
                            <li><a class="nav-link " href="#" onclick="$('#fh5co-advantages').goTo();return false;">추천영상</a></li>
                            <li><a class="nav-link " href="#" onclick="$('#fh5co-features').goTo();return false;">간단소개</a></li>
                        </ul>
                    </li>
                    <li class="nav-item ">
                        <%--                        <a class="nav-link" href="#" onclick="$('#fh5co-features').goTo();return false;">Features</a>--%>
                        <a class="nav-link"  href="<c:url value='/board/list'/>">자유게시판<i class='fa '></i></a>
                            <ul class="submenu navbar-nav"  >
<%--                                <li><a class="nav-link" href="#"  onclick="$('#fh5co-download').goTo();return false;">Download</a></li>--%>
<%--                                <li><a class="nav-link" href="#"  onclick="$('#fh5co-download').goTo();return false;">Download</a></li>--%>
                            </ul>
                    </li>
                    <li class="nav-item">
<%--                        <a class="nav-link" href="#" onclick="$('#fh5co-reviews').goTo();return false;">Reviews</a>--%>
                        <a class="nav-link" href="<c:url value='${loginOutLink}'/>">${loginOut}</a>
                    </li>
                    <li class="nav-item">
<%--                        <a class="nav-link" href="#"  onclick="$('#fh5co-download').goTo();return false;">Download</a>--%>
                        <a class="nav-link" href="<c:url value='/register/add'/>">회원가입</a>
                            <ul class="submenu navbar-nav"  >
                                <li><a class="nav-link" href="<c:url value='/updateid/confirmuser'/>">회원수정</a></li>
                                 <li><a class="nav-link" href="<c:url value='/deleteid/deleteuser'/>">회원삭제</a></li>
                            </ul>
                    </li>
                </ul>
                <div class="social-icons-header">
                    <a href="https://www.facebook.com/fh5co"><i class="fab fa-facebook-f"></i></a>
                    <a href="https://freehtml5.co"><i class="fab fa-instagram"></i></a>
                    <a href="https://www.twitter.com/fh5co"><i class="fab fa-twitter"></i></a>
                </div>
            </div>
        </nav>

        <div class="container fh5co-hero-inner">
            <h1 class="animated fadeIn wow" data-wow-delay="0.4s">함께해서 더 즐거운 운동 습관 형성 플랫폼 일상에도 함께해요</h1>
            <p class="animated fadeIn wow" data-wow-delay="0.67s">Start where you are. Use what you have. Do what you can.
                The hard days are what make you stronger.

                 </p>
            <button class="btn btn-md download-btn-first wow fadeInLeft animated" data-wow-delay="0.85s" onclick="$('#fh5co-download').goTo();return false;">Download</button>
<%--            <button class="btn btn-md features-btn-first animated fadeInLeft wow" data-wow-delay="0.95s" onclick="$('#fh5co-features').goTo();return false;">Features</button>--%>
            <img class="fh5co-hero-smartphone animated fadeInRight wow" data-wow-delay="1s" src="img/mainphone.png" alt="Smartphone">
        </div>


    </div> <!-- first section wrapper -->





    <!-- ==========================================================================================================
                                                      SLIDER
         ========================================================================================================== -->

    <div id="fh5co-slider" class="fh5co-slider-outer wow fadeIn" data-wow-delay="0.36s">
        <h1>HP헬파 운동모델</h1>
        <small>Drag and Drop</small>
        <div class="container fh5co-slider-inner">

            <div class="owl-carousel owl-theme">

                <div class="item"><img src="img/model1.png" alt=""></div>
                <div class="item"><img src="img/model2.png" alt=""></div>
                <div class="item"><img src="img/model3.png" alt=""></div>
                <div class="item"><img src="img/model4.png" alt=""></div>


            </div>

        </div>
    </div>

    <!-- ==========================================================================================================
                                                     ADVANTAGES
         ========================================================================================================== -->

    <div id="fh5co-advantages" class="fh5co-advantages-outer">
        <div class="container">
            <h1 class="second-title"><span class="span-perfect">Perfect</span> <span class="span-features">HP 추천 영상</span></h1>
            <small>Only 근육근육</small>

            <div class="row fh5co-advantages-grid-columns wow animated fadeIn" data-wow-delay="0.36s">

                <%--                <div class="col-sm-4">--%>
                <%--                    <img class="grid-image" src="img/icon-1.png" alt="Icon-1">--%>
                <%--                    <h1 class="grid-title">Usability</h1>--%>
                <%--                    <p class="grid-desc">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem cupiditate.</p>--%>
                <%--                </div>--%>

                <%--                <div class="col-sm-4">--%>
                <%--                    <img class="grid-image" src="img/icon-2.png" alt="Icon-2">--%>
                <%--                    <h1 class="grid-title">Parallax Effect</h1>--%>
                <%--                    <p class="grid-desc">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem cupiditate.</p>--%>
                <%--                </div>--%>

                <%--                <div class="col-sm-4">--%>
                <%--                    <img class="grid-image" src="img/icon-3.png" alt="Icon-3">--%>
                <%--                    <h1 class="grid-title">Unlimited Colors</h1>--%>
                <%--                    <p class="grid-desc">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem cupiditate.</p>--%>
                <%--                </div>--%>
                <iframe width="560" height="315" src="https://www.youtube.com/embed/ijCRlmxUleI?si=ZHxPbjr_G40_GR3q" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                <div class="col-sm-6 in-order-2 sm-6-content wow animated fadeInRight" data-wow-delay="0.22s">
                    <h2>덤벨 최대 몇 킬로까지 들 수 있어?</h2>
                    <p>プッシュアップ！ベンチプレス! (푸시업! 벤치 프레스!)</p>
                    <p>レッグカール！ハックリフト！ (레그 컬! 핵 리프트!)</p>
                    <p>バックプレス！サイドレイズ！ (백 프레스! 사이드 레이즈!)</p>
                    <p>ベントオーバー！ラットプルダウン！ (벤트 오버! 랫 풀 다운!)</p>
                    <p>今すぐ始めよ！トレーニング！(지금 당장 시작하자! 트레이닝!)</p>
                    <p>奇麗なワタシに大変身 (아름다운 나로 대변신)</p>
                    <p>めっちゃモテたいから (완전 인기 있어지고 싶으니까)</p>
                </div>
            </div>
        </div>
    </div>

    <!-- ==========================================================================================================
                                                      FEATURES
         ========================================================================================================== -->

    <div class="curved-bg-div wow animated fadeIn" data-wow-delay="0.15s"></div>
    <div id="fh5co-features" class="fh5co-features-outer">
        <div class="container">

            <div class="row fh5co-features-grid-columns">

                <div class="col-sm-6 in-order-1 wow animated fadeInLeft" data-wow-delay="0.22s">
                    <div class="col-sm-image-container">
                        <img class="img-float-left" src="img/smartphonelogin.png" alt="smartphone-1">
                        <span class="span-new">NEW</span>
                        <span class="span-free">Free</span>
                    </div>
                </div>

                <div class="col-sm-6 in-order-2 sm-6-content wow animated fadeInRight" data-wow-delay="0.22s">
                    <h1>New Member</h1>
                    <p>누구나 쉽고 빠르게 할 수 있는 HP 도움이와 함께 지금 바로 앱에 가입하여 누구보다 빠르고 질 좋은 서비스를 사용해보세요 HP 도우미는 사용자 친화적인 인터페이스와 맞춤형 기능을 제공하여 건강 관리와 피트니스 목표 달성을 더 쉽게 만들어줍니다! </p>
                    <span class="circle circle-first"><i class="fab fa-instagram"></i></span>
                    <span class="circle circle-middle"><i class="fab fa-facebook"></i></span>
                    <span class="circle circle-last"><i class="fab fa-twitter"></i></span>
                </div>

                <div class="col-sm-6 in-order-3 sm-6-content wow animated fadeInLeft" data-wow-delay="0.22s">
                    <h1>REAL-TIME Halth Check</h1>
                    <p>실시간으로 간단한 건강상태를 체크해 보세요 운동뿐만 아니라 다른 건강 지표도 관리하는 것이 중요합니다. 올바른 건강 관리 습관은 더 나은 삶을 만드는 데 큰 도움이 됩니다!</p>
                    <span class="circle circle-first"><i class="fas fa-star"></i></span>
                    <span class="circle circle-middle"><i class="far fa-star"></i></span>
                    <span class="circle circle-last"><i class="far fa-thumbs-up"></i></span>
                </div>

                <div class="col-sm-6 in-order-4 wow animated fadeInRight" data-wow-delay="0.22s">
                    <img class="img-float-right" src="img/smartphonecheck.png" alt="smartphone-2">
                </div>

                <div class="col-sm-6 in-order-5 wow animated fadeInLeft" data-wow-delay="0.22s">
                    <div class="col-sm-image-container">
                        <img class="img-float-left" src="img/smartphonekcal.png" alt="smartphone-3">
                        <span class="span-data">DATA</span>
                        <span class="span-percent">100%</span>
                    </div>
                </div>
                <div class="col-sm-6 in-order-6 sm-6-content wow animated fadeInRight" data-wow-delay="0.22s">
                    <h1>calorie calculator</h1>
                    <p> 칼로리 식단을 계산하고 목표치만큼 운동을 해 멋진 몸을 만들어보세요 꾸준한 노력과 인내심이 필요하지만 목표를 향해 나아가는 과정에서 자신을 더 사랑하게 될 것입니다. 건강한 식습관과 규칙적인 운동은 당신의 삶의 질을 높여주고 자신감을 더욱 키워줄 것입니다. 오늘부터 시작해보세요. 작은 변화가 큰 결과를 만들어냅니다! </p>
                    <span class="circle circle-first">100%</span>
                    <span class="circle circle-middle"><i class="fas fa-forward"></i></span>
                    <span class="circle circle-last"><i class="fab fa-github"></i></span>

                </div>




            </div> <!-- row -->


        </div>
    </div>


    <!-- ==========================================================================================================
                                                      REVIEWS
         ========================================================================================================== -->

<%--    <div id="fh5co-reviews" class="fh5co-reviews-outer">--%>
<%--        <h1>What people are saying</h1>--%>
<%--        <small>Reviews</small>--%>
<%--        <div class="container fh5co-reviews-inner">--%>
<%--            <div class="row justify-content-center">--%>
<%--                <div class="col-sm-5 wow fadeIn animated" data-wow-delay="0.25s">--%>
<%--                    <img class="float-left" src="img/quotes-1.jpg" alt="Quote 1">--%>
<%--                    <p class="testimonial-desc">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quis similique quasi.</p>--%>
<%--                    <small class="testimonial-author">John Doe</small>--%>
<%--                    <img class="float-right" src="img/quotes-2.jpg" alt="Quote 2">--%>
<%--                </div>--%>
<%--                <div class="col-sm-5 testimonial-2 wow fadeIn animated" data-wow-delay="0.67s">--%>
<%--                    <img class="float-left" src="img/quotes-1.jpg" alt="Quote 1">--%>
<%--                    <p class="testimonial-desc">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quis similique quasi.</p>--%>
<%--                    <small class="testimonial-author">Someone</small>--%>
<%--                    <img class="float-right" src="img/quotes-2.jpg" alt="Quote 2">--%>
<%--                </div>--%>
<%--            </div>--%>

<%--        </div>--%>
<%--    </div>--%>


    <!-- ==========================================================================================================
                                                 BOTTOM
    ========================================================================================================== -->

    <div id="fh5co-download" class="fh5co-bottom-outer">
        <div class="overlay">
            <div class="container fh5co-bottom-inner">
                <div class="row">
                    <div class="col-sm-6">
                        <h1>앱을 다운로드 하는 방법은?</h1>
<%--                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eaque suscipit, similique animi saepe, ipsam itaque, tempore minus maxime pariatur error unde fugit tenetur.</p>--%>
                        <p>play 스토어에서 HP를 검색해주세요 혹은 홈페이지의 download를 타고 다운받고 지금 시작하세요.</p>
                        <p>HP와 함계하는 편히 할 수 있는 운동 건강을 위해 노력하는 당신은 그 누구보다 아름답습니다.</p>
                        <a class="wow fadeIn animated" data-wow-delay="0.25s" href="#"><img class="app-store-btn" src="img/app-store-icon.png" alt="App Store Icon"></a>
                        <a class="wow fadeIn animated" data-wow-delay="0.67s" href="#"><img class="google-play-btn" src="img/google-play-icon.png" alt="Google Play Icon"></a>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- ==========================================================================================================
                                               SECTION 7 - SUB FOOTER
    ========================================================================================================== -->

    <footer class="footer-outer">
        <div class="container footer-inner">

            <div class="footer-three-grid wow fadeIn animated" data-wow-delay="0.66s">
                <div class="column-1-3">
                    <h1>HP</h1>
                </div>
                <div class="column-2-3">
                    <nav class="footer-nav">
                        <ul>
                            <a><li>성결대학교</li></a>
                            <a><li>웹개발자: 연주승</li></a>
                            <a><li>연락처: 010-xxxx-xxxx</li></a>
                            <a><li></li></a>
                            <a><li></li></a>
                            <a><li>성결대학교</li></a>
                            <a><li>앱개발자: 박성재</li></a>
                            <a><li>연락처: 010-xxxx-xxxx</li></a>
                            <a><li></li></a>
                            <a><li></li></a>
<%--                            <a href="#" onclick="$('#fh5co-hero-wrapper').goTo();return false;"><li>Home</li></a>--%>
<%--                            <a href="#" onclick="$('#fh5co-features').goTo();return false;"><li>Features</li></a>--%>
<%--                            <a href="#" onclick="$('#fh5co-reviews').goTo();return false;"><li>Reviews</li></a>--%>
<%--                            <a href="#" onclick="$('#fh5co-download').goTo();return false;"><li class="active">Download</li></a>--%>
                        </ul>
                    </nav>
                </div>
                <div class="column-3-3">
                    <div class="social-icons-footer">
                        <a href="https://www.facebook.com/fh5co"><i class="fab fa-facebook-f"></i></a>
                        <a href="https://freehtml5.co"><i class="fab fa-instagram"></i></a>
                        <a href="https://www.twitter.com/fh5co"><i class="fab fa-twitter"></i></a>
                    </div>
                </div>
            </div>

            <span class="border-bottom-footer"></span>

<%--            <p class="copyright">&copy; 2018 App. All rights reserved. Design by <a href="https://freehtml5.co" target="_blank">FreeHTML5</a>.</p>--%>

        </div>
    </footer>




</div> <!-- main page wrapper -->

<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>


<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/owl.carousel.js"></script>
<script src="js/wow.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>
