import 'package:flutter/material.dart';
import 'package:moncov/consttants.dart';
import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart';

class BeritaScreen extends StatelessWidget {
  final String selectedUrl;

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  BeritaScreen({
    @required this.selectedUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Berita Seputar Covid-19', style: appbar,),
        backgroundColor: Color(0xFF578DDD),
      ),
      body: WebView(
        initialUrl: selectedUrl,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    );
  }
}
