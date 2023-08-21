import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../api/repository/http_repository.dart';
import '../../../../../shared/components/constants/style/color.dart';
import '../../../../../shared/helper/cache_utils.dart';
import '../../../model/stores_model.dart';

class MostSellingController extends GetxController {
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;
  MostSellingController(
      {required this.httpRepository, required this.cacheUtils});

  Rx<StoresModel?> mostSellingStoresModel = Rx<StoresModel?>(null);

  getMostSellingStores({String? search}) async {
    late Rx<Response?> getMostSellingResponse = Rx<Response?>(null);

    try {
      getMostSellingResponse.value = await httpRepository.getNewStores(
        search: search,
        lang: cacheUtils.getLanguage()!,
      );

      if (getMostSellingResponse.value == null) {
        return null;
      }
      mostSellingStoresModel.value =
          StoresModel.fromJson(getMostSellingResponse.value!.body);
      mostSellingStoresModel.refresh();
    } catch (e) {
      Get.snackbar(
        'Get Most Selling Stores'.tr,
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
    await getMostSellingStores();
    super.onInit();
  }
}
