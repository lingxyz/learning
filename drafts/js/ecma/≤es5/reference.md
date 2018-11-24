# 引用（reference）

“引用”是一个指向对象实际位置的指针。

前提是实际的对象不是引用。

多个变量能够指向同一对象。

对象可以包含一系列属性（property），这些属性也都不过是到其他对象（比如字符串、数字、数组等等）的引用。

如果多个变量指向同一对象，那么该对象的类型一改变，所有这些变量也会跟着相应改变。

``` js
var obj = new Object();
// objRef 引用 obj
var objRef = obj;
// 修改原对象的一个属性
obj.oneProperty = true;

alert(obj.oneProperty = objRef.oneProperty);    //true
```

- 自修改对象（self-modifying）

``` js
var items = new Array("one", "two", "there");
var itemsRef = items;

// 将一个元素添加到原数组中
items.push("four");

alert(items.length == itemsRef.length); //true
```

- 修改对象的引用，同时保持完成性（变成两个不同的对象）

``` js
var items = new Array("one", "two", "there");
var itemsRef = items;

// 将 item 设置为一个新对象
items = new Array("new", "array");

alert(items != itemsRef);   //true
```

- 字符串连接符（+ 、+=）会生成新的对象

``` js
var item = "test";
var itemsRef = item;
item += "ing";

alert(item != itemsRef);    //true
```
