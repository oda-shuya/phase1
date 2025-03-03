<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="ja">

    <head>
        <meta charset="UTF-8">
        <title>ログイン画面</title>
    </head>

    <body>
        <h1>ログイン情報を入力してください</h1>

        <div class="form-container">
            <form action="/tutorial/doneLogin" method="post">
                <label for="familyName">姓</label>
                <input type="text" id="familyName" name="familyName" size="10"><br>

                <label for="firstName">名</label>
                <input type="text" id="firstName" name="firstName" size="10"><br>

                <label for="password">パスワード</label>
                <input type="password" id="password" name="password" size="20"><br>

                <button type="submit" class="enter">ログイン</button>
            </form>
            <a class="link" href="/tutorial/register">新規の方はこちら</a>
        </div>
    </body>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            margin: 0;
        }

        .form-container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        label {
            font-weight: bold;
        }

        input {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: calc(100% - 16px);
            height: 30px;
            text-align: center;
            font-size: inherit;
        }

        button.enter {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s;
        }

        button.enter:hover {
            background-color: #0056b3;
        }

        .link {
            display: block;
            margin-top: 10px;
            color: #007bff;
            text-decoration: none;
            text-align: center;
        }

        .link:hover {
            text-decoration: underline;
        }
    </style>

    </html>