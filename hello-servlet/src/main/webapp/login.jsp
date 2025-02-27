<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ログイン画面</title>
</head>
<body>
    <h1>ログイン画面</h1>
    <form action="login" method="post">
        <p>メールアドレス: <input type="email" name="email" required></p>
        <p>パスワード: <input type="password" name="password" required></p>
        <button type="submit">ログインする</button>
    </form>
    <a href="index.jsp" class="button">ログイン画面へ戻る</a>
</body>
</html>

<style>
    body{
        text-align: center;
    }
</style>
