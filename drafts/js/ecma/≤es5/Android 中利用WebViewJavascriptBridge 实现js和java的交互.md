Android 中利用WebViewJavascriptBridge 实现js和java的交互（一）
      此文出自：http://blog.csdn.net/sk719887916/article/details/47189607 ，skay 博客
    按安卓开发目前现状来说，开发者大部分时间还是花在UI的屏幕适配上，使用原生控件开发成本已不是那么理想，鉴于很多项目和ios基于一致的ui界面，至使安卓UI开发成本花费更大的代价，因此目前结合Html5和原生控件是解决UI适配的一种很好的选择，处于APP性能也会用java和native层进行结合。不管是哪种结合，其实原理都差不多，只要按照它的协议来，是很容易的，今天我们仅对于Html和Java层结合，学习下一个新的开源项目--WebViewJavascriptBridge。
   一 什么是webViewjavascripBridge？
       WebViewJavascriptBridge是移动UIView和Html交互通信的桥梁，用作者的话来说就是实现java（ios为oc）和js的互相调用的桥梁。替代了WebView的自带的JavascriptInterface的接口，使得我们的开发更加灵活和安全。

 二 为什么要用webViewjavascripBridge？

    对于安卓开发有一段时间的人来说，知道安卓4.4以前谷歌的webview存在安全漏洞，网站可以通过js注入就可以随便拿到客户端的重要信息，甚至轻而易举的调用本地代码进行流氓行为，谷歌后来发现有此漏洞后，增加了防御措施，如果要是js调用本地代码，开发者必须在代码申明JavascriptInterface，
   列如在4.0之前我们要使得webView加载js只需如下代码：

mWebView.addJavascriptInterface(new JsToJava(), "myjsfunction");  

     4.4之后调用需要在调用方法加入加入@JavascriptInterface注解，如果代码无此申明，那么也就无法使得js生效，也就是说这样就可以避免恶意网页利用js对安卓客户端的窃取和攻击。
        但是即使这样，我们很多时候需要在js记载本地代码的时候，要做一些判断和限制，或者有可能也会做些过滤和对用户友好提示，因此JavascriptInterface也就无法满足我们的需求了，特此有大神就写出了WebViewJavascriptBridge框架。

三 怎么使用webViewjavascripBridge
      1 将jsBridge.jar引入到我们的工程
         此jar，或者jar源码我们可以到gitHub上下载。

      2 WebView包需使用以上包的webView

              Layout中使用第三方view，
              EG:

<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical" >

    <!-- button 演示Java调用web -->
    <Button
        android:id="@+id/button"
        android:layout_width="match_parent"
        android:text="@string/button_name"
        android:layout_height="48dp"
        />

    <!-- webview 演示web调用Java -->
    <com.github.lzyzsd.jsbridge.BridgeWebView
        android:id="@+id/webView"
        android:layout_width="match_parent"
        android:layout_height="match_parent" >
     </com.github.lzyzsd.jsbridge.BridgeWebView>

</LinearLayout>
  3 Java代码

public class MainActivity extends Activity implements OnClickListener {

	private final String TAG = "MainActivity";

	BridgeWebView webView;

	Button button;

	int RESULT_CODE = 0;

	ValueCallback<Uri> mUploadMessage;

    static class Location {
        String address;
    }

