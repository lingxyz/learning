## 简介
- [qiankun 官方文档](https://qiankun.umijs.org/zh)
- [基于 single-spa](https://github.com/single-spa/single-spa)
- 蚂蚁金服内部孵化，服务超过200+平台

## 微前端集成
### 主应用-加载-微应用

[在主应用中注册微应用](https://qiankun.umijs.org/zh/guide/getting-started#2-%E5%9C%A8%E4%B8%BB%E5%BA%94%E7%94%A8%E4%B8%AD%E6%B3%A8%E5%86%8C%E5%BE%AE%E5%BA%94%E7%94%A8 ':include :type=iframe width=100% height=300px')

### 微应用-路由
### 微应用-配置原则
### 微应用-原生配置
### 微应用-vue配置

## 微前端通信
- 账号打通
- 权限打通
- 绕开账号权限问题
```
需求背景：A系统某模块嵌入B系统展示。
前端：微前端嵌入。A系统模块以微前端嵌入B系统。
后端：A系统将B系统当做一个用户(类型是2B)，返回数据(默认全部/根据A系统数据权限过滤)。B系统数据权限由B去做。
```
- 参数传递，安全性

## 微前端部署
- 微前端-部署
- 跨域解决

## 微前端原理
- HTML entry
- JS 沙箱
- 样式隔离
- 应用间通信
- 预加载