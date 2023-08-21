import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../api/repository/http_repository.dart';
import '../../../../../shared/components/constants/style/color.dart';
import '../../../../../shared/helper/cache_utils.dart';
import '../../delivery _staff/model/delivery_staff_model.dart';
import '../model/client_order_model.dart';

class ClientOrderController extends GetxController {
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;
  ClientOrderController(
      {required this.httpRepository, required this.cacheUtils});

  Rx<ClientOrderModel?> clientOrderModel = Rx<ClientOrderModel?>(null);
  Rx<DeliveryStaffModel?> deliveryStaffModel = Rx<DeliveryStaffModel?>(null);

  final formKey = GlobalKey<FormState>();

  Rx<int> value = Rx<int>(0);

  getClientOrders() async {
    late Rx<Response?> clientOrdersResponse = Rx<Response?>(null);

    try {
      clientOrdersResponse.value = await httpRepository.getClientOrders(
        lang: cacheUtils.getLanguage()!,
      );

      if (clientOrdersResponse.value == null) {
        return null;
      }

      clientOrderModel.value =
          ClientOrderModel.fromJson(clientOrdersResponse.value!.body);
    } catch (e) {
      Get.snackbar(
        'Get Client Orders'.tr,
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

  getDeliveryStaff() async {
    late Rx<Response?> deliveryStaffResponse = Rx<Response?>(null);
    try {
      deliveryStaffResponse.value =
          await httpRepository.getMyDeliveryEmployees();

      if (deliveryStaffResponse.value == null) {
        return null;
      }
      deliveryStaffModel.value =
          DeliveryStaffModel.fromJson(deliveryStaffResponse.value!.body);
    } catch (e) {
      Get.snackbar(
        'Get Delivery Staff'.tr,
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

  acceptOrder({
    required String orderId,
    required String deliveryUserId,
  }) async {
    try {
      httpRepository.acceptOrder(
        orderId: orderId,
        lang: cacheUtils.getLanguage()!,
        deliveryUserId: deliveryUserId,
      );
    } catch (e) {
      Get.snackbar(
        'Accept Order'.tr,
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

  assignDelivery({
    required String deliveryUserId,
    required String saleId,
  }) async {
    try {
      httpRepository.assignDeliveryEmployee(
        saleId: saleId,
        deliveryUserId: deliveryUserId,
      );
      value.value = 0;
    } catch (e) {
      Get.snackbar(
        'Assign Delivery'.tr,
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
        'error',
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
    await getClientOrders();
    await getDeliveryStaff();
    super.onInit();
  }
}
