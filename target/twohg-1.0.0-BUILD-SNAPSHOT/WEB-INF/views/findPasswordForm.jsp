<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 찾기</title>
</head>
<body>
<h2>비밀번호 찾기</h2>
<form action="/twohg/passpwd/findPassword" method="post">
    <label for="id">아이디:</label>
    <input type="text" id="id" name="id" required>
    <br>
    <label for="email">이메일:</label>
    <input type="email" id="email" name="email" required>
    <br>
    <button type="submit">비밀번호 찾기</button>
</form>

<%-- 에러 메시지 출력 --%>
<% if (request.getAttribute("error") != null) { %>
<p style="color: red;"><%= request.getAttribute("error") %></p>
<% } %>

<%-- 성공 메시지 출력 --%>
<% if (request.getAttribute("message") != null) { %>
<p style="color: green;"><%= request.getAttribute("message") %></p>
<% } %>
</body>
</html>
