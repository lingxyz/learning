#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

# 生成页面文件
if [ -d dist ]; then
  rm -rf dist
fi
mkdir dist
cp -r assets dist/assets
cp -r docs/* dist

# 进入生成的文件夹
cd dist

git init
git add -A
git commit -m 'deploy'

# 如果发布到 https://<USERNAME>.github.io/<REPO>
git push -f git@github.com:zhangling91/blog.git master:gh-pages

cd -