import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../api/repository/http_repository.dart';
import '../../../../../shared/components/constants/style/color.dart';
import '../../../../../shared/helper/cache_utils.dart';
import '../../../model/stores_model.dart';

class FreeDeliveryController extends GetxController {
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;
  FreeDeliveryController(
      {required this.httpRepository, required this.cacheUtils});

  Rx<StoresModel?> freeDeliveryStoresModel = Rx<StoresModel?>(null);

  getFreeDeliveryStores({String? search}) async {
    late Rx<Response?> getFreeDeliveryResponse = Rx<Response?>(null);

    try {
      getFreeDeliveryResponse.value =
          await httpRepository.getFreeDeliveryStores(
        search: search,
        lang: cacheUtils.getLanguage()!,
      );

      if (getFreeDeliveryResponse.value == null) {
        return null;
      }
      freeDeliveryStoresModel.value =
          StoresModel.fromJson(getFreeDeliveryResponse.value!.body);
      freeDeliveryStoresModel.refresh();
    } catch (e) {
      Get.snackbar(
        'Get Free Delivery Stores'.tr,
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
        forwardAnimationCurve: Curves.easeInCirc,
      );
      e.printError();
    }
  }

  @override
  Future<void> onInit() async {
    await getFreeDeliveryStores();
    super.onInit();
  }
}
