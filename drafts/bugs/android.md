- 安卓端键盘挡住输入框

解决方案： 在input获取焦点后，键盘弹起，window的高度会发生变化。
由于输入法的不同，键盘弹起时间和高度变化值不一样。

```js
var isAndroid = /Android|Linux|Adr/i.test(navigator.userAgent)

if (isAndroid) {
    // 在 input 被点击或者获取焦点的时候，循环监听 window 高度
    $(document).on('click, focus', 'input', ($event) => {
        var target = $event.target,
            height = window.innerHeight,
            t = new Date().getTime();

        var interval = setInterval(() => {
            // window 高度变小，滚动 input 到 view 区域
            if (window.innerHeight < height) {
                target.scrollIntoViewIfNeeded();
                clearInterval(interval);
            }
            // 若上一步未触发，1s 后 自动销毁监听
            if (new Date().getTime() - t > 1000)
                clearInterval(interval)
        }, 100)
    })
}
```

- overflow: scroll 在安卓机会有小黑点，应改为 overflow: auto