    static class User {
        String name;
        Location location;
        String testStr;
    }

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);

        webView = (BridgeWebView) findViewById(R.id.webView);

		button = (Button) findViewById(R.id.button);

		button.setOnClickListener(this);

		webView.setDefaultHandler(new DefaultHandler());

		webView.setWebChromeClient(new WebChromeClient() {

			@SuppressWarnings("unused")
			public void openFileChooser(ValueCallback<Uri> uploadMsg, String AcceptType, String capture) {
				this.openFileChooser(uploadMsg);
			}

			@SuppressWarnings("unused")
			public void openFileChooser(ValueCallback<Uri> uploadMsg, String AcceptType) {
				this.openFileChooser(uploadMsg);
			}

			public void openFileChooser(ValueCallback<Uri> uploadMsg) {
				mUploadMessage = uploadMsg;
				pickFile();
			}
		});
		//加载本地网页

		//webView.loadUrl("file:///android_asset/demo.html");
		//加载服务器网页
		webView.loadUrl("https://www.baidu.com");

		//必须和js同名函数，注册具体执行函数，类似java实现类。
		webView.registerHandler("submitFromWeb", new BridgeHandler() {

			@Override
			public void handler(String data, CallBackFunction function) {

				String str ="这是html返回给java的数据:" + data;
				// 例如你可以对原始数据进行处理
				makeText(MainActivity.this, str, LENGTH_SHORT).show();

				Log.i(TAG, "handler = submitFromWeb, data from web = " + data);
                function.onCallBack( str + ",Java经过处理后截取了一部分："+ str.substring(0,5));
			}

		});
		//模拟用户获取本地位置
        User user = new User();
        Location location = new Location();
        location.address = "上海";
        user.location = location;
        user.name = "Bruce";

        webView.callHandler("functionInJs", new Gson().toJson(user), new CallBackFunction() {
            @Override
            public void onCallBack(String data) {
				makeText(MainActivity.this, "网页在获取你的位置", LENGTH_SHORT).show();

            }
        });

        webView.send("hello");

	}

	public void pickFile() {
		Intent chooserIntent = new Intent(Intent.ACTION_GET_CONTENT);
		chooserIntent.setType("image/*");
		startActivityForResult(chooserIntent, RESULT_CODE);
	}

	@Override
	protected void onActivityResult(int requestCode, int resultCode, Intent intent) {
		if (requestCode == RESULT_CODE) {
			if (null == mUploadMessage){
				return;
			}
			Uri result = intent == null || resultCode != RESULT_OK ? null : intent.getData();
			mUploadMessage.onReceiveValue(result);
			mUploadMessage = null;
		}
	}

	@Override
	public void onClick(View v) {
		if (button.equals(v)) {
            webView.callHandler("functionInJs", "data from Java", new CallBackFunction() {

				@Override
				public void onCallBack(String data) {
					// TODO Auto-generated method stub
					Log.i(TAG, "reponse data from js " + data);
				}

			});
		}

	}

}



      通过实例化webView,用法和安卓原生的view没多大区别，设置WebChromClient, 设置加载的html（同样支持网络和本地文件），接着我们需要给web注册和html端约定好的js方法名。代码列举的submitFromweb和js的执行的方法名一致，玩过NDK的JNI调用的朋友也知道必须和c代码之间有个约定，其实js桥和jni有点类似，

通过注册handler来实现回调，Java代码中通过js返回的数据，进行处理后在调用function.onCallback返回给js.这里不做过多解释

//必须和js同名函数，注册具体执行函数，类似java实现类。
		webView.registerHandler("submitFromWeb", new BridgeHandler() {

			@Override
			public void handler(String data, CallBackFunction function) {

				String str ="这是html返回给java的数据:" + data;
				// 例如你可以对原始数据进行处理
				makeText(MainActivity.this, str, LENGTH_SHORT).show();

				Log.i(TAG, "handler = submitFromWeb, data from web = " + data);
                function.onCallBack( str + ",Java经过处理后截取了一部分："+ str.substring(0,5));
			}

		});

     如果是webview刚开始就执行一段Java代码 ，可以通过webView.CallHandler（）来实现 。当然我们注册的方法也要和js里面的方法名一致。

 webView.callHandler("functionInJs", new Gson().toJson(user), new CallBackFunction() {
            @Override
            public void onCallBack(String data) {
				makeText(MainActivity.this, "网页在获取你的位置", LENGTH_SHORT).show();

            }
        });

  3 Html和js实现
         html代码如下，效果图



<html>
    <head>
        <meta content="text/html; charset=utf-8" http-equiv="content-type">
        <title>
            js调用java
        </title>
    </head>

    <body>
        <p>
            <xmp id="show">
            </xmp>
        </p>
        <p>
            <xmp id="init">
            </xmp>
        </p>
        <p>
            <input type="text" id="text1" value="用户名(username)" />
        </p>
        <p>
            <input type="text" id="text2" value="password" />
        </p>
        <p>
            <input type="button" id="enter" value="发消息给Native" onclick="testClick();"
            />
        </p>
        <p>
            <input type="button" id="enter1" value="调用Native方法" onclick="testClick1();"
            />
        </p>
        <p>
            <input type="button" id="enter2" value="显示html" onclick="testDiv();" />
        </p>
        <p>
            <input type="file" value="打开文件"  />
        </p>
    </body>

