import 'package:albausalah_app/api/repository/http_repository.dart';
import 'package:albausalah_app/shared/components/widgets/more_item/model.dart';
import 'package:albausalah_app/shared/helper/cache_utils.dart';
import 'package:albausalah_app/view/more/pages/about_us.dart';
import 'package:albausalah_app/view/more/pages/contact_us/contact_us.dart';
import 'package:albausalah_app/view/more/pages/fqa.dart';
import 'package:albausalah_app/view/more/pages/how_register/how_register.dart';
import 'package:albausalah_app/view/more/pages/language.dart';
import 'package:albausalah_app/view/more/pages/privacy_policy.dart';
import 'package:albausalah_app/view/more/pages/purchase_method.dart';
import 'package:albausalah_app/view/more/pages/terms_conditions.dart';
import 'package:albausalah_app/view/welcome/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoreController extends GetxController {
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;
  MoreController({required this.httpRepository, required this.cacheUtils});

  RxList<MoreModel> moreItem = RxList<MoreModel>([]);

  @override
  void onInit() {
    moreItem.value = [
      MoreModel(
          moreItems: MoreItems.language,
          title: 'Language'.tr,
          icon: Icons.translate,
          onTap: () {
            Get.to(() => const LanguagePage());
          }),
      MoreModel(
        moreItems: MoreItems.language,
        title: 'About Us'.tr,
        icon: Icons.info,
        onTap: () {
          Get.to(() => AboutUS());
        },
      ),
      MoreModel(
        moreItems: MoreItems.howToRegister,
        title: 'How to register'.tr,
        icon: Icons.login,
        onTap: () {
          Get.to(() => const HowRegister());
        },
      ),
      MoreModel(
        moreItems: MoreItems.contactUs,
        title: 'Contact Us'.tr,
        icon: Icons.call,
        onTap: () {
          Get.to(() => const ContactUS());
        },
      ),
      MoreModel(
        moreItems: MoreItems.fqa,
        title: 'FAQ'.tr,
        icon: Icons.question_mark_outlined,
        onTap: () {
          Get.to(() => FQA());
        },
      ),
      MoreModel(
        moreItems: MoreItems.purchaseMethod,
        title: 'Purchase method'.tr,
        icon: Icons.shopping_bag,
        onTap: () {
          Get.to(() => const PurchaseMethod());
        },
      ),
      MoreModel(
        moreItems: MoreItems.termsConditions,
        title: 'Terms & Conditions'.tr,
        icon: Icons.access_time_filled_outlined,
        onTap: () {
          Get.to(() => TermsConditions());
        },
      ),
      MoreModel(
        moreItems: MoreItems.privacyPolicy,
        title: 'Privacy Policy'.tr,
        icon: Icons.privacy_tip,
        onTap: () {
          Get.to(() => const PrivacyPolicy());
        },
      ),
      MoreModel(
        moreItems: MoreItems.logout,
        title: 'Logout'.tr,
        icon: Icons.logout,
        onTap: () {
          try {
            httpRepository.logout(
              lang: 'en',
            );
            Get.offAll(() => const WelcomePage());
            cacheUtils.logout();
          } catch (e) {
            e.printError();
          }
        },
      ),
    ];
    super.onInit();
  }
}
