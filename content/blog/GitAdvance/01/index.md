---
title: "#1 git logでコミット履歴を見る(前編)"
postdate: "2020-11-11"
updatedate: "2020-11-11"
category: "Git中級者を目指す"
image: './01/image01.jpg'
description: git log のオプションは多岐にわたります。入門書に載っている基本的で有名なものからちょっとマニアックなものまで、できるだけ例を踏まえて紹介しますので良ければ実際にコマンドを打ち込みながら読んでみてください。
---

<section class="section">

# git logのオプション

`git log`のオプションは多岐にわたります。入門書に載っている基本的で有名なものからちょっとマニアックなものまで、できるだけ例を踏まえて紹介しますので良ければ実際にコマンドを打ち込みながら読んでみてください。

※対象はgitの入門書を読み終えた方を想定して書きました。~~自分が全然わかっていなかったこともあり~~ だからと言っては何ですが、記述が冗長になっていたりやたら丁寧だったりするかもしれませんが、ご了承ください。

<section class="section">

## --onelineで簡易出力する

単純に`git log`を実行した場合、コミットのハッシュID40桁、Authorの情報、コミット日時、コメント全行が表示されます(「そういえばAuthorって何?」っていう人は本ページ下部の参考を見てください。)。

```bash
$ git log
commit ff3bb636fe5dff87b1a9686dbc9a0112ba6cf670 (HEAD -> master)
Author: potsunen <potsunen@potsunen.com>
Date:   Fri Nov 13 11:45:59 2020 +0900

    master-commit

    masterブランチでのコミット

commit 8306dd3d794c6508a30d72f2d85f9e494c9077f3
Author: potsunen <potsunen@potsunen.com>
Date:   Fri Nov 13 11:45:41 2020 +0900

    initial commit
```

`--oneline`を付けた場合、短縮されたハッシュID、HEADが指しているブランチ、そしてコメントの先頭行だけが表示されます。

```shell
$ git log --oneline
ff3bb63 (HEAD -> master) master-commit
8306dd3 initial commit
```

なお、`oneline`は`--pretty=oneline --abbrev-commit`を短縮したオプションのようです。
※abbrev → abbreviated → 省略された の意。

</section>

<section class="section">

## `--all`と`--graph`で他ブランチも含め、グラフィカルに出力する

developブランチを切っていてmasterブランチにいるとします。ここで単純に`git log`と打つと、masterブランチのログしか表示されません。

```shell
$ git log --oneline

ff3bb63 (HEAD -> master) master-commit
8306dd3 initial commit

※本当はdevelopブランチでのコミットがある。masterブランチにいるから見えない。
```

他のブランチのコミットも含めログを確認するには、`--all`オプションを渡します。

```shell
$ git log --oneline --all

ff3bb63 (HEAD -> master) master-commit
c3872b8 (develop) develop-commit # developブランチでのコミットも見れる!
8306dd3 initial commit
```

さらに`--graph`オプションを使用すると、アスタリスクや線を使い、グラフィカルにログを表示してくれます。

```shell
$ git log --oneline --all --graph

* ff3bb63 (HEAD -> master) master-commit
| * c3872b8 (develop) develop-commit
|/
* 8306dd3 initial commit
```

通常、複数のブランチを切りマージを繰り返していきますので、`--all`と`--graph`の組み合わせは強力です。

私は`git log --oneline --all --graph`のエイリアスを設定しています。

一応、コマンドエイリアスの設定方法をここで紹介しておきます。`git config --global --edit`を実行すると、テキストエディタが立ち上がりますので、以下のように入力します。

```vim
[alias]
  lol = log --oneline --all --graph
```

`lol`がエイリアスの名前です。一度設定しておけば`git lol`と実行するだけでグラフィカルなログが閲覧できます。

</section>

<section class="section">

## `-p`で変更内容を確認する

`-p`オプションを渡すことで、コミットごとの変更内容を出力することができます。`git log`と`git diff`の組み合わせのようなものだと考えていいと思います。
以下のコマンドを実行してください。ファイルの作成と内容の変更を行っています。

```bash
# htmlファイルを作成し、コミットします。
touch index.html
git add .
git commit -m "create html"

# 作成したファイルに3行追記し、コミットします。
echo -e "aaa\nbbb\nccc" >> index.html
git add .
git commit -m "edit html"
```

