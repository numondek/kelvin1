import 'dart:io';

import 'package:d8er1/ui/utills/input_deco.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    return Scaffold(
      appBar: buildAppBar(),
      body: const WebView(
        initialUrl: 'https://d8er-app.com',
      ),
    );
  }
}
