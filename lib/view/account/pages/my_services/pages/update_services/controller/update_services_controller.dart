import 'package:albausalah_app/shared/components/constants/style/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../api/repository/http_repository.dart';
import '../../../../../../../shared/helper/cache_utils.dart';

class UpdateServiceController extends GetxController {
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;
  UpdateServiceController(
      {required this.httpRepository, required this.cacheUtils});

  Rx<int> statusValue = Rx<int>(0);
  Rx<String?> serviceId = Rx<String?>(null);

  final formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();

  updateService() async {
    try {
      httpRepository.updateMyService(
        status: statusValue.value.toString(),
        lang: cacheUtils.getLanguage()!,
        serviceId: serviceId.value!,
        titleEn: titleController.text,
      );
      titleController.text = '';
      statusValue.value = 0;
    } catch (e) {
      Get.snackbar(
        'Update Service'.tr,
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
  void onInit() {
    serviceId.value = Get.arguments.toString();
    super.onInit();
  }
}
