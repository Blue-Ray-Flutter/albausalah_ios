import 'package:albausalah_app/view/home/model/stores_in_home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../api/repository/http_repository.dart';
import '../../../shared/components/constants/style/color.dart';
import '../../../shared/helper/cache_utils.dart';
import '../model/StatusModel.dart';
import '../model/category_model.dart';
import '../model/slider_model.dart';

class HomeController extends GetxController {
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;

  HomeController({required this.httpRepository, required this.cacheUtils});

  Rx<StatusModel?> statusModel = Rx<StatusModel?>(null);
  Rx<SliderModel?> sliderModel = Rx<SliderModel?>(null);
  Rx<CategoryModel?> categoryModel = Rx<CategoryModel?>(null);
  Rx<StoresInHomeModel?> storesModel = Rx<StoresInHomeModel?>(null);

  final emailController = TextEditingController();

  final scrollController = ScrollController();

  RxInt bottomNavIndex = 0.obs;

  RxBool isView = RxBool(false);
  RxBool isOpen = RxBool(false);

  void scrollDown() {
    scrollController.jumpTo(scrollController.position.maxScrollExtent);
  }

  void scrollToBottom() {
    isOpen.value = true;

    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  getStatus() async {
    late Rx<Response?> statusResponse = Rx<Response?>(null);
    try {
      statusResponse.value = await httpRepository.getStatus();

      if (statusResponse.value == null) {
        return null;
      }

      statusModel.value = StatusModel.fromJson(statusResponse.value!.body);
    } catch (e) {
      Get.snackbar(
        'Get status'.tr,
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

  getSlider() async {
    late Rx<Response?> sliderResponse = Rx<Response?>(null);

    try {
      sliderResponse.value = await httpRepository.getSlider(
        lang: cacheUtils.getLanguage()!,
      );

      if (sliderResponse.value == null) {
        return null;
      }
      sliderModel.value = SliderModel.fromJson(sliderResponse.value!.body);
    } catch (e) {
      Get.snackbar(
        'Get Slider'.tr,
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

  getCategories() async {
    late Rx<Response?> categoryResponse = Rx<Response?>(null);

    try {
      categoryResponse.value = await httpRepository.getShowCategoryInHome(
        lang: cacheUtils.getLanguage()!,
      );

      if (categoryResponse.value == null) {
        return null;
      }
      categoryModel.value =
          CategoryModel.fromJson(categoryResponse.value!.body);
    } catch (e) {
      Get.snackbar(
        'Get Category in home'.tr,
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

  getStores() async {
    late Rx<Response?> storesResponse = Rx<Response?>(null);

    try {
      storesResponse.value = await httpRepository.getShowStoresInHome(
        lang: cacheUtils.getLanguage()!,
      );

      if (storesResponse.value == null) {
        return null;
      }
      storesModel.value =
          StoresInHomeModel.fromJson(storesResponse.value!.body);
    } catch (e) {
      Get.snackbar(
        'Get stores_guest in home'.tr,
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

  subscribeNewsletter() async {
    try {
      httpRepository.subscribeNewsletter(
        lang: cacheUtils.getLanguage()!,
        email: emailController.text,
      );
      emailController.text = '';
    } catch (e) {
      Get.snackbar(
        'Subscribe newsletter'.tr,
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
    await getStatus();
    await getSlider();
    await getCategories();
    await getStores();

    super.onInit();
  }
}
