# 作用域（scope）和作用域链

### 作用域

在 es6 之前，JavaScript 的作用域是由函数划分的，而不是由块（block）划分（while, if, for）。

``` js
// 全局作用域
var foo = "test";

if (true)
    var foo = "new test";

alert(foo == "new test");

function test() {
    // 局部作用域，只在函数内部起作用
    var foo = "old test";
}

test();

alert(foo == "new test");
```

### 全局作用域（Global Scope）

- 最外层函数和在最外层函数外面定义的变量拥有全局作用域  
浏览器中JS的全局变量是window，所以所有的全局作用域变量都是window的属性（property）

``` js
var test = "test";
alert(window.test == test);
```
- 所有通过隐式声明声明的变量和函数  
    js 中声明变量，分为显式声明（用var）和隐式声明（不用var）。
通过隐式声明声明的变量为全局变量。   
    在严格模式（'use scrict'）中，隐式声明会报错（referenceError）

``` js
function test() {
    foo = "test";
}

test();

alert(window.foo == "test");
```
- 所有window对象的属性拥有全局作用域

进阶阅读：[闭包](../closure.md)


### 局部作用域（Local Scope）
用显式声明定义在函数内部的变量或函数

### 作用域链（Scope Chain）

``` js
name="zl";  
function t(){  
    var name="tzl";  
    function s(){  
        var name="szl";  
        console.log(name);  
    }  
    function ss(){  
        console.log(name);  
    }  
    s();  
    ss();  
}  
t();
```

当执行s时，将创建函数s的执行环境(调用对象),并将该对象置于链表开头，然后将函数t的调用对象链接在之后，最后是全局对象。然后从链表开头寻找变量name,很明显
name是"szl"。

但执行ss()时，作用域链是： ss()->t()->window,所以name是”tzl"

- with 语句

with语句主要用来临时扩展作用域链，将语句中的对象添加到作用域的头部。

``` js
var name = 'pig'
var person={name:"zhangling"};

with(person){
    // zhangling
    console.log(name);  
}
// pig
console.log(name);  
```

with语句结束后，作用域链恢复正常。