</html>

  js代码


 <script>

        function testDiv() {
            document.getElementById("show").innerHTML = document.getElementsByTagName("html")[0].innerHTML;
        }

        function testClick() {
            var str1 = document.getElementById("text1").value;
            var str2 = document.getElementById("text2").value;

            //发送消息给java代码
            var data = "name=" + str1 + ",pass=" + str2;

            window.WebViewJavascriptBridge.send(
                data
                , function(responseData) {

                    document.getElementById("show").innerHTML = "repsonseData from java, data = " +responseData
                }
            );

        }

        function testClick1() {
            var str1 = document.getElementById("text1").value;
            var str2 = document.getElementById("text2").value;

            //调用本地java方法
            window.WebViewJavascriptBridge.callHandler(
                'submitFromWeb'
                , {'param': str1}
                , function(responseData) {
                    document.getElementById("show").innerHTML = "send get responseData from java, data = " + responseData
                }
            );
        }

        function bridgeLog(logContent) {
            document.getElementById("show").innerHTML = logContent;
        }//注册事件监听
        function connectWebViewJavascriptBridge(callback) {
            if (window.WebViewJavascriptBridge) {
                callback(WebViewJavascriptBridge)
            } else {
                document.addEventListener(
                    'WebViewJavascriptBridgeReady'
                    , function() {
                        callback(WebViewJavascriptBridge)
                    },
                    false
                );
            }
        }
//注册回调函数，初始化函数
        connectWebViewJavascriptBridge(function(bridge) {
            bridge.init(function(message, responseCallback) {
                console.log('JS got a message', message);
                var data = {
                    'Javascript Responds': 'Wee!'
                };
                console.log('JS responding with', data);
                responseCallback(data);
            });

            bridge.registerHandler("functionInJs", function(data, responseCallback) {
                document.getElementById("show").innerHTML = ("data from Java: = " + data);
                var responseData = "Javascript Says Right back aka!";
                responseCallback(responseData);
            });
        })
    </script>

      这段代码不难理解，我们对上面的id为enter的Button注册了一个点击事件，点击后执行以下testClick()方法，依次类推，其他Button注册事件相同，

     当点击“发消息给Native”的按钮时，Js通过webWiew的jsBridage.send()发送一条数据给java层（密码和用户名），同时在此用function()来执行应java层回调函数的。此demo中是把java返回的数据插入到"show"的div里面去。

testClick1()：此方法中调用callHandler来调用Java代码的submitFromweb同名函数，可以结合上面的Activty的代码理解下，此函数调用我们已在java注册实现好的

//必须和js同名函数，注册具体执行函数，类似java实现类。
		webView.registerHandler("submitFromWeb", new BridgeHandler() {

			@Override
			public void handler(String data, CallBackFunction function) {

				String str ="这是html返回给java的数据:" + data;
				// 例如你可以对原始数据进行处理
				makeText(MainActivity.this, str, LENGTH_SHORT).show();

				Log.i(TAG, "handler = submitFromWeb, data from web = " + data);
                function.onCallBack( str + ",Java经过处理后截取了一部分："+ str.substring(0,5));
			}

		});
     java注册Js函数如上面列子 ，那么在js中注册方法来注册呢，
    在js中我们同样可以直接注册一个回调函数，通过 bridge.registerHandler（）来注册，接着调用 responseCallback(responseData)来返回数据给java代码的同名函数。f
也可以直接调用init()来指定网页首次加载上面注册java代码。

  connectWebViewJavascriptBridge(function(bridge) {
            bridge.init(function(message, responseCallback) {
                console.log('JS got a message', message);
                var data = {
                    'Javascript Responds': 'Wee!'
                };
                console.log('JS responding with', data);
                responseCallback(data);
            });

            bridge.registerHandler("functionInJs", function(data, responseCallback) {
                document.getElementById("show").innerHTML = ("data from Java: = " + data);
                var responseData = "Javascript Says Right back aka!";
                responseCallback(responseData);
            });
        })

四 总结
     通过以上的代码示例，不难发现此框架的优雅和简便，对js和java双方来说，如果html中的js需要调用java代码，而java代码没做任何实现，那么这个js也是无效的，反之java代码注册的回调函数，没在js里去实现，那么Java也无法获取js远程数据，由此可见此，此通信是双方的，必须由双发来约定，这样就避免了安卓之前存在js注入漏洞，也很大的提高了安全性，也可以保证我们的网页数据不被第三方的APP获取，怎么说呢，比如你的项目某一html界面，被安卓浏览器或者其他第三方App恶意加载你们的网站或网页，那么它的java代码调用你的js函数，比如由你的Js事先注册或者实现，不然跟本无法调用。这样就保证了这个html的唯一性，第三方可以加载预览你的网页，但是第三方java不能和你的js交互通信。同样加载第三方的网页时候，我们可以对第三方网页进行一些行为的过滤，进而对用户进行友好提示。

    以上代码只是此开源框架一部分功能，还有很多的功能需要我们去挖掘，以后再给大家解剖下此开源项目的内部实现。欢迎阅读


项目开源地址：https://github.com/lzyzsd/JsBridge

来源： http://www.myexception.cn/web/1978082.html
