# 会員登録

## DB設計

```mysql
CREATE TABLE userlist(
    useruid varchar(36) NOT NULL primary key,
    username varchar(256) NOT NULL,
    email varchar(256) NOT NULL,
    password varchar(256) NOT NULL
);
```

```mermaid
sequenceDiagram

participant user as user
participant index as index.jsp
participant confirm as confirm.jsp
participant register as register.jsp
participant server as HelloServlet.java
participant db as DataBase

user ->> index: 会員情報を入力
index ->> index: session に保存
index ->> confirm: ページ遷移
confirm ->> confirm: session からデータ取得
confirm -->> user: 会員情報内容を表示
user ->> confirm: 確認完了
confirm ->> register: ページ遷移
register ->> register: session からデータ取得
register ->> server: DB に登録
server ->> db: 会員情報を保存
db -->> server: StatusCode: 200
server -->> register: 登録完了メッセージ
register -->> user: 登録完了画面を表示
```
