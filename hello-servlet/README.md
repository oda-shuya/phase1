# Hello Servlet Project

このプロジェクトは、Java Servletを使って "Hello, World!" を表示するサンプルアプリケーションです。

**🚀 クイックスタート**

## 1. リポジトリをクローン

```
git clone https://github.com/your-username/hello-servlet.git
cd hello-servlet
```

## 2. 必要なツール

- Java 17以上

- Apache Maven


## 3. ビルドと実行

Mavenを使ってTomcat上でアプリケーションを起動します。

```
mvn clean install
mvn tomcat7:run
```

## 4. アクセスURL

アプリケーションホーム: http://localhost:8080/


プロジェクト構成
```
hello-servlet/
    ├── src
    │   └── main
    │       ├── java
    │       │   └── com/example/helloservlet
    │       │       └── HelloWorldServlet.java
    │       └── webapp
    │           ├── WEB-INF
    │           │   └── web.xml
    │           └── index.jsp
    └── pom.xml
```
