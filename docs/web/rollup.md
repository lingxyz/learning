## Rollup 简介

Rollup 可以将多个 JavaScript 代码片段编译成一个完整的库和应用。

使用 ES6 的模块标准（ES6 Module），通过将 `import`、`export` 编译为当前被广泛支持的 CommonJS、AMD 以及 IIFE 风格等多种格式，抹平浏览器的兼容性。

可以通过 `命令行` 或 `JavaScript API` 方式调用。

## JS中的模块化

Rollup 中有很多 `JS模块化`的概念。这些概念按时间顺序依次是：

> IIFE, Immediately Invoked Function Expression。通过 `<script>` 标签引入的自执行函数。作用是隐藏局部变量。

> CommonJS，只能在 NodeJS 上运行，使用 require("module") 读取并加载模块。

> AMD, Asynchronous Module Definition，可以看作 CJS 的异步版本，制定了一套规则使模块可以被异步 require 进来并在回调函数里继续使用，然后 require.js 等前端库也可以利用这个规则加载代码了，目前已经是时代的眼泪了。

> UMD, Universal Module Definition，同时兼容 CJS 和 AMD，并且支持直接在前端用 `<script src="lib.umd.js"></script>` 的方式加载。广泛使用。

> ESM, 即 ECMAScript Module，浏览器直接通过 `<script type="module">` 来加载模块。存在兼容性问题。

## 使用命令行打包

全局安装

```bash
npm i --g rollup
```

### 为浏览器打包为iife

将 main.js 依赖的所有js文件打包为 bundle.js。
编译为一个在 `<script>` 标签中可用的自运行函数 `iife`。

```bash
rollup mian.js --file bundle.js --format iife
```

### 为Node.js打包为cjs

在 Node.js 中，需要编译为 CommonJS 模块 `cjs`。

```bash
rollup main.js --file bundle.js --format cjs
```

### 同时用于浏览器和 Node.js

需要为 `UMD` 格式的包指定一个名称。

```bash
rollup main.js --file bundle.js --format umd --name "myBundle"
```

## Tree-Shaking 优化

通过`依赖分析`，Rollup 将实际`未使用的代码剔除`。粒度到`函数`级别。

> `Tree-Shaking` 也叫`live code inclusion`，是一种消除无效代码的方式。根据项目依赖抽离模块内容的 `AST抽象语法树`，然后 `摇动语法树` 以删除所有无效代码，过程类似于 `标记-清除垃圾收集算法`。

```js
// ESM 引入所需函数
import { ajax } from './utils';
ajax(...);

// 对比在commonjs中，只能整体引入模块
const utils = require('./utils');
utils.ajax(...);
```
