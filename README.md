# servletを使ったWeb開発

---

## 環境開発
https://downloads.apache.org/tomcat/tomcat-9/v9.0.100/bin/ において環境に合った圧縮ファイルををダウンロード、解凍する。

CLASSPATH を apache-tomcat-9.0.100\lib\servlet-api.jar

CATALINA_HOME を apache-tomcat-9.0.100

に設定する。

mySQLの環境も整えておく。
## 実行
apache-tomcat-9.0.100/webapps/ 内の tutorial を apache-tomcat-9.0.100/webapps/ に配置し、
apache-tomcat-9.0.100/webapps/tutorial/WEB-INF/classes 内に config.properties ファイルを作成する。
```
db.url=jdbc:mysql://localhost:3306/mydatabase
db.username={ユーザ名}
db.password={パスワード}
```
config.properties ファイル内に上のコードを書く。
ユーザ名、パスワードはmysqlのユーザ名とパスワードである。
apache-tomcat-9.0.100/bin において以下を実行する。
```
sh shutdown.sh
sh startup.sh
```
http://localhost:8080/tutorial/
にアクセスする。
