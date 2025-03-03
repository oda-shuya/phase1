# **概要設計（アーキテクチャ設計）**

## **1. システム全体構成**

- **アーキテクチャ:**  
  - **MVC（Model-View-Controller）パターンを採用**  
    - Model（データ管理・DBアクセス）  
    - View（JSP）  
    - Controller（Servlet）  

- **開発技術:**  
  - 言語: **Java**
  - フレームワーク: **なし（Servlet & JSP を直接使用）**
  - データベース: **MySQL**
  - インフラ: **Docker（開発環境）**
  - 認証方式: **セッションベース認証**

- **ディレクトリ構成**

```zsh
/webapp
 ├── /WEB-INF
 │    ├── /views (JSPファイル)
 │    ├── /lib (外部ライブラリ)
 │    ├── web.xml
 ├── /src
 │    ├── /controller (Servlet)
 │    ├── /model (DB, 型宣言)
 │    ├── /service (ビジネスロジック)
 ├── /db (SQLスクリプト)
 ├── /config (設定ファイル)
```

---

## **2. 機能一覧・システム構成**

|No|機能|リクエスト/レスポンス|Servlet|
|-|-|-|-|
|1|会員情報入力|GET `/index` 画面表示|`IndexServlet`|
|2|入力確認|POST `/confirm` 確認画面表示|`ConfirmServlet`|
|3|会員登録|POST `/register` DB登録|`RegisterServlet`|

---

## **3. データ設計（概念設計）**

**テーブル定義**

```sql
CREATE TABLE `userlist` (
  `user_uid` varchar(36) NOT NULL,
  `familyname` varchar(20) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_uid`)
);
```

- **パスワードはハッシュ化して保存**（`BCrypt` 使用予定）
- **メールアドレスはユニーク制約あり**
- **トランザクション管理（競合対策）を考慮**

---

## **4. 非機能要件の整理**

|要件|対策|
|-|-|
|セキュリティ|パスワードハッシュ化（BCrypt）|
|パフォーマンス|インデックス適用（email）|
|エラーハンドリング|共通エラーページ実装|

---

## **5. インフラ設計**

- **Docker + MySQL**
- **ログ管理:** `log4j` を使用
- **セッション管理:** `HttpSession` を利用

---

## **詳細設計**

### **1. クラス設計（DAO, DTO, Service, Controller）**

- **DTO（データ転送オブジェクト）**
  
  ```java
  public class UserDTO {
    private UUID   userUid;
    private String firstName;
    private String lastName;
    private String email;
    private String hashedPassword;
  }
  ```

- **DAO（データアクセス層）**
  
  ```java
  public class UserDAO {
    public boolean findByEmail(String email) { ... }
    public boolean insert(UserDTO user) { ... }
  }
  ```

- **Service（ビジネスロジック層）**
  
  ```java
  public class UserService {
    public UUID    generateUuid() { ... }
    public boolean registerUser(UserDTO user) { ... }
  }
  ```

---

## **2. API設計（Servletのリクエスト/レスポンス）**

|エンドポイント|メソッド|リクエスト|レスポンス|Servlet|
|-|-|-|-|-|
|/register|POST|ユーザー情報|登録成功/エラーメッセージ|`RegisterServlet`|
|/login|POST|メール, パスワード|ログイン成功/エラーメッセージ|`LoginServlet`|

---

## **3. データベース詳細設計**

- **インデックス:** `email` に適用
- **トランザクション:** `commit()` / `rollback()` で管理

---

## **4. 画面設計（JSPファイル構成）**

- `index.jsp`（入力画面）
- `confirm.jsp`（確認画面）
- `register.jsp`（登録完了）

---

## **5. エラーハンドリング**

- **バリデーションエラー時:** フォームに戻り、メッセージ表示
- **システムエラー時:** `error.jsp` へ遷移

---

## **まとめ**

- **概要設計でアーキテクチャを決定**
- **詳細設計でServlet, DAO, DTOの設計を定義**
- **データベース設計を考慮（トランザクション, ハッシュ化）**
- **エラーハンドリング、セキュリティ対策を明確化**
