```css
.display-flex() {
    display: -webkit-box; //老版本语法: Safari, iOS, Android browser, older WebKit browsers.
    display: -moz-box; //老版本语法: Firefox (buggy)
    display: -ms-flexbox; //混合版本语法: IE 10
    display: -webkit-flex; //新版本语法: Chrome 21+
    display: flex; //新版本语法: Opera 12.1, Firefox 22+
}
.justify-content(...) {
    -webkit-box-pack: @arguments;
    -moz-justify-content: @arguments;
    -webkit-justify-content: @arguments;
    justify-content: @arguments;
}
.align-items(...) {
    -webkit-box-align: @arguments;
    -moz-align-items: @arguments;
    -webkit-align-items: @arguments;
    align-items: @arguments;
}
.left-right(){
  -webkit-box-direction: normal;
  -webkit-box-orient: horizontal;
  -moz-flex-direction: row;
  -webkit-flex-direction: row;
  flex-direction: row;
}
.right-left(){
  -webkit-box-pack: end;
  -webkit-box-direction: reverse;
  -webkit-box-orient: horizontal;
  -moz-flex-direction: row-reverse;
  -webkit-flex-direction: row-reverse;
  flex-direction: row-reverse;
}
.up-bottom(){
  -webkit-box-direction: normal;
  -webkit-box-orient: vertical;
  -moz-flex-direction: column;
  -webkit-flex-direction: column;
  flex-direction: column;
}
.bottom-up(){
  -webkit-box-pack: end;
  -webkit-box-direction: reverse;
  -webkit-box-orient: vertical;
  -moz-flex-direction: column-reverse;
  -webkit-flex-direction: column-reverse;
  flex-direction: column-reverse;
}
.flex-grow(...){
  -webkit-box-flex: unit(@arguments, ~'.0');
  -moz-flex-grow: @arguments;
  -webkit-flex-grow: @arguments;
  flex-grow: @arguments;
}
.flex-shrink(...){
  -webkit-box-flex: unit(@arguments, ~'.0');
  -moz-flex-shrink: @arguments;
  -webkit-flex-shrink: @arguments;
  flex-shrink: @arguments;
}
.flex-order(...){
  -webkit-box-ordinal-group: @arguments;
  -moz-order: @arguments;
  -webkit-order: @arguments;
  order: @arguments;
}
```