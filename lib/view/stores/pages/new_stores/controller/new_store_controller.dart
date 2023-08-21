import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../api/repository/http_repository.dart';
import '../../../../../shared/components/constants/style/color.dart';
import '../../../../../shared/helper/cache_utils.dart';
import '../../../model/stores_model.dart';

class NewStoreController extends GetxController {
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;

  NewStoreController({required this.httpRepository, required this.cacheUtils});

  Rx<StoresModel?> newStoresModel = Rx<StoresModel?>(null);

  getNewStores({String? search}) async {
    late Rx<Response?> newStoresResponse = Rx<Response?>(null);

    try {
      newStoresResponse.value = await httpRepository.getNewStores(
        search: search,
        lang: cacheUtils.getLanguage()!,
      );

      if (newStoresResponse.value == null) {
        return null;
      }
      newStoresModel.value =
          StoresModel.fromJson(newStoresResponse.value!.body);
      newStoresModel.refresh();
    } catch (e) {
      Get.snackbar(
        'Get Stores'.tr,
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
    await getNewStores();
    super.onInit();
  }
}
