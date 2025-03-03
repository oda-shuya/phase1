<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="ja">

    <head>
        <meta charset="UTF-8">
        <title>確認画面</title>
    </head>

    <body>
        <h1>以下の情報でよろしいですか？</h1>

        <div class="form-container">
            <label for="familyName">姓</label>
            <div class="item">
                <% String familyName=(String) session.getAttribute("familyName"); %>
                <%= familyName %>
            </div>
            <br>
            <label for="firstName">名</label>
            <div class="item">
                <% String firstName=(String) session.getAttribute("firstName"); %>
                <%= firstName %>
            </div>
            <br>
            <label for="email">メールアドレス</label>
            <div class="item">
                <% String email=(String) session.getAttribute("email"); %>
                <%= email %>
            </div>
            <br>
            <label for="password">パスワード</label>
            <div class="item">
                <% String password=(String) session.getAttribute("password"); %>
                <%= password %>
            </div>
            <br>
            <div class="button-container">
                <form action="/tutorial/register" method="get">
                    <button type="submit" class="enter">戻る</button>
                </form>

                <form action="/tutorial/dataRegister" method="post">
                    <button type="submit" class="enter">登録</button>
                </form>
            </div>
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
            text-align: center;
            width: 300px;
        }

        form {
            width: 100%;
        }

        label {
            font-weight: bold;
        }

        .item {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: calc(100% - 16px);
            height: 30px;
            text-align: center;
            align-content: center;
        }

        .button-container {
            display: flex;
            gap: 10px;
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
    </style>

    </html>