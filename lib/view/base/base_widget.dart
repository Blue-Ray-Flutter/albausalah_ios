import 'package:albausalah_app/shared/components/actions/actions.dart';
import 'package:albausalah_app/view/home/pages/notification/model/notification_model.dart';
import 'package:albausalah_app/view/stores/pages/free_delivery_stores/free_delivery_stores.dart';
import 'package:albausalah_app/view/stores/pages/most_selling_stores/most_selling_stores.dart';
import 'package:albausalah_app/view/stores/pages/new_stores/newstores_page.dart';
import 'package:albausalah_app/view/stores/pages/offer_stores/offer_stores.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/assets_res.dart';
import '../../shared/components/constants/constant_data/constant_data.dart';
import '../../shared/components/constants/nav_screen/nav_screen.dart';
import '../../shared/components/constants/style/color.dart';
import '../../shared/components/widgets/header_widget/header_widget.dart';
import '../account/pages/my_orders/view/my_order.dart';

class BaseWidget extends StatefulWidget {
  const BaseWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<BaseWidget> createState() => BaseWidgetState();
}

class BaseWidgetState extends State<BaseWidget> {
  static ValueNotifier<int> bottomNavIndex = ValueNotifier<int>(0);

  static ValueNotifier<List<int>> numberItems =
      ValueNotifier<List<int>>([0, 0]);

  static ValueNotifier<bool> visible = ValueNotifier<bool>(true);

  static ValueNotifier<bool> isEnglish = ValueNotifier<bool>(true);

  static NotificationModel? notificationModel = NotificationModel();

  void initialization() async {
    ConstantActions.getNumberItemCart();
    myInformationModel = await ConstantActions.getMyProfile();
  }

