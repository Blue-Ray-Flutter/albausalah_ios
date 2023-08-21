import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_icon_button/loading_icon_button.dart';

import '../../../../../api/repository/http_repository.dart';
import '../../../../../shared/components/constants/style/color.dart';
import '../../../../../shared/helper/cache_utils.dart';
import '../../../../category/sub_category/model/sub_category_model.dart';
import '../../../../home/model/category_model.dart';
import '../../../../stores/store_page/product_page/model/product_color_model.dart';
import '../../../../stores/store_page/product_page/model/product_size_model.dart';

class AddNewProductController extends GetxController {
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;

  AddNewProductController(
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

  RxList<File> otherImages = RxList([]);

  Rx<CategoryModel?> categoryModel = Rx<CategoryModel?>(null);
  Rx<SubCategoryModel?> subCategoryModel = Rx<SubCategoryModel?>(null);
  Rx<ProductColorModel?> productColorModel = Rx<ProductColorModel?>(null);
  Rx<ProductSizeModel?> productSizeModel = Rx<ProductSizeModel?>(null);

  final LoadingButtonController btnController = LoadingButtonController();

  final fileController = TextEditingController();
  final discountPriceController = TextEditingController();
  final priceController = TextEditingController();
  final productNameController = TextEditingController();
  final skuController = TextEditingController();
  final productDescriptionController = TextEditingController();

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

  getCategories() async {
    late Rx<Response?> categoryResponse = Rx<Response?>(null);

    try {
      categoryResponse.value = await httpRepository.getMainCategories(
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

  getSubCategories({required String categoryId}) async {
    late Rx<Response?> subCategoryResponse = Rx<Response?>(null);

    try {
      subCategoryResponse.value = await httpRepository.getSubCategories(
        categoryId: categoryId,
        lang: cacheUtils.getLanguage()!,
      );

      if (subCategoryResponse.value == null) {
        return null;
      }
      subCategoryModel.value =
          SubCategoryModel.fromJson(subCategoryResponse.value!.body);
      subCategoryModel.refresh();
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

  getProductColors() async {
    late Rx<Response?> productColorResponse = Rx<Response?>(null);

    try {
      productColorResponse.value = await httpRepository.getAllColors();

      if (productColorResponse.value == null) {
        return null;
      }
      productColorModel.value =
          ProductColorModel.fromJson(productColorResponse.value!.body);
    } catch (e) {
      Get.snackbar(
        'Get Colors'.tr,
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

  getProductSize() async {
    late Rx<Response?> productSizeResponse = Rx<Response?>(null);

    try {
      productSizeResponse.value = await httpRepository.getAllSizes();

      if (productSizeResponse.value == null) {
        return null;
      }
      productSizeModel.value =
          ProductSizeModel.fromJson(productSizeResponse.value!.body);
    } catch (e) {
      Get.snackbar(
        'Get Size'.tr,
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

  addNewProduct() async {
    try {
      httpRepository.addNewProduct(
        lang: cacheUtils.getLanguage()!,
        name: productNameController.text,
        categoryId: (categoryValue.value).toString(),
        subCategoryId: (subCategoryValue.value).toString(),
        sku: skuController.text,
        description: productDescriptionController.text,
        salePrice: priceController.text,
        onSalePriceStatus: (activeValue.value).toString(),
        onSalePrice: discountPriceController.text,
        status: (statusValue.value).toString(),
        summerOffer: (specialOfferValue.value ?? '').toString(),
        image: file!.value,
        colorIds: selectColors,
        sizeIds: selectSizes,
        files: otherImages,
      );
      productNameController.text = '';
      skuController.text = '';
      productDescriptionController.text = '';
      priceController.text = '';
      discountPriceController.text = '';
      fileController.text = '';
      specialOfferValue.value = 0;
      statusValue.value = 0;
      activeValue.value = 0;
      categoryValue.value = 0;
      subCategoryValue.value = 0;
    } catch (e) {
      Get.snackbar(
        'Add New Product'.tr,
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

  Future getImages() async {
    final pickedFile = await ImagePicker().pickMultiImage(
      imageQuality: 100,
      maxHeight: 1000,
      maxWidth: 1000,
    );
    List<XFile> xfilePick = pickedFile;
    if (xfilePick.isNotEmpty) {
      for (var i = 0; i < xfilePick.length; i++) {
        otherImages.add(File(xfilePick[i].path));
      }
    }
  }

  @override
  Future<void> onInit() async {
    await getCategories();
    await getProductColors();
    await getProductSize();
    super.onInit();
  }
}
