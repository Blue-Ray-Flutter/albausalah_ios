import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../shared/components/constants/style/color.dart';

class PurchaseMethod extends StatefulWidget {
  const PurchaseMethod({Key? key}) : super(key: key);

  @override
  _PurchaseMethodState createState() => _PurchaseMethodState();
}

class _PurchaseMethodState extends State<PurchaseMethod> {
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
            'Purchase Method'.tr,
          ),
        ),
        body: IndexedStack(index: position, children: <Widget>[
          WebView(
            initialUrl: 'https://al-bausalah.com/frontend/howToBuys',
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
