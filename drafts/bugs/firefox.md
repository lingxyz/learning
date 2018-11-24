- Firefox 不支持 img onerror 属性

``` html
<img src="pic.gif" onerror="javascript:this.src='/noPic.gif';this.onerror=null;" alt="pic" />
```

onerror属性分析：
当图片不存在时，将触发 onerror，而 onerror 中又为 img 指定一个 NoPic.gif 图片。也就是说图片存在则显示 pic.gif，图片不存在将显示 noPic.gif。
但问题来了，如果 noPic.gif 也不存在，则继续触发 onerror，导致循环，故出现错误。

说明：如果图片存在，但网络很不通畅，也可能触发 onerror。

解决方法：

第一种：
去掉 onerror 代码；或者更改 onerror 代码为其它；或者确保 onerror 中的图片足够小，并且存在。

第二种：

``` js
this.onerror=null;    //控制不要一直跳动
```
