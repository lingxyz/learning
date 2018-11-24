在日常开发中，我们经常需要判断某个对象是否是数组类型的，在js中检测对象类型的常见的方法有几种.
1、typeof操作符。对于Function、String、Number、Undefined这几种类型的对象来说，不会有什么问题，但是针对Array的对象就没什么用途了：
Js代码
复制代码代码如下:

alert(typeof null); // "object"
alert(typeof []); // "object"

2、instanceof操作符。此操作符检测对象的原型链是否指向构造函数的prototype对象，恩，听起来不错，应该可以解决我们的数组检测问题：
Js代码
复制代码代码如下:

var arr = [];
alert(arr instanceof Array); // true

3、对象的constructor属性。除了instanceof，我们还可以利用每个对象都具有constructor的属性来判断其类型，于是乎我们可以这样做:
Js代码
复制代码代码如下:

var arr = [];
alert(arr.constructor == Array); // true

貌似后两个解决方案是无懈可击的，但真的是这样么？天有不测风云，当你在多个frame中来回穿梭的时候，令人沮丧的问题出现了：
Js代码
复制代码代码如下:

var iframe = document.createElement('iframe');
document.body.appendChild(iframe);
xArray = window.frames[window.frames.length-1].Array;
var arr = new xArray(1,2,3); // [1,2,3]
// 哎呀！
arr instanceof Array; // false
// 哎呀呀！
arr.constructor === Array; // false

由于每个iframe都有一套自己的执行环境，跨frame实例化的对象彼此是不共享原型链的，因此导致上述检测代码失效！怎么办怎么办？？嗯，javascript是动态语言，或许万金油“鸭式辨型”（duck type）可以助我们一臂之力“如果它走起路来像鸭子，叫起来也像鸭子，那就当他是鸭子吧”，同理，可以检测某些数组对象特有的能力来做判断，这个法子已经有人用了，比如Prototype框架，来看看它实现的Object.isArray方法：
Js代码
复制代码代码如下:

isArray: function(object) {
return object != null && typeof object == "object" &&
'splice' in object && 'join' in object;
}

isArray：”object，你有splice、join这两个数组特有的方法吗？”
object:“嗯，没错我有！”
isArray：“好吧，那你就是个数组了，哪怕你是冒充的，囧……”
Js代码
复制代码代码如下:

var trickster = { splice: 1, join: 2 };
Object.isArray(trickster); // 假冒成功，耶

没错，这个解决方案给人的感觉有点别扭，任何一个具有'splice'和'join'属性的对象都能通过这个检测！怎么办怎么办怎么办？？别着急，仔细想想，其实我们需要的是一个能取得对象实际类型，而且又能跨frame使用的方法即可。这不，细心的老外在翻阅ECMA262标准的时候发现了这个（btw，我也看了，怎么就没发现这个用途呢，囧）：
ECMA-262 写道
复制代码代码如下:

Object.prototype.toString( ) When the toString method is called, the following steps are taken:
1. Get the [[Class]] property of this object.
2. Compute a string value by concatenating the three strings “[object “, Result (1), and “]”.
3. Return Result (2)

上面的规范定义了Object.prototype.toString的行为：首先，取得对象的一个内部属性[[Class]]，然后依据这个属性，返回一个类似于"[object Array]"的字符串作为结果（看过ECMA标准的应该都知道，[[]]用来表示语言内部用到的、外部不可直接访问的属性，称为“内部属性”）。利用这个方法，再配合call，我们可以取得任何对象的内部属性[[Class]]，然后把类型检测转化为字符串比较，以达到我们的目的。还是先来看看在ECMA标准中Array的描述吧：
ECMA-262 写道
复制代码代码如下:

new Array([ item0[, item1 [,…]]])
The [[Class]] property of the newly constructed object is set to “Array”.

于是乎，可以改写之前的isArray函数以利用这个特性，如下：
Js代码
复制代码代码如下:

function isArray(array) {
return Object.prototype.toString.call(array) === '[object Array]';
}

call改变toString的this引用为待检测的对象，返回此对象的字符串表示，然后对比此字符串是否是'[object Array]'，以判断其是否是Array的实例。也许你要问了，为什么不直接o.toString()？嗯，虽然Array继承自Object，也会有toString方法，但是这个方法有可能会被改写而达不到我们的要求，而Object.prototype则是老虎的屁股，很少有人敢去碰它的，所以能一定程度保证其“纯洁性”：）
与前面几个方案不同，这个方法很好的解决了跨frame对象构建的问题，经过测试，各大浏览器兼容性也很好，可以放心使用。一个好消息是，很多框架，比如jQuery、Base2等等，都计划借鉴此方法以实现某些特殊的，比如数组、正则表达式等对象的类型判定，不用我们自己写了。

来源： <http://www.jb51.net/article/20303.htm>
 
