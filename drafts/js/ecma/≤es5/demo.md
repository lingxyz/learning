### 2-19 创建对象并设置属性

``` js
var obj = new Object();
obj.val = 5;
obj.click = function(){
    alert("hello");
}

// 和下面的代码等价
var obj = {
    val: 5,
    click: function(){
        alert("hello");
    }
}
```
### 2-20 简单对象的创建和使用

``` js
function User(name) {
    this.name = name;
}

var me = new User("My Name");

alert(me.name == "My Name");
alert(me.constructor == User);

// 既然User不过是个函数，那么把User当做函数使用时
// 因为this未曾指定，所以默认为window
User("Test");
alert(window.name == "Test");
```

### 2-21 使用 constructor 属性的例子

``` js
function User(){};
var me = new User();
var you = new me.constructor();

alert(me.constructor == you.constructor);
```
### 2-22 对象的方法通过 prototype 对象添加的例子(公有方法)

``` js
function User(name, age) {
    this.name = name;
    this.age = age;
}

User.prototype.getName = function(){
    return this.name;
}

User.prototype.getAge = function(){
    return this.age;
}

var user = new User("Bob", 44);
alert(user.getName() == "Bob");
alert(user.getAge == 44);
```
### 2-23 只能由构造函数访问的私有方法的例子（私有方法）

``` js
var names = [];

function Classroom(students, teacher) {
    function disp() {
        alert(this.names.join(", "));
    }

    this.students = students;
    this.teacher = teacher;

    disp();
}

var classr = new Classroom(["John", "Bob"], "Mr. Smith");
classr.disp();      //会调用失败
```
### 2-24 特权方法：能够访问函数内部变量，同时自身属于公共可访问的
