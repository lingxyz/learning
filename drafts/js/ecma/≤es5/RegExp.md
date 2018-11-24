方法：
  ● match:
      a. value.match(express)    // true / false

  ● test:
      a. express.test(value)    // true / false


常用：
  ● 中文：
      a. /[u4e00-u9fa5]/g    // 汉字的 Unicode 编码范围

  ● 18位身份证：
      a. /(^\d{15}$)|(^\d{17}([0-9]|X)$)/g

  ● 手机号：
      a. /^1\d{10}$/g    //以1开头，11位数字
