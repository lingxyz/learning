## 考点
DOM 对象与 jQuery 对象的异同

## 分析

- 在 `jQuery `中，全局变量 `jQuery === $`，因此 `jQuery('#id') ` 就是 `$('#id')`

- JS 通过 document.getElementById('id') 选择 DOM 元素，jQuery 通过 $('id') 选择具有相同 id 元素集合（类数组）

## 答案

```js
// 第一种方式
$('#id').get(0) === document.getElementById('id')
// 第二种方式
$('#id')[0] === document.getElementById('id')
```

## 拓展

### 类数组

定义：

- 拥有 `length` 属性，`length-0` 可隐式转换为 number 类型，并且不大于 `Math.pow(2,32)`

示例：

```js
// 此对象具有 length 属性，是类数组
var a = {'1':'gg','2':'love','4':'meimei',length:5}
Array.prototype.join.call(a,'+');//'+gg+love++meimei'
```

JavaScript 中常见的类数组有 `arguments` 对象和 `document.getElementsByTagName()` 等 DOM 方法返回的结果

参见：https://segmentfault.com/a/1190000000415572