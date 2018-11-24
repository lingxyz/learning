上传文件时，html标签为
```html
<input type="file" >
```
但浏览器默认样式比较丑陋，与设计稿差距较大。所以在使用的时候，需要更改样式。

改样式有很多种方法：
- 将`input`隐藏，然后通过$("[type='file']").click()来触发
Tip：在IE8中不支持

- 设置透明度来实现兼容。
```css
input[type="file"] {
    opacity: 0;
    filter: alpha(opcity=0);
}
```