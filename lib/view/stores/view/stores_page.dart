import 'package:albausalah_app/shared/components/widgets/button/button.dart';
import 'package:albausalah_app/view/base/base_widget.dart';
import 'package:albausalah_app/view/stores/controller/stores_controller.dart';
import 'package:albausalah_app/view/stores/store_page/view/store_page.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../res/assets_res.dart';
import '../../../shared/components/actions/actions.dart';
import '../../../shared/components/constants/style/color.dart';
import '../../../shared/components/widgets/store_item/store_item.dart';
import '../../../shared/components/widgets/text_filed/text_form_filed_widget.dart';
import '../../category/view/category_page.dart';

class Stores extends GetWidget<StoresController> {
  const Stores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 100,
      ),
      child: Obx(() => controller.storesModel.value == null ||
              controller.historyProductModel.value == null
          ? Center(
              child: LoadingAnimationWidget.stretchedDots(
              color: AppColor.globalDefaultColor,
              size: 40,
            ))
          : ListView(
              padding: const EdgeInsets.only(
                top: 5,
              ),
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 10,
                    left: 10,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 7,
                          ),
                          child: DefaultFormField(
                            onTap: () {
                              BaseWidgetState.visible.value = false;
                            },
                            onSubmit: (value) {
                              BaseWidgetState.visible.value = true;
                            },
                            onChange: (value) {
                              controller.getStores(search: value);
                            },
                            maxLines: 1,
                            minLines: 1,
                            prefixIcon: Icons.search_rounded,
                            hint: 'Search for the store'.tr,
                            isPassword: false,
                            enabled: true,
                            readOnly: false,
                            radius: 15,
                            autofocus: false,
                            focusBorderColor: Colors.grey[700]!,
                            textColor: AppColor.globalDefaultColor,
                            filled: false,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 58,
                          width: 50,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            border: Border.all(
                              width: 0.4,
                              color: Colors.grey[700]!,
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              Get.to(() => const CategoryPage());
                            },
                            child: const Center(
                              child: Icon(
                                color: Colors.black87,
                                size: 18,
                                FontAwesomeIcons.filter,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
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
                    itemCount: controller.storesModel.value!.stores!.length,
                    itemBuilder: (context, index) {
                      return StoreItem(
                        isAuthenticated: controller.storesModel.value!
                                        .stores![index].authenticatedStatus ==
                                    null ||
                                controller.storesModel.value!.stores![index]
                                        .authenticatedStatus ==
                                    "Not Authenticated"
                            ? false
                            : true,
                        followWidget: Padding(
                          padding: const EdgeInsets.only(
                            right: 15,
                            left: 15,
                          ),
                          child: controller.storesModel.value!.stores![index]
                                  .followStore!
                              ? InkWell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0))),
                                            scrollable: true,
                                            title: Text(
                                              'Confirmation'.tr,
                                            ),
                                            content: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
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
                                                      .storesModel
                                                      .value!
                                                      .stores![index]
                                                      .followStoreItem = false;
                                                  controller.storesModel
                                                      .refresh();
                                                  ConstantActions.followStores(
                                                      controller
                                                          .storesModel
                                                          .value!
                                                          .stores![index]
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
                                                textColor: Colors.black,
                                                background: Colors.grey[400]!,
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
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: AppColor.globalDefaultColor,
                                    ),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0))),
                                            scrollable: true,
                                            title: Text(
                                              'Confirmation'.tr,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            content: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Do you want to follow this store'
                                                    .tr,
                                                style: const TextStyle(
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
                                                      .storesModel
                                                      .value!
                                                      .stores![index]
                                                      .followStoreItem = true;
                                                  controller.storesModel
                                                      .refresh();
                                                  ConstantActions.followStores(
                                                      controller
                                                          .storesModel
                                                          .value!
                                                          .stores![index]
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
                                                textColor: Colors.black,
                                                background: Colors.grey[400]!,
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
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.grey[200],
                                    ),
                                    child:  Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                            isFavorite: controller.storesModel.value!
                                .stores![index].wishlistStore,
                            valueChanged: (isFavorite) {
                              ConstantActions.addRemoveStoreWishlist(controller
                                  .storesModel.value!.stores![index].id
                                  .toString());
                            },
                            //
                          ),
                        ),
                        heightContainer: 150,
                        nameShop: controller
                            .storesModel.value!.stores![index].storeName,
                        location: controller
                            .storesModel.value!.stores![index].storeLocation,
                        image: controller
                            .storesModel.value!.stores![index].profilePhotoUrl,
                        rate: double.parse(controller
                            .storesModel.value!.stores![index].storeReview!),
                        widthBorder: 0.9,
                        onTap: () {
                          Get.to(
                            () => const StorePage(),
                            arguments: [
                              controller.storesModel.value!.stores![index].id,
                              controller.storesModel.value!.stores![index]
                                  .followStore,
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            )),
    );
  }
}
