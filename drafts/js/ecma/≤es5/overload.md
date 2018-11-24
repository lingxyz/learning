# 函数重载（function overloading）

面向对象语言如 Java、 PHP 的一个常见特性是，能够根据传入不同数量或类型的参数，通过“重载（overload）”函数来发挥不同的功用。

JavaScript 没有直接支持函数重载，但也有很多办法实现。

函数重载（function overloading）必须依赖两件事：

- 判断传入参数数量的能力
- 判断传入参数类型的能力

### JavaScript 判断传入参数数量

JavaScript 的每个函数都带有一个仅在这个函数内部作用的变量（contextual variabel）,成为参数（argument）。

函数的参数是一个包含所有传给函数的参数的伪数组（pseudo-array），具有length属性，只可以访问不可以修改。

``` js
// 发送一条消息
function sendMessage (msg, obj) {
    // 根据参数数量，分别执行不同的逻辑
    if(arguments.length == 2)
        obj.handleMsg(msg);
    else
        alert(msg);
}

// 调用 sendMessage
sendMessage("Hello world!");

sendMessage("How are you?", {
    handleMsg: function(msg) {
        alert("This is a custom message: " + msg);
    }
});
```

一个将参数转成数组返回的函数
``` js
function makeArray() {
    var arr = [];
    for (var i = 0; i < arguments.length; i++) {
        arr.push(arguments[i]);
    };
    return arr;
}
```

### JavaScript 判断传入参数类型

显示错误信息和默认信息
``` js
function displayerror (msg) {
    // 判断 msg 是否传入
    if (typeof msg == "undefined")
        msg = "an error occurred";

    alert(msg);
}
```

### JavaScript 类型检查

JavaScript 是一个动态类型（dynamically typed）的语言。那么类型检查就显得尤为重要。

有许多方法可以检查变量的类型（详情参阅：[JS 类型检测](../type.md)），这里我们讨论两种特别有用的方法。

- typeof 操作符

结果用一个字符串名称（string name），来表达变量内容的类型。

当变量不是 object、array、null、自定义对象(user, xxx)时，应该算是完美的方法了。因为这些变量的返回结果都是 'object'

``` js
// 判断是否是字符串
if (typeof num == "string")
    num = parseInt(num);

// 判断是否是 数字
if (typeof a == "number")
    a +=''

// 判断是否是 布尔值
if (typeof a == "boolean")
    a = !a

// 判断是否是 undefined
if (typeof a == "undefined")
    a = !a
```

- 构造函数判断对象类型

JavaScript 所有对象都带有构造函数（constructor）的属性，返回构造该对象的那个函数。

``` js
// 检查数字是否是字符串
if (num.constructor == String) {
    num = parseInt(num);
}

// 检查字符串是否是数字
if (str.constructor == Number) {
    str += '';
}

// 检查数字是否是布尔值
if (num.constructor == Boolean) {
    num = +num;
}

// 检查字符串是否是数组
if (str.constructor == Array) {
    str = str.join();
}
```

|       变量       | typeof 变量 | 变量.constructor |
| --------------- | :--------: | :--------------: |
|  {a: 'object'}  |  'object'  |      Object      |
| ['an', 'array'] |  'object'  |      Array       |
|  function(){}   | 'function' |     Function     |
|    'string'     |  'string'  |      String      |
|        0        |  'number'  |      Number      |
|      true       |  'boolean' |     Boolean      |
|   new User()    |  'object'  |       User       |

一个可以用来严格维护传入函数的所有参数的函数
``` js
function strict (types, args) {
    if (types.legth != args.length) {
        // throw 在console抛出一个错误
        throw "Invalid number of argument. Expected "
            + types.length
            + ", received "
            + args.length
            + " instead.";
    }

    for (var i = 0; i < args.length; i++) {
        if (args[i].constructor != types[i]) {
            // 注意这里的 name 属性(以字符串返回函数名)
            throw "Invalid number of argument. Expected "
                + types[i].name
                + ", received "
                + args[i].constructor.name
                + " instead.";
        }
    };
}

function userList(prefix, num, users) {
    strict([String, Number, Array], arguments);

    for (var i = 0; i < num; i++) {
        // print 打印
        print(prefix + ": " + users[i]);
    };
}
```
