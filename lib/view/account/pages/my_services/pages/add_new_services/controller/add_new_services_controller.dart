import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../api/repository/http_repository.dart';
import '../../../../../../../shared/components/constants/style/color.dart';
import '../../../../../../../shared/helper/cache_utils.dart';

class AddNewServicesController extends GetxController {
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;
  AddNewServicesController(
      {required this.httpRepository, required this.cacheUtils});

  final servicesController = TextEditingController();

  Rx<int> activeValue = Rx<int>(0);

  final formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();

  addNewServices() async {
    try {
      httpRepository.createNewService(
        status: activeValue.value.toString(),
        lang: cacheUtils.getLanguage()!,
        title: titleController.text,
      );
      titleController.text = '';
      activeValue.value = 0;
    } catch (e) {
      Get.snackbar(
        'Add New Services'.tr,
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
}
