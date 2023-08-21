import 'package:albausalah_app/shared/components/constants/style/color.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:loading_icon_button/loading_icon_button.dart';

import '../../../../shared/components/widgets/client_order_finished_item/client_order_finished_item.dart';
import '../../../../shared/components/widgets/client_order_unfinished_item/client_order_unfinished_item.dart';
import '../../../../shared/components/widgets/size_config/size_config.dart';
import 'controller/client_orders_controller.dart';
import 'detailed_order/detailed_order.dart';

class ClientOrders extends GetWidget<ClientOrderController> {
  const ClientOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            iconTheme: IconThemeData(
              color: Colors.grey[600],
            ),
            title:  Text(
              'Client Orders'.tr,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            elevation: 0,
          ),
          backgroundColor: Colors.white,
          body: Obx(() {
            return controller.clientOrderModel.value == null ||
                    controller.deliveryStaffModel.value == null
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
                              unselectedLabelColor: AppColor.globalDefaultColor,
                              overlayColor: MaterialStateProperty.all(
                                AppColor.globalDefaultColor,
                              ),
                              tabs: [
                                Tab(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        width: 0.8,
                                        color: AppColor.globalDefaultColor,
                                      ),
                                    ),
                                    child:  Center(
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
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        width: 0.8,
                                        color: AppColor.globalDefaultColor,
                                      ),
                                    ),
                                    child:  Center(
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
                          physics: const BouncingScrollPhysics(),
                          children: [
                            Obx(
                              () => controller.clientOrderModel.value!
                                      .finishOrders!.isEmpty
                                  ? Center(
                                      child: Text(
                                        'There are no orders'.tr,
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(0.4),
                                          fontSize: 20,
                                        ),
                                      ),
                                    )
                                  : ListView.separated(
                                      separatorBuilder: (context, index) =>
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
                                      itemCount: controller.clientOrderModel
                                          .value!.finishOrders!.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 15,
                                          ),
                                          child: ClientOrderFinishedItem(
                                            onPressed: () {
                                              Get.to(() => DetailedOrder(
                                                    orderId: controller
                                                        .clientOrderModel
                                                        .value!
                                                        .finishOrders![index]
                                                        .id
                                                        .toString(),
                                                  ));
                                            },
                                            status: controller
                                                    .clientOrderModel
                                                    .value!
                                                    .finishOrders![index]
                                                    .status ??
                                                '',
                                            phone: controller
                                                    .clientOrderModel
                                                    .value!
                                                    .finishOrders![index]
                                                    .customer!
                                                    .phone ??
                                                '',
                                            price: controller
                                                    .clientOrderModel
                                                    .value!
                                                    .finishOrders![index]
                                                    .subTotal ??
                                                '',
                                            onTap: () {},
                                            address: controller
                                                    .clientOrderModel
                                                    .value!
                                                    .finishOrders![index]
                                                    .customer!
                                                    .addressEn ??
                                                '',
                                            name: controller
                                                    .clientOrderModel
                                                    .value!
                                                    .finishOrders![index]
                                                    .customer!
                                                    .name ??
                                                '',
                                            date: controller
                                                    .clientOrderModel
                                                    .value!
                                                    .finishOrders![index]
                                                    .createdAt ??
                                                '',
                                            productNumber: controller
                                                .clientOrderModel
                                                .value!
                                                .finishOrders![index]
                                                .productCount
                                                .toString(),
                                            totalPrice: controller
                                                    .clientOrderModel
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
                              () =>
                                  controller.clientOrderModel.value!
                                          .pendingOrders!.isEmpty
                                      ? Center(
                                          child: Text(
                                            'There are no orders'.tr,
                                            style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.4),
                                              fontSize: 20,
                                            ),
                                          ),
                                        )
                                      : ListView.separated(
                                          separatorBuilder: (context, index) =>
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
                                          itemCount: controller.clientOrderModel
                                              .value!.pendingOrders!.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 15,
                                              ),
                                              child: ClientOrderUnFinishedItem(
                                                onTapViewOrder: () {
                                                  Get.to(() => DetailedOrder(
                                                        orderId: controller
                                                            .clientOrderModel
                                                            .value!
                                                            .pendingOrders![
                                                                index]
                                                            .id
                                                            .toString(),
                                                      ));
                                                },
                                                status: controller
                                                        .clientOrderModel
                                                        .value!
                                                        .pendingOrders![index]
                                                        .status ??
                                                    '',
                                                phone: controller
                                                        .clientOrderModel
                                                        .value!
                                                        .pendingOrders![index]
                                                        .customer!
                                                        .phone ??
                                                    '',
                                                price: controller
                                                        .clientOrderModel
                                                        .value!
                                                        .pendingOrders![index]
                                                        .subTotal ??
                                                    '',
                                                onTapAcceptOrder: () {
                                                  showModalBottomSheet(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                      ),
                                                      context: context,
                                                      builder: (builder) {
                                                        return Container(
                                                            height: SizeConfig
                                                                    .screenHeight *
                                                                0.4,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15)),
                                                            child: ListView(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                top: 20,
                                                                bottom: 20,
                                                                right: 10,
                                                                left: 10,
                                                              ),
                                                              children: [
                                                                Text(
                                                                  'Choose Delivery *'.tr
                                                                      .tr,
                                                                  style:
                                                                      const TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  height: 20,
                                                                ),
                                                                Center(
                                                                  child:
                                                                      CoolDropdown(
                                                                    resultWidth:
                                                                        SizeConfig
                                                                            .screenWidth,
                                                                    dropdownItemPadding:
                                                                        const EdgeInsets
                                                                            .all(5),
                                                                    dropdownItemGap:
                                                                        5,
                                                                    dropdownHeight:
                                                                        200,
                                                                    dropdownList: controller
                                                                        .deliveryStaffModel
                                                                        .value!
                                                                        .employees!
                                                                        .map(
                                                                            (e) {
                                                                      return {
                                                                        'label':
                                                                            e.name,
                                                                        'value':
                                                                            e.id
                                                                      };
                                                                    }).toList(),
                                                                    defaultValue: {
                                                                      'label':
                                                                          'Choose the delivery employee *'.tr
                                                                              .tr,
                                                                      'value': 0
                                                                    },
                                                                    isAnimation:
                                                                        true,
                                                                    isResultLabel:
                                                                        true,
                                                                    onChange:
                                                                        (value) {
                                                                      controller
                                                                              .value
                                                                              .value =
                                                                          value[
                                                                              'value'];
                                                                    },
                                                                    dropdownItemReverse:
                                                                        true,
                                                                    dropdownItemMainAxis:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    resultMainAxis:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    dropdownWidth:
                                                                        200,
                                                                    labelIconGap:
                                                                        5,
                                                                    resultTS:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                    unselectedItemTS:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                    resultIcon:
                                                                        const Icon(
                                                                      Icons
                                                                          .arrow_drop_down_outlined,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  height: 50,
                                                                ),
                                                                Center(
                                                                  child:
                                                                      ArgonButton(
                                                                    height: 50,
                                                                    roundLoadingShape:
                                                                        true,
                                                                    width: SizeConfig
                                                                        .screenWidth,
                                                                    onTap: (startLoading,
                                                                        stopLoading,
                                                                        btnState) async {
                                                                      if (controller
                                                                              .value
                                                                              .value >
                                                                          0) {
                                                                        controller
                                                                            .acceptOrder(
                                                                          orderId: controller
                                                                              .clientOrderModel
                                                                              .value!
                                                                              .pendingOrders![index]
                                                                              .id
                                                                              .toString(),
                                                                          deliveryUserId: controller
                                                                              .value
                                                                              .value
                                                                              .toString(),
                                                                        );

                                                                        controller
                                                                            .clientOrderModel
                                                                            .value = null;

                                                                        Future.delayed(
                                                                            const Duration(milliseconds: 500),
                                                                            () {
                                                                          controller
                                                                              .getClientOrders();
                                                                        });

                                                                        // controller
                                                                        //     .assignDelivery(
                                                                        //   deliveryUserId:
                                                                        //
                                                                        //   controller
                                                                        //       .value
                                                                        //       .value
                                                                        //       .toString(),
                                                                        //   saleId: controller
                                                                        //       .clientOrderModel
                                                                        //       .value!
                                                                        //       .pendingOrders![
                                                                        //           index]
                                                                        //       .id
                                                                        //       .toString(),
                                                                        // );
                                                                        Get.back();
                                                                      } else {
                                                                        Get.snackbar(
                                                                          'Field required'.tr,
                                                                          'Please Enter required field'.tr,
                                                                          icon:
                                                                              const Icon(
                                                                            Icons.error,
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                          snackPosition:
                                                                              SnackPosition.TOP,
                                                                          backgroundColor:
                                                                              AppColor.globalDefaultColor,
                                                                          borderRadius:
                                                                              15,
                                                                          margin:
                                                                              const EdgeInsets.all(15),
                                                                          colorText:
                                                                              Colors.white,
                                                                          duration:
                                                                              const Duration(seconds: 2),
                                                                          isDismissible:
                                                                              true,
                                                                          dismissDirection:
                                                                              DismissDirection.horizontal,
                                                                          forwardAnimationCurve:
                                                                              Curves.easeOutBack,
                                                                        );
                                                                        await stopLoading();
                                                                      }

                                                                      Future.delayed(
                                                                          const Duration(
                                                                              seconds: 3),
                                                                          () {
                                                                        stopLoading();
                                                                      });
                                                                    },
                                                                    loader:
                                                                        const Center(
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          Colors
                                                                              .white,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    borderRadius:
                                                                        15,
                                                                    color: AppColor
                                                                        .globalDefaultColor,
                                                                    child: Text(
                                                                      'Choose'.tr,
                                                                      style:
                                                                          const TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            16,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ));
                                                      });
                                                },
                                                address: controller
                                                        .clientOrderModel
                                                        .value!
                                                        .pendingOrders![index]
                                                        .customer!
                                                        .addressEn ??
                                                    '',
                                                name: controller
                                                        .clientOrderModel
                                                        .value!
                                                        .pendingOrders![index]
                                                        .customer!
                                                        .name ??
                                                    '',
                                                date: controller
                                                        .clientOrderModel
                                                        .value!
                                                        .pendingOrders![index]
                                                        .createdAt ??
                                                    '',
                                                productNumber: controller
                                                    .clientOrderModel
                                                    .value!
                                                    .pendingOrders![index]
                                                    .productCount
                                                    .toString(),
                                                totalPrice: controller
                                                        .clientOrderModel
                                                        .value!
                                                        .pendingOrders![index]
                                                        .endTotal ??
                                                    '',
                                                onTapRejectOrder: () {
                                                  controller.rejectOrder(
                                                      controller
                                                          .clientOrderModel
                                                          .value!
                                                          .pendingOrders![index]
                                                          .id
                                                          .toString());
                                                  controller.clientOrderModel
                                                      .value = null;

                                                  Future.delayed(
                                                      const Duration(
                                                          milliseconds: 500),
                                                      () {
                                                    controller
                                                        .getClientOrders();
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
      ),
    );
  }
}
