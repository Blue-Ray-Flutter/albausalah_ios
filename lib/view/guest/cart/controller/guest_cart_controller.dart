import 'package:albausalah_app/view/home/pages/cart/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:get/get.dart';

import '../../../../../api/repository/http_repository.dart';
import '../../../../../shared/components/constants/style/color.dart';
import '../../../../../shared/helper/cache_utils.dart';

class GuestCartController extends GetxController {
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;

  GuestCartController({required this.httpRepository, required this.cacheUtils});

  Rx<CartModel?> cartModel = Rx<CartModel?>(null);

  Rx<String?> deviceId = Rx<String?>(null);

  getCart({required String deviceId}) async {
    Rx<Response?> cartResponse = Rx<Response?>(null);

    try {
      cartResponse.value = await httpRepository.guestGetCart(
        lang: cacheUtils.getLanguage() ?? 'en',
        deviceId: deviceId,
      );
      if (cartResponse.value == null) {
        return null;
      }
      cartModel.value = CartModel.fromJson(cartResponse.value!.body);
    } catch (e) {
      Get.snackbar(
        'Get cart'.tr,
        'Something went wrong'.tr,
        icon: const Icon(
          Icons.warning,
          color: Colors.white,
        ),
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColor.globalDefaultColor,
        borderRadius: 15,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        forwardAnimationCurve: Curves.easeOutBack,
      );
      e.printError();
    }
  }

  updateCartQuantity({required List<Map> data}) {
    try {
      httpRepository.guestUpdateCartQuantity(
        lang: cacheUtils.getLanguage() ?? 'en',
        deviceId: deviceId.value!,
        data: data,
      );
      cartModel.value = null;
      Future.delayed(const Duration(milliseconds: 500), () {
        getCart(deviceId: deviceId.value ?? '');
      });
    } catch (e) {
      Get.snackbar(
        'Update Cart Quantity'.tr,
        'Something went wrong'.tr,
        icon: const Icon(
          Icons.warning,
          color: Colors.white,
        ),
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColor.globalDefaultColor,
        borderRadius: 15,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        forwardAnimationCurve: Curves.easeOutBack,
      );
      e.printError();
    }
  }

  @override
  Future<void> onInit() async {
    deviceId.value = await FlutterUdid.udid;
    await getCart(deviceId: deviceId.value ?? '');
    super.onInit();
  }
}
