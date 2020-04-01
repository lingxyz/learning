# 使用Node.js制作命令行工具

平时我们喜欢把工程中的命令行配置在`package.json` 的 `script` 中，比如：

```json
"scripts": {
  "dev": "cross-env NODE_ENV=dev node build/server.js",
  "build:test": "cross-env NODE_ENV=test node build/build.js",
  "build:prd": "cross-env NODE_ENV=prd node build/build.js"
}
```

如果需要制作一个像 `Fis`、`Gulp` 这样的全局命令行启动的工具，该怎么做呢？

## 自定义命令

通过 `package.json`中的`bin`自定义指令：

```json
"bin": {
  "gulp": "bin/gulp.js"
}
```

## 命令的参数和选项

`gulp.js` 中通过 [commander.js](https://github.com/tj/commander.js) 来自定义指令的参数：

```js
const { program } = require('commander')

program
  .command('run')
  .option('-d, --debug', 'output extra debugging')
  .option('-s, --small', 'small pizza size')
  .option('-p, --pizza-type <type>', 'flavour of pizza');
  .parse(process.argv)
```

`commander.js` 可以根据用户输入不同的命令参数 `command`、，或选项 `option`，执行不同的脚本，具体用法见其[中文文档](https://github.com/tj/commander.js/blob/master/Readme_zh-CN.md)。

## 原理简析

### npm bin
npm 模块全局安装的时候，npm 会为 模块中 `package.json` `bin` 中配置的文件在 bin目录下创建一个软链接。

bin 目录一般与全局安装包所在 `node_modules` 目录一致，我们可以通过命令 `npm root -g` 查询：

```bash
npm root -g
> /usr/local/bin/lib/node_modules # MacOS
> C:\Users\username\AppData\Roaming\npm\node_modules # Windows
```

本人是MacOS系统，且采用 `nvm` 进行 `nodejs` 版本管理，所以执行的结果是：

```bash
npm root -g
> /Users/username/.nvm/versions/node/v12.14.0/lib/node_modules
```

若是局部安装，则会在项目内的 `./node_modules/.bin` 目录下创建一个软链接。

### process.argv

`process.argv` 是一个 Node.js 全局对象，返回当前进程的所有命令行参数数组。

> process.argv[0]: 返回启动 Node.js 进程的可执行文件所在的绝对路径
>
> process.argv[1]: 返回当前执行的JavaScript 文件所在的绝对路径
>
> process.argv[3/n]: 返回命令行参数

```js
// 1.js
console.log(process.argv)
```

```bash
node 1.js
> [ '/Users/username/.nvm/versions/node/v12.14.0/bin/node',
  '/Users/username/code/1.js' ]

node 1.js -x
> [ '/Users/username/.nvm/versions/node/v12.14.0/bin/node',
  '/Users/username/code/1.js',
  '-x' ]
```