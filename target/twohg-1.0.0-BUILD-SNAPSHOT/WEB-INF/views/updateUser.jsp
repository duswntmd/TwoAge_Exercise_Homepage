<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>사용자 정보 수정</title>
</head>
<body>
<h2>사용자 정보 수정</h2>
<form action="${pageContext.request.contextPath}/updateuser" method="post">
    <label>ID: <input type="text" name="id" value="${user.id}" readonly /></label><br>
    <label>비밀번호: <input type="password" name="pwd" value="${user.pwd}" /></label><br>
    <label>이름: <input type="text" name="name" value="${user.name}" /></label><br>
    <label>이메일: <input type="email" name="email" value="${user.email}" /></label><br>
    <label>생년월일: <input type="date" name="birth" value="${user.birth}" /></label><br>
    <label>SNS: <input type="text" name="sns" value="${user.sns}" /></label><br>
    <input type="submit" value="수정하기">
</form>
<c:if test="${not empty message}">
    <p style="color: green;">${message}</p>
</c:if>
<c:if test="${not empty error}">
    <p style="color: red;">${error}</p>
</c:if>
</body>
</html>
