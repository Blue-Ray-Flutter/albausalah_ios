import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../shared/components/constants/style/color.dart';

class TermsConditions extends StatefulWidget {
  TermsConditions({Key? key}) : super(key: key);

  @override
  _TermsConditionsState createState() => _TermsConditionsState();
}

class _TermsConditionsState extends State<TermsConditions> {
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
            'Terms & Conditions'.tr,
          ),
        ),
        body: IndexedStack(index: position, children: <Widget>[
          WebView(
            initialUrl: 'https://al-bausalah.com/frontend/termsConditions',
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
