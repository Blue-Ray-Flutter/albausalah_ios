import 'package:albausalah_app/res/assets_res.dart';
import 'package:albausalah_app/shared/components/constants/constant_data/constant_data.dart';
import 'package:albausalah_app/shared/components/constants/style/color.dart';
import 'package:albausalah_app/shared/components/constants/translation/app_translation.dart';
import 'package:albausalah_app/shared/helper/cache_utils.dart';
import 'package:albausalah_app/view/base/base_widget.dart';
import 'package:albausalah_app/view/delivery/delivery_order.dart';
import 'package:albausalah_app/view/welcome/welcome_page.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import 'binding/app_binding.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  CacheUtils cacheUtils = CacheUtils(GetStorage());

  await OneSignal.shared.setAppId(ConstantData.appID);
  OneSignal.shared
      .promptUserForPushNotificationPermission(fallbackToSettings: true)
      .then((accepted) {});

  String language = 'en';

  if (cacheUtils.getLanguage() == null || cacheUtils.getLanguage()!.isEmpty) {
    language = 'en';
  } else {
    language = cacheUtils.getLanguage()!;
  }
  cacheUtils.saveLanguage(language: language);

  runApp(
    MyApp(language: language),
  );
}

class MyApp extends StatefulWidget {
  final String language;

  const MyApp({
    super.key,
    required this.language,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AL-Bausalah',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: AppColor.globalDefaultColor,
                statusBarBrightness: Brightness.light,
                statusBarIconBrightness: Brightness.dark)),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColor.globalDefaultColor,
          secondary: AppColor.globalDefaultColor,
        ),
      ),

      translations: AppTranslation(),
      locale: Locale(widget.language),
      fallbackLocale: const Locale('en'),
      initialBinding: AppBindings(),
      home: AnimatedSplashScreen(
        duration: 3000,
        splash: AssetsRes.ALBAUSALAH_LOGO,
        splashIconSize: 1500,
        nextScreen: checkInitialPage(),
      ),
      // home: ,
    );
  }

  Widget checkInitialPage() {
    final cacheUtils = Get.put(CacheUtils(GetStorage()), permanent: true);
    if (cacheUtils.isUserLoggedIn()) {
      if (cacheUtils.getUserType() == "Delivery") {
        return const DeliveryOrder();
      }
      return const BaseWidget();
    } else {
      return const WelcomePage();
    }
  }
}