`git log -p`とすることで、そのコミットでの変更箇所と内容を確認することができます。`git log -p --oneline`と入力してみます。

```shell
$ git log -p --oneline

71ce239 (HEAD -> master) edit html
diff --git a/index.html b/index.html
index e69de29..1802a74 100644
--- a/index.html
+++ b/index.html
@@ -0,0 +1,3 @@
+aaa
+bbb
+ccc

f082e60 create html
diff --git a/index.html b/index.html
new file mode 100644
index 0000000..e69de29
```

最初のコミット(上記で言うf082e60)を見てみると、`new file`という記述があり、新しいファイルがコミットされたことを表しています。

```shell
f082e60 create html
diff --git a/index.html b/index.html
new file mode 100644   # これ
index 0000000..e69de29
```

次のコミットでは空だったファイルに3行を追記しました。これは追記した行に`＋`を記すことによって表されます。

```shell
71ce239 (HEAD -> master) edit html
diff --git a/index.html b/index.html
index e69de29..1802a74 100644
--- a/index.html
+++ b/index.html
@@ -0,0 +1,3 @@
+aaa  # これ！
+bbb  # 同じく
+ccc  # 同じく
```

行を削除した場合や編集した場合は`-`で表現されます。

```shell
# ファイルを上書きします。
echo -e "aaaaaa\nbbb" > index.html

git add .

git commit -m "2nd edit"

$ git log -p -1 --oneline

90aa8b2 (HEAD -> master) 2nd commit
diff --git a/index.html b/index.html
index 1802a74..183df72 100644
--- a/index.html
+++ b/index.html
@@ -1,3 +1,2 @@
-aaa
+aaaaaa
 bbb
-ccc
```

1行目の`aaa`は`aaaaaa`に変更されました。これは「`aaa`を削除した。`aaaaaa`を追記した。」と捉えられます。ですので、`aaa`には`-`、`aaaaaa`には`＋`が付与されます。削除された`ccc`も同じく`-`が付与されます。

次、ファイル名を変更してみます。`rename`と表示されます。

```shell
# ファイルをindex.ejsに変更
$ git mv index.html index.ejs

$ git commit -m "Rename index.html"

$ git log -p -1 --oneline

$ git log -p -1 --oneline

341a5ba (HEAD -> master) Rename index.html
diff --git a/index.html b/index.ejs
similarity index 100%
rename from index.html   # from ～から
rename to index.ejs      # to ～へ
```

続いて、ファイルを削除します。`delete`でファイルが削除されたこと、そして削除されたファイルの内容も教えてくれます。

```shell
$ git rm index.ejs

$ git commit -m "Remove index.ejs"

$ git log -p -1 --oneline

99f2aa9 (HEAD -> master) Remove index.ejs
diff --git a/index.ejs b/index.ejs
deleted file mode 100644    # これ
index 183df72..0000000
--- a/index.ejs
+++ /dev/null
@@ -1,2 +0,0 @@
-aaaaaa
-bbb
```
</section>

<section class="section">

## `--word-diff`で-pの出力を読みやすくする

`-p`オプションは便利ですが、出力結果が読みにくい気がしませんか？
`2nd commit`では「aaaをaaaaaaに変更」、「cccを削除」という内容でした。`-p`を渡すだけだと、

```shell
@@ -1,3 +1,2 @@
-aaa
+aaaaaa
 bbb
-ccc
```

というアウトプットですが、`--word-diff`を渡すと以下のように変化します。

```shell
#--grep="2nd"でログの絞り込み
$ git log -p --word-diff --oneline --grep="2nd"

90aa8b2 2nd commit
diff --git a/index.html b/index.html
index 1802a74..183df72 100644
--- a/index.html
+++ b/index.html
@@ -1,3 +1,2 @@
[-aaa-]{+aaaaaa+}
bbb
[-ccc-]
```

`aaa`と`aaaaaa`が同じ行で、`-`と`+`で表現されています。これにより変更内容が分かりやすくなった…気がしませんか:thinking:?

他の例も以下に置いておきます。マークダウン上で見るよりもgitコンソールの方がカラフルですし幾分見やすいですね。

</section>

<section class="section">

## `--stat`で変更内容を簡易的に確認する

`-p`よりももっとザクっと変更内容を確認したい、という時には`--stat`オプションを渡します。

