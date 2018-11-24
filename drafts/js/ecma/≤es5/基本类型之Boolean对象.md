### Boolean 对象
Boolean 对象表示两个值："true" 或 "false"

> 创建：
```js
new Boolean(value);	//构造函数
Boolean(value);		//转换函数
```

> 属性：
- `constructor` 返回对创建此对象的 Boolean 函数的引用
```js
var myvar = new Boolean(1);
console.log(myvar.constructor)
// function Boolean() {[native code]}
```

- `prototype` 使您有能力向对象添加属性和方法

> 方法：
- `toSource()` 返回该对象的源代码

- `toString()`	把逻辑值转换为字符串，并返回结果("true"/"false")

- `valueOf()` 返回 Boolean 对象的原始值(true/false)
