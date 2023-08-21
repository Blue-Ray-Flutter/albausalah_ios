import 'package:albausalah_app/shared/components/constants/style/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  CustomSnackBar();

  static const String messageWifiConnect =
      'Please make sure you are connected to the internet';
  static const String messageSomethingWrong =
      'Something is wrong please retry again';
  static const String messageNoSelectItem = 'No file was selected';
  static const String messageUnauthorized = 'Can\'t perform this action';
  static const String messageRequiredFiled = 'Please enter required filed';
  static const String messageSocialData = 'Please verify the entered account';

  static void whenUserTryToSignWithSocial({required String snackBarTitle}) {
    Get.snackbar(
      snackBarTitle.tr,
      messageSocialData.tr,
      icon: const Icon(Icons.error_outline),
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.white,
      borderRadius: 15,
      margin: const EdgeInsets.all(15),
      colorText: AppColor.globalDefaultColor,
      duration: const Duration(seconds: 2),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeInCirc,
    );
  }

  static void whenInternetDisconnected({required String snackBarTitle}) {
    Get.snackbar(
      snackBarTitle.tr,
      messageWifiConnect.tr,
      icon: const Icon(
        Icons.wifi,
        color: AppColor.globalDefaultColor,
      ),
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.white,
      borderRadius: 15,
      margin: const EdgeInsets.all(15),
      colorText: AppColor.globalDefaultColor,
      duration: const Duration(seconds: 2),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeInCirc,
    );
  }

  static void whenSomethingWrong({required String snackBarTitle}) {
    Get.snackbar(
      snackBarTitle.tr,
      messageSomethingWrong.tr,
      icon: const Icon(
        Icons.error_outline,
        color: AppColor.globalDefaultColor,
      ),
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.white,
      borderRadius: 15,
      margin: const EdgeInsets.all(15),
      colorText: AppColor.globalDefaultColor,
      duration: const Duration(seconds: 2),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeInCirc,
    );
  }

  static void whenNoSelectItem({required String snackBarTitle}) {
    Get.snackbar(
      snackBarTitle.tr,
      messageNoSelectItem.tr,
      icon: const Icon(
        Icons.warning_amber_rounded,
        color: AppColor.globalDefaultColor,
      ),
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.white,
      borderRadius: 15,
      margin: const EdgeInsets.all(15),
      colorText: AppColor.globalDefaultColor,
      duration: const Duration(seconds: 2),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeInCirc,
    );
  }

  static void whenUserUnauthorized({required String snackBarTitle}) {
    Get.snackbar(
      snackBarTitle.tr,
      messageUnauthorized.tr,
      icon: const Icon(
        Icons.warning_amber_rounded,
        color: AppColor.globalDefaultColor,
      ),
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.white,
      borderRadius: 15,
      margin: const EdgeInsets.all(15),
      colorText: AppColor.globalDefaultColor,
      duration: const Duration(seconds: 2),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeInCirc,
    );
  }

  static void whenHaveErrorFromBackEnd(
      {required String snackBarTitle, required String bodySnackBar}) {
    Get.snackbar(
      snackBarTitle.tr,
      bodySnackBar.tr,
      icon: const Icon(
        Icons.warning_amber_rounded,
        color: AppColor.globalDefaultColor,
      ),
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.white,
      borderRadius: 15,
      margin: const EdgeInsets.all(15),
      colorText: AppColor.globalDefaultColor,
      duration: const Duration(seconds: 2),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeInCirc,
    );
  }

  static void whenHaveSuccessFromBackEnd(
      {required String snackBarTitle,
      required String bodySnackBar,
      required Icon icon}) {
    Get.snackbar(
      snackBarTitle.tr,
      bodySnackBar.tr,
      icon: icon,
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColor.globalDefaultColor,
      borderRadius: 15,
      margin: const EdgeInsets.all(15),
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeInCirc,
    );
  }

  static void whenHaveRequiredFiled(
      {required String snackBarTitle, required Icon icon}) {
    Get.snackbar(
      snackBarTitle.tr,
      messageRequiredFiled.tr,
      icon: icon,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.white,
      borderRadius: 15,
      margin: const EdgeInsets.all(15),
      colorText: AppColor.globalDefaultColor,
      duration: const Duration(seconds: 2),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeInCirc,
    );
  }
}
