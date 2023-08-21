import 'dart:io';

import 'package:albausalah_app/shared/components/widgets/lib/chatview.dart';
import 'package:albausalah_app/view/account/pages/edit_information_for_customer/model/my_information_model.dart';
import 'package:albausalah_app/view/home/pages/cart/model/cart_model.dart';
import 'package:albausalah_app/view/home/pages/cart/model/notifications_count_model.dart';
import 'package:albausalah_app/view/home/pages/notification/model/notification_model.dart';
import 'package:albausalah_app/view/stores/model/stores_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../api/repository/http_repository.dart';
import '../../../api/repository/http_repository_impl.dart';
import '../../../view/account/pages/edit_information_for_customer/model/cities_model.dart';
import '../../../view/base/base_widget.dart';
import '../../helper/cache_utils.dart';
import '../constants/constant_data/constant_data.dart';
import '../constants/style/color.dart';

class ConstantActions {
  static final HttpRepository _httpRepository = HttpRepositoryImpl();
  static final CacheUtils _cacheUtils = CacheUtils(GetStorage());
  static final locale = Get.locale;

  static removeFromCart(int itemId) async {
    try {
      _httpRepository.removeFromCart(
        itemId: itemId.toString(),
        lang: _cacheUtils.getLanguage()!,
      );
      Future.delayed(const Duration(milliseconds: 1000), () async {
        getNumberItemCart();
      });
    } catch (e) {
      Get.snackbar(
        'Remove From Cart'.tr,
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

  static destroyStatus({
    required String statusId,
  }) async {
    try {
      _httpRepository.destroyStatus(
        statusId: statusId,
        lang: _cacheUtils.getLanguage()!,
      );
    } catch (e) {
      Get.snackbar(
        'Destroy Status'.tr,
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

  static guestRemoveFromCart({
    required int itemId,
    required String deviceId,
  }) async {
    try {
      _httpRepository.guestRemoveFromCart(
        deviceId: deviceId,
        itemId: itemId.toString(),
        lang: _cacheUtils.getLanguage() ?? 'en',
      );
    } catch (e) {
      Get.snackbar(
        'Remove From Cart'.tr,
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

  static addToCart({
    required String productId,
    required String colorId,
    required String sizeId,
    required String quantity,
  }) async {
    try {
      _httpRepository.addToCart(
        lang: _cacheUtils.getLanguage()!,
        productId: productId,
        colorId: colorId,
        sizeId: sizeId,
        quantity: quantity,
      );
      Future.delayed(const Duration(milliseconds: 1000), () async {
        getNumberItemCart();
      });
    } catch (e) {
      Get.snackbar(
        'Add To Cart'.tr,
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

  static guestAddToCart({
    required String productId,
    required String colorId,
    required String sizeId,
    required String quantity,
    required String deviceId,
    required String storeId,
  }) async {
    try {
      _httpRepository.guestAddToCart(
        lang: _cacheUtils.getLanguage() ?? 'en',
        productId: productId,
        colorId: colorId,
        sizeId: sizeId,
        quantity: quantity,
        deviceId: deviceId,
        storeId: storeId,
      );
    } catch (e) {
      Get.snackbar(
        'Add To Cart'.tr,
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

  static checkout() async {
    try {
      _httpRepository.checkout(
        lang: _cacheUtils.getLanguage()!,
      );
      Future.delayed(const Duration(milliseconds: 1000), () async {
        getNumberItemCart();
        // getNotificationsCount();
      });
    } catch (e) {
      Get.snackbar(
        'Checkout'.tr,
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

  static followStores(String storeId) async {
    try {
      _httpRepository.followStores(
        storeId: storeId,
        lang: _cacheUtils.getLanguage()!,
      );
    } catch (e) {
      Get.snackbar(
        'Follow Stores'.tr,
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

  static addRemoveStoreWishlist(String storeId) async {
    try {
      _httpRepository.addRemoveStoreWishlist(
        storeId: storeId,
        lang: _cacheUtils.getLanguage()!,
      );
    } catch (e) {
      Get.snackbar(
        'Wishlist'.tr,
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

  static addRemoveProductWishlist(String productId) async {
    try {
      _httpRepository.addRemoveProductWishlist(
        productId: productId,
        lang: _cacheUtils.getLanguage()!,
      );
    } catch (e) {
      Get.snackbar(
        'Product Wishlist'.tr,
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

  static createNewMessage({
    required String receiverId,
    required String? message,
    required List<File> files,
  }) async {
    try {
      _httpRepository.createNewMessage(
        lang: _cacheUtils.getLanguage()!,
        receiverId: receiverId,
        message: message,
        files: files,
      );
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

  static Future<int> getNumberNotifications() async {
    late Rx<Response?> notificationResponse = Rx<Response?>(null);
    NotificationModel? notificationModel = NotificationModel();

    try {
      notificationResponse.value = await _httpRepository.getMyNotifications(
        lang: _cacheUtils.getLanguage()!,
      );

      if (notificationResponse.value == null) {
        return 0;
      }
      notificationModel =
          NotificationModel.fromJson(notificationResponse.value!.body);
      return notificationModel.notifications!.length;
    } catch (e) {
      Get.snackbar(
        'Get notifications'.tr,
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
        duration: const Duration(seconds: 4),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        forwardAnimationCurve: Curves.easeOutBack,
      );
      e.printError();
    }
    return 0;
  }

  static Future<NotificationModel?> getNotifications() async {
    late Rx<Response?> notificationResponse = Rx<Response?>(null);
    NotificationModel? notificationModel = NotificationModel();

    try {
      notificationResponse.value = await _httpRepository.getMyNotifications(
        lang: _cacheUtils.getLanguage()!,
      );

      if (notificationResponse.value == null) {
        return null;
      }
      notificationModel =
          NotificationModel.fromJson(notificationResponse.value!.body);

      return notificationModel;
    } catch (e) {
      Get.snackbar(
        'Get notifications'.tr,
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
        duration: const Duration(seconds: 4),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        forwardAnimationCurve: Curves.easeOutBack,
      );
      e.printError();
    }
    return null;
  }

  static Future<int?> getNotificationsCount() async {
    NotificationsCountModel notificationsCountModel = NotificationsCountModel();
    try {
      Response? cartResponse = await _httpRepository.getNotificationsCount();
      if (cartResponse == null) {
        return 0;
      }
      notificationsCountModel =
          NotificationsCountModel.fromJson(cartResponse.body);

      return notificationsCountModel.notificationsCounter;
    } catch (e) {
      Get.snackbar(
        'Get Notifications Count'.tr,
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
    return 0;
  }

  static void readNotifications({required String notificationId}) async {
    try {
      _httpRepository.readNotifications(
        notificationId: notificationId,
      );

      Future.delayed(const Duration(milliseconds: 1000), () async {
        getNumberItemCart();
      });
    } catch (e) {
      Get.snackbar(
        'Read Notifications'.tr,
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
    return;
  }

  static void getNumberItemCart() async {
    CartModel cartModel = CartModel();
    try {
      Response? cartResponse = await _httpRepository.getCart(
        lang: _cacheUtils.getLanguage()!,
      );
      if (cartResponse == null) {
        return;
      }
      cartModel = CartModel.fromJson(cartResponse.body);

      int? numberNotifications = await getNotificationsCount();

      BaseWidgetState.numberItems.value = [
        cartModel.yourCart!.customerCart!.length,
        numberNotifications ?? 0,
      ];
    } catch (e) {
      Get.snackbar(
        'Number cart'.tr,
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
    return;
  }

  static Future<CartModel?> getCart() async {
    Rx<Response?> cartResponse = Rx<Response?>(null);
    CartModel cartModel = CartModel();
    try {
      cartResponse.value = await _httpRepository.getCart(
        lang: _cacheUtils.getLanguage()!,
      );
      if (cartResponse.value == null) {
        return null;
      }

      cartModel = CartModel.fromJson(cartResponse.value!.body);

      userInfo = ChatUser(
        name: _cacheUtils.getName() ?? '',
        id: _cacheUtils.getUID().toString(),
        profilePhoto: _cacheUtils.getPhoto() ?? '',
      );
      return cartModel;
    } catch (e) {
      Get.snackbar(
        'Get cart'.tr,
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

  static Future<MyInformationModel?> getMyProfile() async {
    late Rx<Response?> myInformationResponse = Rx<Response?>(null);
    MyInformationModel myInformationModel = MyInformationModel();
    try {
      myInformationResponse.value = await _httpRepository.getMyProfile(
        lang: _cacheUtils.getLanguage()!,
      );

      if (myInformationResponse.value == null) {
        return null;
      }

      myInformationModel =
          MyInformationModel.fromJson(myInformationResponse.value!.body);
      return myInformationModel;
    } catch (e) {
      Get.snackbar(
        'Get My Profile'.tr,
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
    return null;
  }

  static Future<CitiesModel?> getCities() async {
    late Rx<Response?> citiesResponse = Rx<Response?>(null);
    CitiesModel citiesModel = CitiesModel();

    try {
      citiesResponse.value = await _httpRepository.getCities(
        lang: _cacheUtils.getLanguage() ?? 'en',
      );

      if (citiesResponse.value == null) {
        return null;
      }
      citiesModel = CitiesModel.fromJson(citiesResponse.value!.body);
      return citiesModel;
    } catch (e) {
      Get.snackbar(
        'Get Cities'.tr,
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
    return null;
  }

  static Future<StoresModel?> getCityStores({
    required String storeCityId,
  }) async {
    late Rx<Response?> citiesResponse = Rx<Response?>(null);
    StoresModel storesModel = StoresModel();

    try {
      citiesResponse.value = await _httpRepository.getCityStores(
        lang: _cacheUtils.getLanguage()!,
        storeCityId: storeCityId,
      );

      if (citiesResponse.value == null) {
        return null;
      }
      storesModel = StoresModel.fromJson(citiesResponse.value!.body);
      return storesModel;
    } catch (e) {
      Get.snackbar(
        'Get Stores'.tr,
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
    return null;
  }
}
