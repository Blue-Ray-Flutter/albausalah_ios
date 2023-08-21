import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_icon_button/loading_icon_button.dart';

import '../../../../../../api/repository/http_repository.dart';
import '../../../../../../shared/components/constants/style/color.dart';
import '../../../../../../shared/helper/cache_utils.dart';
import '../model/product_comments.dart';
import '../model/product_reviews_model.dart';

class ProductReviewsController extends GetxController {
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;

  ProductReviewsController(
      {required this.httpRepository, required this.cacheUtils});

  final LoadingButtonController btnController = LoadingButtonController();

  Rx<ProductReviewsModel?> productReviewsModel = Rx<ProductReviewsModel?>(null);
  Rx<ProductCommentsModel?> productCommentsModel =
      Rx<ProductCommentsModel?>(null);

  final noteController = TextEditingController();
  final commentController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final commentKey = GlobalKey<FormState>();

  RxString productId = RxString('');
  RxDouble rate = RxDouble(0.0);

  getProductsReviews() async {
    late Rx<Response?> productReviewsResponse = Rx<Response?>(null);

    try {
      productReviewsResponse.value = await httpRepository.getProductReviews(
        productId: productId.value,
        lang: cacheUtils.getLanguage()!,
      );

      if (productReviewsResponse.value == null) {
        return null;
      }
      productReviewsModel.value =
          ProductReviewsModel.fromJson(productReviewsResponse.value!.body);
      productReviewsModel.refresh();
    } catch (e) {
      Get.snackbar(
        'Get Product Reviews'.tr,
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

  getProductComments() async {
    late Rx<Response?> productCommentsResponse = Rx<Response?>(null);

    try {
      productCommentsResponse.value = await httpRepository.getProductComments(
        productId: productId.value,
      );

      if (productCommentsResponse.value == null) {
        return null;
      }
      productCommentsModel.value =
          ProductCommentsModel.fromJson(productCommentsResponse.value!.body);
      productCommentsModel.refresh();
    } catch (e) {
      Get.snackbar(
        'Get Product Comments'.tr,
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

  addProductReview() async {
    try {
      httpRepository.addProductReview(
        productId: productId.value,
        lang: cacheUtils.getLanguage()!,
        reviewValue: rate.value.toInt().toString(),
        reviewNote: noteController.text,
      );
      rate.value = 0.0;
      noteController.text = '';
      Get.back();
      productReviewsModel.value = null;
      Future.delayed(const Duration(milliseconds: 500), () async {
        await getProductsReviews();
      });
    } catch (e) {
      Get.snackbar(
        'Add Product Review'.tr,
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

  addProductComment({String? parentId}) async {
    try {
      httpRepository.addProductComment(
        productId: productId.value,
        lang: cacheUtils.getLanguage()!,
        comment: commentController.text,
        parentId: parentId,
      );
      commentController.text = '';
      Get.back();
      productCommentsModel.value = null;
      Future.delayed(const Duration(milliseconds: 500), () async {
        await getProductComments();
      });
    } catch (e) {
      Get.snackbar(
        'Add Product Comments'.tr,
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
    productId.value = Get.arguments.toString();
    await getProductsReviews();
    await getProductComments();
    super.onInit();
  }
}
