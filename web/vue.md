## Vue3

### html解析成抽象语法树AST

Vue通过 `parse` 方法，调用了 `htmlparser2` 开源库。在 htmlparser2 中，维持了一个`状态机`，对于每个节点，解析到 `<` 为打开状态，`>` 为初始状态，中间为节点的文本和文字。最后将节点push到父节点的ast中。

### 事件监听
从 AST 中取到注册的 @click 等事件指令，获取当前元素的旧事件监听器和新 `事件监听器`。最后遍历 listeners，通过 `this.$el.addEventListener(eventName, listeners[eventName]);` 为元素绑定的每个事件添加相应处理函数。


- [如何实现一个MVVM框架？](https://github.com/DMQ/mvvm) `MVVM`
- Virtual Dom 是否可以提高性能？
- 怎么看待Dom Diff？Dom Diff算法是啥？
- 如何设计一个组件？
- Vue发展问题在哪里？
- Vue `框架` ☆☆
  - 知识点：生命周期、Router、计算属性
  - 原理：Virtual Dom、Dom Diff、MVVM

### asdas

## Vue-router

## SSR

## Webpack

## Vite
