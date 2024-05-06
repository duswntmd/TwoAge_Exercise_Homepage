<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : 'ID='+=loginId}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>사용자 확인</title>

    <%--    <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>


    <!-- Bootstrap  -->
    <link rel="stylesheet" href="../css/bootstrap.css">
    <!-- Owl Carousel  -->
    <link rel="stylesheet" href="../css/owl.carousel.css">
    <link rel="stylesheet" href="../css/owl.theme.default.min.css">
    <!-- Animate.css -->
    <link rel="stylesheet" href="../css/animate.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">

    <!-- Theme style  -->
    <link rel="stylesheet" href="../css/style.css">

    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-top: -650px; /* 제목을 조금 아래로 이동 */
        }

        form {
            width: 400px;
            margin: 20px auto; /* 폼을 중앙에 위치시키고 아래로 이동 */
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 10px;
            color: #333;
        }

        input[type="text"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            width: calc(100% );
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        p.error {
            color: red;
            text-align: center;
            margin-top: 20px; /* 에러 메시지를 조금 아래로 이동 */
        }

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

<div id="page-wrap">


    <!-- ==========================================================================================================
                                                       HERO
         ========================================================================================================== -->

    <div id="fh5co-hero-wrapper">
        <nav class="container navbar navbar-expand-lg main-navbar-nav navbar-light">
            <a class="navbar-brand" href="<c:url value='/'/>">HP</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav nav-items-center ml-auto">
                    <li class="nav-item active">
                        <%--                        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>--%>
                        <a class="nav-link"  href="<c:url value='/'/>">테스트</a>
                    </li>
                    <li class="nav-item">
                        <%--                        <a class="nav-link" href="#" onclick="$('#fh5co-features').goTo();return false;">Features</a>--%>
                        <a class="nav-link"  href="<c:url value='/board/list'/>">자유게시판</a>
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

    </div> <!-- first section wrapper -->
</div> <!-- main page wrapper -->

<body>
<h2>사용자 확인</h2>
<form action="${pageContext.request.contextPath}/updateid/confirmuser" method="post">
    <c:if test="${not empty error}">
        <p style="color: red;">${error}</p>
    </c:if>
    <label>ID: <input type="text" name="id" /></label><br>
    <label>NAME: <input type="text" name="name" /></label><br>
    <label>PWD: <input type="text" name="pwd" /></label><br>
    <input type="submit" value="사용자 확인">
</form>

</body>
</html>
