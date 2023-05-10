结合 amis 文档和团队使用经验按结构化整合，方便大家入门。

## 🐥 Amis 基础

***

### &#x20;Amis 简介

*   Amis 是一个基于 **React** 的**低代码前端**开发框架。
*   它使用**JSON 配置**或 **JS Object** 作为 **AST 语法树**，生成 **React DOM**，最终由 React 框架完成页面渲染。

### &#x20;快速开始

可通过sdk方式和react方式引入。这里介绍通用的sdk方式，可以用于Vue项目。

1.  项目中安装 amis

```bash
npm i amis -S
```

1.  html 中引入 amis （vite中）

```javascript
// vite项目中：index.html
<link rel="stylesheet" href="node_modules/amis/sdk/sdk.css" />
<script src="node_modules/amis/sdk/sdk.js"></script>
```

1.  Vue 中定义通用的 Amis 组件

```javascript
// src > components > amis.vue
<template>
<div id="box">
  <slot></slot>
</div>
</template>

<script lang="ts" setup>
import { onMounted } from "vue";

const props= defineProps({
  amisjson: {
    type: Object,
    required: true
  }
})

onMounted(() => {
  var amis = amisRequire('amis/embed');
  let amisScoped = amis.embed('#box', props.amisjson);
})
</script>
```

1.  Vue 中使用 Amis 组件

```javascript
<Amis :amisjson="amisjson"></Amis>
```

### SchemaNode

在 amis 中，==SchemaNode  = 组件 = 配置文件==。简单示例：

```json
{
  "type": "page",
  "data": {"hello": "hello word"},
  "body": "${hello}"
}
```

*   其中 ==type 的值 = 要渲染的组件名==，必须有。
*   ==body== 中可以嵌套组件。格式为 `body: [{type, body}]`。
*   根据 body 中的组件嵌套关系树，来实现默认布局。
*   在 ==data== 属性中，定义组件需要的数据。
*   使用 ==\${xxx}== 动态获取数据。类似 js 模板字符串语法。
*   ==Definitions== 公共配置：

在`顶级节点`中定义 Definitions 属性，作为当前页面公共的配置项。在页面组件中通过 ==\$ref== 来引用组件。

主要用于页面中组件的==重复引用==和==递归引用==。

示例：from 表单中渲染全局配置的组件 `aa`。

```json
{
  "type": "page",
  "definitions": {
    "aa": {
      "type": "input-text",
      "name": "jack",
      "value": "ref value",
      "labelRemark": "通过<code>\\$ref</code>引入的组件"
    }
  },
  "body": [
    {
      "type": "form",
      "api": "api/xxx",
      "actions": [],
      "body": [
        {
          "$ref": "aa"
        }
      ]
    }
  ]
}
```

### &#x20;CSS 样式调整

amis 中大部分的组件都支持配置 ==className== 和 ==xxxClassName==，来添加自定义样式。

```json
{
	"type": "xxx",
	"className": {"text-danger": "this.status == 1"}
}
```

1.  给组件添加 amis 内置样式

通过 ==className== 给组件添加内置样式类。

