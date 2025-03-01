<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="ja">

    <head>
        <meta charset="UTF-8">
        <title>ログイン完了画面</title>
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
                padding: 10px;
                border-radius: 30px;
                font-size: 16px;
                width: 100%;
                margin-top: 15px;
                cursor: pointer;
                transition: 0.3s;
            }

            .enter:hover {
                background-color: #e68900;
            }
        </style>
    </head>

    <body>
        <h1>ログイン完了しました</h1>
    </body>

    </html>