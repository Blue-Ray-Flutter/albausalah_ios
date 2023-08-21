import 'package:albausalah_app/shared/components/actions/actions.dart';
import 'package:albausalah_app/view/stores/store_page/view/store_page.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../res/assets_res.dart';
import '../../../../shared/components/constants/style/color.dart';
import '../../../../shared/components/widgets/button/button.dart';
import '../../../../shared/components/widgets/store_item/store_item.dart';
import '../../../../shared/components/widgets/text_filed/text_form_filed_widget.dart';
import '../../../category/view/category_page.dart';
import 'offer_controller/offer_controller.dart';

class OfferStores extends GetWidget<OfferController> {
  const OfferStores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, // <-- SEE HERE
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.6,
        title:  Text(
          'Offer Stores'.tr,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Obx(() {
        return controller.mostSellingStoresModel.value == null
            ? Center(
                child: LoadingAnimationWidget.stretchedDots(
                color: AppColor.globalDefaultColor,
                size: 40,
              ))
            : Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 75,
                    ),
                    child: Obx(
                      () => controller
                              .mostSellingStoresModel.value!.stores!.isEmpty
                          ? Center(
                              child: Text(
                                'There are no stores'.tr,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.4),
                                  fontSize: 20,
                                ),
                              ),
                            )
                          : SizedBox(
                              child: GridView.builder(
                                physics: const ScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                padding: const EdgeInsets.only(
                                  top: 5,
                                  bottom: 40,
                                  left: 10,
                                  right: 10,
                                ),
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 300,
                                  childAspectRatio: 3 / 4.5,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 15,
                                ),
                                itemCount: controller.mostSellingStoresModel
                                    .value!.stores!.length,
                                itemBuilder: (context, index) {
                                  return StoreItem(
                                    isAuthenticated: controller
                                                    .mostSellingStoresModel
                                                    .value!
                                                    .stores![index]
                                                    .authenticatedStatus ==
                                                null ||
                                            controller
                                                    .mostSellingStoresModel
                                                    .value!
                                                    .stores![index]
                                                    .authenticatedStatus ==
                                                "Not Authenticated"
                                        ? false
                                        : true,
                                    followWidget: Padding(
                                      padding: const EdgeInsets.only(
                                        right: 15,
                                        left: 15,
                                      ),
                                      child: controller
                                              .mostSellingStoresModel
                                              .value!
                                              .stores![index]
                                              .followStore!
                                          ? InkWell(
                                              onTap: () {
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        shape: const RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        10.0))),
                                                        scrollable: true,
                                                        title: Text(
                                                          'Confirmation'.tr,
                                                        ),
                                                        content: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            'Are you sure you want to unfollow this store'
                                                                .tr,
                                                          ),
                                                        ),
                                                        actions: [
                                                          Button(
                                                            height: 40,
                                                            radius: 10,
                                                            onPressed: () {
                                                              controller
                                                                  .mostSellingStoresModel
                                                                  .value!
                                                                  .stores![
                                                                      index]
                                                                  .followStoreItem = false;
                                                              controller
                                                                  .mostSellingStoresModel
                                                                  .refresh();
                                                              ConstantActions
                                                                  .followStores(controller
                                                                      .mostSellingStoresModel
                                                                      .value!
                                                                      .stores![
                                                                          index]
                                                                      .id!
                                                                      .toString());
                                                              Get.back();
                                                            },
                                                            text: 'Yes'.tr,
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          Button(
                                                            textColor:
                                                                Colors.black,
                                                            background: Colors
                                                                .grey[400]!,
                                                            height: 40,
                                                            radius: 10,
                                                            onPressed: () {
                                                              Get.back();
                                                            },
                                                            text: 'No'.tr,
                                                          ),
                                                        ],
                                                      );
                                                    });
                                              },
                                              child: Container(
                                                height: 40,
                                                padding:
                                                    const EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: AppColor
                                                      .globalDefaultColor,
                                                ),
                                                child: Center(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Following'.tr,
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      const ImageIcon(
                                                        size: 18,
                                                        color: Colors.white,
                                                        AssetImage(
                                                          AssetsRes.FOLLOWING,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          : InkWell(
                                              onTap: () {
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        shape: const RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        10.0))),
                                                        scrollable: true,
                                                        title: Text(
                                                          'Confirmation'.tr,
                                                          style:
                                                              const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        content: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            'Do you want to follow this store'
                                                                .tr,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ),
                                                        actions: [
                                                          Button(
                                                            height: 40,
                                                            radius: 10,
                                                            onPressed: () {
                                                              controller
                                                                  .mostSellingStoresModel
                                                                  .value!
                                                                  .stores![
                                                                      index]
                                                                  .followStoreItem = true;
                                                              controller
                                                                  .mostSellingStoresModel
                                                                  .refresh();
                                                              ConstantActions
                                                                  .followStores(controller
                                                                      .mostSellingStoresModel
                                                                      .value!
                                                                      .stores![
                                                                          index]
                                                                      .id!
                                                                      .toString());
                                                              Get.back();
                                                            },
                                                            text: 'Yes'.tr,
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          Button(
                                                            textColor:
                                                                Colors.black,
                                                            background: Colors
                                                                .grey[400]!,
                                                            height: 40,
                                                            radius: 10,
                                                            onPressed: () {
                                                              Get.back();
                                                            },
                                                            text: 'No'.tr,
                                                          ),
                                                        ],
                                                      );
                                                    });
                                              },
                                              child: Container(
                                                height: 40,
                                                padding:
                                                    const EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.grey[200],
                                                ),
                                                child:  Center(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Follow'.tr,
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      const ImageIcon(
                                                        size: 18,
                                                        color: Colors.black,
                                                        AssetImage(
                                                          AssetsRes.ADD_FOLLOW,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                    ),
                                    widget: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: FavoriteButton(
                                        iconSize: 38,
                                        isFavorite: controller
                                            .mostSellingStoresModel
                                            .value!
                                            .stores![index]
                                            .wishlistStore,
                                        valueChanged: (isFavorite) {
                                          ConstantActions
                                              .addRemoveStoreWishlist(controller
                                                  .mostSellingStoresModel
                                                  .value!
                                                  .stores![index]
                                                  .id
                                                  .toString());
                                        },
                                        //
                                      ),
                                    ),
                                    heightContainer: 150,
                                    nameShop: controller.mostSellingStoresModel
                                        .value!.stores![index].storeName,
                                    location: controller.mostSellingStoresModel
                                        .value!.stores![index].storeLocation,
                                    image: controller.mostSellingStoresModel
                                        .value!.stores![index].profilePhotoUrl,
                                    rate: double.parse(controller
                                        .mostSellingStoresModel
                                        .value!
                                        .stores![index]
                                        .storeReview!),
                                    widthBorder: 0.9,
                                    onTap: () {
                                      Get.to(() => const StorePage(),
                                          arguments: [
                                            controller.mostSellingStoresModel
                                                .value!.stores![index].id,
                                            controller
                                                .mostSellingStoresModel
                                                .value!
                                                .stores![index]
                                                .followStore,
                                          ]);
                                    },
                                  );
                                },
                              ),
                            ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                      right: 20,
                      left: 20,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: DefaultFormField(
                            onTap: () {},
                            onSubmit: (value) {},
                            onChange: (value) {
                              controller.getOfferStores(search: value);
                            },
                            prefixIcon: Icons.search_rounded,
                            hint: 'Search for the store'.tr,
                            isPassword: false,
                            enabled: true,
                            readOnly: false,
                            radius: 15,
                            autofocus: false,
                            focusBorderColor: AppColor.globalDefaultColor,
                            textColor: AppColor.globalDefaultColor,
                            filled: false,
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => const CategoryPage());
                          },
                          child: Container(
                            height: 55,
                            width: 50,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                  width: 0.4,
                                  color: Colors.grey[700]!,
                                )),
                            child: const Center(
                              child: Icon(
                                color: Colors.black87,
                                size: 18,
                                FontAwesomeIcons.filter,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
      }),
    );
  }
}
