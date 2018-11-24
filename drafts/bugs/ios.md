- ios竖屏拍摄，并上传图片后，图片会旋转90°

解决方法：[lrz.js](https://github.com/think2011/localResizeIMG)中的exif.js

原理：exif.js 获取拍照方向，纠正旋转角度

- ios 微信 上下拉页面回弹 卡住

在ios safari 和 ios微信等使用其自带浏览器作为webview的app中，如果页面活动区域不是body，那么当页面滑动到最顶部或者最底部，触发反向滚动，有一定几率卡死。

解决办法：
1. 改变框架布局，用body作为滚动区域。缺点是增加了滚动条，影响页面布局，分页等跟页面滚动相关的插件要调整。
2. 在touchmove的时候禁止body滚动，并且记录滚动距离，触发活动区域dom滚动相应距离。
3. 以上两个方案对页面影响都比较大，网上的方法都试了，不起作用，最优方案还在探索中。

需要固定的元素直接设置 fixed ，不用担心ios随着页面滚动变位置

- input readonly 失效（safari）
``` html
<input
    type="text"
    value=""
    onfocus="this.blur()"
    readonly
>
```

- ios input获取焦点时，页面隐藏
```css
.input-parent {
    position: relative
}
```

- IOS 300ms延迟，trigger要触发两次

- ios中 设置object cookie会截断

ios中 object cookie会在汉字处截断。

解决方法：`encodeURIComponent(JSON.stringify(obj))`
