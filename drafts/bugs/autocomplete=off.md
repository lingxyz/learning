autocomplete=off：自动填写用户名时，这个属性不起作用。

解决方法：
  1. <input type="text" name="password" hidden>
  2. <input type="password" name="password">
  1. setTimeout('$("[hidden]").remove()', 1000);

原理：浏览器会从缓存中读取数据，自动填写name相同的第一个输入框
