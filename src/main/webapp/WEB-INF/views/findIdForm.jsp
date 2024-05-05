<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아이디 찾기</title>
</head>
<body>
<h2>아이디 찾기</h2>
<form action="/twohg/passid/findid" method="post">
    <label for="name">이름:</label>
    <input type="text" id="name" name="name" required>
    <br>
    <label for="email">이메일:</label>
    <input type="email" id="email" name="email" required>
    <br>
    <button type="submit">아이디 찾기</button>
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
