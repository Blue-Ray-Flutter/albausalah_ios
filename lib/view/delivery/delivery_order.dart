import 'package:albausalah_app/shared/components/constants/style/color.dart';
import 'package:albausalah_app/shared/components/widgets/header_widget/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../shared/components/widgets/client_order_finished_item/client_order_finished_item.dart';
import '../../../../shared/components/widgets/client_order_unfinished_item/client_order_unfinished_item.dart';
import '../../../../shared/components/widgets/size_config/size_config.dart';
import 'controller/delivery_controller.dart';

class DeliveryOrder extends GetWidget<DeliveryOrderController> {
  const DeliveryOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 95,
                ),
                child: Obx(() {
                  return controller.deliveryOrderModel.value == null
                      ? Center(
                          child: LoadingAnimationWidget.stretchedDots(
                            color: AppColor.globalDefaultColor,
                            size: 40,
                          ),
                        )
                      : Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                              ),
                              child: Container(
                                height: 60,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TabBar(
                                    onTap: (value) {
                                      // controller.index.value = value;
                                    },
                                    indicatorColor: Colors.white,
                                    indicator: const BoxDecoration(
                                        color: AppColor.globalDefaultColor,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        )),
                                    labelColor: Colors.white,
                                    unselectedLabelColor:
                                        AppColor.globalDefaultColor,
                                    overlayColor: MaterialStateProperty.all(
                                      AppColor.globalDefaultColor,
                                    ),
                                    tabs: [
                                      Tab(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              width: 0.8,
                                              color:
                                                  AppColor.globalDefaultColor,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Finished'.tr,
                                              style: const TextStyle(
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Tab(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              width: 0.8,
                                              color:
                                                  AppColor.globalDefaultColor,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Unfinished'.tr,
                                              style: const TextStyle(
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                physics: const ScrollPhysics(),
                                children: [
                                  Obx(
                                    () => controller.deliveryOrderModel.value!
                                            .finishOrders!.isEmpty
                                        ? Center(
                                            child: Text(
                                              'There are no orders'.tr,
                                              style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.4),
                                                fontSize: 20,
                                              ),
                                            ),
                                          )
                                        : ListView.separated(
                                            separatorBuilder:
                                                (context, index) =>
                                                    const SizedBox(
                                              height: 10,
                                            ),
                                            physics: const ScrollPhysics(),
                                            scrollDirection: Axis.vertical,
                                            shrinkWrap: true,
                                            padding: const EdgeInsets.only(
                                              top: 20,
                                              left: 5,
                                              right: 5,
                                              bottom: 30,
                                            ),
                                            itemCount: controller
                                                .deliveryOrderModel
                                                .value!
                                                .finishOrders!
                                                .length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 15,
                                                ),
                                                child: ClientOrderFinishedItem(
                                                  onPressed: () {
                                                    // Get.to(() => DetailedOrder(
                                                    //       orderId: controller
                                                    //           .clientOrderModel
                                                    //           .value!
                                                    //           .finishOrders![index]
                                                    //           .id
                                                    //           .toString(),
                                                    //     ));
                                                  },
                                                  status: controller
                                                          .deliveryOrderModel
                                                          .value!
                                                          .finishOrders![index]
                                                          .status ??
                                                      '',
                                                  phone: '',
                                                  price: controller
                                                          .deliveryOrderModel
                                                          .value!
                                                          .finishOrders![index]
                                                          .subTotal ??
                                                      '',
                                                  onTap: () {},
                                                  address: '',
                                                  name: '',
                                                  date: '',
                                                  productNumber: controller
                                                      .deliveryOrderModel
                                                      .value!
                                                      .finishOrders![index]
                                                      .productCount
                                                      .toString(),
                                                  totalPrice: controller
                                                          .deliveryOrderModel
                                                          .value!
                                                          .finishOrders![index]
                                                          .endTotal ??
                                                      '',
                                                ),
                                              );
                                            },
                                          ),
                                  ),
                                  Obx(
                                    () => controller.deliveryOrderModel.value!
                                            .pendingOrders!.isEmpty
                                        ? Center(
                                            child: Text(
                                              'There are no orders'.tr,
                                              style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.4),
                                                fontSize: 20,
                                              ),
                                            ),
                                          )
                                        : ListView.separated(
                                            separatorBuilder:
                                                (context, index) =>
                                                    const SizedBox(
                                              height: 10,
                                            ),
                                            physics: const ScrollPhysics(),
                                            scrollDirection: Axis.vertical,
                                            shrinkWrap: true,
                                            padding: const EdgeInsets.only(
                                              top: 20,
                                              left: 5,
                                              right: 5,
                                              bottom: 30,
                                            ),
                                            itemCount: controller
                                                .deliveryOrderModel
                                                .value!
                                                .pendingOrders!
                                                .length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 15,
                                                ),
                                                child:
                                                    ClientOrderUnFinishedItem(
                                                  haveRejectedButton: false,
                                                  onTapViewOrder: () {
                                                    // Get.to(() => DetailedOrder(
                                                    //       orderId: controller
                                                    //           .clientOrderModel
                                                    //           .value!
                                                    //           .pendingOrders![index]
                                                    //           .id
                                                    //           .toString(),
                                                    //     ));
                                                  },
                                                  status: controller
                                                          .deliveryOrderModel
                                                          .value!
                                                          .pendingOrders![index]
                                                          .status ??
                                                      '',
                                                  phone: '',
                                                  price: controller
                                                          .deliveryOrderModel
                                                          .value!
                                                          .pendingOrders![index]
                                                          .subTotal ??
                                                      '',
                                                  onTapAcceptOrder: () {
                                                    controller.acceptOrder(
                                                        controller
                                                            .deliveryOrderModel
                                                            .value!
                                                            .pendingOrders![
                                                                index]
                                                            .id
                                                            .toString());
                                                    controller
                                                        .deliveryOrderModel
                                                        .value = null;

                                                    Future.delayed(
                                                        const Duration(
                                                            milliseconds: 500),
                                                        () {
                                                      controller
                                                          .getMyDeliveryOrders();
                                                    });
                                                  },
                                                  address: '',
                                                  name: '',
                                                  date: '',
                                                  productNumber: controller
                                                      .deliveryOrderModel
                                                      .value!
                                                      .pendingOrders![index]
                                                      .productCount
                                                      .toString(),
                                                  totalPrice: controller
                                                          .deliveryOrderModel
                                                          .value!
                                                          .pendingOrders![index]
                                                          .endTotal ??
                                                      '',
                                                  onTapRejectOrder: () {
                                                    controller.rejectOrder(
                                                        controller
                                                            .deliveryOrderModel
                                                            .value!
                                                            .pendingOrders![
                                                                index]
                                                            .id
                                                            .toString());
                                                    controller
                                                        .deliveryOrderModel
                                                        .value = null;

                                                    Future.delayed(
                                                        const Duration(
                                                            milliseconds: 500),
                                                        () {
                                                      controller
                                                          .getMyDeliveryOrders();
                                                    });
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                  ),

                                  // Customer(),
                                  // Merchant(),
                                ],
                              ),
                            ),
                          ],
                        );
                }),
              ),
              HeaderWidget(
                onPressed: () {},
                centerTitle: true,
                containerSize: 100,
                title: 'Delivery Orders'.tr,
                haveMore: true,
                haveFav: false,
                haveBack: false,
                haveLocation: false,
                haveLogo: false,
                haveCart: false,
                haveSearch: false,
                haveNotification: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
