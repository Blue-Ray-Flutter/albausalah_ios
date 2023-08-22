import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:get/get_connect/http/src/response/response.dart';

abstract class HttpRepository {
  Future<Response?> login({
    required String email,
    required String password,
    required String lang,
    required String providerStatus,
    required String playerId,
  });
  Future<Response?> loginWithSocial({
    required String email,
    String? password,
    required String lang,
    required String providerStatus,
    required String provider,
    required String providerId,
  });

  Future<Response?> flagFirebase();
  Future<void> acceptOrder({
    required String lang,
    required String orderId,
    required String deliveryUserId,
  });
  Future<void> rejectOrder({
    required String lang,
    required String orderId,
  });
  Future<Response?> getSubCategoryStores({
    required String lang,
    required String subCategoryId,
  });

  Future<Response?> getOrderDetails({
    required String lang,
    required String orderId,
  });

  Future<Response?> getMyOrders({required String lang});

  Future<void> contactUsRequest({
    required String lang,
    required String name,
    required String email,
    required String phone,
    required String message,
    required String subject,
  });

  Future<void> watchStatus({
    required String statusId,
    required String storeId,
  });

  Future<Response?> historyProduct();

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
  });

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
  });

  Future<void> updateMyService({
    required String serviceId,
    required String titleEn,
    required String lang,
    required String status,
  });

  Future<Response?> getMyFollowers({required String lang});

  Future<Response?> getClientOrders({
    required String lang,
  });

  Future<Response?> getMyDeliveryOrders();

  Future<Response?> getMonthlyReports({
    required String lang,
  });

  Future<Response?> getMyDeliveryEmployees();

  Future<Response?> getStatus();

  Future<Response?> getMyStatus();

  Future<Response?> showSoftDeleteDeliveryEmployees();

  void restoreSoftDeleteDeliveryEmployees({
    required String employeeId,
  });

  void activeInactiveEmployee({
    required String employeeId,
  });

  void destroyStatus({
    required String lang,
    required String statusId,
  });

  void acceptDeliveryOrder({
    required String saleId,
  });

  void softDeleteDeliveryEmployee({
    required String employeeId,
  });

  Future<void> createStatus({
    required String liveStatus,
    required String lang,
    File file,
    String? text,
    String? url,
  });

  Future<Response?> getCityStores({
    required String storeCityId,
    required String lang,
  });

  Future<void> addNewJob({
    required String title,
    required String description,
    required String status,
    required String lang,
  });

  Future<void> updateJob({
    required String title,
    required String description,
    required String status,
    required String lang,
    required String jobId,
  });

  Future<Response?> getMyJobs({
    required String lang,
  });

  Future<Response?> getShowStoreJobs({
    required String lang,
    required String storeId,
  });

  Future<Response?> getGuestStatus();

  Future<Response?> getMyMessages({
    required String lang,
  });

  Future<Response?> search({
    required String search,
  });

  Future<Response?> aboutStore({
    required String storeId,
  });

  Future<Response?> getStoreCategories({
    required String storeId,
  });

  Future<Response?> followingStores({
    required String lang,
  });

  Future<Response?> getMyProfile({
    required String lang,
  });

  void logout({
    required String lang,
  });

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
  });

  Future<Response?> registerWithSocial({
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
    String? mailbox,
  });

  Future<Response?> getSlider({
    required String lang,
  });

  Future<Response?> getWelcomeSlider();

  Future<Response?> getLoginSlider();

  Future<Response?> getRegisterSlider();

  Future<Response?> getNotificationsCount();

  Future<Response?> getCities({
    required String lang,
  });

  Future<Response?> getCategory({
    required String lang,
  });

  Future<Response?> getShowCategoryInHome({
    required String lang,
  });
  Future<Response?> getShowStoresInHome({
    required String lang,
  });
  Future<Response?> getShowStoresInHomeGuest({
    required String lang,
  });
  Future<Response?> getMainCategories({
    required String lang,
  });
  Future<Response?> getSubCategories({
    required String categoryId,
    required String lang,
  });
  Future<Response?> getStores({
    required String lang,
    String? search,
  });
  Future<Response?> guestGetStores({
    required String lang,
    String? search,
  });
  Future<Response?> getNewStores({
    required String lang,
    String? search,
  });
  Future<Response?> getMostSelling({
    required String lang,
    String? search,
  });
  Future<Response?> getSummerOffers({
    required String lang,
    String? search,
  });
  Future<Response?> getFreeDeliveryStores({
    required String lang,
    String? search,
  });
  Future<Response?> getCategoryStores({
    required String lang,
    required String categoryId,
  });
  Future<Response?> getHowToRegister({
    required String lang,
  });
  Future<Response?> getMyProducts({
    required String lang,
  });

  Future<Response?> showSoftDeleteProducts({
    required String lang,
  });

  void restoreSoftDeleteProduct({
    required String productId,
    required String lang,
  });

  void assignDeliveryEmployee({
    required String saleId,
    required String deliveryUserId,
  });

  void addProductComment({
    required String productId,
    required String lang,
    String? parentId,
    required String comment,
  });

  Future<Response?> getCart({
    required String lang,
  });

  Future<Response?> getProductComments({
    String? productId,
  });

  Future<Response?> getProductReviews({
    required String lang,
    required String productId,
  });

  Future<Response?> guestGetCart({
    required String lang,
    required String deviceId,
  });

  Future<Response?> getMyNotifications({
    required String lang,
  });

  Future<Response?> getFavoriteProduct({
    required String lang,
  });

  Future<Response?> getFavoriteStore({
    required String lang,
  });

  Future<Response?> showProducts({
    required String lang,
    required String storeId,
    required String min,
    required String max,
    required String radio,
    String? search,
    List<String>? categoryIds,
    String? check1,
    String? check2,
  });

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
  });

  Future<Response?> getContactUs({
    required String lang,
  });

  Future<Response?> getAllColors();

  Future<Response?> getAllSizes();

  Future<Response?> getMyServices({
    required String lang,
  });

  Future<void> activeInactiveMyService({
    required String lang,
    required String serviceId,
  });

  Future<void> activeInactiveMyJob({
    required String lang,
    required String jobId,
  });

  Future<void> destroyMyService({
    required String lang,
    required String serviceId,
  });

  Future<Response?> singleProductDetails({
    required String lang,
    required String productId,
  });

  Future<Response?> guestSingleProductDetails({
    required String lang,
    required String productId,
  });

  Future<void> activeInactiveMyProduct({
    required String lang,
    required String productId,
  });

  void updateCartQuantity({
    required String lang,
    required List<Map> data,
  });

  void guestUpdateCartQuantity({
    required String lang,
    required String deviceId,
    required List<Map> data,
  });

  Future<Response?> getProductColors({
    required String lang,
    required String productId,
  });

  Future<Response?> getStoreReviews({
    required String lang,
    required String storeId,
  });

  void addStoreReview({
    required String lang,
    required String storeId,
    required String reviewValue,
    String? reviewNote,
  });
  void addProductReview({
    required String lang,
    required String productId,
    required String reviewValue,
    String? reviewNote,
  });

  void readNotifications({
    required String notificationId,
  });

  Future<Response?> getProductSizes({
    required String lang,
    required String productId,
  });

  Future<Response?> showLocationRequests({
    required String lang,
  });

  Future<Response?> showMyLocationInquireies({
    required String lang,
  });

  void addToCart({
    required String lang,
    required String productId,
    required String colorId,
    required String sizeId,
    required String quantity,
  });

  void suggestPrice({
    required String receiverId,
    required String suggestPrice,
    required String productId,
  });

  void acceptLocatioInquiry({
    required String locationInquiryId,
    required String latitude,
    required String longitude,
    required String lang,
  });

  void rejectLocatioInquiry({
    required String locationInquiryId,
    required String lang,
  });

  void guestAddToCart({
    required String lang,
    required String deviceId,
    required String productId,
    required String storeId,
    required String colorId,
    required String sizeId,
    required String quantity,
  });

  void removeFromCart({
    required String lang,
    required String itemId,
  });

  void guestRemoveFromCart({
    required String lang,
    required String itemId,
    required String deviceId,
  });
  void addRemoveStoreWishlist({
    required String lang,
    required String storeId,
  });
  void addRemoveProductWishlist({
    required String lang,
    required String productId,
  });

  void checkout({
    required String lang,
  });

  void deleteChat({
    required String lang,
    required String messageId,
    required String receiverId,
    required String senderId,
  });

  Future<void> deleteMessage({
    required String lang,
    required String operationId,
    required String receiverId,
    required String senderId,
  });

  void followStores({
    required String lang,
    required String storeId,
  });

  void createDeliveryEmployee({
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
  });

  void updateDeliveryEmployee({
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
  });

  void addNewProduct({
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
  });

  void updateMyProduct({
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
  });

  void subscribeNewsletter({
    required String lang,
    required String email,
  });

  void createNewMessage({
    required String receiverId,
    required String lang,
    required String? message,
    List<File>? files,
  });

  void applyJob({
    required String name,
    required String email,
    required String phone,
    required File cv,
    required String jobId,
    required String lang,
    required String message,
  });

  void softDeleteProduct({
    required String lang,
    required String productId,
  });

  void softDeleteJob({
    required String lang,
    required String jobId,
  });

  void createNewService({
    required String status,
    required String lang,
    required String title,
  });

  Future<Response?> getMessageDetails({
    required String lang,
    required String messageId,
  });

  Future<Response?> getServices({
    required String lang,
    required String storeId,
  });
}
