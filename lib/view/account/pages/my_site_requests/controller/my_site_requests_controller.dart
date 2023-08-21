import 'package:albausalah_app/api/repository/http_repository.dart';
import 'package:albausalah_app/api/repository/http_repository_impl.dart';
import 'package:albausalah_app/shared/components/constants/style/color.dart';
import 'package:albausalah_app/shared/helper/cache_utils.dart';
import 'package:albausalah_app/view/account/pages/my_site_requests/model/show_location_requests_model.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MySiteRequestsController {
  static RxString address = RxString('');

  static RxDouble lat = RxDouble(0.0);
  static RxDouble long = RxDouble(0.0);

  static Future<ShowLocationRequestsModel?> showLocationRequests() async {
    HttpRepository httpRepository = HttpRepositoryImpl();
    CacheUtils cacheUtils = CacheUtils(GetStorage());


    late Rx<Response?> showMyLocationInquireiesResponse = Rx<Response?>(null);
    ShowLocationRequestsModel? showLocationRequestsModel =
        ShowLocationRequestsModel();

    try {
      showMyLocationInquireiesResponse.value =
          await httpRepository.showLocationRequests(
        lang: cacheUtils.getLanguage()!,
      );

      if (showMyLocationInquireiesResponse.value == null) {
        return null;
      }
      showLocationRequestsModel = ShowLocationRequestsModel.fromJson(
          showMyLocationInquireiesResponse.value!.body);

      return showLocationRequestsModel;
    } catch (e) {
      Get.snackbar(
        'Show My Location Inquiries'.tr,
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

  static Future<void> getAddressFromLatLng({
    required double latitude,
    required double longitude,
  }) async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    lat.value = latitude;
    long.value = longitude;
    try {
      List<Placemark> placeMarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placeMarks.isNotEmpty) {
        Placemark placeMark = placeMarks[0];
        address.value =
            '${placeMark.street}, ${placeMark.subLocality}, ${placeMark.locality}, ${placeMark.administrativeArea}, ${placeMark.country}';
      }
    } catch (e) {
      throw Exception('Place-Mark $e');
    }
  }

  static Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar('Location'.tr,
          'Location services are disabled. Please enable the services'.tr);
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar('Location'.tr, 'Location permissions are denied'.tr);
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Get.snackbar(
          'Location'.tr,
          'Location permissions are permanently denied, we cannot request permissions.'
              .tr);
      return false;
    }
    return true;
  }

  static acceptLocationInquiry({
    required String locationInquiryId,
    required String longitude,
    required String latitude,
  }) async {
    try {
      HttpRepository httpRepository = HttpRepositoryImpl();
      CacheUtils cacheUtils = CacheUtils(GetStorage());

      httpRepository.acceptLocatioInquiry(
        lang: cacheUtils.getLanguage()!,
        latitude: latitude,
        longitude: longitude,
        locationInquiryId: locationInquiryId,
      );
    } catch (e) {
      Get.snackbar(
        'Accept Location Inquiry'.tr,
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

  static rejectLocationInquiry({
    required String locationInquiryId,
  }) async {
    try {
      HttpRepository httpRepository = HttpRepositoryImpl();
      CacheUtils cacheUtils = CacheUtils(GetStorage());

      httpRepository.rejectLocatioInquiry(
        lang: cacheUtils.getLanguage()!,
        locationInquiryId: locationInquiryId,
      );
    } catch (e) {
      Get.snackbar(
        'Reject Location Inquiry'.tr,
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
}