  @override
  initState() {
    visible = ValueNotifier<bool>(true);
    initialization();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: ValueListenableBuilder<bool>(
          valueListenable: visible,
          builder: (BuildContext context, value, Widget? child) {
            return Visibility(
              visible: visible.value,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 0.5,
                        blurRadius: 2,
                        offset: const Offset(
                          0,
                          1,
                        ),
                      ),
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 0.5,
                        blurRadius: 2,
                        offset: const Offset(
                          1,
                          0,
                        ),
                      ),
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 0.5,
                        blurRadius: 2,
                        offset: const Offset(
                          0,
                          -1,
                        ),
                      ),
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 0.5,
                        blurRadius: 2,
                        offset: const Offset(
                          -1,
                          0,
                        ),
                      ),
                    ],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(100),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FloatingActionButton(
                    elevation: 0,
                    onPressed: () {
                      showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          context: context,
                          builder: (builder) {
                            return Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15)),
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: TextButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: const Text(
                                          'X',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 22,
                                          ),
                                        ),
                                      ),
                                      title: Text(
                                        'Stores'.tr,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    ListTile(
                                      onTap: () {
                                        Get.to(() => const NewStores());
                                      },
                                      leading: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(100),
                                            ),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: ImageIcon(
                                                AssetImage(AssetsRes.STORE)),
                                          )),
                                      title: Text(
                                        'New stores'.tr,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    ListTile(
                                      onTap: () {
                                        Get.to(() => const MostSellingStores());
                                      },
                                      leading: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(100),
                                            ),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: ImageIcon(AssetImage(
                                                AssetsRes.BEST_SELLER)),
                                          )),
                                      title: Text(
                                        'Best Seller'.tr,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    ListTile(
                                      onTap: () {
                                        Get.to(() => const OfferStores());
                                      },
                                      leading: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(100),
                                            ),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: ImageIcon(
                                                AssetImage(AssetsRes.OFFER)),
                                          )),
                                      title: Text(
                                        'Offers'.tr,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    ListTile(
                                      onTap: () {
                                        Get.to(
                                            () => const FreeDeliveryStores());
                                      },
                                      leading: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(100),
                                            ),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: ImageIcon(AssetImage(
                                                AssetsRes.FREE_DELIVERY)),
                                          )),
                                      title: Text(
                                        'Free delivery'.tr,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    ListTile(
                                      onTap: () {
                                        Get.to(() => const MyOrderPage());
                                      },
                                      leading: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(100),
                                            ),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: ImageIcon(
                                                AssetImage(AssetsRes.RETURN)),
                                          )),
                                      title: Text(
                                        'Pre Order'.tr,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ));
                          });
                    },
                    child: const Icon(
                      Icons.add_shopping_cart,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: ValueListenableBuilder<bool>(
            valueListenable: isEnglish,
            builder: (BuildContext context, value, Widget? child) {
              return ValueListenableBuilder<int>(
                valueListenable: bottomNavIndex,
                builder: (BuildContext context, value, Widget? child) {
                  return isEnglish.value
                      ? AnimatedBottomNavigationBar.builder(
                          splashRadius: 50,
                          notchMargin: 0,
                          elevation: 50,
                          height: 75,
                          activeIndex: bottomNavIndex.value,
                          gapLocation: GapLocation.center,
                          notchSmoothness: NotchSmoothness.sharpEdge,
                          leftCornerRadius: 20,
                          rightCornerRadius: 20,
                          onTap: (index) =>
                              setState(() => bottomNavIndex.value = index),
                          itemCount: navScreensEnglish.length,
                          tabBuilder: (int index, bool isActive) {
                            final color = isActive
                                ? AppColor.globalDefaultColor
                                : Colors.grey[400];
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  navScreensEnglish[index].icon,
                                  size: 28,
                                  color: color,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  navScreensEnglish[index].name,
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            );
                          },
                          //other params
                        )
                      : AnimatedBottomNavigationBar.builder(
                          splashRadius: 50,
                          notchMargin: 0,
                          elevation: 50,
                          height: 75,
                          activeIndex: bottomNavIndex.value,
                          gapLocation: GapLocation.center,
                          notchSmoothness: NotchSmoothness.sharpEdge,
                          leftCornerRadius: 20,
                          rightCornerRadius: 20,
                          onTap: (index) =>
                              setState(() => bottomNavIndex.value = index),
                          itemCount: navScreensArabic.length,
                          tabBuilder: (int index, bool isActive) {
                            final color = isActive
                                ? AppColor.globalDefaultColor
                                : Colors.grey[400];
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  navScreensArabic[index].icon,
                                  size: 28,
                                  color: color,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  navScreensArabic[index].name,
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            );
                          },
                          //other params
                        );
                },
              );
            }),
        body: ValueListenableBuilder<int>(
            valueListenable: bottomNavIndex,
            builder: (BuildContext context, value, Widget? child) {
              return ValueListenableBuilder<bool>(
                valueListenable: isEnglish,
                builder: (BuildContext context, value, Widget? child) {
                  return isEnglish.value
                      ? Stack(
                          children: [
                            navScreensEnglish[bottomNavIndex.value].widget,
                            navScreensEnglish[bottomNavIndex.value]
                                        .navBarItem ==
                                    NavBarItem.home
                                ? ValueListenableBuilder<List<int>>(
                                    valueListenable: numberItems,
                                    builder: (BuildContext context, value,
                                        Widget? child) {
                                      return HeaderWidget(
                                        numItem: numberItems.value[0],
                                        numNotification: numberItems.value[1],
                                        containerSize: 100,
                                      );
                                    },
                                  )
                                : ValueListenableBuilder<List<int>>(
                                    valueListenable: numberItems,
                                    builder: (BuildContext context, value,
                                        Widget? child) {
                                      return HeaderWidget(
                                        numItem: numberItems.value[0],
                                        numNotification: numberItems.value[1],
                                        onPressed: () {
                                          setState(() {
                                            bottomNavIndex.value = 0;
                                          });
                                        },
                                        centerTitle: true,
                                        containerSize: 100,
                                        title: isEnglish.value
                                            ? navScreensEnglish[
                                                    bottomNavIndex.value]
                                                .name
                                            : navScreensArabic[
                                                    bottomNavIndex.value]
                                                .name,
                                        haveMore: false,
                                        haveFav: false,
                                        haveBack: true,
                                        haveLocation: false,
                                        haveLogo: false,
                                      );
                                    },
                                  )
                          ],
                        )
                      : Stack(
                          children: [
                            navScreensArabic[bottomNavIndex.value].widget,
                            navScreensArabic[bottomNavIndex.value].navBarItem ==
                                    NavBarItem.home
                                ? ValueListenableBuilder<List<int>>(
                                    valueListenable: numberItems,
                                    builder: (BuildContext context, value,
                                        Widget? child) {
                                      return HeaderWidget(
                                        numItem: numberItems.value[0],
                                        numNotification: numberItems.value[1],
                                        containerSize: 100,
                                      );
                                    },
                                  )
                                : ValueListenableBuilder<List<int>>(
                                    valueListenable: numberItems,
                                    builder: (BuildContext context, value,
                                        Widget? child) {
                                      return HeaderWidget(
                                        numItem: numberItems.value[0],
                                        numNotification: numberItems.value[1],
                                        onPressed: () {
                                          setState(() {
                                            bottomNavIndex.value = 0;
                                          });
                                        },
                                        centerTitle: true,
                                        containerSize: 100,
                                        title: navScreensArabic[
                                                bottomNavIndex.value]
                                            .name,
                                        haveMore: false,
                                        haveFav: false,
                                        haveBack: true,
                                        haveLocation: false,
                                        haveLogo: false,
                                      );
                                    },
                                  )
                          ],
                        );
                },
              );
            }),
      ),
    );
  }
}
