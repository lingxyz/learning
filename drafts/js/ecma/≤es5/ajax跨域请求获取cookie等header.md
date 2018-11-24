一般请求来说，客户端的AJAX请求不需要做任何改变，只需要服务端稍作改变即可。
也可用jsonp的方式，由服务端传回js包裹的数据。
但是如果后端想要获取cookie，可采用如下方式：

```js
$.ajax({
    url: '',
    data: data,
    type: 'post/get',
    dataType: 'json',
    xhrFields: {
        withCredentials: true    // 发送文档头信息
    },
    crossDomain: true    // 允许跨域
});
```

参考资料：http://www.cnblogs.com/shikyoh/p/4959562.html
