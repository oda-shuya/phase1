<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="ja">

    <head>
        <meta charset="UTF-8">
        <title>確認画面</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background: linear-gradient(to right, #6a11cb, #2575fc);
                color: white;
                text-align: center;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
            }

            h1 {
                font-size: 24px;
                margin-bottom: 20px;
            }

            .link {
                color: red;
            }

            .form-container {
                background: rgba(255, 255, 255, 0.1);
                padding: 20px;
                border-radius: 15px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
                backdrop-filter: blur(5px);
                width: 300px;
            }

            label {
                display: block;
                margin-top: 10px;
                font-size: 14px;
            }

            input {
                font-family: Arial, sans-serif;
                text-align: center;
                width: 100%;
                padding: 8px;
                margin-top: 5px;
                border: none;
                border-radius: 5px;
                font-size: 14px;
            }

            input[type="password"],
            input[type="text"] {
                background: rgba(255, 255, 255, 0.8);
            }

            .enter {
                background-color: #ff9800;
                color: white;
                border: none;
                padding: 10px 20px;
                border-radius: 30px;
                font-size: 16px;
                width: 100%;
                margin-top: 15px;
                cursor: pointer;
                transition: 0.3s;
            }

            .button-container {
                display: flex;
                gap: 10px;
                justify-content: center;
                align-items: center;
                margin-top: 20px;
            }

            .enter:hover {
                background-color: #e68900;
            }
        </style>
    </head>

    <body>
        <h1>以下の情報でよろしいですか？</h1>

        <div class="form-container">
            <form action="/tutorial/doneRegister" method="post">
                <label for="familyName">姓</label>
                <%= request.getParameter("familyName") %>

                    <label for="firstName">名</label>
                    <%= request.getParameter("firstName") %>

                        <label for="email">メールアドレス</label>
                        <%= request.getParameter("email") %>

                            <label for="password">パスワード</label>
                            <%= request.getParameter("password") %>
            </form>

            <div class="button-container">
                <form action="/tutorial/register" method="get">
                    <button type="submit" class="enter">戻る</button>
                </form>

                <form action="/tutorial/doneRegister" method="post">
                    <button type="submit" class="enter">登録</button>
                </form>
            </div>
        </div>
    </body>

    </html>