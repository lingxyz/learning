* [Hbase](https://github.com/xingshaocheng/architect-awesome/blob/master/README.md#hbase)

* [《简明 HBase 入门教程（开篇）》](http://www.thebigdata.cn/HBase/35831.html)

* [《深入学习HBase架构原理》](https://www.cnblogs.com/qiaoyihang/p/6246424.html)

* [《传统的行存储和（HBase）列存储的区别》](https://blog.csdn.net/youzhouliu/article/details/67632882)

* [《Hbase与传统数据库的区别》](https://blog.csdn.net/lifuxiangcaohui/article/details/39891099)
	* 空数据不存储，节省空间，且适用于并发。

* [《HBase Rowkey设计》](https://blog.csdn.net/u014091123/article/details/73163088)
```
> rowkey 按照字典顺序排列，便于批量扫描。
> 通过散列可以避免热点。
```