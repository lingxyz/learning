```js
;(function($){
    // 单体模式
    var page = {
        config: {},
        init: function(){
            this.bindEvent();
       },  
        bindEvent: {}
    };
    page.init();
})(jQuery);    //自执行的匿名函数，jQuery作为形参
```
