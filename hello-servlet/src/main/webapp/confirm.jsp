<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>確認画面</title>
</head>
<body>    
    <h1>確認画面</h1>
    <p>Username: <%= request.getAttribute("username") %></p>
    <p>Email: <%= request.getAttribute("email") %></p>

    <!-- StoreServlet にデータを送信する -->
    <form action="register" method="post">
        <input type="hidden" name="username" value="<%= request.getAttribute("username") %>">
        <input type="hidden" name="email" value="<%= request.getAttribute("email") %>">
        <input type="hidden" name="password" value="<%= session.getAttribute("password") %>">
        <button type="submit">登録</button>
    </form>
</body>
</html>
