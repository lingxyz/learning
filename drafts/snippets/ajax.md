jQuery ajax 模板：
```js
$.ajax({
    url: "",	//add url
    type: "post",    //post get ...
    data: $form.serialize(),
    dataType: "json",    //jsonp ...
    async: "false",    //设为同步，默认是true(异步),非必须
    beforeSend: function(){},    //请求发送前执行,非必须
    afterSend: function(){},    //请求发送后执行,非必须
    success: function(data){
        // code here ...
    }
});
```
