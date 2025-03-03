<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>会員情報入力画面</title>
</head>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        const passwordInput = document.getElementById("password");
        const confirmPasswordInput = document.getElementById("subpassword");
        const passwordError = document.getElementById("passwordError");
        const confirmPasswordError = document.getElementById("confirmPasswordError");
        const submitButton = document.getElementById("submitBtn");

        function validatePassword() {
            const password = passwordInput.value;
            const regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,32}$/;
            
            if (!regex.test(password)) {
                passwordError.textContent = "パスワードは8〜32文字で、大文字・小文字・数字を含める必要があります。";
                submitButton.disabled = true;
            } else {
                passwordError.textContent = "";
                submitButton.disabled = false;
            }
        }

        function validateConfirmPassword() {
            if (passwordInput.value !== confirmPasswordInput.value) {
                confirmPasswordError.textContent = "パスワードが一致しません。";
                submitButton.disabled = true;
            } else {
                confirmPasswordError.textContent = "";
                submitButton.disabled = false;
            }
        }

        passwordInput.addEventListener("input", validatePassword);
        confirmPasswordInput.addEventListener("input", validateConfirmPassword);
    });
</script>

<body>
    <h1>会員情報入力</h1>
    <form action="confirm" method="post">
        <label>姓 <input type="text" name="familyname" value="<%= session.getAttribute("familyname") != null ? session.getAttribute("familyname") : "" %>" placeholder="山田" required></label>
        <label>名 <input type="text" name="firstname" value="<%= session.getAttribute("firstname") != null ? session.getAttribute("firstname") : "" %>" placeholder="太郎" required></label>
        <br/>
        <label>Email <input type="email" name="email" value="<%= session.getAttribute("email") != null ? session.getAttribute("email") : "" %>" placeholder="exam@example.com" required></label>
        <br/>

        <label>Password <input type="password" id="password" name="password" required></label>
        <p id="passwordError" style="color: red; font-size: 14px;"></p> <!-- エラーメッセージ表示 -->
        
        <label>Password(確認用) <input type="password" id="subpassword" name="subpassword" required></label>
        <p id="confirmPasswordError" style="color: red; font-size: 14px;"></p> <!-- エラーメッセージ表示 -->
        <br/>

        <button type="submit" id="submitBtn">次へ</button>

        <a href="login.jsp">アカウントがある方はこちら</a>        
    </form>
</body>
</html>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        text-align: center;
        margin: 0;
        padding: 0;
    }

    h1 {
        margin-top: 30px;
        color: #333;
    }

    form {
        background: white;
        max-width: 400px;
        margin: 20px auto;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        display: flex;
        flex-direction: column;
    }

    label {
        font-weight: bold;
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        margin-bottom: 10px;
    }

    input {
        width: 100%;
        padding: 8px;
        margin-top: 5px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 14px;
    }

    button {
        background-color: #007bff;
        color: white;
        padding: 10px;
        font-size: 16px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        margin-top: 15px;
    }

    button:hover {
        background-color: #0056b3;
    }

    /* アカウントがある方のリンク */
    a {
        display: block;
        margin-top: 15px;
        color: #007bff;
        text-decoration: none;
    }

    a:hover {
        text-decoration: underline;
    }

</style>
