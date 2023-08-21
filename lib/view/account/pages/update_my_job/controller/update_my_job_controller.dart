import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_icon_button/loading_icon_button.dart';

import '../../../../../api/repository/http_repository.dart';
import '../../../../../shared/components/constants/style/color.dart';
import '../../../../../shared/helper/cache_utils.dart';

class UpdateMyJobController extends GetxController {
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;

  UpdateMyJobController(
      {required this.httpRepository, required this.cacheUtils});
  final formKey = GlobalKey<FormState>();

  final LoadingButtonController btnController = LoadingButtonController();

  RxString jobId = RxString('');

  Rx<int> statusValue = Rx<int>(0);
  final descriptionController = TextEditingController();
  final titleController = TextEditingController();

  updateMyJob() async {
    try {
      httpRepository.updateJob(
        lang: cacheUtils.getLanguage()!,
        description: descriptionController.text,
        status: (statusValue.value).toString(),
        title: titleController.text,
        jobId: jobId.value,
      );
      descriptionController.text = '';
      titleController.text = '';
    } catch (e) {
      Get.snackbar(
        'update Job'.tr,
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
    jobId.value = Get.arguments;
    super.onInit();
  }
}
