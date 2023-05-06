- 【简介】Node的特点和应用场景
- 基础语法
- 模块机制
  - CommonJS规范
  - 模块实现
  - 核心模块
  - C++扩展模块
  - 模块调用栈
  - 包与NPM
```JS
设置registry：npm config set registry http://registry.npmjs.org 上传下载快了不少~
1.掌握npm包制作上传发布的一系列流程 npm init npm publish
2.用nodejs制作命令行工具
3.基于fis封装解决方案
4.插件的编写
## 常用npm包收集
- [opn](https://www.npmjs.com/package/opn)：在浏览器打开文件/url
```
  - 前后端共用模块
  - [exports与module.exports区别](https://juejin.im/post/597ec55a51882556a234fcef)
  - [模块加载机制是怎样的？（require优先级）](https://www.infoq.cn/article/nodejs-module-mechanism)

- 异步I/O
  - I/O与异步I/O
  - 异步I/O实现现状
  - Node的异步I/O
  - 非I/O的异步API
  - 事件驱动与高性能服务器
  - 什么是高阶函数？
```
如果一个函数以一个或多个函数作为参数，或者返回一个函数，那么此函数为高阶函数。
Node中大部分异步函数都为高阶函数。
高阶函数执行后返回的函数，或者接受的函数参数，被称作闭包。
```
  - [什么是I/O?常见I/O操作有哪些？](https://www.jianshu.com/p/fa7bdc4f3de7) `Node` `I/O`
```
- I/O = Input / Output，也就是输入/输出
- 常见I/O为网络I/O和本地磁盘I/O
```
- 异步编程
  - `事件循环`
  - 函数式编程
  - 异步编程的优势与难点
  - 异步编程解决方案
  - 异步并发控制: [单线程](https://www.cnblogs.com/wanghuohuo/p/7156323.html)
- 内存控制
  - V8的垃圾回收机制与内存限制
  - 高效实用内存
  - 内存指标
  - 内存泄露
  - 内存泄漏排查
  - 大内存应用
- 理解Buffer
  - Buffer结构
  - Buffer的转换
  - Buffer的拼接
  - Buffer与性能
- 网络编程
  - 构建TCP服务
  - 构建UDP服务
  - 构建HTTP服务
  - 构建WebSocket服务
  - 网络服务与安全
- 构建WEB应用
  - 基础功能
  - 数据上传
  - 路由解析
  - 中间件
  - 页面渲染
- 多进程
  - 服务模型的变迁
  - 多进程架构
  - 集群
  - Cluster模块
- 测试
  - 单元测试
  - 性能测试
- 产品化
  - 项目工程化
  - 持续集成
  - 进程守护：[PM2](https://wohugb.gitbooks.io/pm2/content/)
  - 性能优化
  - 日志
  - 监控报警
  - 稳定性
  - 异构共存
  - 框架推荐：express | koa | egg | [nest](https://nestjs.com/)、[nest中文网](https://docs.nestjs.cn/)
  - 脚手架
	- [node-cli](https://github.com/zhanglingrd/node-cli)
	- [egg-cli](https://github.com/zhanglingrd/egg-cli)
- 工具
  - 说说用 Node 开发命令行工具的流程。
- 推荐书籍
  - [《深入浅出Node.js》](https://book.douban.com/subject/25768396/)
  - [《Node.js开发指南》](<https://book.douban.com/subject/10789820/>)
  - [《深入理解Node.js：核心思想与源码分析》](<https://yjhjstz.gitbooks.io/deep-into-node/content/>)
---
- devops
- `Stream`
- `PV/UV`
- `监控`
- `V8`
- [用 Nodejs 如何实现 RPC？](https://juejin.im/entry/5b2089def265da6e2f3e39fd) `network`
- Node中的错误怎么捕获？
- Node中遇到错误，进程退出了怎么办？
- 项目中的中间层Node 在处理什么问题？
- Node 的Cluster模式是什么？
- Node 中的进程和线程啥区别？
- Node 中如何创建一个进程？
- Node的多个进程如何通信？
- Koa2 中的 context如何实现？
- 如何监控Node？
- Node中的日志如何保整串行？
- Node 挂掉怎么办？怎么发现其中的问题？
- Node中的事件循环是什么？
- 多进程 `分布式`
- Chrome V8
- `Express`
- `Koa`
- `Egg.js`
- `Nest.js`