# 会員登録機能の設計書

## 1. 概要

会員登録機能のシステム構成と実装の方針を記載する。ユーザーはWeb画面から情報を入力し、バックエンドのServletを通じてデータベースに登録を行う。その後、ユーザーはログインしてシステムを利用できる。

---

## 2. 構成図

### 2.1 システム構成

```
ユーザー  --- (入力) -->  フロントエンド (/index.jsp)
                \-- (バリデーションチェック) --> ログイン画面 (/login.jsp)
                      \-- (確認) --> 入力内容確認 (/confirm.jsp)
                              \-- (登録) --> 登録完了 (/register.jsp)
```

---

## 3. 処理流れ

### 3.1 会員情報登録
1. ユーザーが `/index.jsp` に入力
2. フロントエンド側でバリデーション
3. `/confirm.jsp` へ値を渡す (Sessionを利用)
4. マスク表示の後、Servlet (`RegisterServlet`) にPOST
5. Servlet側で内部バリデーション
6. データベースに登録
7. 完了画面 `/register.jsp` にリダイレクト

---

## 4. データベース設計

### 4.1 `users` テーブル

| カラム名 | 型 | 備考 |
|---|---|---|
| id | INT AUTO_INCREMENT PRIMARY KEY | 一意なユーザーID |
| username | VARCHAR(255) NOT NULL | ユーザー名 |
| email | VARCHAR(255) UNIQUE NOT NULL | メールアドレス |
| password | VARCHAR(255) NOT NULL | BCryptでハッシュ化 |
| created_at | TIMESTAMP DEFAULT CURRENT_TIMESTAMP | 登録日 |

---

## 5. セキュリティ要件

- セッション管理
  - ログイン時に新しいSession IDを発行
  - 登録完了時にセッションを破棄
- パスワードの保証
  - BCryptを使用したハッシュ化
  - プレーンテキストストレングスを適切化
- CSRF / XSS対策
  - Servletで入力値のエスケープ処理
  - CSRF Tokenの利用

---

## 6. 実装方針

### 6.1 Servlet
- `RegisterServlet`
  - POSTリクエストを受け付け
  - バリデーションを実行
  - データベースに登録
  - ログイン画面へリダイレクト

### 6.2 JSP
- `index.jsp`
  - 入力フォーム + バリデーション
- `confirm.jsp`
  - マスク表示 + 入力情報の伝達

---

これにより、会員登録機能の設計を明確にし、実装が効率的に行えるようにする。

