import 'package:albausalah_app/shared/components/actions/actions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../api/repository/http_repository.dart';
import '../../../../../shared/components/constants/style/color.dart';
import '../../../../../shared/helper/cache_utils.dart';
import '../model/cart_model.dart';

class CartController extends GetxController {
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;

  CartController({required this.httpRepository, required this.cacheUtils});

  Rx<CartModel?> cartModel = Rx<CartModel?>(null);

  updateCartQuantity({
    required List<Map> data,
  }) {
    try {
      httpRepository.updateCartQuantity(
        lang: cacheUtils.getLanguage()!,
        data: data,
      );
      cartModel.value = null;
      Future.delayed(const Duration(milliseconds: 500), () async {
        cartModel.value = await ConstantActions.getCart();
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
    cartModel.value = await ConstantActions.getCart();
    super.onInit();
  }
}
