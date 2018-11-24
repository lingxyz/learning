### `href="#"` 与 `javascript：void(0)`的区别

在工作中，如果我们想把a标签中的链接置成空链接，我们一般会用两种方法：
```html
<a href="#" target="_blank"></a>
```
或者
```html
<a href="javascript:void(0);" target="_blank"></a>
```

`href="#"`方法：

空连接，点击之后会自动跳转到页面顶部，并且在页面URL后面会出现#，相当于点击了一个锚记，但是这个锚记又没写ID，所以就默认跳转到页面顶部。

`href="javascript:void(0);"`方法：

void是一个操作符，这个操作符指定要计算一个表达式但是不返回值。
如果在void中写入0（void(0)），则什么也不执行，从而也就形成了一个空链接。

简写为`javascript:;`
