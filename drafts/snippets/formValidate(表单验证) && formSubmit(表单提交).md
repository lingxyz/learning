```js
init: function(){
	this.bindEvent();
},

/*------------------------------------------------------------*/
// 表单验证
formValidate: function(){
	if(!/^1\d{10}$/.test($phone.val())) return false;
	if(!$name.val().length > 2 || !$name.val().length < 10) return false;
	if(!$password.val().length > 4 || !$password.val().length < 20) return false;
	if(!$captcha.val().length > 2 || !$captcha.val().length < 6) return false;
	return true;
},
/*------------------------------------------------------------*/
// 提交表单
formSubmit: function(){
	$.ajax({
		url: "",	//add url
		type: "post",
		data: $form.serialize(),
		dataType: "json",
		success: function(data){
			// code here ...
		}
	});
},

/*------------------------------------------------------------*/

// 事件绑定
bindEvent: function(){
	// 提交表单按钮
	$form.on("submit", function(e){
		// 阻止默认事件
		e.preventDefault();
		// 验证提交
		if (page.formValidate())
			page.formSubmit();
	});
}
```
