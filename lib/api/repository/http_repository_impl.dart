import 'dart:io';

import 'package:albausalah_app/shared/components/components/custom_snackbar/custom_snackbarr.dart';
import 'package:albausalah_app/shared/helper/cache_utils.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../api_url/api_url.dart';
import 'http_repository.dart';

class HttpRepositoryImpl extends GetConnect implements HttpRepository {
  @override
  void onInit() {
    httpClient.timeout = const Duration(minutes: 1);
    super.onInit();
  }

  Map<String, String> get headers {
    CacheUtils cacheUtils = CacheUtils(GetStorage());
    return {"Authorization": "Bearer ${cacheUtils.getToken()}"};
  }

  @override
  Future<Response?> login({
    required String email,
    required String password,
    required String lang,
    required String providerStatus,
    required String playerId,
  }) async {
    final formData = FormData(
      {
        "email": email,
        "password": password,
        "lang": lang,
        "provider_status": providerStatus,
        "player_id": playerId,
      },
    );

    var response = await post(UrlAPI.loginUrl, formData);
    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(snackBarTitle: 'Login');
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
          snackBarTitle: 'Login', bodySnackBar: response.body['message']);
    }
    return null;
  }

  @override
  Future<Response?> register({
    required String userType,
    required String providerStatus,
    required String name,
    required String userName,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String phone,
    required String lang,
    required String countryCode,
    required String addressEn,
    required String addressAr,
    required String playerId,
    File? profilePhotoUrl,
    String? longitude,
    String? latitude,
    String? storeName,
    String? storeDescription,
    String? services,
    String? storeType,
    String? deliveryType,
    String? storeRegion,
    String? storeStreet,
    String? buildingNumber,
    String? buildingName,
    String? city,
    String? showInHome,
    String? postalCode,
    String? mailbox,
  }) async {
    final MultipartFile? multiPartFile;
    profilePhotoUrl == null || profilePhotoUrl.path.isEmpty
        ? multiPartFile = null
        : multiPartFile = MultipartFile(await profilePhotoUrl.readAsBytes(),
            filename: profilePhotoUrl.path.split('/').last);

    final formData = FormData(
      {
        "profile_photo_url": multiPartFile,
        "lang": lang,
        "user_type": userType,
        "provider_status": providerStatus,
        "name": name,
        "user_name": userName,
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation,
        "phone": phone,
        "country_code": countryCode,
        "address_en": addressEn,
        "address_ar": addressAr,
        "latitude": latitude,
        "longitude": longitude,
        "store_type": storeType,
        "store_name_en": storeName,
        "store_name_ar": storeName,
        "store_description_en": storeDescription,
        "store_description_ar": storeDescription,
        "store_service_ar": services,
        "store_service_en": services,
        "store_city": city,
        "store_region": storeRegion,
        "store_street": storeStreet,
        "building_name": buildingName,
        "building_number": buildingNumber,
        "mailbox": mailbox,
        "postal_code": postalCode,
        "free_delivery_status": deliveryType,
        "show_in_home_page": showInHome,
        "player_id": playerId,
      },
    );
    var response = await post(UrlAPI.registerUrl, formData);

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(snackBarTitle: 'Register');
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Register',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<Response?> getSlider({
    required String lang,
  }) async {
    var response = await get(
      UrlAPI.getSliderUrl,
      query: {
        "lang": lang,
      },
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(snackBarTitle: 'Get Slider');
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
          snackBarTitle: 'Get Slider', bodySnackBar: response.body['message']);
    }
    return null;
  }

  @override
  Future<Response?> getCategory({
    required String lang,
  }) async {
    var response = await get(
      UrlAPI.getCategoryUrl,
      query: {
        "lang": lang,
      },
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(snackBarTitle: 'Get Category'.tr);
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get Category'.tr,
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<Response?> getStores({
    required String lang,
    String? search,
  }) async {
    final formData = FormData(
      {
        "lang": lang,
        "search": search,
      },
    );
    var response = await post(
      UrlAPI.getStoresUrl,
      formData,
      headers: headers,
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(snackBarTitle: 'Get Stores');
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
          snackBarTitle: 'Get Stores', bodySnackBar: response.body['msg']);
    }
    return null;
  }

  @override
  Future<Response?> getShowStoresInHome({required String lang}) async {
    final formData = FormData(
      {
        "lang": lang,
      },
    );

    var response = await post(
      UrlAPI.getShowStoresInHomeUrl,
      formData,
      headers: headers,
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get Stores',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get Stores',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<Response?> getShowCategoryInHome({required String lang}) async {
    var response = await get(
      UrlAPI.getShowCategoryInHome,
      query: {
        "lang": lang,
      },
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get Category',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get Category',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<void> subscribeNewsletter({
    required String lang,
    required String email,
  }) async {
    final formData = FormData(
      {
        "lang": lang,
        "email": email,
      },
    );

    var response = await post(
      UrlAPI.subscribeNewsletterUrl,
      formData,
    );

    if (response.isOk) {
      CustomSnackBar.whenHaveSuccessFromBackEnd(
        snackBarTitle: 'Subscribe News Letter',
        bodySnackBar: response.body['msg'],
        icon: const Icon(Icons.check_circle_outline),
      );
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Subscribe News Letter',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Subscribe News Letter',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<Response?> getMainCategories({required String lang}) async {
    var response = await get(
      UrlAPI.getMainCategoriesUrl,
      query: {
        "lang": lang,
      },
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(snackBarTitle: 'Get Main Category');
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get Main Category',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<Response?> getSubCategories({
    required String categoryId,
    required String lang,
  }) async {
    final formData = FormData(
      {
        "category_id": categoryId,
        "lang": lang,
      },
    );

    var response = await post(
      UrlAPI.getSubCategoriesUrl,
      formData,
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get Main Category',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get Main Category',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<Response?> getCategoryStores({
    required String lang,
    required String categoryId,
  }) async {
    final formData = FormData(
      {
        "category_id": categoryId,
        "lang": lang,
      },
    );

    var response = await post(
      UrlAPI.getCategoryStoresUrl,
      formData,
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get Category',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get Category',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<Response?> getHowToRegister({
    required String lang,
  }) async {
    var response = await get(
      UrlAPI.getHowToRegisterUrl,
      query: {
        "lang": lang,
      },
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'How To Register',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'How To Register',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<Response?> getCart({
    required String lang,
  }) async {
    final formData = FormData({
      "lang": lang,
    });

    var response = await post(
      UrlAPI.getCartUrl,
      formData,
      headers: headers,
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get Cart',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get Cart',
        bodySnackBar: response.body['message'],
      );
    }
    return null;
  }

  @override
  Future<void> removeFromCart({
    required String lang,
    required String itemId,
  }) async {
    final formData = FormData(
      {
        "lang": lang,
        "cart_temp_id": itemId,
      },
    );

    var response = await post(
      UrlAPI.removeFromCartUrl,
      formData,
      headers: headers,
    );

    if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Remove From Cart',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Remove From Cart',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<Response?> getMyNotifications({
    required String lang,
  }) async {
    final formData = FormData(
      {
        "lang": lang,
      },
    );

    var response = await post(
      UrlAPI.getMyNotificationsUrl,
      formData,
      headers: headers,
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get Notifications',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get Notifications',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<void> checkout({
    required String lang,
  }) async {
    final formData = FormData(
      {
        "lang": lang,
      },
    );

    var response = await post(
      UrlAPI.checkoutUrl,
      formData,
      headers: headers,
    );

    if (response.isOk) {
      CustomSnackBar.whenHaveSuccessFromBackEnd(
        snackBarTitle: 'Checkout',
        bodySnackBar: response.body['msg'],
        icon: const Icon(
          Icons.check_circle_outline,
          color: Colors.white,
        ),
      );
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Checkout',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Checkout',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<void> addRemoveStoreWishlist({
    required String lang,
    required String storeId,
  }) async {
    final formData = FormData(
      {
        "lang": lang,
        "store_id": storeId,
      },
    );

    var response = await post(
      UrlAPI.addRemoveStoreWishlistUrl,
      formData,
      headers: headers,
    );

    if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Store Wishlist',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Store Wishlist',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<Response?> getNewStores({
    required String lang,
    String? search,
  }) async {
    final formData = FormData(
      {
        "lang": lang,
        "search": search,
      },
    );
    var response = await post(
      UrlAPI.getNewStoresUrl,
      formData,
      headers: headers,
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get New Stores',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get New Stores',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<Response?> getMostSelling({
    required String lang,
    String? search,
  }) async {
    final formData = FormData(
      {
        "lang": lang,
        "search": search,
      },
    );
    var response = await post(
      UrlAPI.getMostSellingUrl,
      formData,
      headers: headers,
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get Most Selling',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get Most Selling',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<Response?> getSummerOffers({
    required String lang,
    String? search,
  }) async {
    final formData = FormData(
      {
        "lang": lang,
        "search": search,
      },
    );
    var response = await post(
      UrlAPI.getSummerOffersUrl,
      formData,
      headers: headers,
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get Summer Offers',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get Summer Offers',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<Response?> getFreeDeliveryStores({
    required String lang,
    String? search,
  }) async {
    final formData = FormData(
      {
        "lang": lang,
        "search": search,
      },
    );
    var response = await post(
      UrlAPI.getFreeDeliveryStoresUrl,
      formData,
      headers: headers,
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get Free Delivery Stores',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get Free Delivery Stores',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<Response?> getContactUs({
    required String lang,
  }) async {
    var response = await get(
      UrlAPI.getContactUsUrl,
      query: {
        "lang": lang,
      },
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get Contact Us',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get Contact Us',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<Response?> showProducts({
    required String lang,
    required String storeId,
    required String min, //  "1"
    required String max, // "100"
    required String radio, // "option1"
    List<String>? categoryIds,
    String? search,
    String? check1,
    String? check2,
  }) async {
    final formData = FormData(
      {
        "lang": lang,
        "search": search,
        "store_id": storeId,
        "radio": radio,
        "min": min,
        "max": max,
        "check1": check1,
        "check2": check2,
      },
    );

    if (categoryIds != null || categoryIds!.isNotEmpty) {
      formData.fields.addAll(
          categoryIds.map((e) => MapEntry('category_ids[]', e.toString())));
    }
    var response = await post(
      UrlAPI.showProductsUrl,
      formData,
      headers: headers,
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Show Products',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Show Products',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<void> addRemoveProductWishlist({
    required String lang,
    required String productId,
  }) async {
    final formData = FormData(
      {
        "lang": lang,
        "product_id": productId,
      },
    );

    var response = await post(
      UrlAPI.addRemoveProductWishlistUrl,
      formData,
      headers: headers,
    );

    if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Product Wishlist',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Product Wishlist',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<Response?> singleProductDetails({
    required String lang,
    required String productId,
  }) async {
    final formData = FormData({
      "lang": lang,
      "product_id": productId,
    });

    var response = await post(
      UrlAPI.singleProductDetailsUrl,
      formData,
      headers: headers,
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Product Details',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Product Details',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<Response?> guestSingleProductDetails({
    required String lang,
    required String productId,
  }) async {
    final formData = FormData(
      {
        "lang": lang,
        "product_id": productId,
      },
    );
    var response = await post(
      UrlAPI.singleProductDetailsUrl,
      formData,
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Product Details',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Product Details',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<Response?> getProductColors({
    required String lang,
    required String productId,
  }) async {
    var response = await get(
      UrlAPI.getProductColorsUrl,
      query: {
        "lang": lang,
        "product_id": productId,
      },
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Product Colors',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Product Colors',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<Response?> getProductSizes({
    required String lang,
    required String productId,
  }) async {
    var response = await get(
      UrlAPI.getProductSizesUrl,
      query: {
        "lang": lang,
        "product_id": productId,
      },
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Product Sizes',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Product Sizes',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<void> addToCart({
    required String lang,
    required String productId,
    required String colorId,
    required String sizeId,
    required String quantity,
  }) async {
    final formData = FormData(
      {
        "lang": lang,
        "product_id": productId,
        "color_id": colorId,
        "size_id": sizeId,
        "quantity": quantity,
      },
    );

    var response = await post(
      UrlAPI.addToCartUrl,
      formData,
      headers: headers,
    );

    if (response.isOk) {
      CustomSnackBar.whenHaveSuccessFromBackEnd(
        snackBarTitle: 'Add To Cart',
        bodySnackBar: response.body['msg'],
        icon: const Icon(
          Icons.shopping_cart_outlined,
          color: Colors.white,
        ),
      );
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Add To Cart',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Add To Cart',
        bodySnackBar: response.body['message'],
      );
    }
    return;
  }

  @override
  Future<void> updateCartQuantity({
    required String lang,
    required List<Map> data,
  }) async {
    var response = await post(
      UrlAPI.updateCartQuantityUrl,
      {
        'lang': lang,
        'data': data,
      },
      headers: headers,
    );

    if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Update Cart',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Update Cart',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<Response?> getStoreReviews(
      {required String lang, required String storeId}) async {
    var response = await get(
      UrlAPI.getStoreReviewsUrl,
      query: {
        "lang": lang,
        "store_id": storeId,
      },
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get Store Reviews',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get Store Reviews',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<void> addStoreReview({
    required String lang,
    required String storeId,
    required String reviewValue,
    String? reviewNote,
  }) async {
    final formData = FormData(
      {
        "lang": lang,
        "store_id": storeId,
        "review_note": reviewNote,
        "review_value": reviewValue,
      },
    );
    var response = await post(
      UrlAPI.addStoreReviewUrl,
      formData,
      headers: headers,
    );
    if (response.isOk) {
      CustomSnackBar.whenHaveSuccessFromBackEnd(
        snackBarTitle: 'Add Store Review',
        bodySnackBar: response.body['msg'],
        icon: const Icon(Icons.reviews_outlined),
      );
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Add Store Review',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Add Store Review',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<Response?> getFavoriteProduct({required String lang}) async {
    final formData = FormData(
      {
        "lang": lang,
      },
    );
    var response = await post(
      UrlAPI.getProductsWishlistUrl,
      formData,
      headers: headers,
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get Wishlist',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get Wishlist',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<Response?> getMyProducts({
    required String lang,
  }) async {
    final formData = FormData(
      {
        "lang": lang,
      },
    );

    var response = await post(
      UrlAPI.getMyProducts,
      formData,
      headers: headers,
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get Products',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get Products',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<void> activeInactiveMyProduct({
    required String lang,
    required String productId,
  }) async {
    final formData = FormData(
      {
        "lang": lang,
        "product_id": productId,
      },
    );
    var response = await post(
      UrlAPI.activeInactiveMyProduct,
      formData,
      headers: headers,
    );
    if (response.isOk) {
      CustomSnackBar.whenHaveSuccessFromBackEnd(
        snackBarTitle: 'In/Active My Product',
        bodySnackBar: response.body['msg'],
        icon: const Icon(Icons.done),
      );
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'In/Active My Product',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'In/Active My Product',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<Response?> getMyServices({required String lang}) async {
    final formData = FormData(
      {
        "lang": lang,
      },
    );

    var response = await post(
      UrlAPI.getMyServicesUrl,
      formData,
      headers: headers,
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get My Services',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get My Services',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<void> activeInactiveMyService(
      {required String lang, required String serviceId}) async {
    final formData = FormData(
      {
        "lang": lang,
        "service_id": serviceId,
      },
    );
    var response = await post(
      UrlAPI.activeInactiveMyServiceUrl,
      formData,
      headers: headers,
    );
    if (response.isOk) {
      CustomSnackBar.whenHaveSuccessFromBackEnd(
        snackBarTitle: 'In/Active My Service',
        bodySnackBar: response.body['msg'],
        icon: const Icon(Icons.done),
      );
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'In/Active My Service',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'In/Active My Service',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<void> destroyMyService({
    required String lang,
    required String serviceId,
  }) async {
    final formData = FormData({
      "lang": lang,
      "service_id": serviceId,
    });
    var response = await post(
      UrlAPI.destroyMyServiceUrl,
      formData,
      headers: headers,
    );
    if (response.isOk) {
      CustomSnackBar.whenHaveSuccessFromBackEnd(
        snackBarTitle: 'Destroy My Service',
        bodySnackBar: response.body['msg'],
        icon: const Icon(Icons.done),
      );
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Destroy My Service',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Destroy My Service',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<void> logout({
    required String lang,
  }) async {
    final formData = FormData(
      {
        "lang": lang,
      },
    );
    await post(
      UrlAPI.logoutUrl,
      formData,
      headers: headers,
    );

    return;
  }

  @override
  Future<Response?> getFavoriteStore({
    required String lang,
  }) async {
    final formData = FormData(
      {
        "lang": lang,
      },
    );

    var response = await post(
      UrlAPI.getStoresWishlistUrl,
      formData,
      headers: headers,
    );
    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get Favorite Store',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get Favorite Store',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<Response?> getMyProfile({
    required String lang,
  }) async {
    final formData = FormData({
      "lang": lang,
    });

    var response = await post(
      UrlAPI.getMyProfileUrl,
      formData,
      headers: headers,
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get My Profile',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get My Profile',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<Response?> getMyOrders({required String lang}) async {
    final formData = FormData(
      {
        "lang": lang,
      },
    );

    var response = await post(
      UrlAPI.getMyOrdersUrl,
      formData,
      headers: headers,
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get My Orders',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get My Orders',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<void> followStores({
    required String lang,
    required String storeId,
  }) async {
    final formData = FormData(
      {
        "store_id": storeId,
        "lang": lang,
      },
    );

    var response = await post(
      UrlAPI.followStoresUrl,
      formData,
      headers: headers,
    );

    if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Follow Store',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Follow Store',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<Response?> followingStores({
    required String lang,
  }) async {
    final formData = FormData(
      {
        "lang": lang,
      },
    );

    var response = await post(
      UrlAPI.followingStoresUrl,
      formData,
      headers: headers,
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get Following Stores',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get Following Stores',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<Response?> getMyFollowers({required String lang}) async {
    final formData = FormData({
      "lang": lang,
    });

    var response = await post(
      UrlAPI.getMyFollowersUrl,
      formData,
      headers: headers,
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get My Followers',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get My Followers',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<void> contactUsRequest({
    required String lang,
    required String name,
    required String email,
    required String phone,
    required String message,
    required String subject,
  }) async {
    final formData = FormData(
      {
        "lang": lang,
        "name": name,
        "email": email,
        "phone": phone,
        "message": message,
        "subject": subject,
      },
    );
    var response = await post(
      UrlAPI.contactUsRequestUrl,
      formData,
      headers: headers,
    );
    if (response.isOk) {
      CustomSnackBar.whenHaveSuccessFromBackEnd(
        snackBarTitle: 'Contact Us',
        bodySnackBar: response.body['msg'],
        icon: const Icon(Icons.done),
      );
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Contact Us',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Contact Us',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<void> acceptOrder({
    required String lang,
    required String orderId,
    required String deliveryUserId,
  }) async {
    final formData = FormData(
      {
        "lang": lang,
        "order_id": orderId,
        "delivery_user_id": deliveryUserId,
      },
    );
    var response = await post(
      UrlAPI.acceptOrderUrl,
      formData,
      headers: headers,
    );
    if (response.isOk) {
      CustomSnackBar.whenHaveSuccessFromBackEnd(
        snackBarTitle: 'Accept Order',
        bodySnackBar: response.body['msg'],
        icon: const Icon(Icons.done),
      );
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Accept Order',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Accept Order',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<void> rejectOrder({
    required String lang,
    required String orderId,
  }) async {
    final formData = FormData(
      {
        "lang": lang,
        "order_id": orderId,
      },
    );
    var response = await post(
      UrlAPI.rejectOrderUrl,
      formData,
      headers: headers,
    );
    if (response.isOk) {
      CustomSnackBar.whenHaveSuccessFromBackEnd(
        snackBarTitle: 'Reject Order',
        bodySnackBar: response.body['msg'],
        icon: const Icon(Icons.done),
      );
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Reject Order',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Reject Order',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<void> updateMyService({
    required String serviceId,
    required String titleEn,
    required String lang,
    required String status,
  }) async {
    final formData = FormData(
      {
        "lang": lang,
        "service_id": serviceId,
        "title_en": titleEn,
        "title_ar": titleEn,
        "status": status,
      },
    );
    var response = await post(
      UrlAPI.updateMyServiceUrl,
      formData,
      headers: headers,
    );
    if (response.isOk) {
      CustomSnackBar.whenHaveSuccessFromBackEnd(
        snackBarTitle: 'Update My Service',
        bodySnackBar: response.body['msg'],
        icon: const Icon(Icons.done),
      );
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Update My Service',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Update My Service',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<Response?> getSubCategoryStores({
    required String lang,
    required String subCategoryId,
  }) async {
    final formData = FormData(
      {
        "lang": lang,
        "sub_category_id": subCategoryId,
      },
    );

    var response = await post(
      UrlAPI.getSubCategoryStoresUrl,
      formData,
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get Stores',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get Stores',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<Response?> getClientOrders({required String lang}) async {
    final formData = FormData(
      {
        "lang": lang,
      },
    );

    var response = await post(
      UrlAPI.getClientOrdersUrl,
      formData,
      headers: headers,
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get Client Orders',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get Client Orders',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<void> updateMyProfile({
    required String name,
    required String userName,
    required String email,
    required String lang,
    required String phone,
    required String countryCode,
    required String address,
    required String password,
    required String passwordConfirmation,
    File? profilePhotoUrl,
    String? showInHomePage,
    String? freeDeliveryStatus,
    String? storeType,
    String? storeName,
    String? storeStatus,
    String? storeDescription,
    String? storeService,
    String? storeCity,
    String? storeRegion,
    String? storeStreet,
    String? buildingName,
    String? buildingNumber,
    String? mailbox,
    String? postalCode,
    String? lat,
    String? lan,
  }) async {
    final MultipartFile? multiPartFile;
    profilePhotoUrl == null || profilePhotoUrl.path.isEmpty
        ? multiPartFile = null
        : multiPartFile = MultipartFile(await profilePhotoUrl.readAsBytes(),
            filename: profilePhotoUrl.path.split('/').last);

    final formData = FormData(
      {
        "lang": lang,
        "name": name,
        "user_name": userName,
        "email": email,
        "phone": phone,
        "country_code": countryCode,
        "address_en": address,
        "address_ar": address,
        "map_url": "http://map.com",
        "profile_photo_url": multiPartFile,
        "password": password,
        "password_confirmation": passwordConfirmation,
        "show_in_home_page": showInHomePage,
        "free_delivery_status": freeDeliveryStatus,
        "store_type": storeType,
        "store_name_en": storeName,
        "store_name_ar": storeName,
        "store_status": storeStatus,
        "store_description_en": storeDescription,
        "store_description_ar": storeDescription,
        "store_service_en": storeService,
        "store_service_ar": storeService,
        "store_city": storeCity,
        "store_region": storeRegion,
        "store_street": storeStreet,
        "building_name": buildingName,
        "building_number": buildingNumber,
        "mailbox": mailbox,
        "postal_code": postalCode,
        "latitude": lat,
        "longitude": lan,
      },
    );
    var response = await post(
      UrlAPI.updateMyProfileUrl,
      formData,
      headers: headers,
    );
    if (response.isOk) {
      CustomSnackBar.whenHaveSuccessFromBackEnd(
        snackBarTitle: 'Update My Profile',
        bodySnackBar: response.body['msg'],
        icon: const Icon(Icons.done),
      );
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Update My Profile',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Update My Profile',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<Response?> getCities({
    required String lang,
  }) async {
    var response = await get(
      UrlAPI.getCitiesUrl,
      query: {
        "lang": lang,
      },
    );
    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get Cities',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get Cities',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<Response?> getLoginSlider() async {
    var response = await get(
      UrlAPI.getLoginSliderUrl,
    );
    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get Slider',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get Slider',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<Response?> getRegisterSlider() async {
    var response = await get(
      UrlAPI.getRegisterSliderUrl,
    );
    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get Slider',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get Slider',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<Response?> getWelcomeSlider() async {
    var response = await get(
      UrlAPI.getWelcomeSliderUrl,
    );
    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get Slider',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get Slider',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<Response?> getMyMessages({
    required String lang,
  }) async {
    final formData = FormData(
      {
        "lang": lang,
      },
    );

    var response = await post(
      UrlAPI.getMyMessagesUrl,
      formData,
      headers: headers,
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get My Messages',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get My Messages',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<Response?> getMessageDetails({
    required String lang,
    required String messageId,
  }) async {
    final formData = FormData({
      "lang": lang,
      "message_id": messageId,
    });

    var response = await post(
      UrlAPI.getMessageDetailsUrl,
      formData,
      headers: headers,
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get Message Details',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get Message Details',
        bodySnackBar: response.body['message'],
      );
    }
    return null;
  }

  @override
  Future<void> createNewMessage({
    required String receiverId,
    required String lang,
    required String? message,
    List<File>? files,
  }) async {
    final formData = FormData(
      {
        "lang": lang,
        "receiver_id": receiverId,
        "message_details": message,
      },
    );

    if (files != null || files!.isNotEmpty) {
      for (int i = 0; i < files.length; i++) {
        formData.files.add(MapEntry(
            "message_file[]",
            MultipartFile(await files[i].readAsBytes(),
                filename: files[i].path.split('/').last)));
      }
    }

    var response = await post(
      UrlAPI.createNewMessageUrl,
      formData,
      headers: headers,
    );

    if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Create new massage',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Create new massage',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<void> deleteChat({
    required String lang,
    required String messageId,
    required String receiverId,
    required String senderId,
  }) async {
    final formData = FormData(
      {
        "lang": lang,
        "receiver_id": receiverId,
        "message_id": messageId,
        "sender_id": senderId,
      },
    );
    var response = await post(
      UrlAPI.deleteChatUrl,
      formData,
      headers: headers,
    );
    if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Delete chat',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Delete chat',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<Response?> getStatus() async {
    var response = await get(
      UrlAPI.getStatusUrl,
      headers: headers,
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get Status',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get Status',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<Response?> getGuestStatus() async {
    var response = await get(
      UrlAPI.getStatusUrl,
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get Status',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get Status',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<Response?> guestGetCart({
    required String lang,
    required String deviceId,
  }) async {
    final formData = FormData(
      {
        "lang": lang,
        "device_id": deviceId,
      },
    );

    var response = await post(
      UrlAPI.guestGetCartUrl,
      formData,
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get Cart',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get Cart',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<Response?> guestShowProducts({
    required String lang,
    required String storeId,
    required String min,
    required String max,
    required String radio,
    String? search,
    List<String>? categoryIds,
    String? check1,
    String? check2,
  }) async {
    final formData = FormData({
      "lang": lang,
      "search": search,
      "store_id": storeId,
      "radio": "option1",
      "min": "1",
      "max": "100",
    });

    var response = await post(
      UrlAPI.showProductsUrl,
      formData,
    );
    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Show Products',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Show Products',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<void> guestAddToCart({
    required String lang,
    required String deviceId,
    required String productId,
    required String storeId,
    required String colorId,
    required String sizeId,
    required String quantity,
  }) async {
    final formData = FormData(
      {
        "lang": lang,
        "product_id": productId,
        "color_id": colorId,
        "size_id": sizeId,
        "quantity": quantity,
        "store_id": storeId,
        "device_id": deviceId,
      },
    );

    var response = await post(
      UrlAPI.guestAddToCartUrl,
      formData,
    );

    if (response.isOk) {
      CustomSnackBar.whenHaveSuccessFromBackEnd(
        snackBarTitle: 'Add To Cart',
        bodySnackBar: response.body['msg'],
        icon: const Icon(Icons.done),
      );
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Add To Cart',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Add To Cart',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<void> guestUpdateCartQuantity({
    required String lang,
    required String deviceId,
    required List<Map> data,
  }) async {
    var response = await post(
      UrlAPI.guestUpdateCartQuantityUrl,
      {
        'lang': lang,
        "device_id": deviceId,
        'data': data,
      },
      headers: headers,
    );
    if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Update Cart',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Update Cart',
        bodySnackBar: response.body['msg'],
      );
    }
  }

  @override
  Future<void> guestRemoveFromCart({
    required String lang,
    required String itemId,
    required String deviceId,
  }) async {
    final formData = FormData(
      {
        "lang": lang,
        "cart_temp_id": itemId,
        "device_id": deviceId,
      },
    );

    var response = await post(
      UrlAPI.guestDeleteFromCartUrl,
      formData,
    );

    if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Remove From Cart',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Remove From Cart',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<Response?> getOrderDetails({
    required String lang,
    required String orderId,
  }) async {
    final formData = FormData(
      {
        "lang": lang,
        "order_id": orderId,
      },
    );

    var response = await post(
      UrlAPI.getOrderDetailsUrl,
      formData,
      headers: headers,
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get Order Details',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get Order Details',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<Response?> getMyStatus() async {
    final formData = FormData(
      {
        "lang": 'en',
      },
    );
    var response = await post(
      UrlAPI.getMyStatusesUrl,
      formData,
      headers: headers,
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get Status',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get Status',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<void> destroyStatus({
    required String lang,
    required String statusId,
  }) async {
    final formData = FormData(
      {
        "lang": lang,
        "status_id": statusId,
      },
    );

    var response = await post(
      UrlAPI.destroyStatusUrl,
      formData,
      headers: headers,
    );

    if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Destroy Status',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Destroy Status',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<void> createStatus({
    required String liveStatus,
    required String lang,
    File? file,
    String? text,
    String? url,
  }) async {
    final MultipartFile? multiPartFile;
    file == null || file.path.isEmpty
        ? multiPartFile = null
        : multiPartFile = MultipartFile(await file.readAsBytes(),
            filename: file.path.split('/').last);

    final formData = FormData(
      {
        "lang": lang,
        "live_status": liveStatus,
        "file": multiPartFile,
        "post": text!,
        "url": url!,
      },
    );

    var response = await post(
      UrlAPI.createStatusUrl,
      formData,
      headers: headers,
    );

    if (response.isOk) {
      CustomSnackBar.whenHaveSuccessFromBackEnd(
        snackBarTitle: 'Create Status',
        bodySnackBar: response.body['msg'],
        icon: const Icon(Icons.done),
      );
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Create Status',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Create Status',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<void> createNewService({
    required String status,
    required String lang,
    required String title,
  }) async {
    final formData = FormData(
      {
        "lang": lang,
        "status": status,
        "title_ar": title,
        "title_en": title,
      },
    );

    var response = await post(
      UrlAPI.createNewServiceUrl,
      formData,
      headers: headers,
    );

    if (response.isOk) {
      CustomSnackBar.whenHaveSuccessFromBackEnd(
        snackBarTitle: 'Create New Service',
        bodySnackBar: response.body['msg'],
        icon: const Icon(Icons.done),
      );
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Create New Service',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Create New Service',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<void> deleteMessage({
    required String lang,
    required String operationId,
    required String receiverId,
    required String senderId,
  }) async {
    final formData = FormData(
      {
        "lang": lang,
        "operation_id": operationId,
        "receiver_id": receiverId,
        "sender_id": senderId,
      },
    );

    var response = await post(
      UrlAPI.deleteMessageUrl,
      formData,
      headers: headers,
    );

    if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Delete Message',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Delete Message',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<Response?> getAllColors() async {
    var response = await get(
      UrlAPI.getAllColorsUrl,
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get Colors',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get Colors',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<Response?> getAllSizes() async {
    var response = await get(
      UrlAPI.getAllSizesUrl,
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get Sizes',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get Sizes',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<void> addNewProduct({
    required String lang,
    required String name,
    required String categoryId,
    required String subCategoryId,
    required String sku,
    required String description,
    required String salePrice,
    required String onSalePriceStatus,
    required String onSalePrice,
    required String status,
    required String summerOffer,
    required File image,
    required List<String> colorIds,
    required List<String> sizeIds,
    List<File>? files,
  }) async {
    final multiPartFile = MultipartFile(await image.readAsBytes(),
        filename: image.path.split('/').last);

    var formData = FormData({
      "lang": lang,
      "name_en": name,
      "name_ar": name,
      "sku": sku,
      "category_id": categoryId,
      "sub_category_id": subCategoryId,
      "description_en": description,
      "description_ar": description,
      "sale_price": salePrice,
      "on_sale_price_status": onSalePriceStatus,
      "on_sale_price": onSalePrice,
      "status": status,
      "summer_offer": summerOffer,
      "image": multiPartFile,
    });

    if (files != null || files!.isNotEmpty) {
      for (int i = 0; i < files.length; i++) {
        formData.files.add(MapEntry(
            "product_other_images[]",
            MultipartFile(await files[i].readAsBytes(),
                filename: files[i].path.split('/').last)));
      }
    }

    if (colorIds.isNotEmpty) {
      formData.fields
          .addAll(colorIds.map((e) => MapEntry('color_ids[]', e.toString())));
    }
    if (sizeIds.isNotEmpty) {
      formData.fields
          .addAll(colorIds.map((e) => MapEntry('size_ids[]', e.toString())));
    }
    var response = await post(
      UrlAPI.addNewProductUrl,
      formData,
      headers: headers,
    );
    if (response.isOk) {
      CustomSnackBar.whenHaveSuccessFromBackEnd(
        snackBarTitle: 'Add New Product',
        bodySnackBar: response.body['msg'],
        icon: const Icon(Icons.done),
      );
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Add New Product',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Add New Product',
        bodySnackBar: response.body['message'],
      );
    }
    return;
  }

  @override
  Future<void> updateMyProduct({
    required String productId,
    required String lang,
    required String name,
    required String categoryId,
    required String subCategoryId,
    required String sku,
    required String description,
    required String salePrice,
    required String onSalePriceStatus,
    required String onSalePrice,
    required String status,
    required String summerOffer,
    required File image,
    required List<String> colorIds,
    required List<String> sizeIds,
  }) async {
    final multiPartFile = MultipartFile(await image.readAsBytes(),
        filename: image.path.split('/').last);

    var formData = FormData({
      "product_id": productId,
      "lang": lang,
      "name_en": name,
      "name_ar": name,
      "sku": sku,
      "category_id": categoryId,
      "sub_category_id": subCategoryId,
      "description_en": description,
      "description_ar": description,
      "sale_price": salePrice,
      "on_sale_price_status": onSalePriceStatus,
      "on_sale_price": onSalePrice,
      "status": status,
      "summer_offer": summerOffer,
      "image": multiPartFile,
    });
    if (colorIds.isNotEmpty) {
      formData.fields
          .addAll(colorIds.map((e) => MapEntry('color_ids[]', e.toString())));
    }
    if (sizeIds.isNotEmpty) {
      formData.fields
          .addAll(colorIds.map((e) => MapEntry('size_ids[]', e.toString())));
    }
    var response = await post(
      UrlAPI.updateMyProductUrl,
      formData,
      headers: headers,
    );
    if (response.isOk) {
      CustomSnackBar.whenHaveSuccessFromBackEnd(
        snackBarTitle: 'Add New Product',
        bodySnackBar: response.body['msg'],
        icon: const Icon(Icons.done),
      );
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Add New Product',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Add New Product',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<Response?> getServices({
    required String lang,
    required String storeId,
  }) async {
    var response = await get(
      UrlAPI.getServicesUrl,
      query: {
        "lang": lang,
        "store_id": storeId,
      },
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get services',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get services',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<void> softDeleteProduct({
    required String lang,
    required String productId,
  }) async {
    var formData = FormData({
      "product_id": productId,
      "lang": lang,
    });

    var response = await post(
      UrlAPI.softDeleteProductUrl,
      formData,
      headers: headers,
    );
    if (response.isOk) {
      CustomSnackBar.whenHaveSuccessFromBackEnd(
        snackBarTitle: 'Delete Product',
        bodySnackBar: response.body['msg'],
        icon: const Icon(Icons.done),
      );
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Delete Product',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Delete Product',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<Response?> showSoftDeleteProducts({required String lang}) async {
    final formData = FormData(
      {
        "lang": lang,
      },
    );

    var response = await post(
      UrlAPI.showSoftDeleteProductsUrl,
      formData,
      headers: headers,
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Show Delete Products',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Show Delete Products',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<void> restoreSoftDeleteProduct({
    required String productId,
    required String lang,
  }) async {
    var formData = FormData(
      {
        "product_id": productId,
        "lang": lang,
      },
    );

    var response = await post(
      UrlAPI.restoreSoftDeleteProductUrl,
      formData,
      headers: headers,
    );
    if (response.isOk) {
      CustomSnackBar.whenHaveSuccessFromBackEnd(
        snackBarTitle: 'Restore Delete Product',
        bodySnackBar: response.body['msg'],
        icon: const Icon(Icons.done),
      );
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Restore Delete Product',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Restore Delete Product',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<Response?> getProductReviews({
    required String lang,
    required String productId,
  }) async {
    var response = await get(
      UrlAPI.getProductReviewsUrl,
      query: {
        "lang": lang,
        "product_id": productId,
      },
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get Product Reviews',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get Product Reviews',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<void> addProductReview({
    required String lang,
    required String productId,
    required String reviewValue,
    String? reviewNote,
  }) async {
    final formData = FormData(
      {
        "lang": lang,
        "product_id": productId,
        "review_note": reviewNote,
        "review_value": reviewValue,
      },
    );
    var response = await post(
      UrlAPI.productReviewUrl,
      formData,
      headers: headers,
    );
    if (response.isOk) {
      CustomSnackBar.whenHaveSuccessFromBackEnd(
        snackBarTitle: 'Add Product Review',
        bodySnackBar: response.body['msg'],
        icon: const Icon(Icons.done),
      );
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Add Product Review',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Add Product Review',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<Response?> loginWithSocial({
    required String email,
    String? password,
    required String lang,
    required String providerStatus,
    required String provider,
    required String providerId,
  }) async {
    final formData = FormData(
      {
        "email": email,
        "password": password,
        "lang": lang,
        "provider_status": providerStatus,
        "provider": provider,
        "provider_id": providerId,
      },
    );

    var response = await post(UrlAPI.loginUrl, formData);

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Login',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Login',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<Response?> registerWithSocial(
      {required String userType,
      required String providerStatus,
      required String name,
      required String userName,
      required String email,
      required String password,
      required String passwordConfirmation,
      required String phone,
      required String lang,
      required String countryCode,
      required String addressEn,
      required String addressAr,
      required String provider,
      required String providerId,
      File? profilePhotoUrl,
      String? longitude,
      String? latitude,
      String? storeName,
      String? storeDescription,
      String? services,
      String? storeType,
      String? deliveryType,
      String? storeRegion,
      String? storeStreet,
      String? buildingNumber,
      String? buildingName,
      String? city,
      String? showInHome,
      String? postalCode,
      String? mailbox}) async {
    final MultipartFile? multiPartFile;
    profilePhotoUrl == null || profilePhotoUrl.path.isEmpty
        ? multiPartFile = null
        : multiPartFile = MultipartFile(await profilePhotoUrl.readAsBytes(),
            filename: profilePhotoUrl.path.split('/').last);

    final formData = FormData(
      {
        "profile_photo_url": multiPartFile,
        "lang": lang,
        "user_type": userType,
        "provider_status": providerStatus,
        "name": name,
        "user_name": userName,
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation,
        "phone": phone,
        "country_code": countryCode,
        "address_en": addressEn,
        "address_ar": addressAr,
        "latitude": latitude,
        "longitude": longitude,
        "store_type": storeType,
        "store_name_en": storeName,
        "store_name_ar": storeName,
        "store_description_en": storeDescription,
        "store_description_ar": storeDescription,
        "store_service_ar": services,
        "store_service_en": services,
        "store_city": city,
        "store_region": storeRegion,
        "store_street": storeStreet,
        "building_name": buildingName,
        "building_number": buildingNumber,
        "mailbox": mailbox,
        "postal_code": postalCode,
        "free_delivery_status": deliveryType,
        "show_in_home_page": showInHome,
        "provider": provider,
        "provider_id": providerId,
      },
    );
    var response = await post(UrlAPI.registerUrl, formData);

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Register',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Register',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<Response?> search({
    required String search,
  }) async {
    var response = await get(
      UrlAPI.searchUrl,
      query: {
        "search": search,
      },
      headers: headers,
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Search',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Search',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<Response?> aboutStore({
    required String storeId,
  }) async {
    var response = await get(
      UrlAPI.getAboutStoreUrl,
      query: {
        "store_id": storeId,
      },
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'About Store',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'About Store',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<void> addNewJob({
    required String title,
    required String description,
    required String status,
    required String lang,
  }) async {
    final formData = FormData(
      {
        "lang": lang,
        "title_en": title,
        "title_ar": title,
        "description_ar": description,
        "description_en": description,
        "status": status,
      },
    );
    var response = await post(
      UrlAPI.addNewJobUrl,
      formData,
      headers: headers,
    );
    if (response.isOk) {
      CustomSnackBar.whenHaveSuccessFromBackEnd(
        snackBarTitle: 'Add New Job',
        bodySnackBar: response.body['msg'],
        icon: const Icon(Icons.done),
      );
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Add New Job',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Add New Job',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<Response?> getMyJobs({
    required String lang,
  }) async {
    final formData = FormData(
      {
        "lang": lang,
      },
    );
    var response = await post(
      UrlAPI.getMyJobsUrl,
      formData,
      headers: headers,
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get My Jobs',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get My Jobs',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<void> activeInactiveMyJob({
    required String lang,
    required String jobId,
  }) async {
    final formData = FormData(
      {
        "lang": lang,
        "job_id": jobId,
      },
    );
    var response = await post(
      UrlAPI.activeInactiveMyJobUrl,
      formData,
      headers: headers,
    );

    if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'In/Active MyJob',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'In/Active MyJob',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<void> softDeleteJob({
    required String lang,
    required String jobId,
  }) async {
    final formData = FormData(
      {
        "lang": lang,
        "job_id": jobId,
      },
    );
    var response = await post(
      UrlAPI.destroyMyJobUrl,
      formData,
      headers: headers,
    );

    if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Delete My Jobs',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Delete My Jobs',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<void> updateJob({
    required String title,
    required String description,
    required String status,
    required String lang,
    required String jobId,
  }) async {
    final formData = FormData({
      "lang": lang,
      "title_en": title,
      "title_ar": title,
      "description_ar": description,
      "description_en": description,
      "status": status,
      "job_id": jobId,
    });
    var response = await post(
      UrlAPI.updateMyJobUrl,
      formData,
      headers: headers,
    );
    if (response.isOk) {
      CustomSnackBar.whenHaveSuccessFromBackEnd(
        snackBarTitle: 'Update Job',
        bodySnackBar: response.body['msg'],
        icon: const Icon(Icons.done),
      );
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Update Job',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Update Job',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<Response?> getShowStoreJobs({
    required String lang,
    required String storeId,
  }) async {
    final formData = FormData(
      {
        "lang": lang,
        "store_id": storeId,
      },
    );
    var response = await post(
      UrlAPI.getShowStoreJobsUrl,
      formData,
      headers: headers,
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get Jobs',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get Jobs',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<void> applyJob({
    required String name,
    required String email,
    required String phone,
    required File cv,
    required String jobId,
    required String lang,
    required String message,
  }) async {
    final multiPartFile = MultipartFile(await cv.readAsBytes(),
        filename: cv.path.split('/').last);
    final formData = FormData({
      "name": name,
      "email": email,
      "phone": phone,
      "cv": multiPartFile,
      "lang": lang,
      "job_id": jobId,
      "message": message,
    });

    var response = await post(
      UrlAPI.applyJobUrl,
      formData,
      headers: headers,
    );
    if (response.isOk) {
      CustomSnackBar.whenHaveSuccessFromBackEnd(
        snackBarTitle: 'Apply Job',
        bodySnackBar: response.body['msg'],
        icon: const Icon(Icons.done),
      );
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Apply Job',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Apply Job',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<Response?> getMyDeliveryOrders() async {
    var response = await get(
      UrlAPI.getMyDeliveryOrdersUrl,
      headers: headers,
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get Delivery Orders',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get Delivery Orders',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<void> acceptDeliveryOrder({
    required String saleId,
  }) async {
    var response = await get(
      UrlAPI.acceptDeliveryOrderUrl,
      query: {
        "sale_id": saleId,
      },
      headers: headers,
    );
    if (response.isOk) {
      CustomSnackBar.whenHaveSuccessFromBackEnd(
        snackBarTitle: 'Accept Delivery Order',
        bodySnackBar: response.body['msg'],
        icon: const Icon(Icons.done),
      );
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Accept Delivery Order',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Accept Delivery Order',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<Response?> getProductComments({
    String? productId,
  }) async {
    var response = await get(
      UrlAPI.getProductCommentsUrl,
      query: {
        "product_id": productId,
      },
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get Product Comments',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get Product Comments',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<void> addProductComment({
    required String productId,
    required String lang,
    String? parentId,
    required String comment,
  }) async {
    final formData = FormData(
      {
        "product_id": productId,
        "parent_id": parentId,
        "comment": comment,
        "lang": lang,
      },
    );

    var response = await post(
      UrlAPI.addProductCommentUrl,
      formData,
      headers: headers,
    );
    if (response.isOk) {
      CustomSnackBar.whenHaveSuccessFromBackEnd(
        snackBarTitle: 'Add comment',
        bodySnackBar: response.body['msg'],
        icon: const Icon(Icons.done),
      );
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Add comment',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Add comment',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<void> upgradeMyProfile({
    required String name,
    required String userName,
    required String email,
    required String lang,
    required String phone,
    required String countryCode,
    required String address,
    required String password,
    required String passwordConfirmation,
    File? profilePhotoUrl,
    String? showInHomePage,
    String? freeDeliveryStatus,
    String? storeType,
    String? storeName,
    String? storeStatus,
    String? storeDescription,
    String? storeService,
    String? storeCity,
    String? storeRegion,
    String? storeStreet,
    String? buildingName,
    String? buildingNumber,
    String? mailbox,
    String? postalCode,
    Position? currentPosition,
  }) async {
    final MultipartFile? multiPartFile;
    profilePhotoUrl == null || profilePhotoUrl.path.isEmpty
        ? multiPartFile = null
        : multiPartFile = MultipartFile(await profilePhotoUrl.readAsBytes(),
            filename: profilePhotoUrl.path.split('/').last);

    final formData = FormData(
      {
        "lang": lang,
        "name": name,
        "user_name": userName,
        "email": email,
        "phone": phone,
        "country_code": countryCode,
        "address_en": address,
        "address_ar": address,
        "map_url": "http://map.com",
        "profile_photo_url": multiPartFile,
        "password": password,
        "password_confirmation": passwordConfirmation,
        "show_in_home_page": showInHomePage,
        "free_delivery_status": freeDeliveryStatus,
        "store_type": storeType,
        "store_name_en": storeName,
        "store_name_ar": storeName,
        "store_status": storeStatus,
        "store_description_en": storeDescription,
        "store_description_ar": storeDescription,
        "store_service_en": storeService,
        "store_service_ar": storeService,
        "store_city": storeCity,
        "store_region": storeRegion,
        "store_street": storeStreet,
        "building_name": buildingName,
        "building_number": buildingNumber,
        "mailbox": mailbox,
        "postal_code": postalCode,
        // "latitude": currentPosition!.latitude.toString(),
        // "longitude": currentPosition.longitude.toString(),
      },
    );
    var response = await post(
      UrlAPI.upgradeMyProfileUrl,
      formData,
      headers: headers,
    );
    if (response.isOk) {
      CustomSnackBar.whenHaveSuccessFromBackEnd(
        snackBarTitle: 'Upgrade My Profile',
        bodySnackBar: response.body['msg'],
        icon: const Icon(Icons.done),
      );
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Upgrade My Profile',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Upgrade My Profile',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<Response?> getMonthlyReports({required String lang}) async {
    final formData = FormData(
      {
        "lang": lang,
      },
    );

    var response = await post(
      UrlAPI.getMonthlyReportsUrl,
      formData,
      headers: headers,
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get Monthly Reports',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get Monthly Reports',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<Response?> getMyDeliveryEmployees() async {
    var response = await get(
      UrlAPI.getMyDeliveryEmployeesUrl,
      headers: headers,
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get My Delivery',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get My Delivery',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<void> softDeleteDeliveryEmployee({required String employeeId}) async {
    var response = await get(
      UrlAPI.softDeleteDeliveryEmployeeUrl,
      query: {
        "employee_id": employeeId,
      },
      headers: headers,
    );
    if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Delete Delivery Employee',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Delete Delivery Employee',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<Response?> showSoftDeleteDeliveryEmployees() async {
    var response = await get(
      UrlAPI.showSoftDeleteDeliveryEmployeesUrl,
      headers: headers,
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Show Delete Delivery',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Show Delete Delivery',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<void> restoreSoftDeleteDeliveryEmployees({
    required String employeeId,
  }) async {
    var response = await get(
      UrlAPI.restoreSoftDeleteDeliveryEmployeesUrl,
      query: {
        "employee_id": employeeId,
      },
      headers: headers,
    );
    if (response.isOk) {
      CustomSnackBar.whenHaveSuccessFromBackEnd(
        snackBarTitle: 'Restore Delivery Employees',
        bodySnackBar: response.body['msg'],
        icon: const Icon(Icons.done),
      );
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Restore Delivery Employees',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Restore Delivery Employees',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<void> activeInactiveEmployee({
    required String employeeId,
  }) async {
    var response = await get(
      UrlAPI.activeInactiveEmployeeUrl,
      query: {
        "employee_id": employeeId,
      },
      headers: headers,
    );
    if (response.isOk) {
      CustomSnackBar.whenHaveSuccessFromBackEnd(
        snackBarTitle: 'In/Active Employee',
        bodySnackBar: response.body['msg'],
        icon: const Icon(Icons.done),
      );
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'In/Active Employee',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'In/Active Employee',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<void> createDeliveryEmployee({
    required String name,
    required String userName,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String countryCode,
    required String status,
    required String phone,
    required File profilePhotoUrl,
    required String lang,
  }) async {
    final multipartFile = MultipartFile(await profilePhotoUrl.readAsBytes(),
        filename: profilePhotoUrl.path.split('/').last);

    final formData = FormData({
      "lang": lang,
      "name": name,
      "user_name": userName,
      "email": email,
      "password": password,
      "password_confirmation": passwordConfirmation,
      "country_code": countryCode,
      "status": status,
      "phone": phone,
      "profile_photo_url": multipartFile,
    });

    var response = await post(
      UrlAPI.createDeliveryEmployeeUrl,
      formData,
      headers: headers,
    );
    if (response.isOk) {
      CustomSnackBar.whenHaveSuccessFromBackEnd(
        snackBarTitle: 'Create Delivery Employee',
        bodySnackBar: response.body['msg'],
        icon: const Icon(Icons.done),
      );
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Create Delivery Employee',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Create Delivery Employee',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<void> updateDeliveryEmployee({
    required String name,
    required String userName,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String countryCode,
    required String status,
    required String phone,
    required File profilePhotoUrl,
    required String lang,
  }) async {
    final multipartFile = MultipartFile(await profilePhotoUrl.readAsBytes(),
        filename: profilePhotoUrl.path.split('/').last);

    final formData = FormData({
      "lang": lang,
      "name": name,
      "user_name": userName,
      "email": email,
      "password": password,
      "password_confirmation": passwordConfirmation,
      "country_code": countryCode,
      "status": status,
      "phone": phone,
      "profile_photo_url": multipartFile,
    });

    var response = await post(
      UrlAPI.updateDeliveryEmployeeUrl,
      formData,
      headers: headers,
    );
    if (response.isOk) {
      CustomSnackBar.whenHaveSuccessFromBackEnd(
        snackBarTitle: 'Update Delivery Employee',
        bodySnackBar: response.body['msg'],
        icon: const Icon(Icons.done),
      );
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Update Delivery Employee',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Update Delivery Employee',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<Response?> guestGetStores({
    required String lang,
    String? search,
  }) async {
    final formData = FormData(
      {
        "lang": lang,
        "search": search,
      },
    );
    var response = await post(
      UrlAPI.getStoresUrl,
      formData,
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get Stores',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get Stores',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<void> assignDeliveryEmployee({
    required String saleId,
    required String deliveryUserId,
  }) async {
    final formData = FormData(
      {
        "sale_id": saleId,
        "delivery_user_id": deliveryUserId,
      },
    );

    var response = await post(
      UrlAPI.assignDeliveryEmployeeUrl,
      formData,
      headers: headers,
    );
    if (response.isOk) {
      CustomSnackBar.whenHaveSuccessFromBackEnd(
        snackBarTitle: 'Assign Delivery Employee',
        bodySnackBar: response.body['msg'],
        icon: const Icon(Icons.done),
      );
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Assign Delivery Employee',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Assign Delivery Employee',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<Response?> getStoreCategories({required String storeId}) async {
    final formData = FormData(
      {
        "store_id": storeId,
      },
    );
    var response = await post(
      UrlAPI.getStoreCategoriesUrl,
      formData,
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get Stores',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get Stores',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<void> watchStatus({
    required String statusId,
    required String storeId,
  }) async {
    final formData = FormData(
      {
        "status_id": statusId,
        "store_id": storeId,
      },
    );

    var response = await post(
      UrlAPI.watchStatusUrl,
      formData,
      headers: headers,
    );
    if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Watch Status',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Watch Status',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<Response?> historyProduct() async {
    final formData = FormData({});

    var response = await post(
      UrlAPI.historyProductUrl,
      formData,
      headers: headers,
    );
    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'History Product',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'History Product',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<Response?> getShowStoresInHomeGuest({required String lang}) async {
    final formData = FormData(
      {
        "lang": lang,
      },
    );

    var response = await post(UrlAPI.getShowStoresInHomeUrl, formData);

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get Stores',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get Stores',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<Response?> showLocationRequests({required String lang}) async {
    final formData = FormData(
      {
        "lang": lang,
      },
    );

    var response = await post(
      UrlAPI.showLocationRequestsUrl,
      formData,
      headers: headers,
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Show location requests',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Show location requests',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<Response?> showMyLocationInquireies({
    required String lang,
  }) async {
    final formData = FormData(
      {
        "lang": lang,
      },
    );

    var response = await post(
      UrlAPI.showMyLocationInquireiesUrl,
      formData,
      headers: headers,
    );

    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Show my location Inquiries',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Show my location Inquiries',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<void> acceptLocatioInquiry({
    required String locationInquiryId,
    required String latitude,
    required String longitude,
    required String lang,
  }) async {
    final formData = FormData(
      {
        "location_inquiry_id": locationInquiryId,
        "latitude": latitude,
        "longitude": longitude,
        "lang": lang,
      },
    );

    var response = await post(
      UrlAPI.acceptLocatioInquiryUrl,
      formData,
      headers: headers,
    );
    if (response.isOk) {
      CustomSnackBar.whenHaveSuccessFromBackEnd(
        snackBarTitle: 'Accept Location Inquiry',
        bodySnackBar: response.body['msg'],
        icon: const Icon(Icons.done),
      );
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Accept Location Inquiry',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Accept Location Inquiry',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<void> rejectLocatioInquiry(
      {required String locationInquiryId, required String lang}) async {
    final formData = FormData({
      "location_inquiry_id": locationInquiryId,
      "lang": lang,
    });

    var response = await post(
      UrlAPI.rejectLocatioInquiryUrl,
      formData,
      headers: headers,
    );
    if (response.isOk) {
      CustomSnackBar.whenHaveSuccessFromBackEnd(
        snackBarTitle: 'Reject Location Inquiry',
        bodySnackBar: response.body['msg'],
        icon: const Icon(Icons.done),
      );
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Reject Location Inquiry',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Reject Location Inquiry',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<void> suggestPrice({
    required String receiverId,
    required String suggestPrice,
    required String productId,
  }) async {
    final formData = FormData(
      {
        "receiver_id": receiverId,
        "suggest_price": suggestPrice,
        "product_id": productId,
      },
    );

    var response = await post(
      UrlAPI.suggestPriceUrl,
      formData,
      headers: headers,
    );
    if (response.isOk) {
      CustomSnackBar.whenHaveSuccessFromBackEnd(
        snackBarTitle: 'Suggest Price',
        bodySnackBar: response.body['msg'],
        icon: const Icon(Icons.done),
      );
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Suggest Price',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Suggest Price',
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<Response?> getCityStores({
    required String storeCityId,
    required String lang,
  }) async {
    final formData = FormData(
      {
        "lang": lang,
        "store_city_id": storeCityId,
      },
    );

    var response = await post(
      UrlAPI.getCityStoresUrl,
      formData,
    );
    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get City Stores',
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get City Stores',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<Response?> getNotificationsCount() async {
    final formData = FormData(
      {
        "lang": 'en',
      },
    );
    var response = await post(
      UrlAPI.getNotificationsCountUrl,
      formData,
      headers: headers,
    );
    if (response.isOk) {
      return response;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Get Notifications Count'.tr,
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Get City Stores',
        bodySnackBar: response.body['msg'],
      );
    }
    return null;
  }

  @override
  Future<void> readNotifications({
    required String notificationId,
  }) async {
    final formData = FormData(
      {
        "notification_id": notificationId,
      },
    );
    var response = await post(
      UrlAPI.readNotificationsUrl,
      formData,
      headers: headers,
    );
    if (response.isOk) {
      return;
    } else if (response.unauthorized) {
      CustomSnackBar.whenUserUnauthorized(
        snackBarTitle: 'Read Notifications'.tr,
      );
    } else if (response.hasError) {
      CustomSnackBar.whenHaveErrorFromBackEnd(
        snackBarTitle: 'Read Notifications'.tr,
        bodySnackBar: response.body['msg'],
      );
    }
    return;
  }

  @override
  Future<Response?> flagFirebase() async {
    var response = await get(UrlAPI.flagApi);
    if (response.isOk) {
      return response;
    }
    if (response.hasError) {
      throw Exception(response.statusText);
    }
    return null;
  }
}
