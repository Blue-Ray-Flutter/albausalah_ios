import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_add_to_cart_button/flutter_add_to_cart_button.dart';
import 'package:get/get.dart';
import 'package:loading_icon_button/loading_icon_button.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../api/repository/http_repository.dart';
import '../../../../../shared/components/constants/style/color.dart';
import '../../../../../shared/helper/cache_utils.dart';
import '../model/product_color_model.dart';
import '../model/product_size_model.dart';
import '../model/single_product_model.dart';

class ProductController extends GetxController {
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;
  ProductController({required this.httpRepository, required this.cacheUtils});

  Rx<SingleProductModel?> singleProductModel = Rx<SingleProductModel?>(null);
  Rx<ProductColorModel?> productColorModel = Rx<ProductColorModel?>(null);
  Rx<ProductSizeModel?> productSizeModel = Rx<ProductSizeModel?>(null);
  final LoadingButtonController btnController = LoadingButtonController();

  Rx<AddToCartButtonStateId> stateId = AddToCartButtonStateId.idle.obs;
  final suggestPriceController = TextEditingController();
  final fileController = TextEditingController();

  final fromAddNewMessageKey = GlobalKey<FormState>();

  final bool show = true;
  Rx<bool> isDoneUpload = RxBool(false);
  Rx<File>? file = Rx(File(''));

  RxString colorProduct = RxString('0');
  RxString sizeProduct = RxString('0');
  RxInt numberItem = RxInt(0);

  RxInt index = RxInt(-1);

  RxString productId = RxString('');

  RxString storeId = RxString('');

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

  getSingleProduct() async {
    late Rx<Response?> productResponse = Rx<Response?>(null);

    try {
      productResponse.value = await httpRepository.singleProductDetails(
        productId: productId.value,
        lang: cacheUtils.getLanguage()!,
      );

      if (productResponse.value == null) {
        return null;
      }
      singleProductModel.value =
          SingleProductModel.fromJson(productResponse.value!.body);
    } catch (e) {
      Get.snackbar(
        'Get Single Product'.tr,
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
      productColorResponse.value = await httpRepository.getProductColors(
        productId: productId.value,
        lang: cacheUtils.getLanguage()!,
      );

      if (productColorResponse.value == null) {
        return null;
      }
      productColorModel.value =
          ProductColorModel.fromJson(productColorResponse.value!.body);
    } catch (e) {
      Get.snackbar(
        'Get Product Colors'.tr,
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
      productSizeResponse.value = await httpRepository.getProductSizes(
        productId: productId.value,
        lang: cacheUtils.getLanguage()!,
      );

      if (productSizeResponse.value == null) {
        return null;
      }
      productSizeModel.value =
          ProductSizeModel.fromJson(productSizeResponse.value!.body);
    } catch (e) {
      Get.snackbar(
        'Get Product Sizes'.tr,
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

  suggestPrice({
    required String productId,
    required String suggestPrice,
  }) async {
    try {
      httpRepository.suggestPrice(
        productId: productId,
        receiverId: storeId.value,
        suggestPrice: suggestPrice,
      );
      suggestPriceController.text = '';
      fileController.text = '';
    } catch (e) {
      Get.snackbar(
        'Create New Message'.tr,
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

  void onShare({
    required BuildContext context,
    required String text,
    required String subject,
  }) async {
    final box = context.findRenderObject() as RenderBox?;

    await Share.share(
      text,
      subject: subject,
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    );
  }

  @override
  Future<void> onInit() async {
    productId.value = Get.arguments[0].toString();
    storeId.value = Get.arguments[1].toString();

    await getSingleProduct();
    await getProductColors();
    await getProductSize();

    super.onInit();
  }
}
