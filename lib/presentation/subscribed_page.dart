import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SubscribedPage extends StatelessWidget {
  final String? link;
  const SubscribedPage({super.key, this.link});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscribed Page'),
      ),
      body: WebView(
        initialUrl: link ?? 'https://www.google.com/',
      ),
    );
  }
}
