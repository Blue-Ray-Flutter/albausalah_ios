import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_icon_button/loading_icon_button.dart';

import '../../../../../api/repository/http_repository.dart';
import '../../../../../shared/components/constants/style/color.dart';
import '../../../../../shared/helper/cache_utils.dart';
import '../../../../category/sub_category/model/sub_category_model.dart';
import '../../../../home/model/category_model.dart';
import '../../../../stores/store_page/product_page/model/product_color_model.dart';
import '../../../../stores/store_page/product_page/model/product_size_model.dart';

class DeliveryStaffController extends GetxController {
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;

  DeliveryStaffController(
      {required this.httpRepository, required this.cacheUtils});
  final formKey = GlobalKey<FormState>();

  Rx<int> subCategoryValue = Rx<int>(0);
  Rx<int> categoryValue = Rx<int>(0);
  Rx<int> activeValue = Rx<int>(0);
  Rx<int> specialOfferValue = Rx<int>(0);
  Rx<int> statusValue = Rx<int>(0);

  final RxBool show = true.obs;
  Rx<bool> isDoneUpload = RxBool(false);
  Rx<File>? file = Rx(File(''));

  RxList<String> selectColors = RxList([]);
  RxList<String> selectSizes = RxList([]);

  Rx<CategoryModel?> categoryModel = Rx<CategoryModel?>(null);
  Rx<SubCategoryModel?> subCategoryModel = Rx<SubCategoryModel?>(null);
  Rx<ProductColorModel?> productColorModel = Rx<ProductColorModel?>(null);
  Rx<ProductSizeModel?> productSizeModel = Rx<ProductSizeModel?>(null);

  final LoadingButtonController btnController = LoadingButtonController();

  RxString codeCountry = RxString('');

  final phoneController = TextEditingController();
  final skuController = TextEditingController();
  final fileController = TextEditingController();
  final passwordController = TextEditingController();
  final cPasswordController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final userNameController = TextEditingController();
  final productDescriptionController = TextEditingController();
  final priceController = TextEditingController();
  final discountPriceController = TextEditingController();

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
      fileController.text = file!.value.path;
      isDoneUpload.value = true;
    } else {
      isDoneUpload.value = false;
    }
  }

  addNewEmployee() async {
    try {
      httpRepository.createDeliveryEmployee(
        lang: cacheUtils.getLanguage()!,
        name: nameController.text,
        status: (activeValue.value).toString(),
        phone: phoneController.text,
        email: emailController.text,
        profilePhotoUrl: file!.value,
        password: passwordController.text,
        passwordConfirmation: cPasswordController.text,
        countryCode: codeCountry.value.substring(1),
        userName: userNameController.text,
      );
      nameController.text = '';
      activeValue.value = 0;
      phoneController.text = '';
      emailController.text = '';
      fileController.text = '';
      passwordController.text = '';
      cPasswordController.text = '';
      codeCountry.value = '';
      userNameController.text = '';
      Get.back();
    } catch (e) {
      Get.snackbar(
        'Add New Employee'.tr,
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

  updateEmployee() async {
    try {
      httpRepository.updateDeliveryEmployee(
        lang: cacheUtils.getLanguage()!,
        name: nameController.text,
        status: (activeValue.value).toString(),
        phone: phoneController.text,
        email: emailController.text,
        profilePhotoUrl: file!.value,
        password: passwordController.text,
        passwordConfirmation: cPasswordController.text,
        countryCode: codeCountry.value.substring(1),
        userName: userNameController.text,
      );
      nameController.text = '';
      activeValue.value = 0;
      phoneController.text = '';
      emailController.text = '';
      fileController.text = '';
      passwordController.text = '';
      cPasswordController.text = '';
      codeCountry.value = '';
      userNameController.text = '';

      Get.back();
    } catch (e) {
      Get.snackbar(
        'Update Employee'.tr,
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
}
