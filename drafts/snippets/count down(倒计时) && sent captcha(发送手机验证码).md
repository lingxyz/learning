发送验证码：

```js
// 验证码
captcha: function(){
    $sendCaptha.prop("disabled", "true");

    var secounds = 60;
    var countDown = setInterval(function(){
	    secounds --;
        if(secounds == 0) {
			clearInterval(countDown);
			$sendCaptha.removeProp("disabled").text("重新发送");
			return;
		}
		$sendCaptha.html(secounds + "秒后重发");
	}, 1000);
},
/*------------------------------------------------------------*/
// 事件绑定
bindEvent: function(){
	// 点击发送验证码按钮
	$sendCaptha.on("click", function(){
		if(!/^1\d{10}$/.test($phone.val())) return;

		$.post("    ", {phone: $phone.val()}, function(){
			page.captcha();
		}, "json");
	});
}
```
