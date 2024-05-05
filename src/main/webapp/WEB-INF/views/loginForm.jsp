<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : 'ID='+=loginId}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>sungkyul</title>
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

    <style>
        * { box-sizing:border-box; }
        a { text-decoration: none; }
        form {
            width:400px;
            height:500px;
            display : flex;
            flex-direction: column;
            align-items:center;
            position : absolute;
            top:50%;
            left:50%;
            transform: translate(-50%, -50%) ;
            border: 1px solid rgb(89,117,196);
            border-radius: 10px;
            background-color: rgba(255, 255, 255, 0.8);

        }
        input[type='text'], input[type='password'] {
            width: 300px;
            height: 40px;
            border : 1px solid rgb(89,117,196);
            border-radius:5px;
            padding: 0 10px;
            margin-bottom: 10px;
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
        #title {
            font-size : 50px;
            margin: 40px 0 30px 0;
        }
        #msg {
            height: 30px;
            text-align:center;
            font-size:16px;
            color:red;
            margin-bottom: 20px;
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

<%--<div id="menu">--%>
<%--    <ul>--%>
<%--        <li id="logo">sungkyul</li>--%>
<%--        <li><a href="<c:url value='/'/>">Home</a></li>--%>
<%--        <li><a href="<c:url value='/board/list'/>">Board</a></li>--%>
<%--        <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>--%>
<%--        <li><a href="<c:url value='/register/add'/>">Sign in</a></li>--%>
<%--        <li><a href=""><i class="fa fa-search"></i></a></li>--%>
<%--    </ul>--%>
<%--</div>--%>
<form action="<c:url value="/login/login"/>" method="post" onsubmit="return formCheck(this);">
    <h3 id="title">Login</h3>
    <div id="msg">
        <c:if test="${not empty param.msg}">
            <i class="fa fa-exclamation-circle"> ${URLDecoder.decode(param.msg)}</i>
        </c:if>
    </div>
    <input type="text" name="id" value="${cookie.id.value}" placeholder="아이디 입력" autofocus>
    <input type="password" name="pwd" placeholder="비밀번호">
    <input type="hidden" name="toURL" value="${param.toURL}">
    <button>로그인</button>
    <div>
        <label><input type="checkbox" name="rememberId" value="on" ${empty cookie.id.value ? "":"checked"}> 아이디 기억</label> |
        <a href="/twohg/passid/findid">아이디 찾기</a> |
        <a href="/twohg/passpwd/findPassword">비밀번호 찾기</a>
    </div>
    <script>
        function formCheck(frm) {
            let msg ='';
            if(frm.id.value.length==0) {
                setMessage('id를 입력해주세요.', frm.id);
                return false;
            }
            if(frm.pwd.value.length==0) {
                setMessage('password를 입력해주세요.', frm.pwd);
                return false;
            }
            return true;
        }
        function setMessage(msg, element){
            document.getElementById("msg").innerHTML = ` ${'${msg}'}`;
            if(element) {
                element.select();
            }
        }
    </script>
</form>
</body>
</html>