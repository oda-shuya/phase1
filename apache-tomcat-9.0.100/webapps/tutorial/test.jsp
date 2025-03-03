<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="ja">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>フォームの表示切り替え</title>
        <style>
            .box {
                padding: 5px;
                border: 1px solid black;
                width: 200px;
                display: inline-block;
                font-size: 16px;
                height: 30px;
                text-align: left;
                line-height: 30px;
            }

            input.box {
                border: 1px solid black;
            }
        </style>
        <script>
            function register() {
                document.getElementById("nameDisplay").textContent = document.getElementById("nameInput").value;
                document.getElementById("emailDisplay").textContent = document.getElementById("emailInput").value;
                document.getElementById("form").style.display = "none";
                document.getElementById("result").style.display = "block";
            }
        </script>
    </head>

    <body>

        <div id="form">
            <label>氏名</label><br>
            <input type="text" id="nameInput" class="box"><br><br>
            <label>メールアドレス</label><br>
            <input type="email" id="emailInput" class="box"><br><br>
            <button onclick="register()">登録</button>
        </div>

        <div id="result" style="display: none;">
            <label>氏名</label><br>
            <div id="nameDisplay" class="box"></div><br><br>
            <label>メールアドレス</label><br>
            <div id="emailDisplay" class="box"></div><br><br>
        </div>

    </body>

    </html>