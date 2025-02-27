<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>メイン画面</title>
</head>
<body> 
    <%
        String successParam = request.getParameter("isActive");
        boolean isActive = (successParam != null && successParam.equals("true"));
    %>

    <% if (isActive){ %>
        <h1 class="message success">
            ログイン完了！
        </h1>
    <% } else { %>
        <h1 class="message error">
            ログインに失敗しました。
        </h1>
    <% } %>

    <a href="login.jsp" class="button">ログイン画面へ戻る</a>
</body>
</html>

<style>
    h1{
        text-align: center;
    }
</style>
