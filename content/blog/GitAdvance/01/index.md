updatedate: "2020-12-11"
## `--oneline`で簡易出力する
```shell

commit c5d47834f21e0308b6a180260c2d207e75285f6e (HEAD -> master)
Date:   Fri Dec 11 11:06:40 2020 +0900
commit 993a41313015b66a99727ad65deaed3d837e4bc2
Date:   Fri Dec 11 11:06:07 2020 +0900
    Initial Commit

c5d4783 (HEAD -> master) master-commit
993a413 Initial Commit
なお、`--oneline`は`--pretty=oneline --abbrev-commit`を短縮したオプションのようです。
c5d4783 (HEAD -> master) master-commit
993a413 Initial Commit
4de3594 (develop) develop-commit        # developブランチのログも見れる！
c5d4783 (HEAD -> master) master-commit
993a413 Initial Commit
* 4de3594 (develop) develop-commit
| * c5d4783 (HEAD -> master) master-commit
* 993a413 Initial Commit
git commit -m "Create html"
git commit -m "Edit html"

# cssファイルを作成し、コミットします。
touch style.css
git add .
git commit -m "Create css"
80e04b5 (HEAD -> master) Create css
diff --git a/style.css b/style.css
new file mode 100644
index 0000000..e69de29

ce31455 Edit html