import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_icon_button/loading_icon_button.dart';

import '../../../../../api/repository/http_repository.dart';
import '../../../../../shared/components/constants/style/color.dart';
import '../../../../../shared/helper/cache_utils.dart';

class AddNewJobController extends GetxController {
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;

  AddNewJobController({required this.httpRepository, required this.cacheUtils});
  final formKey = GlobalKey<FormState>();

  final LoadingButtonController btnController = LoadingButtonController();

  Rx<int> statusValue = Rx<int>(0);
  final descriptionController = TextEditingController();
  final titleController = TextEditingController();

  addNewJob() async {
    try {
      httpRepository.addNewJob(
        lang: cacheUtils.getLanguage()!,
        description: descriptionController.text,
        status: (statusValue.value).toString(),
        title: titleController.text,
      );
      descriptionController.text = '';
      titleController.text = '';
    } catch (e) {
      Get.snackbar(
        'Add new job'.tr,
        'Something is wrong'.tr,
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
    super.onInit();
  }
}
