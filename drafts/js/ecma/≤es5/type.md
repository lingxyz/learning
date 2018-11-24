# JS 类型检测

javascript内置的类型检测操作符，其中两种是最有用的：
- typeof    
返回变量类型名称的字符串

```js
if(typeof num == "string")  //检查数字是否是字符串
    num = parseInt(num);    //若是，解析出整数，可能为NaN
if(typeof arr == "string")  //检查数组是否是字符串
    arr= arr.split(",");    //若是，根据逗号切分出数组
```

缺点：     
无法区分object和array、自定义对象，都会返回'object'     
在Safari(直到第四版)中检测正则表达式，都会返回"Function"

- 利用构造函数（constructor）判断对象类型

```js
if(num.constructor == String)
    num = parseInt(num);
if(str.constructor == Array)    //检查字符串是否是数组
    num = num.join(",");        //若是，用逗号归并出字符串
```

但这些类型操作符并非是完全可靠的。

如**instanceof**，在浏览器含有多个框架（安全作用域）的时候，也是问题多多。如检测数组和原生的JSON。

所以，我们很难知道，检测到的构造函数是原生的，还是一些框架、库内部定义的。

### 利用object对象的toString()方法，进行安全类型检测

任何值调用object的toString()方法，都会返回一个[object nativeConstructorName]格式的字符串。

由于原生数组、json、正则等的构造函数都和全局作用域无关，只和原生有关。因此可以用此方法排除非原生构造函数的影响。

``` js
// 检测原生数组
function isArray(value) {
    return object.prototype.toString.call(value) == '[object Array]';
}

/*同理*/
// 检测原生函数
function isFunction(value) {
    return object.prototype.toString.call(value) == '[object Function]';
}

// 检测原生正则
function isRegExp(value) {
    return object.prototype.toString.call(value) == '[object RegExp]';
}

// 检测原生json
var isNativeJSON == window.JSON && object.prototype.toString.call(JSON) == '[object JSON]';
```

_注意：_

> 1.IE中以COM形式实现的任何函数，isFunction()都将返回false(因为他们并非原生javascript函数)。
>
> 2.object.peototype.toString()本身也可能被修改，我们在此讨论的是假设它是未被修改的原生版本。

_参考资料：《javascript高级程序设计》 22.1.1 安全的类型检测_
