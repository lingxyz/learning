# Array.prototype.includes

`ES7` 新增 `Array.prototype.includes` ，来判断某元素在数组中是否存在。它返回一个布尔值，是`indexOf`的替代。

### 用法

`Array.includes(element[, fromIndex])` => `Boolean`

| 参数 | 类型 | 解释 |
| --------   | ----- | ---- |
| Array | `Array` | 数组 |
| element | `String`/`NaN`/`Number`... | 某元素 |
| fromIndex | `Number` | 查询的起始位置【可选】 |

其结果为布尔值，相比于`indexOf`省去了结果的类型转换，更加直观简单：

```js
let arr = ['react', 'angular', 'vue']

if (arr.includes('vue')) {
    console.log('Vue is exist')
}
```

`includes` 也可以在 `NaN` (非数字)使用:

```js
[1, 2, NaN].includes(NaN) // true
```

`includes` 第二可选参数 `fromIndex`，允许从特定位置开始寻找匹配，提高了性能。
```js
['a', 'b', 'c'].includes('a', 1) // false
```

### `ES7 includes` 发布前的方法

- 使用 `indexOf`

`Array.indexOf(element)`返回元素`element`在`Array`中的位置，若不存在，则返回-1。

结果是一个数字，而非布尔值。

所以当开发人员需要判断某元素在数组中是否存在时，需要加额外的判断，将数字结果转换为`Boolean`。

```js
let arr = ['react', 'angular', 'vue']

if (arr.indexOf('vue') !== -1) {
    console.log('Vue is exist')
}
```

或者使用`~`使代码更紧凑些。`~a = -(a + 1)`

```js
let arr = ['react', 'angular', 'vue']

if (~arr.indexOf('vue')) {
    console.log('Vue is exist')
}
```

- 使用 `JavaScript` 库

jQuery: [$.inArray](http://api.jquery.com/jquery.inarray/)

Underscore.js: [_.contains](http://underscorejs.org/#contains)

Lodash: [_.includes ](https://lodash.com/docs/4.17.10#includes)

CoffeeScript: [in](http://coffeescript.org/#try:arr%20%3D%20%5B'react'%2C%20'angular'%2C%20'vue'%5D%0Aif%20('react'%20in%20arr)%0A%20%20console.log('Can%20use%20React')%0A)

Darf:  [list.contains](https://gist.github.com/anonymous/b8e39109e5705a9a0ff7281c1af97195)