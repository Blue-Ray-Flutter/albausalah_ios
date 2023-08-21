import 'package:albausalah_app/api/repository/http_repository.dart';
import 'package:albausalah_app/res/assets_res.dart';
import 'package:albausalah_app/view/account/pages/add_new_job/add_new_job.dart';
import 'package:albausalah_app/view/account/pages/add_new_product/add_new_product.dart';
import 'package:albausalah_app/view/account/pages/client_orders/client_orders.dart';
import 'package:albausalah_app/view/account/pages/delivery%20_staff/delivery_staff.dart';
import 'package:albausalah_app/view/account/pages/edit_information_for_customer/edit_information_for_customer.dart';
import 'package:albausalah_app/view/account/pages/edit_information_for_store/edit_information_for_store.dart';
import 'package:albausalah_app/view/account/pages/follow_stores/follow_stores.dart';
import 'package:albausalah_app/view/account/pages/followers/followers_page.dart';
import 'package:albausalah_app/view/account/pages/monthly_reports/monthly_reports.dart';
import 'package:albausalah_app/view/account/pages/my_jobs/my_jobs.dart';
import 'package:albausalah_app/view/account/pages/my_orders/view/my_order.dart';
import 'package:albausalah_app/view/account/pages/my_products/my_products.dart';
import 'package:albausalah_app/view/account/pages/my_services/my_services.dart';
import 'package:albausalah_app/view/account/pages/my_site_requests/view/my_site_requests.dart';
import 'package:albausalah_app/view/account/pages/store_requests/view/store_request.dart';
import 'package:albausalah_app/view/account/pages/story/create_story.dart';
import 'package:albausalah_app/view/account/pages/uprade_my_profile/upgrade_my_profile.dart';
import 'package:albausalah_app/view/home/pages/favorite/favorite_products/favorite_products.dart';
import 'package:albausalah_app/view/home/pages/favorite/favorite_stores/favorite_stores.dart';
import 'package:albausalah_app/view/home/pages/notification/notification_page.dart';
import 'package:albausalah_app/view/stores/store_page/view/store_page.dart';
import 'package:albausalah_app/view/welcome/welcome_page.dart';
import 'package:get/get.dart';

import '../../../shared/components/widgets/account_item/model.dart';
import '../../../shared/helper/cache_utils.dart';

class AccountController extends GetxController {
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;
  AccountController({required this.httpRepository, required this.cacheUtils});

  RxList<AccountModel> accountStoreItem = RxList<AccountModel>([]);
  RxList<AccountModel> accountCustomerItem = RxList<AccountModel>([]);

