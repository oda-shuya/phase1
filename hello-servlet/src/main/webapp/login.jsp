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
        <label>姓 <input type="text" name="loginfamilyname" required></label>
        <label>名 <input type="text" name="loginfirstname" required></label>
        <label>パスワード <input type="password" name="loginpassword" required></label> 
        <button type="submit">ログインする</button>
    </form>
    <a href="index.jsp" class="button">初めての方はこちらから</a>
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

    /* フォーム全体のスタイル */
    form {
        background: white;
        max-width: 400px;
        margin: 20px auto;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    /* ラベルと入力フィールドのコンテナ */
    .form-group {
        width: 100%;
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        margin-bottom: 15px;
    }

    /* ラベルのスタイル */
    label {
        font-weight: bold;
        margin-bottom: 5px;
    }

    /* 入力フィールドのスタイル */
    input {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 14px;
        box-sizing: border-box;
    }

    /* ボタンのスタイル */
    button {
        background-color: #007bff;
        color: white;
        padding: 10px;
        font-size: 16px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        width: 100%;
        margin-top: 15px;
    }

    button:hover {
        background-color: #0056b3;
    }

    /* リンクボタンのスタイル */
    
    a.button {
        display: inline-block;
        margin-top: 15px;
        background-color: #28a745;
        color: white;
        padding: 8px 15px;  /* 縦を小さめに */
        font-size: 14px;  /* 文字サイズを縮小 */
        text-decoration: none;
        border-radius: 5px;
        text-align: center;
        width: auto;  /* 自動サイズに */
    }

    a.button:hover {
        background-color: #218838;
    }


</style>