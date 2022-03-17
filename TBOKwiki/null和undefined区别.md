## 考点

产生差异的原因以及差异化的使用方法

## 分析

对于大多数计算机语言，有且仅有一个表示“无”的值。如 C 语言的 NULL，Java 的 null。而 JavaScript 却具有两个表示“无”的值。究其原因，与 JavaScript 设计时的历史因素有关。

而这样的现状，导致了我们在使用这两个表示“无”的值的复杂性，要时刻谨记它们的相似性和差异性。

## 答案

`null` 表示一个“无”的空对象，是一个空对象的指针
`undefined` 表示一个“无”的原始值
```js
Number(null) === 0	// true
isNaN(Number(undefined)) // true
```

### 用法差异
对于 `null`，表示“没有对象”，即此处值为空：

1. 作为变量或函数的参数，表示空对象
2. 作为对象原型链的终点
```js
Object.getPrototypeOf(Object.prototype)
```

对于 `undefined`，表示未定义的值：

1. 变量被声明了，但是没有赋值，那么变量的值就等于 `undefined`
```js
let a
a === undefined // true
```

2. 对象的属性没有赋值，该属性的值为 `undefined`
```js
var  o = {}
o.p // undefined
```

3. 函数调用时，已定义的形参却未传入相应的实参，则该形参等于 `undefined`

4. 函数没有返回值时，默认返回 `undefined`

```js
// 打印出 x 值为 undefined，且函数返回 undefined
(function f(x){
	console.log(x)
})()
```

### 类型转换
`null` 与 `undefined` 在做一些比较的时候，会被自动转化

```js
null == undefined   // true
if (null) {}	// 转化为 false
```

具体类型转换的规则，请移步 [JavaScript 类型转换规则](JavaScript 类型转换规则)

## 拓展

### 历史遗留问题

资料参考：《Speaking JavaScript》

1995年JavaScript诞生时，最初像Java一样，只设置了null作为表示"无"的值。根据C语言的传统，null被设计成可以自动转为0。

```js
Number(null) // 0

1 + null // 1
```

但是，JavaScript的设计者Brendan Eich，觉得这样做还不够，有两个原因。

- 首先，null像在Java里一样，被当成一个对象。但是，JavaScript的数据类型分成原始类型（primitive）和合成类型（complex）两大类，Brendan Eich觉得表示"无"的值最好不是对象。

- 其次，JavaScript的最初版本没有包括错误处理机制，发生数据类型不匹配时，往往是自动转换类型或者默默地失败。Brendan Eich觉得，如果null自动转为0，很不容易发现错误。

因此，Brendan Eich又设计了一个undefined。