import 'package:flutter/material.dart';
import 'dart:async';
import 'package:webview_windows/webview_windows.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _controller = WebviewController();
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    await _controller.initialize();
    await _controller.loadUrl("https://www.google.com");
    if (!mounted) return;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: Webview(_controller)),
      ),
    );
  }
}
