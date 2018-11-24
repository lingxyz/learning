### JSON
> 什么是 json

JSON 指的是 JavaScript 对象表示法（JavaScript Object Notation）

JSON 是轻量级的文本数据交换格式JSON 独立于语言

JSON 具有自我描述性，更易理解

> JSON与XML的异同

类似 XMLJSON

是纯文本

JSON 具有“自我描述性”（人类可读）

JSON 具有层级结构（值中存在值）

JSON 可通过 JavaScript 进行解析

JSON 数据可使用 AJAX 进行传输

相比 XML 的不同之处：没有结束标签、更短、读写的速度更快、能够使用内建的 JavaScript eval() 方法进行解析

使用数组不使用保留字

> 为什么使用 JSON？

对于 AJAX 应用程序来说，JSON 比 XML 更快更易使用：

使用 XML读取 XML 文档，使用 XML DOM 来循环遍历文档读取值并存储在变量中使用。JSON读取 JSON ，用 eval() 处理 JSON 字符串

> JSON 语法

JSON 语法规则JSON 语法是 JavaScript 对象表示法语法的子集。数据在名称/值对中数据由逗号","分隔花括号"{}"保存对象方括号"[]"保存数组
e.gJSON名称/值对："firstName" : "John"
等价于这条 JavaScript 语句：
firstName = "John"
JSON值：
数字（整数或浮点数）字符串（在双引号中）逻辑值（true 或 false）数组（在方括号中）对象（在花括号中）

nullJSON对象：
```js
{
"employees": [
{ "firstName":"John" , "lastName":"Doe" },
{ "firstName":"Anna" , "lastName":"Smith" },
{ "firstName":"Peter" , "lastName":"Jones" }
]
}
```

JSON数组：
```html
<body><p>First Name: <span id="fname"></span></p>

<script type="text/javascript">
var employees = [
{ "firstName":"Bill" , "lastName":"Gates" },
{ "firstName":"George" , "lastName":"Bush" },
{ "firstName":"Thomas" , "lastName": "Carter" }
];
employees[1].firstName="Jobs";
document.getElementById("fname").innerHTML=employees[1].firstName;
</script>
</body>
```

> JSON 使用：

把 JSON 文本转换为 JavaScript 对象：从 web 服务器上读取 JSON 数据（作为文件或作为 HttpRequest），将 JSON 数据转换为 JavaScript 对象，然后在网页中使用该数据

JSON 实例：来自字符串的对象
```html
<body>
<h2>通过 JSON 字符串来创建对象</h3>
<p>
First Name: <span id="fname"></span><br />
Last Name: <span id="lname"></span><br />
</p>
<script type="text/javascript">
//创建包含 JSON 语法的 JavaScript 字符串
var txt = '{"employees":[' +
'{"firstName":"Bill","lastName":"Gates" },' +
'{"firstName":"George","lastName":"Bush" },' +
'{"firstName":"Thomas","lastName":"Carter" }]}';

//由于 JSON 语法是 JavaScript 语法的子集，JavaScript 函数 eval() 可用于将 JSON 文本转换为 JavaScript 对象。eval() 函数使用的是 JavaScript 编译器，可解析 JSON 文本，然后生成 JavaScript 对象。必须把文本包围在括号中，这样才能避免语法错误var obj = eval ("(" + txt + ")");

document.getElementById("fname").innerHTML=obj.employees[1].firstName
document.getElementById("lname").innerHTML=obj.employees[1].lastName
</script>
</body>
```
