import 'dart:io';

import 'package:albausalah_app/shared/components/constants/style/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  int position = 1;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:  Text(
            'Privacy Policy'.tr,
          ),
        ),
        body: IndexedStack(index: position, children: <Widget>[
          WebView(
            initialUrl: 'https://al-bausalah.com/frontend/privacyPolicy',
            javascriptMode: JavascriptMode.unrestricted,
            onPageStarted: (value) {
              setState(() {
                position = 1;
              });
            },
            onPageFinished: (value) {
              setState(() {
                position = 0;
              });
            },
          ),
          Center(
            child: LoadingAnimationWidget.stretchedDots(
              color: AppColor.globalDefaultColor,
              size: 40,
            ),
          ),
        ]));
  }
}
