import 'dart:io';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_icon_button/loading_icon_button.dart';

import '../../../../../api/repository/http_repository.dart';
import '../../../../../shared/components/constants/style/color.dart';
import '../../../../../shared/helper/cache_utils.dart';
import '../model/my_status_model.dart';

class CreateStoryController extends GetxController {
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;
  CreateStoryController({
    required this.httpRepository,
    required this.cacheUtils,
  });

  final LoadingButtonController btnController = LoadingButtonController();
  Rx<MyStatusModel?> myStatusModel = Rx<MyStatusModel?>(null);

  final fileController = TextEditingController();
  final linkController = TextEditingController();
  final postController = TextEditingController();
  Rx<int> liveFeedValue = Rx<int>(0);

  final formKey = GlobalKey<FormState>();

  final bool show = true;
  Rx<bool> isDoneUpload = RxBool(false);
  Rx<File>? file = Rx(File(''));

  getFileSize(String filepath, int decimals) async {
    var file = File(filepath);
    int bytes = await file.length();
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();

    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }

  Future<void> openFileExplorer() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'jpeg',
        'jpg',
        'png',
        'gif',
        'mp4',
        'ogx',
        'oga',
        'ogv',
        'ogg',
        'webm',
      ],
    );

    if (result != null) {
      file!.value = File(result.files.single.path!);
      isDoneUpload.value = true;
      int size = await file!.value.length();
      if (size > 20000000) {
        file!.value = File('');
        Get.snackbar(
          'Warning'.tr,
          'You cannot upload a file larger than 20 MG'.tr,
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
      } else {
        fileController.text = file!.value.path;
      }
    } else {
      isDoneUpload.value = false;
    }
  }

  getMyStatus() async {
    late Rx<Response?> statusResponse = Rx<Response?>(null);
    try {
      statusResponse.value = await httpRepository.getMyStatus();
      if (statusResponse.value == null) {
        return null;
      }
      myStatusModel.value = MyStatusModel.fromJson(statusResponse.value!.body);
      myStatusModel.refresh();
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

  createStatus() async {
    try {
      await httpRepository.createStatus(
        lang: cacheUtils.getLanguage()!,
        liveStatus: liveFeedValue.value.toString(),
        file: file!.value,
        text: postController.text,
        url: linkController.text,
      );

      file!.value.path == '';
      postController.text = '';
      linkController.text = '';
      fileController.text = '';
      liveFeedValue.value = 0;
      myStatusModel.value = null;
      Future.delayed(const Duration(milliseconds: 500), () async {
        await getMyStatus();
      });
    } catch (e) {
      Get.snackbar(
        'Create Status'.tr,
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
    return null;
  }

  @override
  Future<void> onInit() async {
    await getMyStatus();
    super.onInit();
  }
}