```shell
$ git log --stat --oneline

99f2aa9 (HEAD -> master) Remove index.ejs   # ファイル削除
 index.ejs | 2 --                           # 削除されたファイルに2行記載があった
 1 file changed, 2 deletions(-)             # 要約

341a5ba Rename index.html                           # ファイル名変更
 index.html => index.ejs | 0                        # 変更内容
 1 file changed, 0 insertions(+), 0 deletions(-)

90aa8b2 2nd commit
 index.html | 3 +--                                 # 3箇所変更
 1 file changed, 1 insertion(+), 2 deletions(-)

71ce239 edit html
 index.html | 3 +++                                 # 3箇所変更
 1 file changed, 3 insertions(+)

f082e60 create html                                 # ファイル作成
 index.html | 0                                     # 作成したファイル名
 1 file changed, 0 insertions(+), 0 deletions(-)
```

</section>

<section class="section">

## `--name-stats`で`--stat`よりも更に簡易表示する

変更内容を一文字で表してくれます。
A=Add、M=Modify、R=Rename、D=Delete。

```
$ git log --name-status --oneline
99f2aa9 (HEAD -> master) Remove index.ejs
D       index.ejs
341a5ba Rename index.html
R100    index.html      index.ejs
90aa8b2 2nd commit
M       index.html
71ce239 edit html
M       index.html
f082e60 create html
A       index.html
```

Renameの時に`R100`と表示されていますが、この数字は「変更の前と後で、ファイルの中身がどれくらい一緒か」をパーセンテージで表しています。
今回の例ではファイル名を変更しただけで内容は一切触っていないので、100=「100%一緒だよ」になります。

</section>

<section class="section">

## `--name-only`でファイル名のみ表示する

名前からも分かる通り、変更のあったファイル名のみが表示されます。

```shell
$ git log --name-only --oneline
99f2aa9 (HEAD -> master) Remove index.ejs
index.ejs
341a5ba Rename index.html
index.ejs
90aa8b2 2nd commit
index.html
71ce239 edit html
index.html
f082e60 create html
index.html
```

</section>

<section class="section">

## `-- <path>`で特定のファイルの履歴を確認する

任意のファイルが含まれているコミットのみ出力する場合には、`-- <ファイル名 もしくは パス>`と記述します。以下の例では`--stat`と組み合わせています。`-p`と組み合わせることも可能です。

```shell
$ git log --stat --oneline -- index.ejs

99f2aa9 (HEAD -> master) Remove index.ejs
 index.ejs | 2 --
 1 file changed, 2 deletions(-)

341a5ba Rename index.html
 index.ejs | 2 ++
 1 file changed, 2 insertions(+)
```

なお、パスの前に`--`を付与していますが、これは`git log`に「渡しているのはファイル名だよ」と伝える意味を持っています。もし付与しない場合はブランチ名とみなされます。検索したいファイル名と同名のブランチが切られていないなら、`--`は省略できます（ほとんどの場合省略できそうですね）。

### あれ？index.htmlが引っかからないけど。。。

今回は途中で`index.html`から`index.ejs`にファイル名を変更しています。`-- index.ejs`で検索しても、`index.html`は検索されません。

![キャプチャ](./image01.jpg)

そういう時は`--follow`オプションを付けてください。変更前のindex.htmlも検索してくれます。
なお、引数の順番は注意が必要です。`--follow -- ファイル名`としなければ旧ファイルが検索されませんでした（git version 2.22.0）。

```shell
$ git log --stat --oneline --follow -- index.ejs

99f2aa9 (HEAD -> master) Remove index.ejs
 index.ejs | 2 --
 1 file changed, 2 deletions(-)

341a5ba Rename index.html
 index.html => index.ejs | 0
 1 file changed, 0 insertions(+), 0 deletions(-)

90aa8b2 2nd commit
 index.html | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

71ce239 edit html
 index.html | 3 +++
 1 file changed, 3 insertions(+)

f082e60 create html
 index.html | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
```

</section>

<section class="section">

## `--since`で日付以降のコミット、`--until`で日付以前のコミット

以下のようなコミット履歴があるとします。2017年から2020年まで、各年の1月1日にコミットを行っており、計4回のコミット履歴があります。

