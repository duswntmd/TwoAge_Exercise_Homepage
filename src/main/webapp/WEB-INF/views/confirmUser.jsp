<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>사용자 확인</title>
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
            margin-top: 50px; /* 제목을 조금 아래로 이동 */
        }

        form {
            width: 400px;
            margin: 40px auto; /* 폼을 중앙에 위치시키고 아래로 이동 */
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
    </style>
</head>
<body>
<h2>사용자 확인</h2>
<form action="${pageContext.request.contextPath}/confirmuser" method="post">
    <label>ID: <input type="text" name="id" /></label><br>
    <label>NAME: <input type="text" name="name" /></label><br>
    <label>PWD: <input type="text" name="pwd" /></label><br>
    <input type="submit" value="사용자 확인">
</form>
<c:if test="${not empty error}">
    <p style="color: red;">${error}</p>
</c:if>
</body>
</html>
