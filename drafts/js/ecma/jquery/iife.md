[说的很透彻了](http://suqing.iteye.com/blog/1981591)


在一些jQuery插件中我们经常会看到以下这段代码：

``` js
;(function($, window, document, undefined){
    // ...
})(jQuery, window, document);
```

解释如下：
- 1、代码最前面的分号，是为了防止多个js文件压缩合并时，因为其他文件最后一行语句没加分号，而引起合并后的语法错误。
- 2、自执行匿名函数(function(){})();：避免函数体内和外部的变量冲突。第一个括号内的是一个匿名函数，因为匿名函数没有函数名，所以要用括号括起来。最后一个括号是执行这个函数，可以传入形参。
- 3、$：$是形参，jQuery是实参。这里$接受jQuery对象，也是为了避免$变量和其他库冲突，保证插件可以正常运行。
- 4、window, document形参分别接受window, document对象，window, document对象都是全局环境下的，而在函数体内的window, document其实是局部变量，不是全局的window, document对象。这样做有个好处就是可以**提高性能，减少作用域链的查询时间**，如果你在函数体内需要多次调用window 或 document对象，这样把window 或 document对象当作参数传进去，这样做是非常有必要的。当然如果你的插件用不到这两个对象，那么就不用传递这两个参数了。
- 5、undefined在老一辈的浏览器是不被支持的，直接使用会报错，js框架要考虑到**兼容性**，因此增加一个形参undefined。
