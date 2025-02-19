<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");

    // `RegisterScreen.jsp` からのデータ受け取り
    String username = request.getParameter("hiddenUsername");
    String email = request.getParameter("hiddenEmail");
    String password = request.getParameter("hiddenPassword"); // 実際には表示しない
%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>Confirm Screen</title>
</head>
<body>
    <h1>Confirm Your Information</h1>
    <p><strong>Username:</strong> <%= username %></p>
    <p><strong>Email:</strong> <%= email %></p>

    <!-- hidden input を埋めて submit 時に送る -->
    <form action="RegisterComplete.jsp" method="post">
        <input type="hidden" name="username" value="<%= username %>">
        <input type="hidden" name="email" value="<%= email %>">
        <input type="hidden" name="password" value="<%= password %>">

        <button type="submit">Confirm</button>
        <button type="button" action="index.jsp" method="post" onclick="history.back()">Back</button>
    </form>
</body>
</html>
