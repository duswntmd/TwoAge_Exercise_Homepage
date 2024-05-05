<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false"%>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : 'ID='+=loginId}"/>
<%@ page import="java.net.URLDecoder"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>sungkyul</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

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

    <style>
        * { box-sizing:border-box; }
        form {
            width:400px;
            height:600px;
            display : flex;
            flex-direction: column;
            align-items:center;
            position : absolute;
            top:55%;
            left:50%;
            transform: translate(-50%, -50%) ;
            border: 1px solid rgb(89,117,196);
            border-radius: 10px;
            background-color: rgba(255, 255, 255, 0.8);
        }
        .input-field {
            width: 300px;
            height: 40px;
            border : 1px solid rgb(89,117,196);
            border-radius:5px;
            padding: 0 10px;
            margin-bottom: 10px;
        }

        label {
            width:300px;
            height:30px;
            margin-top :4px;
        }
        button {
            background-color: rgb(89,117,196);
            color : white;
            width:300px;
            height:50px;
            font-size: 17px;
            border : none;
            border-radius: 5px;
            margin : 20px 0 30px 0;
        }
        .title {
            font-size : 50px;
            margin: 40px 0 30px 0;
        }
        .msg {
            height: 30px;
            text-align:center;
            font-size:16px;
            color:red;
            margin-bottom: 20px;
        }

        .sns-chk {
            margin-top : 5px;
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
    <title>Register</title>
</head>
<body>

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
                <ul class="navbar-nav nav-items-center ml-auto ">
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
                                <li><a class="nav-link" href="<c:url value='/confirmuser'/>">회원수정</a></li>
                                <li><a class="nav-link" href="<c:url value='/deleteuser'/>">회원삭제</a></li>
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

<%--<!-- form action="<c:url value="/register/save"/>" method="POST" onsubmit="return formCheck(this)"-->--%>
<form action="/twohg" method="post">
<form:form modelAttribute="user">
    <div class="title">Register</div>
    <div id="msg" class="msg"><form:errors path="id"/></div>
    <div pwd="msg" class="msg"><form:errors path="pwd"/></div>
    <span style="color:red;">${message}</span>
    <label for="">아이디</label>
    <input class="input-field" type="text" name="id" placeholder="4~10자리의 영대소문자와 숫자 조합">
    <label for="">비밀번호</label>
    <input class="input-field" type="text" name="pwd" placeholder="4~10자리의 영대소문자와 숫자 조합">
    <label for="">이름</label>
    <input class="input-field" type="text" name="name" placeholder="홍길동">
    <label for="">이메일</label>
    <input class="input-field" type="text" name="email" placeholder="example@gmail.co.kr">
    <label for="">생일</label> <!-- text -->
    <input class="input-field" type="date" name="birth" placeholder="2020-12-31">


<%--    <div class="sns-chk">--%>
<%--        <label><input type="checkbox" name="sns" value="facebook"/>페이스북</label>--%>
<%--        <label><input type="checkbox" name="sns" value="kakaotalk"/>카카오톡</label>--%>
<%--        <label><input type="checkbox" name="sns" value="instagram"/>인스타그램</label>--%>
<%--    </div>--%>
    <button>회원 가입</button>
</form:form>
</form>
<script>
    function formCheck(frm) {
        var msg ='';
        if(frm.id.value.length<3) {
            setMessage('id의 길이는 3이상이어야 합니다.', frm.id);
            return false;
        }
        return true;
    }
    function setMessage(msg, element){
        document.getElementById("msg").innerHTML = `<i class="fa fa-exclamation-circle"> ${'${msg}'}</i>`;
        if(element) {
            element.select();
        }
    }
</script>
</body>
</html>