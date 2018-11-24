一个常见的问题：
```js
var a= 1;      
(function(){      
    console.log(a);
    var a = 2;    
})();
```
```js
var foo = 1;      
function bar() {      
    if (!foo) {      
        var foo = 10;    //如果这里不加var就是1了，加了var后在预编译时foo会被当做局部变量进行索引  
    }      
    alert(foo);      
}      
bar();
```
```js
var a = 1;      
function b() {      
    a = 10;  //function a()在预编译阶段建立局部变量索引，所以这里的a是局部变量    
    return;      
    function a() {}    //同理a在这里被重新索引  
}      
b();      
alert(a);
```
解释：预编译和执行期的问题。

javascript会分块的进行预编译，预编译期会处理所以使用var声明的变量以及使用function的函数会被处理，但var声明的变量只进行索引，而不处理赋值，赋值在执行期处理；而function的函数会处理函数体。

所以第一个例子：预编译期间建立索引foo和处理bar函数体，但foo未赋值，所以foo为undefined。然后执行期给foo赋值1，执行bar（）时，先预编译函数体内的内容，建立局部变量索引foo，但未赋值，所以foo=undefined，此时执行期bar()，由上往下执行,结果自然为10.
而第二个例子类似，因为执行期到b（）时，会预编译b里面的内容，此时function a(){}相当于（类似）var a，即也建立局部变量的索引a，所以执行期给局部变量的a赋值10，并不影响全局的a

来源： <http://smiky.iteye.com/blog/1564549>
