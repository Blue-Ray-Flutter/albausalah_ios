import 'package:albausalah_app/shared/components/constants/style/color.dart';
import 'package:albausalah_app/view/base/base_widget.dart';
import 'package:albausalah_app/view/category/sub_category/sub_category.dart';
import 'package:albausalah_app/view/home/controller/home_controller.dart';
import 'package:albausalah_app/view/home/pages/story/story.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../res/assets_res.dart';
import '../../../shared/components/actions/actions.dart';
import '../../../shared/components/constants/constant_data/constant_data.dart';
import '../../../shared/components/widgets/categorie_item/categorie_item.dart';
import '../../../shared/components/widgets/store_item/store_item.dart';
import '../../../shared/components/widgets/story_items/story_items.dart';
import '../../../shared/components/widgets/text_filed/text_form_filed_widget.dart';
import '../../stores/store_page/view/store_page.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.statusModel.value != null &&
              controller.sliderModel.value != null &&
              controller.categoryModel.value != null &&
              controller.storesModel.value != null
          ? Padding(
              padding: const EdgeInsets.only(
                top: 100,
              ),
              child: SingleChildScrollView(
                controller: controller.scrollController,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(() {
                      return controller
                              .statusModel.value!.storeWithStatus!.isEmpty
                          ? Container()
                          : SizedBox(
                              height: 72,
                              child: ListView.separated(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                  right: 5,
                                ),
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                itemCount: controller
                                    .statusModel.value!.storeWithStatus!.length,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(width: 10),
                                itemBuilder: (context, index) {
                                  return StoryItems(
                                    isLive: controller.statusModel.value!
                                        .storeWithStatus![index].isLive!,
                                    isView: controller.statusModel.value!
                                        .storeWithStatus![index].view!,
                                    image: controller
                                        .statusModel
                                        .value!
                                        .storeWithStatus![index]
                                        .profilePhotoUrl,
                                    onTap: () {
                                      controller
                                          .statusModel
                                          .value!
                                          .storeWithStatus![index]
                                          .viewStatus = true;
                                      controller.statusModel.refresh();
                                      Get.to(
                                        () => StoryPage(
                                          follow: controller
                                                  .statusModel
                                                  .value!
                                                  .storeWithStatus![index]
                                                  .followStore ??
                                              false,
                                          storeId: controller.statusModel.value!
                                              .storeWithStatus![index].id
                                              .toString(),
                                          image: controller
                                              .statusModel
                                              .value!
                                              .storeWithStatus![index]
                                              .profilePhotoUrl,
                                          storeStatuses: controller
                                              .statusModel
                                              .value!
                                              .storeWithStatus![index]
                                              .storeStatuses,
                                          onPressedFollow: () {
                                            controller
                                                .statusModel
                                                .value!
                                                .storeWithStatus![index]
                                                .followStoreItem = true;
                                            controller.storesModel.refresh();
                                            ConstantActions.followStores(
                                                controller.storesModel.value!
                                                    .stores![index].id!
                                                    .toString());
                                          },
                                          onPressedFollowing: () {
                                            controller
                                                .statusModel
                                                .value!
                                                .storeWithStatus![index]
                                                .followStoreItem = false;
                                            controller.storesModel.refresh();
                                            ConstantActions.followStores(
                                                controller.storesModel.value!
                                                    .stores![index].id!
                                                    .toString());
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            );
                    }),
                    SizedBox(
                      height: ConstantData.heightSpace,
                    ),
                    SizedBox(
                      height: 150,
                      child: CarouselSlider(
                        items: controller.sliderModel.value!.slider!.map((e) {
                          return Container(
                            height: 140,
                            margin: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: e.image!,
                              errorWidget: (context, url, error) => const Image(
                                  image: AssetImage(AssetsRes.PLACE_HOLDER)),
                              placeholder: (context, url) => const Image(
                                  image: AssetImage(AssetsRes.PLACE_HOLDER)),
                            ),
                          );
                        }).toList(),
                        options: CarouselOptions(
                          autoPlay: true,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          viewportFraction: 0.8,
                          aspectRatio: 16 / 9,
                          enlargeCenterPage: true,
                          height: 150,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ConstantData.heightSpace,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 15,
                        left: 15,
                      ),
                      child: Text(
                        'Categories'.tr,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ConstantData.heightSpace,
                    ),
                    SizedBox(
                      height: 120,
                      child: ListView.separated(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 5,
                        ),
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount:
                            controller.categoryModel.value!.category!.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 15),
                        itemBuilder: (context, index) {
                          return CategorieItem(
                            name: controller
                                .categoryModel.value!.category![index].name!,
                            image: controller
                                .categoryModel.value!.category![index].image,
                            onTap: () {
                              Get.to(() => const SubCategoryPage(),
                                  arguments: controller.categoryModel.value!
                                      .category![index].id!);
                            },
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: ConstantData.heightSpace,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 15,
                        left: 15,
                      ),
                      child: Text(
                        'Stores'.tr,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ConstantData.heightSpace,
                    ),
                    SizedBox(
                      height: 215,
                      child: ListView.separated(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 5,
                          top: 5,
                          bottom: 5,
                        ),
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: controller.storesModel.value!.stores!.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 10),
                        itemBuilder: (context, index) {
                          return StoreItem(
                            haveWidget: false,
                            followWidget: Container(),
                            widget: Container(),
                            valueChanged: (value) {},
                            isFav: true,
                            heightContainer: 120,
                            heightImage: 300,
                            widthImage: 150,
                            onTap: () {
                              Get.to(() => const StorePage(), arguments: [
                                controller.storesModel.value!.stores![index].id,
                                controller.storesModel.value!.stores![index]
                                    .followStore,
                              ]);
                            },
                            image: controller.storesModel.value!.stores![index]
                                .profilePhotoUrl,
                            nameShop: controller.storesModel.value!
                                    .stores![index].storeName ??
                                '',
                            location: controller.storesModel.value!
                                .stores![index].storeLocation,
                            rate: double.parse(controller.storesModel.value!
                                .stores![index].storeReview!),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: ConstantData.heightSpace,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 15,
                        left: 15,
                      ),
                      child: Text(
                        'Subscribe to our newsletter'.tr,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      height: 200,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        alignment: Alignment.topRight,
                        fit: BoxFit.fitHeight,
                        image: AssetImage(
                          AssetsRes.HOME_NEWSLETTER,
                        ),
                      )),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                right: 120,
                                left: 10,
                                bottom: 20,
                              ),
                              child: DefaultFormField(
                                havePrefix: false,
                                controller: controller.emailController,
                                hint: 'Enter email'.tr,
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8,
                                    right: 8,
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      controller.subscribeNewsletter();
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: AppColor.globalDefaultColor,
                                      ),
                                      child: const Center(
                                        child: Icon(
                                          size: 20,
                                          color: Colors.white,
                                          Icons.send,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                maxLines: 1,
                                minLines: 1,
                                maxLength: 100,
                                borderColors: Colors.grey[300],
                                isPassword: false,
                                enabled: true,
                                readOnly: false,
                                radius: 100,
                                autofocus: false,
                                focusBorderColor: Colors.grey[300]!,
                                textColor: AppColor.globalDefaultColor,
                                filled: true,
                                fillColor: Colors.grey[100],
                                onTap: () {
                                  BaseWidgetState.visible.value = false;
                                  controller.scrollToBottom();
                                },
                                onSubmit: (value) {
                                  BaseWidgetState.visible.value = true;
                                  controller.isOpen.value = false;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ))
          : Center(
              child: LoadingAnimationWidget.stretchedDots(
                color: AppColor.globalDefaultColor,
                size: 40,
              ),
            );
    });
  }
}
