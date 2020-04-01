#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

# 生成页面文件
if [ -d dist ]; then
  rm -rf dist
fi

# 解决强制提交gitbook不更新的问题
git clone -b gh-pages git@github.com:zhanglingx/blog.git dist
cp -r assets dist
cp -r docs/* dist
cp -r README.md dist

cd dist
git add -A
git commit -m 'deploy'
git push origin gh-pages:gh-pages

# mkdir dist
# cp -r assets dist
# cp -r docs/* dist
# cp -r README.md dist

# 进入生成的文件夹
# cd dist

# git init
# git add -A
# git commit -m 'deploy'

# 如果发布到 https://<USERNAME>.github.io/<REPO>
# git push -f git@github.com:zhanglingx/blog.git master:gh-pages

cd -