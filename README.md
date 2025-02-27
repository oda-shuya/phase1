# servletを使ったWeb開発

---

## 環境開発
https://downloads.apache.org/tomcat/tomcat-9/v9.0.100/bin/ において環境に合った圧縮ファイルををダウンロード、解凍する。

CLASSPATH を apache-tomcat-9.0.100\lib\servlet-api.jar

CATALINA_HOME を apache-tomcat-9.0.100

に設定する。

## 実行
apache-tomcat-9.0.100/webapps/ 内の tutorial を apache-tomcat-9.0.100/webapps/ に配置し、
apache-tomcat-9.0.100/bin において以下を実行する。
```
sh shutdown.sh
sh startup.sh
```
http://localhost:8080/tutorial/hello
にアクセスすると、Hello, World!と出力された画面を見ることができる。
