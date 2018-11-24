- IE下,可以使用获取常规属性的方法来获取自定义属性,
   也可以使用getAttribute()获取自定义属性;

   Firefox下,只能使用getAttribute()获取自定义属性.
   解决方法:统一通过getAttribute()获取自定义属性

- IE下,event对象有x,y属性,但是没有pageX,pageY属性;

  Firefox下,event对象有pageX,pageY属性,但是没有x,y属性