```shell
$ git log --format=fuller

commit 13a83c31fc4558b811ae2c0dbb373a60d2359c77 (HEAD -> master)
Author:     potsunen <potsunen@potsunen.com>
Date: Fri Jan 10 00:00:00 2020 +0900

    2020 commit

commit 0fb21bf1e009cd3edb4036bc167db0cb93c1c98b
Author:     potsunen <potsunen@potsunen.com>
Date: Tue Jan 1 00:00:00 2019 +0900

    2019 commit

commit 41ece2df6ad958e89ae9ba91e08d82c3d476ec9d
Author:     potsunen <potsunen@potsunen.com>
Date: Mon Jan 1 00:00:00 2018 +0900

    2018 commit

commit d4657a563990338265ed5af1ff90f8e971546560
Author:     potsunen <potsunen@potsunen.com>
Date: Sun Jan 1 00:00:00 2017 +0900

    2017 commit
```

`--sinse="<date>"`とすることで任意の日付以降にコミットされたコミットのみ出力できます。以下の例だと、2018年1月1日以降を表します。

```shell
$ git log --since="2018-01-01:00:00:00" --oneline
13a83c3 (HEAD -> master) 2020 commit
0fb21bf 2019 commit
41ece2d 2018 commit
```

日付のフォーマットですが色々なものに対応しているようです。

```shell
# YYYY-MM-DD
$ git log --since="2018-01-01"

# YYYY/MM/DD
$ git log --since="2018/01/01"

# YYYY MM DD
$ git log --since="2018 01 01"

# DD/MM/YYYY
$ git log --since="01/01/2018"

# UNIXタイムスタンプ
$ git log --since="1514732400"

# 10週間前
$ git log --since="10 week age"

# 先月
$ git log --since="last month"
```

なお、フォーマットの一部のみ指定した場合の動作ですが、指定していない箇所は現在の日時で補完されるようです。
以下の例では、YYYYに当たる`2019`のみ指定していますが動作します。ただ、2019年1月1日のコミットは表示されません。予想ですが、実行した日付の3月3日とその時間で絞り込みされることになると想像しました。

```shell
$ git log --since="2019" # YYYYのみ
commit 13a83c31fc4558b811ae2c0dbb373a60d2359c77 (HEAD -> master)
Author: potsunen <potsunen@potsunen.com>
Date:   Fri Jan 10 00:00:00 2020 +0900

    2020 commit

 # 今日は2020/03/03なので、
 # --since="2019/03/03(+その時の時間)"とみなされる?
```

検証したところ上記のようになっていると推察したのですが自信はありません。

`--until`は`--since`の逆、任意の日付以前にコミットされたコミットのみ出力します。

```shell
$ git log --until="2018-01-01:00:00:00" --oneline

# 2018年1月1日以前
41ece2d 2018 commit
d4657a5 2017 commit
```

また、`--since`と`--until`を組み合わせることで「〇〇日以降、〇〇日以前」という風に日時を絞り込めます。

```shell
$ git log --since="2017-06-30" --until="2018-06-29" --oneline

41ece2d 2018 commit
```

</section>

<section class="section">

## `--relative-date`で日付を相対表示する

通常、コミットの日時情報はYYYY-MM-DDといった風に絶対表示されますが、`--relative-date`オプションを渡すことで「〇か月前」「〇時間前」といった現在の日時に対する相対的な形式で出力することが可能です。

```shell
$ git log --relative-date --abbrev-commit

commit 1527aea (HEAD -> master)
Author: potsunen <potsunen@potsunen.com>
Date:   3 minutes ago  # 3分前

    4th-commit

commit 0acb905
Author: potsunen <potsunen@potsunen.com>
Date:   6 days ago     # 6日前

    3rd commit

commit 77e12e9
Author: potsunen <potsunen@potsunen.com>
Date:   5 months ago   # 5か月前

    2nd commit
```

</section>

<section class="section">

## マージ関係

`--merges`でマージコミットのみ、`--no-merges`でマージコミットを除外してログを出力します。

```shell
$ git log --graph --all --oneline

*   ba08362 (HEAD -> develop, master) Merge branch 'develop'
|\
| * fa906d1 dev commit
* | be5f689 master commit
|/
* 4f4d558 initial commit

# マージコミットのみ
$ git log --merges --oneline
ba08362 (HEAD -> develop, master) Merge branch 'develop'

# マージコミットを除外
$ git log --no-merges --oneline

be5f689 master commit
fa906d1 dev commit
4f4d558 initial commit
```

</section>

<section class="section">

## Authorとcommitter

これはそのまま、`--author=〇〇`、`--committer=〇〇`の形で記述できます。

