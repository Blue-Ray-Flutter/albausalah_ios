import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../api/repository/http_repository.dart';
import '../../../../shared/components/constants/style/color.dart';
import '../../../../shared/helper/cache_utils.dart';
import '../model/category_stores_model.dart';
import '../model/sub_category_model.dart';

class SubCategoryController extends GetxController {
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;

  SubCategoryController(
      {required this.httpRepository, required this.cacheUtils});

  Rx<SubCategoryModel?> subCategoryModel = Rx<SubCategoryModel?>(null);
  Rx<CategoryStoresModel?> categoryStoresModel = Rx<CategoryStoresModel?>(null);

  RxString categoryId = RxString('');
  RxInt valueId = RxInt(-1);

  getSubCategories() async {
    late Rx<Response?> subCategoryResponse = Rx<Response?>(null);

    try {
      subCategoryResponse.value = await httpRepository.getSubCategories(
        categoryId: categoryId.value,
        lang: cacheUtils.getLanguage() ?? 'en',
      );

      if (subCategoryResponse.value == null) {
        return null;
      }
      subCategoryModel.value =
          SubCategoryModel.fromJson(subCategoryResponse.value!.body);
    } catch (e) {
      Get.snackbar(
        'Get Sub Category'.tr,
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

  getCategoryStores(String categoryId) async {
    late Rx<Response?> categoryStoresResponse = Rx<Response?>(null);

    try {
      categoryStoresResponse.value = await httpRepository.getCategoryStores(
        categoryId: categoryId,
        lang: cacheUtils.getLanguage() ?? 'en',
      );

      if (categoryStoresResponse.value == null) {
        return null;
      }
      categoryStoresModel.value =
          CategoryStoresModel.fromJson(categoryStoresResponse.value!.body);
    } catch (e) {
      Get.snackbar(
        'Get Category Stores'.tr,
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

  getSubCategoryStores(String subCategoryId) async {
    late Rx<Response?> categoryStoresResponse = Rx<Response?>(null);

    try {
      categoryStoresResponse.value = await httpRepository.getSubCategoryStores(
        subCategoryId: subCategoryId,
        lang: cacheUtils.getLanguage() ?? 'en',
      );

      if (categoryStoresResponse.value == null) {
        return null;
      }
      categoryStoresModel.value =
          CategoryStoresModel.fromJson(categoryStoresResponse.value!.body);
      categoryStoresModel.refresh();
    } catch (e) {
      Get.snackbar(
        'Get sub category stores_guest'.tr,
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
    categoryId.value = Get.arguments.toString();
    await getCategoryStores(categoryId.value);
    await getSubCategories();
    super.onInit();
  }
}
