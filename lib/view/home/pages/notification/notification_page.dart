import 'package:albausalah_app/shared/components/actions/actions.dart';
import 'package:albausalah_app/view/account/pages/client_orders/client_orders.dart';
import 'package:albausalah_app/view/account/pages/follow_stores/follow_stores.dart';
import 'package:albausalah_app/view/base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../shared/components/constants/style/color.dart';
import '../../../../shared/components/widgets/notification_item/notification_item.dart';
import '../../../../shared/components/widgets/size_config/size_config.dart';
import '../../../account/pages/client_orders/detailed_order/detailed_order.dart';
import '../../../account/pages/followers/model/followers_model.dart';
import 'model/notification_model.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.6,
        title: Text(
          'Notification'.tr,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: FutureBuilder<NotificationModel?>(
        future: ConstantActions.getNotifications(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            if (snapshot.data!.notifications!.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Container(
                  height: SizeConfig.screenHeight,
                  width: SizeConfig.screenWidth,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 0.5,
                        blurRadius: 2,
                        offset: const Offset(
                          0,
                          3,
                        ),
                      ),
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 0.5,
                        blurRadius: 2,
                        offset: const Offset(
                          3,
                          0,
                        ),
                      ),
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 0.5,
                        blurRadius: 2,
                        offset: const Offset(
                          0,
                          -3,
                        ),
                      ),
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 0.5,
                        blurRadius: 2,
                        offset: const Offset(
                          -3,
                          0,
                        ),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemCount: snapshot.data!.notifications!.length,
                      separatorBuilder: (context, index) => const Divider(
                        indent: 20,
                        endIndent: 20,
                      ),
                      itemBuilder: (context, index) => NotificationItem(
                        onTap: () {
                          if (snapshot.data!.notifications![index]
                                      .notificationNameFlag ==
                                  1 ||
                              snapshot.data!.notifications![index]
                                      .notificationNameFlag ==
                                  4 ||
                              snapshot.data!.notifications![index]
                                      .notificationNameFlag ==
                                  5 ||
                              snapshot.data!.notifications![index]
                                      .notificationNameFlag ==
                                  6) {
                            Get.to(() => DetailedOrder(
                                      orderId: snapshot
                                          .data!.notifications![index].basedId
                                          .toString(),
                                    ))!
                                .then((value) => setState(() {}));
                          } else if (snapshot.data!.notifications![index]
                                      .notificationNameFlag ==
                                  2 ||
                              snapshot.data!.notifications![index]
                                      .notificationNameFlag ==
                                  3) {
                            Get.to(() => Followers())!
                                .then((value) => setState(() {}));
                          } else if (snapshot.data!.notifications![index]
                                      .notificationNameFlag ==
                                  7 ||
                              snapshot.data!.notifications![index]
                                      .notificationNameFlag ==
                                  8) {
                            Get.to(() => const FollowStores());
                          } else if (snapshot.data!.notifications![index]
                                  .notificationNameFlag ==
                              9) {
                            Get.to(() => const ClientOrders());
                          } else if (snapshot.data!.notifications![index]
                                  .notificationNameFlag ==
                              10) {
                            setState(() {
                              BaseWidgetState.bottomNavIndex.value = 1;
                            });
                            Get.back();
                          }
                          ConstantActions.readNotifications(
                              notificationId: snapshot
                                  .data!.notifications![index].id
                                  .toString());
                        },
                        title:
                            snapshot.data!.notifications![index].readAt != null
                                ? Text(
                                    snapshot.data!.notifications![index]
                                            .notificationDetails ??
                                        '',
                                    style: const TextStyle(
                                        color: AppColor.globalBorderColor),
                                  )
                                : Text(
                                    snapshot.data!.notifications![index]
                                            .notificationDetails ??
                                        '',
                                    style: const TextStyle(
                                        color: AppColor.globalDefaultColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                        body: Text(
                            snapshot.data!.notifications![index].createdAt ??
                                ''),
                      ),
                    ),
                  ),
                ),
              );
            }
            return Center(
              child: Text(
                'There is no notifications'.tr,
                style: TextStyle(
                  fontSize: 21,
                  color: Colors.black.withOpacity(0.2),
                ),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: LoadingAnimationWidget.stretchedDots(
                color: AppColor.globalDefaultColor,
                size: 40,
              ),
            );
          }
          return Center(
              child: Text(
            'Something went wrong'.tr,
            style: TextStyle(
              color: Colors.black.withOpacity(0.4),
              fontSize: 23,
            ),
          ));
        },
      ),
    ));
  }
}
