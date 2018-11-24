# MongoDB 安装

### Lilux 平台安装
```bash
# 下载
wget https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-3.0.6.tgz
# 解压
tar -zxvf mongodb-linux-x86_64-3.0.6.tgz
# 将解压包移动到指定目录
mv mongodb-linux-x86_64-3.0.6/ /usr/local/mongodb
# MongoDB 的可执行文件位于 bin 目录下，所以可将其添加到 PATH 路径中
export PATH=/usr/local/mongodb/bin:$PATH
```

### 创建数据库目录
```bash
mkdir -p /data/db
```
*/data/db 是 MongoDB 默认的启动的数据库路径(--dbpath)*

### 启动
```bash
cd /usr/local/mongodb/bin
./mongod (--dbpath=xxx/data/db)
```

### 后台管理shell
```bash
cd /usr/local/mongodb/bin
./mongo
```

### web 用户界面
启动 MongoDB 时加 --rest 参数
```bash
./mongod (--dbpath=/data/db) --rest
```
MongoDB 的默认端口为 27017
MongoDB 的 Web 界面访问端口比服务的端口多1000
浏览器打开 http://localhost:28017

### 后台启动
可设置命令行参数(-logpath xxx -fork)，也可设置配置文件启动(&)

命令行参数：
```bash
./mongod --dbpath /data/db/ --rest -logpath /data/db/mongo.log -logappend -fork -port 27017
```

配置文件：
```bash
# 创建配置文件
> vi /etc/mongodb.conf
dbpath=/data/db/
logpath=/data/db/mongo.log
logappend=true
fork=true
# auth=true
port=27017

> /usr/local/mongodb/bin/mongod -f /etc/mongodb.conf &
```
[参考](http://www.cnblogs.com/magicsky0/p/3383812.html)

关闭（杀进程）：
```bash
ps aux|grep mongodb
kill -9 xxxx

# 以 fork 方式启动的
/usr/local/mongodb/bin/mongo
use admin
db.shutdownServer({force : true})
```

### 验证登录
MongoDB数据库默认是没有用户名及密码，不用安全验证的，只要连接上服务就可以进行 CRUD(create、retrieve、update、delete) 操作
- 开启安全性验证 auth=true
- 创建用户
```bash
use admin
db.createUser({user: "root",pwd: "root",roles: [ "dbAdminAnyDatabase", "dbAdmin" ]})
```
- 用户登录 db.auth('root', 'root')
- 删除用户 在 auth=false 下， 执行 db.system.users.remove({user: "root"})

### fix error:
在 /usr/local/mongod/bin 目录下运行 ./mongod 命令报错：
[export LC_ALL=C](http://askubuntu.com/questions/536875/error-in-installing-mongo-in-virtual-machine)