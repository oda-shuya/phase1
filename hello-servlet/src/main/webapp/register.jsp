<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>登録処理</title>
</head>
<body>
    <%
        String successParam = request.getParameter("success");
        boolean success = "true".equals(successParam);
    %>

    <% if (success) { %>
        <p class="message success">登録完了</p>
        <a href="login.jsp">ログイン画面へ</a>
    <% } else { %>
        <p class="message error">登録に失敗しました。もう一度お試しください</p>
    <% } %>

    <a href="index.jsp" class="button">トップへ戻る</a>
</body>
</html>
