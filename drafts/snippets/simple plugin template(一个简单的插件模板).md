```js
;(function($){
    //创建一个类
	function Plugin(opt){
		this.options = $.extend({
            x1:x1,
            x2:x2
        },opt || {});

		this.init();
	}

    //原型链
	Plugin.prototype = {
		init: function(){},
		m1: function(){},
		m2: function(){}
		//...
	};

    //挂在window下
	return window.Plugin = Plugin;   
})(jQuery);
```
