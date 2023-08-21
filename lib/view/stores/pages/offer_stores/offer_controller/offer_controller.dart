import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../api/repository/http_repository.dart';
import '../../../../../shared/components/constants/style/color.dart';
import '../../../../../shared/helper/cache_utils.dart';
import '../../../model/stores_model.dart';

class OfferController extends GetxController {
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;
  OfferController({required this.httpRepository, required this.cacheUtils});

  Rx<StoresModel?> mostSellingStoresModel = Rx<StoresModel?>(null);

  getOfferStores({String? search}) async {
    late Rx<Response?> getOfferResponse = Rx<Response?>(null);

    try {
      getOfferResponse.value = await httpRepository.getSummerOffers(
        search: search,
        lang: cacheUtils.getLanguage()!,
      );

      if (getOfferResponse.value == null) {
        return null;
      }
      mostSellingStoresModel.value =
          StoresModel.fromJson(getOfferResponse.value!.body);
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
    await getOfferStores();
    super.onInit();
  }
}
