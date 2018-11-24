首先说一下new的过程
先看一段代码：
1<script type="text/javascript">
2var Person = function () { };
3var p = new Person();
4</script>
很简单的一段代码，我们看看这个new到底做了什么？我们可以把new的过程拆分成以下三部：
1、var p={};    //初始化一个对象p
2、p.__proto__ = Person.prototype;
3、Person.call(p);//讲this的值赋给p
关键在于第二步，我们来证明一下：
1<script type="text/javascript">
2var Person = function () { };
3var p = new Person();
4alert(p.__proto__ === Person.prototype);
5</script>
这段代码返回true。说明我们步骤2是正确的。
我们在这里简单的说一下__proto__。每个对象都会在内部初始化一个__proto__属性，当我们访问一个对象的属性时，如果这个对象内部不存在这个属性，那么他就会去__proto__里找这个属性，这个__proto__又会有自己的__proto__，于是就这样一直找下去，也就是我们平时所说的原型链概念。
按照标准，__proto__是不对外公开的，也就是说是个私有属性，(ie中对象的__proto__属性为undefined)，但是firefox的引擎将他暴露出来成为一个共有的属性，我们可以对外访问和设置。

我们看一下代码，为什么p可以访问Person的Say：
1<script type="text/javascript">
2var Person = function () { };
3Person.prototype.Say = function () {
4alert("Person say");
5}
6var p = new Person();
7p.Say();
8</script>
首先new Person();可以得出p.__proto__=Person.prototype。当我们调用p.Say()时，首先p中没有Say这个属性，于是，他就需要到他的__proto__中去找，也就是Person.prototype，而我们在上面定义了Person.prototype.Say=function(){};于是，就找到了这个方法。
更复杂的例子也是按照这个流程来推理，这也就是原型链的实现原理。
最后，其实prototype只是一个假象，它在实现原型链中只是起到了一个辅助作用，换句话说，他只是在new的时候有一定的价值，而原型链的本质，其实是__proto__。

来源： <http://blog.163.com/ued_er/blog/static/19970315920145146632331/>
 
