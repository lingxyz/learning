# 表设计
* 引擎
* 字符集
* 字段
* 范式和反范式
* [数据库设计的三大范式](https://github.com/xingshaocheng/architect-awesome/blob/master/README.md#数据库设计的三大范式)
* [《数据库的三大范式以及五大约束》](https://www.cnblogs.com/waj6511988/p/7027127.html)
```
> 第一范式：数据表中的每一列（每个字段）必须是不可拆分的最小单元，也就是确保每一列的原子性；
> 第二范式（2NF）：满足1NF后，要求表中的所有列，都必须依赖于主键，而不能有任何一列与主键没有关系，也就是说一个表只描述一件事情；
> 第三范式：必须先满足第二范式（2NF），要求：表中的每一列只与主键直接相关而不是间接相关，（表中的每一列只能依赖于主键）；
```

# CURD
* [MySQL](https://github.com/xingshaocheng/architect-awesome/blob/master/README.md#mysql)
* 索引操作，事物操作，存储过程操作，视图操作，log操作
* [group by 两个字段](https://www.cnblogs.com/happyWolf666/p/8196147.html)
```
> group by 一般和聚合函数一起使用才有意义，比如 count sum avg等
> 筛选结果：where(约束声明，返回结果前生效) → group by → having(过滤声明，返回结果后生效)
> 通过两个字段分组：group by b,c 。先按条件b分组，再按条件c将b分好的组再拆分子组。
```

* [MySQL语句的执行语句的书写顺序与执行顺序](https://blog.csdn.net/weixin_39562364/article/details/106683657)
```
> 书写顺序：select (输出)   from （获取数据）  where（过滤）  group by （分组） having（过滤） order by （排序）   limit（限定）
> 执行顺序：先from，在执行where，group by ，select， having，order by ，limit
```

# SQL优化
* 索引
* 慢SQL排查，explain
* 不走索引情况
* 连表规则

# 高并发优化
* 死锁。事物互相等待。
* 悲观锁(种类)
* 乐观锁

# 大数据优化
* 分库分表
* 分区

# MySQL实现
* 一条SQL从开始执行到结束经历了什么？
* 优化器做了什么
* 缓存区，同步规则？
* 脏读幻读

# 三方集成
* Mybatis
* TypeORM

# 数据同步
* 导入导出
* 自动备份，恢复
* binlog，redolog，。。

----

# 原理
* [数据库](https://github.com/xingshaocheng/architect-awesome/blob/master/README.md#数据库)

* [基础理论](https://github.com/xingshaocheng/architect-awesome/blob/master/README.md#基础理论)
* [《MySQL的InnoDB索引原理详解》](http://www.admin10000.com/document/5372.html)
* [《MySQL存储引擎－－MyISAM与InnoDB区别》](https://blog.csdn.net/xifeijian/article/details/20316775) `最主要差别是 Innodb 支持事务处理与外键和行级锁`
* [《myisam和innodb索引实现的不同》](https://www.2cto.com/database/201211/172380.html)
* [原理](https://github.com/xingshaocheng/architect-awesome/blob/master/README.md#原理)

# InnoDB

* [《一篇文章带你读懂Mysql和InnoDB》](https://my.oschina.net/kailuncen/blog/1504217)
* [InnoDB](https://github.com/xingshaocheng/architect-awesome/blob/master/README.md#innodb)

# 优化

* [explain](https://github.com/xingshaocheng/architect-awesome/blob/master/README.md#explain)
* [优化](https://github.com/xingshaocheng/architect-awesome/blob/master/README.md#优化)
* [优化](https://github.com/xingshaocheng/architect-awesome/blob/master/README.md#优化)[《MySQL36条军规》](http://vdisk.weibo.com/s/muWOT)
* [《MYSQL性能优化的最佳20+条经验》](https://www.cnblogs.com/zhouyusheng/p/8038224.html)
* [《SQL优化之道》](https://blog.csdn.net/when_less_is_more/article/details/70187459)
* [《mysql数据库死锁的产生原因及解决办法》](https://www.cnblogs.com/sivkun/p/7518540.html)
* [《导致索引失效的可能情况》](https://blog.csdn.net/monkey_d_feilong/article/details/52291556)
* [《 MYSQL分页limit速度太慢优化方法》](https://blog.csdn.net/zy_281870667/article/details/51604540) `原则上就是缩小扫描范围`

# 索引

* [索引](https://github.com/xingshaocheng/architect-awesome/blob/master/README.md#索引)

* [聚集索引, 非聚集索引](https://github.com/xingshaocheng/architect-awesome/blob/master/README.md#聚集索引-非聚集索引)
* [复合索引](https://github.com/xingshaocheng/architect-awesome/blob/master/README.md#复合索引)
* [自适应哈希索引(AHI)](https://github.com/xingshaocheng/architect-awesome/blob/master/README.md#自适应哈希索引ahi)

* [《MySQL 聚集索引/非聚集索引简述》](https://blog.csdn.net/no_endless/article/details/77073549)
* [《MyISAM和InnoDB的索引实现》](https://www.cnblogs.com/zlcxbb/p/5757245.html) `MyISAM 是非聚集，InnoDB 是聚集`

* [《复合索引的优点和注意事项》](https://www.cnblogs.com/summer0space/p/7247778.html)

* [《InnoDB存储引擎——自适应哈希索引(AHI)》](https://blog.csdn.net/Linux_ever/article/details/62043708)


# explain
* [《MySQL 性能优化神器 Explain 使用分析》](https://segmentfault.com/a/1190000008131735)