  @override
  void onInit() {
    accountStoreItem.value = [
      AccountModel(
        accountItems: AccountItems.editInformation,
        title: 'Edit Information'.tr,
        icon: AssetsRes.USER_1,
        onTap: () {
          Get.to(() => const EditInformationForStore());
        },
      ),
      AccountModel(
        accountItems: AccountItems.myOrders,
        title: 'My Orders'.tr,
        icon: AssetsRes.BOX,
        onTap: () {
          Get.to(() => const MyOrderPage());
        },
      ),
      AccountModel(
        accountItems: AccountItems.myNotification,
        title: 'My Notification'.tr,
        icon: AssetsRes.NOTIFICATION,
        onTap: () {
          Get.to(() => const NotificationPage());
        },
      ),
      AccountModel(
        accountItems: AccountItems.clientOrders,
        title: 'Client Orders'.tr,
        icon: AssetsRes.ORDER,
        onTap: () {
          Get.to(() => const ClientOrders());
        },
      ),
      AccountModel(
        accountItems: AccountItems.myStatus,
        title: 'My Status'.tr,
        icon: AssetsRes.STORY,
        onTap: () {
          Get.to(() => const CreateStory());
        },
      ),
      AccountModel(
        accountItems: AccountItems.myServices,
        title: 'My Services'.tr,
        icon: AssetsRes.VEHICLE,
        onTap: () {
          Get.to(() => const MyServices());
        },
      ),
      AccountModel(
        accountItems: AccountItems.myProducts,
        title: 'My Products'.tr,
        icon: AssetsRes.GIFT,
        onTap: () {
          Get.to(() => const MyProducts());
        },
      ),
      AccountModel(
        accountItems: AccountItems.addProduct,
        title: 'Add Product'.tr,
        icon: AssetsRes.ADD,
        onTap: () {
          Get.to(() => const AddNewProduct());
        },
      ),
      AccountModel(
        accountItems: AccountItems.addJob,
        title: 'Add Job'.tr,
        icon: AssetsRes.ADD_JOB,
        onTap: () {
          Get.to(() => const AddNewJob());
        },
      ),
      AccountModel(
        accountItems: AccountItems.myJob,
        title: 'My Job'.tr,
        icon: AssetsRes.JOB,
        onTap: () {
          Get.to(() => const MyJobs());
        },
      ),
      AccountModel(
        accountItems: AccountItems.followers,
        title: 'Followers'.tr,
        icon: AssetsRes.FOLLOWERS,
        onTap: () {
          Get.to(() => const Followers());
        },
      ),
      AccountModel(
        accountItems: AccountItems.followingStores,
        title: 'Following stores'.tr,
        icon: AssetsRes.STORE_1,
        onTap: () {
          Get.to(() => const FollowStores());
        },
      ),
      AccountModel(
        accountItems: AccountItems.favoriteProducts,
        title: 'Favorite products'.tr,
        icon: AssetsRes.PACKAGE,
        onTap: () {
          Get.to(() => const FavoriteProducts());
        },
      ),
      AccountModel(
        accountItems: AccountItems.favoriteStores,
        title: 'Favorite stores'.tr,
        icon: AssetsRes.STORE_2,
        onTap: () {
          Get.to(() => const FavoriteStoresPage());
        },
      ),
      AccountModel(
        accountItems: AccountItems.viewStore,
        title: 'View my store as it appears to others'.tr,
        icon: AssetsRes.VIEW,
        onTap: () {
          Get.to(() => const StorePage(), arguments: [
            cacheUtils.getUID(),
            false,
          ]);
        },
      ),
      AccountModel(
        accountItems: AccountItems.deliveryStaff,
        title: 'Delivery staff'.tr,
        icon: AssetsRes.DELIVERY,
        onTap: () {
          Get.to(() => const DeliveryStaff());
        },
      ),
      AccountModel(
        accountItems: AccountItems.monthlyReports,
        title: 'Monthly Reports'.tr,
        icon: AssetsRes.REPORT,
        onTap: () {
          Get.to(() => const MonthlyReports());
        },
      ),
      AccountModel(
        accountItems: AccountItems.siteRequests,
        title: 'My Site Requests'.tr,
        icon: AssetsRes.PRECISION,
        onTap: () {
          Get.to(() => const MySiteRequests());
        },
      ),
      AccountModel(
        accountItems: AccountItems.storeRequests,
        title: 'Store requests'.tr,
        icon: AssetsRes.INFO,
        onTap: () {
          Get.to(() => const StoreRequest());
        },
      ),
      AccountModel(
        accountItems: AccountItems.logout,
        title: 'Logout'.tr,
        icon: AssetsRes.POWER_OFF,
        onTap: () {
          try {
            httpRepository.logout(
              lang: 'en',
            );
            Get.offAll(() => const WelcomePage());
            cacheUtils.logout();
          } catch (e) {
            e.printError();
          }
        },
      ),
    ];

    accountCustomerItem.value = [
      AccountModel(
        accountItems: AccountItems.editInformation,
        title: 'Edit Information'.tr,
        icon: AssetsRes.USER_1,
        onTap: () {
          Get.to(() => const EditInformationForCustomer());
        },
      ),
      AccountModel(
        accountItems: AccountItems.myOrders,
        title: 'My Orders'.tr,
        icon: AssetsRes.BOX,
        onTap: () {
          Get.to(() => const MyOrderPage());
        },
      ),
      AccountModel(
        accountItems: AccountItems.myNotification,
        title: 'My Notification'.tr,
        icon: AssetsRes.NOTIFICATION,
        onTap: () {
          Get.to(() => const NotificationPage());
        },
      ),
      AccountModel(
        accountItems: AccountItems.followingStores,
        title: 'Following stores'.tr,
        icon: AssetsRes.STORE_1,
        onTap: () {
          Get.to(() => const FollowStores());
        },
      ),
      AccountModel(
        accountItems: AccountItems.favoriteProducts,
        title: 'Favorite products'.tr,
        icon: AssetsRes.PACKAGE,
        onTap: () {
          Get.to(() => const FavoriteProducts());
        },
      ),
      AccountModel(
        accountItems: AccountItems.favoriteStores,
        title: 'Favorite stores'.tr,
        icon: AssetsRes.STORE_2,
        onTap: () {
          Get.to(() => const FavoriteStoresPage());
        },
      ),
      AccountModel(
        accountItems: AccountItems.upgrade,
        title: 'Upgrade'.tr,
        icon: AssetsRes.BAG,
        onTap: () {
          Get.to(() => const UpgradeMyProfile());
        },
      ),
      AccountModel(
        accountItems: AccountItems.storeRequests,
        title: 'Store requests'.tr,
        icon: AssetsRes.INFO,
        onTap: () {
          Get.to(() => const StoreRequest());
        },
      ),
      AccountModel(
        accountItems: AccountItems.logout,
        title: 'Logout'.tr,
        icon: AssetsRes.POWER_OFF,
        onTap: () {
          try {
            httpRepository.logout(
              lang: 'en',
            );
            Get.offAll(() => const WelcomePage());
            cacheUtils.logout();
          } catch (e) {
            e.printError();
          }
        },
      ),
    ];

    super.onInit();
  }
}
