// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GithubWebView extends StatefulWidget {
  const GithubWebView({Key? key});

  @override
  State<GithubWebView> createState() => _WebViewStackState();
}

class _WebViewStackState extends State<GithubWebView> {
  var loadingPercentage = 0;
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingPercentage = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPercentage = 100;
          });
        },
      ))
      ..loadRequest(
        Uri.parse('https://github.com/JohnnyBoi03'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Stack with a Scaffold
      appBar: AppBar( // AppBar
        title: Text('GitHub WebView'), // title
      ),
      body: Stack(
        children: [
          WebViewWidget(
            controller: controller,
          ),
          if (loadingPercentage < 100)
            LinearProgressIndicator(
              value: loadingPercentage / 100.0,
            ),
        ],
      ),
    );
  }
}
