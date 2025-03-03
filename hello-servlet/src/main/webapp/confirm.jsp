<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>確認画面</title>
</head>
<body>    
    <h1>確認画面</h1>
    <p>姓: <%= request.getAttribute("familyname") %></p>
    <p>名: <%= request.getAttribute("firstname") %></p>
    <p>email: <%= request.getAttribute("email") %></p>
    <p>password: <%= request.getAttribute("password") %></p>


    <!-- StoreServlet にデータを送信する -->
    <form action="register" method="post">
        <input type="hidden" name="familyname" value="<%= request.getAttribute("familyname") %>">
        <input type="hidden" name="firstname" value="<%= request.getAttribute("firstname") %>">
        <input type="hidden" name="email" value="<%= request.getAttribute("email") %>">
        <input type="hidden" name="password" value="<%= session.getAttribute("password") %>">
        <button type="submit">登録</button>
    </form>

    
    <form action="post">
        <input type="hidden" name="familyname" value="<%= request.getAttribute("familyname") %>">
        <input type="hidden" name="firstname" value="<%= request.getAttribute("firstname") %>">
        <input type="hidden" name="email" value="<%= request.getAttribute("email") %>">
        <input type="hidden" name="password" value="<%= session.getAttribute("password") %>">        
        <a href="index.jsp">編集する</a>
    </form>
</body>
</html>


<style>
    /* ページ全体のスタイル */
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        text-align: center;
        margin: 0;
        padding: 0;
    }

    /* 見出しのスタイル */
    h1 {
        margin-top: 30px;
        color: #333;
    }

    /* 確認内容の表示スタイル */
    p {
        font-size: 16px;
        font-weight: bold;
        background: white;
        max-width: 400px;
        margin: 10px auto;
        padding: 10px;
        border-radius: 5px;
        box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        text-align: left;
    }

    /* フォームのスタイル */
    form {
        margin-top: 20px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    /* ボタン共通スタイル */
    button, .edit-button {
        display: inline-block;
        background-color: #007bff;
        color: white;
        padding: 10px 20px;
        font-size: 16px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        margin-top: 15px;
        text-decoration: none;
        text-align: center;
    }

    /* 登録ボタンのホバー効果 */
    button:hover, .edit-button:hover {
        background-color: #0056b3;
    }

    /* 編集リンクのデザイン */
    .edit-button {
        background-color: #28a745;
        margin-top: 10px;
    }

    /* 編集ボタンのホバー効果 */
    .edit-button:hover {
        background-color: #218838;
    }

</style>
