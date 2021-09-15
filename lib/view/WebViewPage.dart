import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String url;

  WebViewPage(this.url);

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  double progress = 10;

  @override
  Widget build(BuildContext context) {
    print('url ${widget.url}');
    return Scaffold(
      appBar: AppBar(
        title: Text("webview"),
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: progress / 100.0,
            backgroundColor: Colors.yellow, // 进度条背景色
            valueColor: AlwaysStoppedAnimation<Color>(Colors.red), // 进度条当前进度颜色
            minHeight: progress == 100 ? 1 : 2,
          ),
          Expanded(
            child: WebView(
              initialUrl: "https://gank.io/api/v2/post/${widget.url}",
              // initialUrl: widget.url,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (controller) {
                _controller.complete(controller);
              },
              onProgress: (progress) {
                setState(() {
                  this.progress = progress.toDouble();
                  print('progress ${this.progress}');
                });
              },
              gestureNavigationEnabled: true,
            ),
          ),
        ],
      ),
    );
  }
}
