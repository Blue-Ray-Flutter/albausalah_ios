import 'package:albausalah_app/view/stores/model/stores_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../api/repository/http_repository.dart';
import '../../../../../shared/components/constants/style/color.dart';
import '../../../../../shared/helper/cache_utils.dart';

class GuestStoresController extends GetxController {
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;

  GuestStoresController(
      {required this.httpRepository, required this.cacheUtils});

  Rx<StoresModel?> storesModel = Rx<StoresModel?>(null);

  getStores({String? search}) async {
    late Rx<Response?> storesResponse = Rx<Response?>(null);

    try {
      storesResponse.value = await httpRepository.guestGetStores(
        search: search,
        lang: cacheUtils.getLanguage() ?? 'en',
      );

      if (storesResponse.value == null) {
        return null;
      }
      storesModel.value = StoresModel.fromJson(storesResponse.value!.body);
      storesModel.refresh();
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
    await getStores();
    super.onInit();
  }
}
