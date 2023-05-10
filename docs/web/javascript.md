## 变量
### 基本类型

- JavaScript 数据类型有哪些？ `数据类型`

```
5种基本数据类型：
Undefined、Null、Boolean、Number、String
1种复杂数据类型：Object
```

[ECMAScript 6 入门](http://es6.ruanyifeng.com/#docs/intro ':include :type=iframe width=100% height=400px')

- [`ES6` 简介](http://es6.ruanyifeng.com/#docs/intro)
- [let 和 const 命令](http://es6.ruanyifeng.com/#docs/let)
- [变量的解构赋值](http://es6.ruanyifeng.com/#docs/destructuring)
- [字符串的扩展](http://es6.ruanyifeng.com/#docs/string)
- [正则的扩展](http://es6.ruanyifeng.com/#docs/regex)
- [数值的扩展](http://es6.ruanyifeng.com/#docs/number)
- [Symbol](http://es6.ruanyifeng.com/#docs/symbol)
- [Set 和 Map 数据结构](http://es6.ruanyifeng.com/#docs/set-map)

[ES7 and ES8 特性](https://www.jianshu.com/p/a138a525c287 ':include :type=iframe width=100% height=400px')
  -  Array.prototype.includes
  - Exponentiation Operator(求幂运算(a ** = b) = a ** b = Math.pow(a, b))
- ES8(EcmaScript 2017)
  - String padding(字符串填充 padStart / padEnd)
  - Object.values / Object.entries
  - Object.getOwnPropertyDescriptors返回对象所有自身属性描述
  - Trailing commas(函数参数列表和调用中尾部的逗号)
  - Async Functions(异步函数)
  - 共享内存和Atomics

- [ES11](https://mp.weixin.qq.com/s/q8G82BJE1O6Kz031RNBLbw)
### 引用类型

- [数组的扩展](http://es6.ruanyifeng.com/#docs/array)
- [对象的扩展](http://es6.ruanyifeng.com/#docs/object)


- [null 和 undefined 区别](null和undefined区别) 😄🌙 `数据类型`

### 类型判断
### 类型转换

- JavaScript 类型转换规则 `类型转换`

## 函数

- [函数的扩展](http://es6.ruanyifeng.com/#docs/function)
- 什么是闭包？闭包都有哪些优缺点？ `闭包`
- [什么是高阶函数？](javascript/什么是高阶函数？.md) `函数`


- 数组去重 `算法`

- 字符串翻转 `算法`

- 排序 `算法`


## 面向对象

- [Class 的基本语法](http://es6.ruanyifeng.com/#docs/class)
- [Class 的继承](http://es6.ruanyifeng.com/#docs/class-extends)
- [Decorator](http://es6.ruanyifeng.com/#docs/decorator)
- [Module 的语法](http://es6.ruanyifeng.com/#docs/module)
- [Module 的加载实现](http://es6.ruanyifeng.com/#docs/module-loader)
- [Proxy](http://es6.ruanyifeng.com/#docs/proxy)
- [Reflect](http://es6.ruanyifeng.com/#docs/reflect)

## 异步

```js
defer与async的区别:
defer是“渲染完再执行”，async是“下载完就执行”。
浏览器加载ES6模块
<script type="module" src="./xx.js"></script>
type="module"，默认异步加载，等同于
<script type="module" src="./xx.js" defer></script>
...
```

- [Promise 对象](http://es6.ruanyifeng.com/#docs/promise)
- [Iterator 和 for...of 循环](http://es6.ruanyifeng.com/#docs/iterator)
- [Generator 函数的语法](http://es6.ruanyifeng.com/#docs/generator)
- [Generator 函数的异步应用](http://es6.ruanyifeng.com/#docs/generator-async)
- [async 函数](http://es6.ruanyifeng.com/#docs/async)
- Promise的错误如果统一捕获？
- Promise中的ajax 可以try catch 到么？

- [微任务与宏任务的区别？执行顺序是怎样的？](https://juejin.im/post/5b73d7a6518825610072b42b)  `Eventloop`

- [setTimeout 的实现原理是怎样的？使用注意时应注意什么？](https://mp.weixin.qq.com/s/GI6entTJl2EtP5rRzmQFTw) `延时`

## 内存

- [JavaScript 内存机制](https://juejin.im/post/5b10ba336fb9a01e66164346?utm_source=gold_browser_extension)

[`掘金收藏`](https://juejin.im/user/59e6e9acf265da43111f4c21/collections?type=created)

[`简书收藏`](https://www.jianshu.com/u/539a1124c845)

[最全前端资源汇集](https://www.jianshu.com/p/c3dae0951f74)[Front-end-tutorial](https://github.com/windiest/Front-end-tutorial)

[大前端综合教程、资源汇总](https://github.com/nicejade/nice-front-end-tutorial/blob/master/tutorial/front-end-tutorial.md)

[jsfont](https://github.com/jsfront/src/blob/master/qq.md)

- [null和undefined区别](https://note.youdao.com/s/d3voXpnk)
- [jQuery('#id')与document.getElementById('id')之间如何转换？](https://note.youdao.com/s/VmeQfD1x)

## ECMA

- [jQuery('#id') 与 document.getElementById('id') 之间如何转换？](jQuery('%23id')与document.getElementById('id')之间如何转换？)😄🌙  `DOM选择`
- 什么是事件冒泡与捕获？如何在保证兼容性的前提下，阻止事件冒泡？如何阻止DOM的默认行为？ `事件`

## DOM 扩展

## BOM 扩展

## Nodejs 扩展

- [ArrayBuffer](http://es6.ruanyifeng.com/#docs/arraybuffer)
