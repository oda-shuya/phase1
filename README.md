# GitHub

この手順では、GitHubにあるプロジェクトを自分のパソコンにコピーして、自分専用の作業場所（ブランチ）を作ります。その後、プログラムを少し変えて、インターネットにアップロードする方法を学びます。

---

## 1. Gitをインストールする方法

### Windowsの場合

1. **公式サイトからインストーラーをダウンロード**
   * ブラウザで[Git公式サイト](https://git-scm.com/download/win)にアクセスするよ。
   * 大きいボタンを押して、インストーラー（.exeファイル）をダウンロードする。
2. **インストーラーを実行する**
   * ダウンロードしたファイルをダブルクリックして開こう。
   * 「次へ(next)」ボタンや「同意(agree)」ボタンを押しながら、インストールを続けるよ。
   * 特にこだわりがなければ、設定はそのままデフォルト（何もしない）で大丈夫。
3. **インストール完了！**
   * インストーラーが終わったら、パソコンに「Git」というソフトが入ったことになるよ。
   * Windowsメニューに「Git Bash」や「Git GUI」というアプリが追加されるはず。

### Macの場合

1. **Xcode Command Line Toolsを利用する方法（簡単）**
   * Macでターミナルを開いて、「`git --version`」と打ってみよう。
   * もしGitが入っていなければ、「Command Line Toolsをインストールしますか？」と聞かれる。
   * **OK**を押せば自動的にインストールされるよ。
2. **公式サイトからダウンロードする方法**
   * [Git公式サイト](https://git-scm.com/download/mac)にアクセスして、パッケージファイルをダウンロードする。
   * ダウンロードしたファイルをダブルクリックして、表示される案内に従ってインストールする。
3. **インストール完了の確認**
   * ターミナルを開き、「`git --version`」と入力し、バージョンが表示されれば成功

---

## 2. GitHubのアカウントを作ろう

* **もしGitHubのアカウントを持っていなかったら：**
  * [GitHubのサイト](https://github.com/)にアクセスし、アカウントを作ってね。
  * アカウントを作ると、みんなと一緒に作業できるようになるよ。
* もしGitをそもそもダウンロードしていない場合

---

## 2. プロジェクトのページに行こう

* ブラウザで下のリンクをクリックするか、アドレスバーに貼り付けてね：
  [https://github.com/oda-shuya/phase1](https://github.com/oda-shuya/phase1)
* このページには、今日使うファイルやプログラムが入っています。

---

## 3. コードをコピーするためのURLを取得しよう

* ページの上の方に「**Code**」という緑色のボタンがあるよ。
  そのボタンをクリックして、「**HTTPS**」のところに書かれているURLをコピーするね。
  例:
  ```
  https://github.com/oda-shuya/phase1.git
  ```

---

## 4. 自分のパソコンにプロジェクトをコピー（clone）しよう

* **ターミナル（コマンドを打つ画面）を開く**
  Windowsなら「コマンドプロンプト」や「Git Bash」、Macなら「ターミナル」を使ってね。
* **デスクトップなど、好きな場所に移動する**
  例:

  ```
  cd Desktop
  ```
* **プロジェクトをコピーする（git clone）**
  さっきコピーしたURLを使って、次のコマンドを打とう:

  ```
  git clone https://github.com/oda-shuya/phase1.git
  ```

  これで、プロジェクトのフォルダがあなたのパソコンにできます。

---

## 5. 自分専用の作業場所（ブランチ）を作ろう

* ターミナルで、さっきコピーしたプロジェクトのフォルダに入る:
  例:

  ```
  cd phase1
  ```
* 自分の名前を使ったブランチを作るために、次のコマンドを入力する:

  ```
  git switch -c 自分の名前
  ```

  ※「自分の名前」の部分を自分の本当の名前やニックネームに変えてね。

---

## 6. プログラムを編集して、変更を記録しよう

* **VSCodeを開いて、プロジェクトのフォルダを開く**
  VSCodeを使うと、ファイルを簡単に編集できるよ。
* **ファイルを少し変更してみる**
  例えば、コメントを追加したり、文字を変えてみたりしよう。
* **変更をGitに記録（commit）する準備**
  ターミナルで、変更したファイルを「ステージ」に追加する:

  ```
  git add .
  ```

  ※「.」は、すべての変更をまとめて追加する意味です。
* **変更を記録する（commit）**
  自分がした変更について、メッセージを書いて記録するよ:

  ```
  git commit -m "自分の名前の変更内容"
  ```

  ※メッセージは「何を変えたか」を簡単に説明する文章にするよ。
* **変更をインターネットにアップロード（push）する**
  次のコマンドで、あなたのブランチに変更を送ります:

  ```
  git push --set-upstream origin 自分の名前
  ```

  ※「自分の名前」は先ほど作ったブランチ名と同じにするよ。

---

## 7. ブラウザで確認しよう

* 再び、[https://github.com/oda-shuya/phase1](https://github.com/oda-shuya/phase1) にアクセスしてね。
* ページの上部の「Branch（ブランチ）」というところをクリックすると、自分のブランチがあるか確認できるよ。

---
