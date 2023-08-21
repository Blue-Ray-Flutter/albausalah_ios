import 'package:albausalah_app/shared/components/widgets/button/button.dart';
import 'package:albausalah_app/shared/helper/cache_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../shared/components/widgets/size_config/size_config.dart';
import '../../base/base_widget.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    CacheUtils cacheUtils = CacheUtils(GetStorage());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, // <-- SEE HERE
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0.6,
          title: Text(
            'Language'.tr,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Button(
                radius: 15,
                height: 60,
                onPressed: () {
                  Get.updateLocale(const Locale('ar'));
                  cacheUtils.saveLanguage(language: 'ar');

                  BaseWidgetState.isEnglish.value =
                      !BaseWidgetState.isEnglish.value;
                },
                text: 'عربي',
              ),
              const SizedBox(
                height: 10,
              ),
              Button(
                radius: 15,
                height: 60,
                onPressed: () {
                  Get.updateLocale(const Locale('en'));
                  cacheUtils.saveLanguage(language: 'en');

                  BaseWidgetState.isEnglish.value =
                      !BaseWidgetState.isEnglish.value;
                },
                text: 'English',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
