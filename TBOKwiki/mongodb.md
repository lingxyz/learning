## NoSQL
* [NoSQL](https://github.com/xingshaocheng/architect-awesome/blob/master/README.md#nosql)
		* [MongoDB](https://github.com/xingshaocheng/architect-awesome/blob/master/README.md#mongodb)
		* [Hbase](https://github.com/xingshaocheng/architect-awesome/blob/master/README.md#hbase)
### MongoDB

* [MongoDB 教程](http://www.runoob.com/mongodb/mongodb-tutorial.html)
* [《Mongodb相对于关系型数据库的优缺点》](http://mxdxm.iteye.com/blog/2093603)
	* 优点：弱一致性（最终一致），更能保证用户的访问速度；内置GridFS，支持大容量的存储；Schema-less 数据库，不用预先定义结构；内置Sharding；相比于其他NoSQL，第三方支持丰富；性能优越；
	* 缺点：mongodb不支持事务操作；mongodb占用空间过大；MongoDB没有如MySQL那样成熟的维护工具，这对于开发和IT运营都是个值得注意的地方；

### Hbase

* [《简明 HBase 入门教程（开篇）》](http://www.thebigdata.cn/HBase/35831.html)
* [《深入学习HBase架构原理》](https://www.cnblogs.com/qiaoyihang/p/6246424.html)
* [《传统的行存储和（HBase）列存储的区别》](https://blog.csdn.net/youzhouliu/article/details/67632882)


* [《Hbase与传统数据库的区别》](https://blog.csdn.net/lifuxiangcaohui/article/details/39891099)
	* 空数据不存储，节省空间，且适用于并发。

* [《HBase Rowkey设计》](https://blog.csdn.net/u014091123/article/details/73163088)
	* rowkey 按照字典顺序排列，便于批量扫描。
	* 通过散列可以避免热点。