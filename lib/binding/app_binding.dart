import 'package:albausalah_app/view/account/controller/account_controller.dart';
import 'package:albausalah_app/view/account/pages/edit_information_for_customer/controller/edit_information_for_customer_controller.dart';
import 'package:albausalah_app/view/account/pages/edit_information_for_store/controller/edit_information_for_store_controller.dart';
import 'package:albausalah_app/view/home/pages/cart/controller/cart_controller.dart';
import 'package:albausalah_app/view/home/pages/search/controller/search_controller.dart';
import 'package:albausalah_app/view/more/controller/more_controller.dart';
import 'package:albausalah_app/view/stores/pages/free_delivery_stores/controller/free_delivery_controller.dart';
import 'package:albausalah_app/view/stores/pages/most_selling_stores/controller/most_selling_controller.dart';
import 'package:albausalah_app/view/stores/pages/new_stores/controller/new_store_controller.dart';
import 'package:albausalah_app/view/stores/pages/offer_stores/offer_controller/offer_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../api/repository/http_repository.dart';
import '../api/repository/http_repository_impl.dart';
import '../shared/helper/cache_utils.dart';
import '../view/account/pages/add_new_job/controller/add_new_job_controller.dart';
import '../view/account/pages/add_new_product/controller/add_new_product_controller.dart';
import '../view/account/pages/client_orders/controller/client_orders_controller.dart';
import '../view/account/pages/delivery _staff/controller/delivery_staff_controller.dart';
import '../view/account/pages/my_products/update_my_product/controller/update_my_product_controller.dart';
import '../view/account/pages/my_services/pages/add_new_services/controller/add_new_services_controller.dart';
import '../view/account/pages/my_services/pages/update_services/controller/update_services_controller.dart';
import '../view/account/pages/story/controller/create_story_controller.dart';
import '../view/account/pages/update_my_job/controller/update_my_job_controller.dart';
import '../view/account/pages/uprade_my_profile/controller/upgrade_my_profile_controller.dart';
import '../view/category/sub_category/controller/sub_category_controller.dart';
import '../view/chat/chat_details/controller/chat_details_controller.dart';
import '../view/delivery/controller/delivery_controller.dart';
import '../view/guest/cart/controller/guest_cart_controller.dart';
import '../view/guest/guest_store_page/controller/guest_store_page_controller.dart';
import '../view/guest/guest_store_page/product_page/controller/guest_product_controller.dart';
import '../view/guest/guest_store_page/stores/controller/guest_stores_controller.dart';
import '../view/guest/home_guest/controller/guest_home_controller.dart';
import '../view/home/controller/home_controller.dart';
import '../view/login/controller/login_controller.dart';
import '../view/more/pages/contact_us/controller/contact_us_controller.dart';
import '../view/register/controller/register_controller.dart';
import '../view/register/users/customer/controller/customer_controller.dart';
import '../view/register/users/store/controller/store_signup_controller.dart';
import '../view/stores/controller/stores_controller.dart';
import '../view/stores/store_page/controller/store_page_controller.dart';
import '../view/stores/store_page/product_page/controller/product_controller.dart';
import '../view/stores/store_page/product_page/product_reviews/controller/product_reviews_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    final repository = Get.put<HttpRepository>(
      HttpRepositoryImpl(),
      permanent: true,
    );
    Get.put(
      CacheUtils(GetStorage()),
      permanent: true,
    );
    final cacheUtils = Get.find<CacheUtils>();

    Get.create(() => LoginController(
          httpRepository: repository,
          cacheUtils: cacheUtils,
        ));
    Get.create(() => AccountController(
          httpRepository: repository,
          cacheUtils: cacheUtils,
        ));
    Get.create(() => MoreController(
          httpRepository: repository,
          cacheUtils: cacheUtils,
        ));

    Get.create(() => RegisterController(
          httpRepository: repository,
          cacheUtils: cacheUtils,
        ));
    Get.create(() => GuestHomeController(
          httpRepository: repository,
          cacheUtils: cacheUtils,
        ));
    Get.create(() => GuestProductController(
          httpRepository: repository,
          cacheUtils: cacheUtils,
        ));
    Get.create(() => GuestStoresController(
          httpRepository: repository,
          cacheUtils: cacheUtils,
        ));
    Get.create(() => ContactUsController(
          httpRepository: repository,
          cacheUtils: cacheUtils,
        ));
    Get.create(() => HomeController(
          httpRepository: repository,
          cacheUtils: cacheUtils,
        ));
    Get.create(() => CartController(
          httpRepository: repository,
          cacheUtils: cacheUtils,
        ));
    Get.create(() => GuestCartController(
          httpRepository: repository,
          cacheUtils: cacheUtils,
        ));
    Get.create(() => GuestStorePageController(
          httpRepository: repository,
          cacheUtils: cacheUtils,
        ));
    Get.create(() => CustomerController(
          httpRepository: repository,
          cacheUtils: cacheUtils,
        ));
    Get.create(() => StoreSignupController(
          httpRepository: repository,
          cacheUtils: cacheUtils,
        ));
    Get.create(() => SubCategoryController(
          httpRepository: repository,
          cacheUtils: cacheUtils,
        ));
    Get.create(() => EditInformationForCustomerController(
          httpRepository: repository,
          cacheUtils: cacheUtils,
        ));
    Get.create(() => EditInformationForStoreController(
          httpRepository: repository,
          cacheUtils: cacheUtils,
        ));
    Get.create(() => StoresController(
          httpRepository: repository,
          cacheUtils: cacheUtils,
        ));
    Get.create(() => NewStoreController(
          httpRepository: repository,
          cacheUtils: cacheUtils,
        ));
    Get.create(() => MostSellingController(
          httpRepository: repository,
          cacheUtils: cacheUtils,
        ));
    Get.create(() => OfferController(
          httpRepository: repository,
          cacheUtils: cacheUtils,
        ));
    Get.create(() => SearchPageController(
          httpRepository: repository,
          cacheUtils: cacheUtils,
        ));
    Get.create(() => FreeDeliveryController(
          httpRepository: repository,
          cacheUtils: cacheUtils,
        ));
    Get.create(() => AddNewJobController(
          httpRepository: repository,
          cacheUtils: cacheUtils,
        ));
    Get.create(() => StorePageController(
          httpRepository: repository,
          cacheUtils: cacheUtils,
        ));
    Get.create(() => ProductController(
          httpRepository: repository,
          cacheUtils: cacheUtils,
        ));
    Get.create(() => UpdateServiceController(
          httpRepository: repository,
          cacheUtils: cacheUtils,
        ));
    Get.create(() => ClientOrderController(
          httpRepository: repository,
          cacheUtils: cacheUtils,
        ));
    Get.create(() => ChatDetailsController(
          httpRepository: repository,
          cacheUtils: cacheUtils,
        ));
    Get.create(() => CreateStoryController(
          httpRepository: repository,
          cacheUtils: cacheUtils,
        ));
    Get.create(() => AddNewServicesController(
          httpRepository: repository,
          cacheUtils: cacheUtils,
        ));
    Get.create(() => AddNewProductController(
          httpRepository: repository,
          cacheUtils: cacheUtils,
        ));
    Get.create(() => UpdateMyProductController(
          httpRepository: repository,
          cacheUtils: cacheUtils,
        ));
    Get.create(() => ProductReviewsController(
          httpRepository: repository,
          cacheUtils: cacheUtils,
        ));
    Get.create(() => UpdateMyJobController(
          httpRepository: repository,
          cacheUtils: cacheUtils,
        ));
    Get.create(() => DeliveryOrderController(
          httpRepository: repository,
          cacheUtils: cacheUtils,
        ));
    Get.create(() => UpgradeMyProfileController(
          httpRepository: repository,
          cacheUtils: cacheUtils,
        ));
    Get.create(() => DeliveryStaffController(
          httpRepository: repository,
          cacheUtils: cacheUtils,
        ));
  }
}
