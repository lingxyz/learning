# MongoDB 基础操作（写改删查）

[创建数据库](#-use-)  
[查看当前数据库](#-db-)  
[查看所有数据库](#-show-dbs-)  
[插入文档](#-insert-save-)  
[更新文档](#-update-save-)  
[删除文档](#-remove-)  
[查询文档](#-find-findone-)  

### 创建数据库(use)
```sql
> use test
  switched to db test
```
*注：刚创建的数据库需要插入数据才能显示*

### 查看当前数据库(db)
```sql
> db
  test
```

### 查看所有数据库(show dbs)
```sql
> show dbs
  local  0.078GB
  test   0.078GB
```

### 插入文档(insert/save)
MongoDB文档的数据结构和JSON基本一样，叫做BSON格式。
BSON是一种类json的一种二进制形式的存储格式,简称Binary JSON。
MongoDB通过 insert() 或 save() 的方法向集合中插入文档：
```sql
db.COLLECTION_NAME.insert(document)

db.COLLECTION_NAME.save(document)
```
*如果不指定 _id 字段 save() 方法类似于 insert() 方法。如果指定 _id 字段，则会更新该 _id 的数据。*

实例：
```sql
> db.col.insert({
    name: 'zhang ling', 
    age: 26
  })

> db.col.find()
  { name : 'zhang ling' , age : 26 }
```

或者将数据先定义为一个变量，再执行插入操作：
```sql
> document = {name: 'zhangling', age: 26}
  { name : 'zhang ling' , age : 26 }

> db.col.insert(document)
  WriteResult({ "nInserted" : 1 })
```

### 更新文档(update/save)
部分更新：update()
文档替换：save()

语法：
```sql
db.COLLECTION_NAME.update(
   <query>, # 查询条件，类似 sql 里的 where
   <update>, # update 的对象和一些更新的操作符（$, $inc...），类似 sql 里的 set
   {
     upsert: <boolean>, # 若该记录不存在，是否插入新记录（可选，默认 false）
     multi: <boolean>, # 是否全部更新（可选，默认 false，即只更新第一条）
     writeConcern: <document> # 抛出异常的级别（可选）
   }
)

db.collection.save(
   <document>,    # 文档数据
   {
     writeConcern: <document>    # 抛出异常的级别（可选）
   }
)
```

实例：
```sql
> db.col.update(
    {'name':'zhangling'},
    {$set:{'age':'18'}}
  )
  WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })

> db.col.save({
    "_id" : ObjectId("56064f89ade2f21f36b03136"),
    name: 'shuaige',
    age: 18
  })
```

### 删除文档(remove)
MongoDB 使用 remove() 函数来执行数据删除操作。
在删除之前，最好执行 find() 函数来判断执行条件是否正确。
语法：
```sql
db.COLLECTION_NAME.remove(
   <query>, # 删除文档的条件（可选）
   <justOne> # 如果设为 true 或 1，则只删除一个文档（可选）
)

# MongoDB 2.6以后的版本
db.COLLECTION_NAME.remove(
   <query>,
   {
     justOne: <boolean>,
     writeConcern: <document> # 抛出异常的级别（可选）
   }
)
```

实例：
```sql
# 执行两次
> db.col.insert({
    name: 'zhangling',
    age: 26
  })

> db.col.find().pretty()
  {
    "_id" : ObjectId("56066169ade2f21f36b03137"),
    "name" : "zhangling",
    "age": 26
  }
  {
    "_id" : ObjectId("56066169ade2f21f36b03138"),
    "name" : "zhangling",
    "age": 26
  }

> db.col.remove({name: 'zhanging'})
  WriteResult({ "nRemoved" : 2 }) # 删除了两条数据

> db.col.find()
  …… # 没有数据
```

若只想删除一条数据，将 justOne 设为1：
```sql
db.COLLECTION_NAME.remove(DELETION_CRITERIA, 1)
```

若删除所有数据：
```sql
db.COLLECTION_NAME.remove({})
```

### 查询文档(find/findOne)
语法：
```sql
db.COLLECTION_NAME.find()

# 只返回一条结果
db.COLLECTION_NAME.findOne()

# 以格式化的方式显示查询结果
db.COLLECTION_NAME.find().pretty()
```

按条件查询：......