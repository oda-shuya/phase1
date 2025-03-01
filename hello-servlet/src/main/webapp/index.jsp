<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>会員情報入力画面</title>
</head>
<body>
    <h1>会員情報入力</h1>
    <form action="confirm" method="post">
        <label>Username: <input type="text" name="username" required></label>
        <p>Email: <input type="email" name="email" required></p>
        <p>Password: <input type="password" name="password" required></p>
        <p>Password for checking: <input type="password" name="password" required></p>

        <button type="submit">次へ</button>
    </form>
</body>
</html>

<style>
    body{
        text-align: center;
    }
</style>