具体可用样式列表请查阅 [旧版样式（可使用但不更新）](https://aisuda.bce.baidu.com/amis/zh-CN/docs/concepts/style#%E5%AD%97%E4%BD%93%E9%A2%9C%E8%89%B2) 和 [新版样式](https://aisuda.bce.baidu.com/amis/zh-CN/style/layout/box-sizing)。

例如给按钮添加 `margin-left: 15px;`

```json
{
	"type": "button",
	"className": "m-l"
}
```

1.  使用 `wrapper` 组件直接内嵌 `style`

`wrapper` 是 amis 组件库中自带的组件，相当于 `div` 标签。最大的作用就是==用来布局==。

```json
{
    "type": "wrapper",
    "body": "内容",
    "className": "b" // 添加class
	"style": {		// 自定义样式（内联）
        "color": "#aaa"
     }
  }
```

1.  使用 CSS 变量动态修改全局样式

在 page 下设置 ==cssVars== 属性，修改 amis 内置 css 变量，达到修改全局 css 样式的目的。

具体的 CSS 变量参照 [CSS 变量](https://aisuda.bce.baidu.com/amis/zh-CN/style/css-vars)。

```json
{
  "type": "page",
  "cssVars": {
    "--text-color": "#CD3632",
    "--primary": "#CD3632",
    "--primary-onHover": "#F23F3A",
    "--primary-onActive": "#BB312D"
}
```

1.  生成自定义主题 CSS

    3.1 官方推荐通过源码方式，参考 scss\themes\cxd.scss 文件，修改变量后重新编译一个 css。

    3.2 实际项目中建议维护一个 ==reset-amis.scss==，覆盖 amis 组件默认样式。多项目建议将 reset-amis.scss 提取出来作为==公共 CSS 组件==，或者加入 CDN。

### 事件与行为

#### &#x20;事件动作

<https://aisuda.bce.baidu.com/amis/zh-CN/docs/concepts/event-action>&#x20;

#### 内置行为

使用 ==action== 行为按钮组件，触发 amis 内置的页面交互操作。

使用 `actionType` 来配置组件具体的行为。

完整的行为列表可以查看 [action](https://aisuda.bce.baidu.com/amis/zh-CN/components/action) 组件。

```json
{
  "type": "page",
  "body": {
    "label": "action示例：弹框",
    "type": "button",
    "actionType": "dialog",
    "dialog": {
      "title": "弹框",
      "body": "这是个简单的弹框。"
    }
  }
}
```

```json
{
  "type": "page",
  "body": {
    "type": "action",
    "label": "action示例：发出一个请求",
    "actionType": "ajax",
    "api": "/amis/api/mock2/form/saveForm"
  }
}
```

#### 事件监听

事件监听用于给**复杂的UI交互场景**提供了**通用的解决方案**。

[将 amis 当成 UI 库用 > 事件监听](https://aisuda.bce.baidu.com/amis/zh-CN/docs/extend/ui-library)

### 页面数据

#### 定义数据

*   在组件的==data==属性中，直接定义组件需要的数据。

```json
{
  "type": "page",
  "data": {"hello": "hello word"},
  "body": "${hello}"
}
```

*   数据域和数据链
    <https://aisuda.bce.baidu.com/amis/zh-CN/docs/concepts/datascope-and-datachain>

*   组件间数据联动
    <https://aisuda.bce.baidu.com/amis/zh-CN/docs/concepts/linkage>

#### 动态数据

##### 动态数据获取

*   通用获取api接口 [API (baidu.com)](https://aisuda.bce.baidu.com/amis/zh-CN/docs/types/api)

*   快捷写法

*   初始化写法

##### 动态数据渲染

*   动态模板
    <https://aisuda.bce.baidu.com/amis/zh-CN/docs/concepts/template>

<https://aisuda.bce.baidu.com/amis/zh-CN/docs/concepts/expression>

*   数据映射
    <https://aisuda.bce.baidu.com/amis/zh-CN/docs/concepts/data-mapping>

### 调试工具

使用 json 配置化，进行低代码开发的一大痛点就是调试困难。Amis 提供了 [调试工具](https://aisuda.bce.baidu.com/amis/zh-CN/docs/extend/debug)，查看组件内部运行日志，方便分析问题。

***

## 💎 Amis 高级

### 工作原理

<https://aisuda.bce.baidu.com/amis/zh-CN/docs/extend/internal>

### 内置组件

实际使用时需要非常熟悉
<https://aisuda.bce.baidu.com/amis/zh-CN/components/page>

### 使用经验

*   Amis初次使用工作量会翻倍，熟悉API后会简化工作量，与Amis官网所说`极大提升效率`有出入。
*   Amis 工作量翻倍的主要原因是配置太细太灵活，熟悉和调试成本大，实际使用时结合**业务组件库**会有效率提升。
*   Amis 主要使用者还是前端，除非基于企业内部构建的业务组件库二次封装一个可视化平台。与Amis官网所说`不需要懂前端`有出入。
*   使用amis的目的是快速，**混合开发**可以节省时间。可以先用amis替代部分vue组件，以后逐渐提升组件替代率。具体可以采用vue页面+嵌入amis组件的形式进行开发，哪些模块可以用amis，就嵌入amis组件，不必在不熟悉的情况下，为了全面使用amis开发浪费大量时间。这样就本末倒置了，等于抛弃了熟悉的vue，完全用新的框架。

### 混合开发

*   从全页面到部分组件

全页面配置？监听路由渲染页面
部分组件？使用 通用 amis组件，传参

问题：打破了amis 组件间的数据联动，如何解决？从以下

*   从 Vue 变量 到 Amis 配置

<https://aisuda.bce.baidu.com/amis/zh-CN/docs/start/getting-started#%E5%88%9D%E5%A7%8B%E5%80%BC>

*   从 Amis 配置 到 Vue 变量

在click中 vue变量.value = 新值

通过事件

项目集成

## 🦠 Amis 生态链

***

### 1. 组件库

#### 使用Amis自带组件库+UI风格覆盖

css reset

#### 集成自定义组件库

vue组件库

### 2. 业务组件库

业务组件库的价值

1.  提效：固化配置，降低了灵活性，但提升了效率。
2.  用户：从开发变更为产品、设计甚至是==业务人员==。
3.  价值：从产品开发变更为快速搭建、快速调整、快速试错。

### 3. 可视化编辑器

### 4. Amis admin

整站使用amis，配置路由
