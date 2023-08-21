import 'package:albausalah_app/api/repository/http_repository.dart';
import 'package:albausalah_app/api/repository/http_repository_impl.dart';
import 'package:albausalah_app/shared/components/constants/style/color.dart';
import 'package:albausalah_app/view/account/pages/store_requests/model/show_my_location_inquireies_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../../shared/helper/cache_utils.dart';

class StoreRequestController {
  static Future<ShowMyLocationInquireiesModel?>
      showMyLocationInquireies() async {
    HttpRepository httpRepository = HttpRepositoryImpl();
    CacheUtils cacheUtils = CacheUtils(GetStorage());

    late Rx<Response?> showMyLocationInquireiesResponse = Rx<Response?>(null);
    ShowMyLocationInquireiesModel? showMyLocationInquireiesModel =
        ShowMyLocationInquireiesModel();

    try {
      showMyLocationInquireiesResponse.value =
          await httpRepository.showMyLocationInquireies(
        lang: cacheUtils.getLanguage()!,
      );

      if (showMyLocationInquireiesResponse.value == null) {
        return null;
      }
      showMyLocationInquireiesModel = ShowMyLocationInquireiesModel.fromJson(
          showMyLocationInquireiesResponse.value!.body);

      return showMyLocationInquireiesModel;
    } catch (e) {
      Get.snackbar(
        'Show My Location Inquiries '.tr,
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
}
