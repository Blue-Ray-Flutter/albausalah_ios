import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../shared/components/constants/style/color.dart';
import '../../../../shared/components/widgets/store_item/store_item.dart';
import '../../../../shared/components/widgets/text_filed/text_form_filed_widget.dart';
import '../guest_store_page.dart';
import 'controller/guest_stores_controller.dart';

class GuestStoresPage extends GetWidget<GuestStoresController> {
  const GuestStoresPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 100,
      ),
      child: Obx(() => controller.storesModel.value == null
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
              physics: const ScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 20,
                    left: 20,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: DefaultFormField(
                          onTap: () {
                            // setState(() {
                            //   visible = false;
                            // });
                          },
                          onSubmit: (value) {
                            // setState(() {
                            //   visible = true;
                            // });
                          },
                          onChange: (value) {
                            controller.getStores(search: value);
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
                      // const SizedBox(
                      //   width: 7,
                      // ),
                      // InkWell(
                      //   onTap: () {
                      //     Get.to(() => const CategoryPage());
                      //   },
                      //   child: Container(
                      //     height: 55,
                      //     width: 50,
                      //     padding: const EdgeInsets.all(10),
                      //     decoration: BoxDecoration(
                      //         color: Colors.white,
                      //         borderRadius:
                      //             const BorderRadius.all(Radius.circular(10)),
                      //         border: Border.all(
                      //           width: 0.4,
                      //           color: Colors.grey[700]!,
                      //         )),
                      //     child: const Center(
                      //       child: Icon(
                      //         color: Colors.black87,
                      //         size: 18,
                      //         FontAwesomeIcons.filter,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                SizedBox(
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
                    itemCount: controller.storesModel.value!.stores!.length,
                    itemBuilder: (context, index) {
                      return StoreItem(
                        followWidget: Container(),
                        // controller
                        //         .storesModel.value!.stores![index].followStore!
                        //     ? Button(
                        //         radius: 10,
                        //         background: AppColor.globalDefaultColor,
                        //         textColor: Colors.white,
                        //         height: 40,
                        //         width: 110,
                        //         onPressed: () {
                        //           controller.storesModel.value!.stores![index]
                        //               .followStoreItem = false;
                        //           controller.storesModel.refresh();
                        //           followStores(controller
                        //               .storesModel.value!.stores![index].id!
                        //               .toString());
                        //         },
                        //         text: 'Following',
                        //       )
                        //     : Button(
                        //         radius: 10,
                        //         background: Colors.white,
                        //         textColor: AppColor.globalDefaultColor,
                        //         height: 40,
                        //         width: 110,
                        //         onPressed: () {
                        //           controller.storesModel.value!.stores![index]
                        //               .followStoreItem = true;
                        //           controller.storesModel.refresh();
                        //           followStores(controller
                        //               .storesModel.value!.stores![index].id!
                        //               .toString());
                        //         },
                        //         text: 'Follow',
                        //       ),
                        widget: Container(),
                        // Padding(
                        //   padding: const EdgeInsets.all(5.0),
                        //   child: FavoriteButton(
                        //     iconSize: 38,
                        //     isFavorite: controller.storesModel.value!
                        //         .stores![index].wishlistStore,
                        //     valueChanged: (isFavorite) {
                        //       addRemoveStoreWishlist(controller
                        //           .storesModel.value!.stores![index].id
                        //           .toString());
                        //     },
                        //     //
                        //   ),
                        // ),
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
                          Get.to(() => const GuestStorePage(), arguments: [
                            controller.storesModel.value!.stores![index].id,
                            false,
                          ]);
                        },
                      );
                    },
                  ),
                ),
              ],
            )),
    );
    // Scaffold(
    //   backgroundColor: Colors.white,
    //   body: Stack(
    //     children: [
    //       Padding(
    //         padding: const EdgeInsets.only(
    //           top: 100,
    //         ),
    //         child: ListView(
    //           scrollDirection: Axis.vertical,
    //           physics: const ScrollPhysics(),
    //           children: [
    //             Padding(
    //               padding: const EdgeInsets.only(
    //                 right: 20,
    //                 left: 20,
    //               ),
    //               child: DefaultFormField(
    //                 onTap: () {
    //                   setState(() {
    //                     visible = false;
    //                   });
    //                 },
    //                 onSubmit: (value) {
    //                   setState(() {
    //                     visible = true;
    //                   });
    //                 },
    //                 prefixIcon: Icons.search_rounded,
    //                 hint: 'Search for the store',
    //                 isPassword: false,
    //                 enabled: true,
    //                 readOnly: false,
    //                 radius: 15,
    //                 autofocus: false,
    //                 focusBorderColor: AppColor.globalDefaultColor,
    //                 textColor: AppColor.globalDefaultColor,
    //                 filled: false,
    //               ),
    //             ),
    //             SizedBox(
    //               child: GridView.builder(
    //                 physics: const ScrollPhysics(),
    //                 scrollDirection: Axis.vertical,
    //                 shrinkWrap: true,
    //                 padding: const EdgeInsets.only(
    //                   bottom: 24,
    //                   top: 15,
    //                   left: 10,
    //                   right: 10,
    //                 ),
    //                 gridDelegate:
    //                     const SliverGridDelegateWithMaxCrossAxisExtent(
    //                   maxCrossAxisExtent: 300,
    //                   childAspectRatio: 3 / 4.5,
    //                   crossAxisSpacing: 10,
    //                   mainAxisSpacing: 15,
    //                 ),
    //                 itemCount: 20,
    //                 itemBuilder: (context, index) {
    //                   return StoreItem(
    //                     heightContainer: 150,
    //                     nameShop: 'nameShop',
    //                     location: 'location',
    //                     image: AssetsRes.MASK,
    //                     rate: 4,
    //                     widthBorder: 0.9,
    //                     onTap: () {
    //                       Get.to(() => const StorePage());
    //                     },
    //                   );
    //                 },
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //       // HeaderWidget(
    //       //   centerTitle: true,
    //       //   containerSize: 100,
    //       //   title: 'Stores',
    //       //   haveFav: false,
    //       //   haveBack: true,
    //       //   haveLocation: false,
    //       //   haveLogo: false,
    //       // ),
    //     ],
    //   ),
    // );
  }
}
