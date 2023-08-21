import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../api/repository/http_repository.dart';
import '../../../../../shared/helper/cache_utils.dart';
import '../../../shared/components/constants/style/color.dart';
import '../model/delivery_order_model.dart';

class DeliveryOrderController extends GetxController {
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;
  DeliveryOrderController(
      {required this.httpRepository, required this.cacheUtils});

  Rx<DeliveryOrderModel?> deliveryOrderModel = Rx<DeliveryOrderModel?>(null);

  getMyDeliveryOrders() async {
    late Rx<Response?> getMyDeliveryOrderResponse = Rx<Response?>(null);

    try {
      getMyDeliveryOrderResponse.value =
          await httpRepository.getMyDeliveryOrders();

      if (getMyDeliveryOrderResponse.value == null) {
        return null;
      }

      deliveryOrderModel.value =
          DeliveryOrderModel.fromJson(getMyDeliveryOrderResponse.value!.body);
    } catch (e) {
      Get.snackbar(
        'Get delivery Order '.tr,
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

  acceptOrder(String saleId) async {
    try {
      httpRepository.acceptDeliveryOrder(
        saleId: saleId,
      );
    } catch (e) {
      Get.snackbar(
        'Accept Delivery Order'.tr,
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

  rejectOrder(String orderId) async {
    try {
      httpRepository.rejectOrder(
        orderId: orderId,
        lang: cacheUtils.getLanguage()!,
      );
    } catch (e) {
      Get.snackbar(
        'Reject Order'.tr,
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
    await getMyDeliveryOrders();
    super.onInit();
  }
}
