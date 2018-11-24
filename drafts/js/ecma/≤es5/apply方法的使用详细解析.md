本文是对js中apply方法的使用进行了详细的总结介绍，需要的朋友可以过来参考下，希望对大家有所帮助
1、对象的继承，一般的做法是复制：Object.extend
prototype.js的实现方式是：
复制代码代码如下:

Object.extend = function(destination, source) {
    for (property in source) {
        destination[property] = source[property];
    }
    return destination;
}

除此之外，还有种方法，就是：Function.apply（当然使用Function.call也是可以的）
apply方法能劫持另外一个对象的方法，继承另外一个对象的属性
Function.apply(obj,args)方法能接收两个参数
obj：这个对象将代替Function类里this对象
args：这个是数组，它将作为参数传给Function（args-->arguments）
apply示范代码如下：
复制代码代码如下:

<script>
function Person(name,age){   //定义一个类，人类  
    this.name=name;     //名字  
    this.age=age;       //年龄
    this.sayhello=function(){alert("hello")};
}
function Print(){            //显示类的属性
    this.funcName="Print";
    this.show=function(){      
        var msg=[];
        for(var key in this){
            if(typeof(this[key])!="function"){
                msg.push([key,":",this[key]].join(""));
            }
        }
        alert(msg.join(" "));
    };
}
function Student(name,age,grade,school){    //学生类
    Person.apply(this,arguments);
    Print.apply(this,arguments);
    this.grade=grade;                //年级
    this.school=school;                 //学校
}
var p1=new Person("jake",10);
p1.sayhello();
var s1=new Student("tom",13,6,"清华小学");
s1.show();
s1.sayhello();
alert(s1.funcName);
</script>

学生类本来不具备任何方法，但是在Person.apply(this,arguments)后，
他就具备了Person类的sayhello方法和所有属性。
在Print.apply(this,arguments)后就自动得到了show()方法
2、利用Apply的参数数组化来提高
Function.apply()在提升程序性能方面的技巧
我们先从Math.max()函数说起，Math.max后面可以接任意个参数，最后返回所有参数中的最大值。
比如
alert(Math.max(5,8))   //8
alert(Math.max(5,7,9,3,1,6))   //9
但是在很多情况下，我们需要找出数组中最大的元素。
复制代码代码如下:

var arr=[5,7,9,1]
alert(Math.max(arr))    // 这样却是不行的。一定要这样写
function getMax(arr){
    var arrLen=arr.length;
    for(var i=0,ret=arr[0];i<arrLen;i++){
        ret=Math.max(ret,arr[i]);       
    }
    return ret;
}

这样写麻烦而且低效。如果用 apply呢，看代码：
复制代码代码如下:

function getMax2(arr){
    return Math.max.apply(null,arr);
}

两段代码达到了同样的目的，但是getMax2却优雅，高效，简洁得多。

再比如数组的push方法。
var arr1=[1,3,4];
var arr2=[3,4,5];
如果我们要把 arr2展开，然后一个一个追加到arr1中去，最后让arr1=[1,3,4,3,4,5]
arr1.push(arr2)显然是不行的。 因为这样做会得到[1,3,4,[3,4,5]]
我们只能用一个循环去一个一个的push(当然也可以用arr1.concat(arr2)，但是concat方法并不改变arr1本身)
复制代码代码如下:

var arrLen=arr2.length
for(var i=0;i<arrLen;i++){
    arr1.push(arr2[i]);
}

自从有了Apply,事情就变得如此简单
Array.prototype.push.apply(arr1,arr2)

来源： <http://www.jb51.net/article/42705.htm>
 
