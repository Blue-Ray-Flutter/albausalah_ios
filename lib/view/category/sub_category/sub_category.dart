import 'package:albausalah_app/res/assets_res.dart';
import 'package:albausalah_app/shared/components/widgets/size_config/size_config.dart';
import 'package:albausalah_app/shared/components/widgets/store_item/store_item.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../shared/components/actions/actions.dart';
import '../../../shared/components/constants/style/color.dart';
import '../../stores/store_page/view/store_page.dart';
import 'controller/sub_category_controller.dart';

class SubCategoryPage extends GetWidget<SubCategoryController> {
  const SubCategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, // <-- SEE HERE
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.6,
        title: Text(
          'Stores'.tr,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Obx(() {
        return controller.subCategoryModel.value == null ||
                controller.categoryStoresModel.value == null
            ? Center(
                child: LoadingAnimationWidget.stretchedDots(
                  color: AppColor.globalDefaultColor,
                  size: 40,
                ),
              )
            : SingleChildScrollView(
                child: SafeArea(
                  child: DefaultTabController(
                    length: controller
                        .subCategoryModel.value!.subCategories!.length,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 10,
                        ),
                        Obx(() {
                          return controller.subCategoryModel.value!
                                  .subCategories!.isEmpty
                              ? SizedBox(
                                  height: 50,
                                  child: Center(
                                      child: Text(
                                    'There is no sub category'.tr,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[500],
                                    ),
                                  )),
                                )
                              : ButtonsTabBar(
                                  height: 50,
                                  onTap: (value) {
                                    controller.getSubCategoryStores(controller
                                        .subCategoryModel
                                        .value!
                                        .subCategories![value]
                                        .id
                                        .toString());
                                  },
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                  ),
                                  backgroundColor: AppColor.globalDefaultColor,
                                  unselectedBackgroundColor: Colors.grey[300],
                                  unselectedLabelStyle:
                                      const TextStyle(color: Colors.black),
                                  labelStyle: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  tabs: controller
                                      .subCategoryModel.value!.subCategories!
                                      .map((e) {
                                    return Tab(
                                      text: e.name,
                                    );
                                  }).toList(),
                                );
                        }),

                        Obx(() {
                          return controller
                                  .categoryStoresModel.value!.stores!.isEmpty
                              ? SizedBox(
                                  height: SizeConfig.screenHeight * 0.8,
                                  child: Center(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        clipBehavior: Clip.hardEdge,
                                        width: 200,
                                        height: 220,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            opacity: 0.2,
                                            image: AssetImage(
                                              AssetsRes.NOT_FOUND,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        'There Are No Products'.tr,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[500]!
                                              .withOpacity(0.4),
                                        ),
                                      ),
                                    ],
                                  )),
                                )
                              : SizedBox(
                                  height: 620,
                                  child: GridView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: controller.categoryStoresModel
                                        .value!.stores!.length,
                                    padding: const EdgeInsets.only(
                                      top: 20,
                                      bottom: 40,
                                      left: 20,
                                      right: 20,
                                    ),
                                    itemBuilder: (context, index) => StoreItem(
                                      followWidget: Container(),
                                      heightContainer: 120,
                                      nameShop: controller.categoryStoresModel
                                          .value!.stores![index].name,
                                      location: controller.categoryStoresModel
                                          .value!.stores![index].storeLocation,
                                      image: controller
                                          .categoryStoresModel
                                          .value!
                                          .stores![index]
                                          .profilePhotoUrl,
                                      rate: double.parse(controller
                                          .categoryStoresModel
                                          .value!
                                          .stores![index]
                                          .storeReview!),
                                      onTap: () {
                                        Get.to(() => const StorePage(),
                                            arguments: [
                                              controller.categoryStoresModel
                                                  .value!.stores![index].id
                                                  .toString(),
                                              controller
                                                  .categoryStoresModel
                                                  .value!
                                                  .stores![index]
                                                  .followStore
                                            ]);
                                      },
                                      widget: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: FavoriteButton(
                                          iconSize: 38,
                                          isFavorite: controller
                                              .categoryStoresModel
                                              .value!
                                              .stores![index]
                                              .wishlistStore,
                                          valueChanged: (isFavorite) {
                                            ConstantActions
                                                .addRemoveStoreWishlist(
                                                    controller
                                                        .categoryStoresModel
                                                        .value!
                                                        .stores![index]
                                                        .id
                                                        .toString());
                                          },
                                          //
                                        ),
                                      ),
                                    ),
                                    gridDelegate:
                                        const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 300,
                                      childAspectRatio: 3 / 4.5,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                    ),
                                  ),
                                );
                        }),

                        // const Expanded(
                        //   child: TabBarView(
                        //     children: <Widget>[
                        //       Center(
                        //         child: Icon(Icons.directions_car),
                        //       ),
                        //       Center(
                        //         child: Icon(Icons.directions_transit),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              );
      }),
    );
  }
}
