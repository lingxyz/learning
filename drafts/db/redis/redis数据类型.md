### Redis 数据类型

Redis支持五种数据类型：
- **string**（字符串）
- **hash**（哈希）
- **list**（列表）
- **set**（集合）
- **zset**(sorted set：有序集合)

> String（字符串）

- string 是redis最基本的类型（与Memcached一模一样），一个key对应一个value
- string类型是二进制。所以可以包含任何数据，比如jpg图片或者序列化的对象
- 一个键最大能存储512MB
```bash
redis 127.0.0.1:6379> SET [key] [value]
OK
redis 127.0.0.1:6379> GET [key]
[value]
```

> Hash（哈希）

- Redis hash 是一个键名对集合
- Redis hash是一个string类型的field和value的映射表，特别适合用于存储对象
```bash
127.0.0.1:6379> HMSET user:1 username runoob password runoob points 200
OK
127.0.0.1:6379> HGETALL user:1
1) "username"
2) "runoob"
3) "password"
4) "runoob"
5) "points"
6) "200"
```
`每个 hash 可以存储 232 -1 键值对（40多亿）`

> List（列表）

- Redis 列表是简单的字符串列表，按照插入顺序排序。你可以添加一个元素到列表的头部（左边）或者尾部（右边）
```bash
redis 127.0.0.1:6379> lpush [listName] [listItem1]
(integer) 1
redis 127.0.0.1:6379> lpush [listName] [listItem2]
(integer) 2
redis 127.0.0.1:6379> lpush [listName] [listItem3]
(integer) 3
redis 127.0.0.1:6379> lrange [listName] 0 10
1) [listItem1]
2) [listItem2]
3) [listItem3]
```
`列表最多可存储 232 - 1 元素 (4294967295, 每个列表可存储40多亿)`

> Set（集合）

- Redis的Set是string类型的无序集合，集合具有唯一性
- 集合是通过哈希表实现的，所以添加，删除，查找的复杂度都是O(1)
- sadd 命令添加一个string元素到key对应的set集合中，成功返回1，如果元素已经在集合中返回0，此次操作被忽略，key对应的set不存在返回错误
```bash
redis 127.0.0.1:6379> sadd [key] [member1]
(integer) 1
redis 127.0.0.1:6379> sadd [key] [member2]
(integer) 1
redis 127.0.0.1:6379> sadd [key] [member3]
(integer) 1
redis 127.0.0.1:6379> sadd [key] [member3]
(integer) 0
redis 127.0.0.1:6379> smembers [key]

1) [member1]
2) [member2]
3) [member3]
```
`集合中最大的成员数为 232 - 1(4294967295, 每个集合可存储40多亿个成员)`

> zset(sorted set：有序集合)

Redis zset 和 set
- 一样也是string类型元素的集合,且不允许重复的成员
- 不同的是每个元素都会关联一个double类型的分数。redis正是通过分数来为集合中的成员进行从小到大的排序
- zset的成员是唯一的,但分数(score)却可以重复
- zadd 命令添加元素到集合，元素在集合中存在则更新对应score
```bash
redis 127.0.0.1:6379> zadd [key] [score] [member1]
(integer) 1
redis 127.0.0.1:6379> zadd [key] [score] [member2]
(integer) 1
redis 127.0.0.1:6379> zadd [key] [score] [member3]
(integer) 1
redis 127.0.0.1:6379> zadd [key] [score] [member3]
(integer) 0
redis 127.0.0.1:6379> ZRANGEBYSCORE [key] 0 1000

1) [member1]
2) [member2]
3) [member3]
```
