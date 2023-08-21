import 'package:albausalah_app/view/stores/model/stores_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../api/repository/http_repository.dart';
import '../../../shared/components/constants/style/color.dart';
import '../../../shared/helper/cache_utils.dart';
import '../model/history_product_model.dart';

class StoresController extends GetxController {
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;

  StoresController({required this.httpRepository, required this.cacheUtils});

  Rx<StoresModel?> storesModel = Rx<StoresModel?>(null);
  Rx<HistoryProductModel?> historyProductModel = Rx<HistoryProductModel?>(null);

  final searchController = TextEditingController();

  RxList<String> list = RxList(['Flutter', 'Rails', 'React', 'Vue']);

  getStores({String? search}) async {
    late Rx<Response?> storesResponse = Rx<Response?>(null);

    try {
      storesResponse.value = await httpRepository.getStores(
        search: search,
        lang: cacheUtils.getLanguage()!,
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

  historyProduct() async {
    late Rx<Response?> historyProductResponse = Rx<Response?>(null);

    try {
      historyProductResponse.value = await httpRepository.historyProduct();

      if (historyProductResponse.value == null) {
        return null;
      }
      historyProductModel.value =
          HistoryProductModel.fromJson(historyProductResponse.value!.body);

      historyProductModel.refresh();
    } catch (e) {
      Get.snackbar(
        'Product History'.tr,
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
    await historyProduct();
    super.onInit();
  }
}