```shell
$ git log --author="alien"

commit 9061b6e9231fac0baf0b8967773e26b66517e6ca
Author: alien <alien@andromeda.space> # Author
Date:   Fri Mar 6 16:25:04 2020 +0900

    私は宇宙人だ

# Committerを確認する場合は、fullerオプションを付けてください。
$ git log --committer="potsunen" --format="fuller"

commit c85203de19d282266cdcfe73f800a66a49486e66 (HEAD -> master)
Author:     potsunen <potsunen@potsunen.com>
AuthorDate: Fri Mar 6 16:27:08 2020 +0900
Commit:     potsunen <potsunen@potsunen.com> # Committer
CommitDate: Fri Mar 6 16:27:08 2020 +0900

    create index.html
```
</section>

</section>

<section class="section">

# `git log`ではないけれど

以上、`git log`に関係するオプションを紹介しましたが、`git log`ではないもののコミットログに関係するコマンドをいくつか紹介したいと思います。

<section class="section">

## `git shortlog`でユーザごとのコミット履歴を取得する

`git shortlog`で各コミットをコミットを行ったユーザごとに分類して表示します。
以下の例だと、alien:alien:さんが1コミット、potsunenさんが5コミット行ったことが分かります。コミット数でマウントをとりたいときに便利です。

```shell
$ git shortlog

alien (1):
      edit style.scss

potsunen (5):
      initial commit
      first commit
      second commit
      third commit
      create style.scss
```

| オプション | 意味 |
| --------- | :----- |
|-n|コミット数が多いユーザから表示する|
|-s|コミット数だけを表示する|


```shell
$ git shortlog -ns
     5  potsunen
     1  alien
```

</section>

<section class="section">

## `git blame`で変更を行ったユーザを特定する

`sayHello`という関数名を`screamHello`という名前に変更した人がいるとします。「誰や勝手に関数名変えたの...」

```shell
$ git log -p

bcb5843 (HEAD -> master) Edit script
diff --git a/script.ts b/script.ts
index 4018eac..37504b5 100644
--- a/script.ts
+++ b/script.ts
@@ -1,4 +1,4 @@

-function sayHello(name: string): void {
+function screamHello(name: string): void {
   console.log('hello ' + name)
 }
```

`git blame`コマンドは、*行ごとに*コミットがあった日時、コミッターを表示します。引数にはファイル名を渡してあげてください。

```shell
$ git blame script.ts

^0f1e08c (potsunen 2020-06-05 11:45:45 +0900 1)
bcb58434 (alien    2020-06-05 11:51:00 +0900 2) function screamHello(name: string): void {
^0f1e08c (potsunen 2020-06-05 11:45:45 +0900 3)   console.log('hello ' + name)
^0f1e08c (potsunen 2020-06-05 11:45:45 +0900 4) }
```

この例で言うと2行目、alienさんが`bcb58434`コミットの時に変更したことが分かります。

なお、blameは「責める、糾弾」などと言った意味です。自分が犯人だった時にはrebase等でもみ消しましょう。

長くなりましたので今回は以上です。次回は後編ということで、

</section>

<section class="section">

## 参考 : AuthorとCommiterの違い

私は

- Author ： 当該ファイルを最初にコミットした人、オリジナルのコードを書いた人
- Commiter ： コミットした人

とイメージしています。

`git commit --amend`でコミットを修正した場合、以下のようになります。

- Author ： 変更されない
- Commiter ： amendしたユーザに変更される

`git log`は多くの場面でAuthorしか出力しませんが、`--pretty=fuller`オプションを渡すことでCommitterも確認することができます。

```shell
$ git log --pretty=fuller

commit 743c4d51cc9631705894e771e1633d6481f8b61b (HEAD -> master)
Author:     potsunen <potsunen@potsunen.co.jp>   # 作成者
AuthorDate: Fri Feb 28 11:13:02 2020 +0900
Commit:     宇宙人 <utyuujin@Andromeda.space>     # amendした人
CommitDate: Fri Feb 28 11:15:26 2020 +0900

    地球侵略記念amend
```

# 参考

- https://qiita.com/yukimura1227/items/fbb076db61a2e43a32e3
- [git diff --name-status で出る R100 って何？](https://stakiran.hatenablog.com/entry/2019/01/14/072206)
- [Advanced Git log](https://www.atlassian.com/ja/git/tutorials/git-log)