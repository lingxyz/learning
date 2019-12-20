# 用Docker统一本地开发环境

前端开发从原始的 HTML + CSS + JavaScript 开发，发展到如今的以数据驱动的 Vue、React、Angular 框架，以及 ES6+，TypeScript、Pug、Stylus 等技术的使用，大大方便了开发者。

但源码必须经过各种编译、打包工具产出浏览器可运行的代码，这给前端开发（尤其是非科班出身）带来了难度。经常遇到的现象是，当我们接手一个新项目，满怀期待执行

```bash
cd [project_root_path]
npm i
```

后，面对各种报错信息一脸懵......

为了统一前端的本地开发环境，告别npm因在Windows、Lilux、macOS系统的差异而导致的编译问题，我们引入 Docker 小助手。

## Step1，Docker 安装运行

这个...自己google一下吧，相信难不倒大家滴！

## Step2，配置文件创建

1. 从github/gitlab克隆已有项目，本地新建分支

```bash
git clone https://github.com/zhanglingco/Blog
git checkout -b feature-docker
```

为排除垃圾代码影响，这里我们用 [vue-cli](https://cli.vuejs.org/zh/guide/creating-a-project.html#)创建一个项目：

```bash
vue create hello-world
```

1. Docker 配置文件的创建

在项目根目录`/hello-world`我们创建两个配置文件，`.dockerignore`和`Dockerfile`。

`.dockerignore`是告诉Docker忽略哪些文件，类似`.gitignore`：

```bash
.DS_Store
node_modules
dist
.git
```

`Dockerfile`是Docker的配置文件，在构建`image`时读取：

```bash
# node版本
FROM node:8.9.4
# 拷贝的文件路径 目标文件夹路径
COPY . /app
# 工作目录
WORKDIR /app
# npm 安装依赖包，注意registry，可以采用淘宝，可以采用企业私服地址
RUN npm i --registry=http://10.32.1.103:4873/
# 暴露给外部的端口，与vue-cli端口保持一致
EXPOSE 8080
```

## Step3，构建 image

一行代码搞定`image`构建，so easy!

```bash
# cd /hello-world
docker image build -t hello-world .
```

构建完成后，执行`docker image ls`查看。

## Step4，生成容器

执行`docker container run`从`image`文件生成容器：

```bash
docker container run -p 8080:8080 -v $(pwd):/app -it c4i-web /bin/bash
```

这句有必要解释下，高手略过：

```bash
-p 本地端口:docker端口
-v 本地目录:docker文件目录
-it 镜像名[：版本]
/bin/bash 容器启动以后，启动 Bash，保证用户可以使用 Shell
```

## Step5 运行项目

经过以上一番折腾，达到了两个目的：

1. 项目运行在docker容器内
2. 项目端口与本地`8080`端口同步，项目文件与本地/hello-world 文件同步

docker container 内部执行 `npm run dev`，坐等出现提示`server start on http://localhost:8080/`

这时我们怀着激动的心情打开浏览器`http://localhost:8080/`，简直不敢相信自己的眼睛，一片空白？WTF!!!

这其实是 Vuejs 的一个配置问题，稍作修改即可

```bash
vi config/index.js
找到 host 属性，改为 host: '0.0.0.0'
```

本机浏览器打开`http://localhost:8080/`，完美！本机改动一下文件，`hot reload`立马呈现！

## Step 6 命令封装

至此，我们距离成功只差一行代码了！为了方便其它开发人员使用，我们将以上命令封装在 `package.json` 的 `script` 属性中。

```javascript
"scripts": {
    "docker": "docker image build -t hello-world .;docker container run -p 8080:8080 -v $(pwd):/app -it hello-world /bin/bash",
        ...
  },
```

其它同事同步代码后，在项目根目录执行

```bash
npm run docker
```

即可一键构建 `image` 和 `container`。

