### Array 对象

用于在单个变量中存储多个值

> 创建：
```js
new Array();
new Array(size);	//undefined
new Array(element0, element1, ..., elementn);
```

> 属性：
- `constructor` 属性返回对创建此对象的数组函数的引用
```js
var arr = new Array();
document.write(arr.constructor);    //Array
```

- `length`	设置或返回数组中元素的数目
```javascript
var arr = new Array();
arr.length = 3;
document.write(arr.length);	//3
```

- `prototype`	属性使您有能力向对象添加属性和方法
```js
function employee(name,job,born){
	this.name=name;
	this.job=job;
	this.born=born;
}

var bill = new employee("Bill Gates","Engineer",1985);

employee.prototype.salary = null;
bill.salary = 20000;

document.write(bill.salary);	//20000
```

> 方法：

- `concat()`	链接两个或者多个数组，返回一个新的数组（不会改变现有的数组）
```js
var arr = [0,1,2,3];
arr.concat(4,5); //[0,1,2,3,4,5]
arr.concat([6,7],[8,9]);	//[0,1,2,3,6,7,8,9]
document.write(arr); //[0,1,2,3]
```

- `pop()` 删除并返回数组的最后一个元素
```js
var arr = [0,1,2]
arr.pop();	//2 | 修改原数组，而非创建新数组
console.log(arr);	//[0,1]

var arrN = [];	//若为空数组
arrN.pop();	//undefined
console.log(arrN);	//[]
```

- `shift()`	删除并返回数组的第一个元素
```js
var arr = [0,1,2]
arr.shift();	//0 | 修改原数组，而非创建新数组
console.log(arr);	//[1,2]

var arrN = [];	//若为空数组
arrN.shift();	//undefined
console.log(arrN);	//[]
```

- `splice(index, howmany, item1,…,itemn)`	删除元素，并向数组添加新元素

- `push()`	向数组的末尾添加一个或多个元素，并返回新的长度
```javascript
var arr = [0,1];
arr.push(2,3);	//修改数组，而非创建新数组
console.log(arr)	//[0,1,2,3]
```
push() 方法和 pop() 方法使用数组提供的先进后出栈的功能。

- `unshift()`	向数组的开头添加一个或更多元素，并返回新的长度

- `reverse()`	颠倒数组中元素的顺序
```js
var arr = [0,1,2,3];
arr.reverse();	//改变原数组，而非创建新数组
console.log(arr)	//[3,2,1,0]
```

- `sort()` 对数组的元素进行排序

- `slice()`	从某个已有的数组返回一个新的数组，包含选定的元素
```js
var arr = [0,1,2,3];

arr.slice(1);	//[1,2,3]
arr.slice(-1);	//[3]
arr.slice(1,2);	//[1,2]
arr.slice(-2,-1);	//[2,3]

console.log(arr);	//[0,1,2,3] 不改变原数组
```

- `join()`	把数组的所有元素放入一个字符串。元素通过指定的分隔符进行分隔
```js
var arr = ['Hello','beauty!'];
arr.join();	//"Hello,beauty!"
arr.join("");	//"Hellobeauty!"
arr.join("-");	//"Hello-beauty!"
```

- `toString()`	把数组转换为字符串，并返回结果

- `toLocaleString()`	把数组转换为本地数组，并返回结果

- `toSource() `返回该对象的源代码

- `valueOf()`	返回数组对象的原始值
