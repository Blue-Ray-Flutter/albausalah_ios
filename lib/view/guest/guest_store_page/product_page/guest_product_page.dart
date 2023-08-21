import 'package:albausalah_app/res/assets_res.dart';
import 'package:albausalah_app/shared/components/actions/actions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_add_to_cart_button/flutter_add_to_cart_button.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../shared/components/constants/style/color.dart';
import '../../../../shared/components/widgets/button/button.dart';
import '../../../../shared/components/widgets/button/counter_button.dart';
import '../../../../shared/components/widgets/item_pic/item_pic.dart';
import '../../../../shared/components/widgets/size_config/size_config.dart';
import 'controller/guest_product_controller.dart';

class GuestProductPage extends GetWidget<GuestProductController> {
  const GuestProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, // <-- SEE HERE
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.6,
        title: Text(
          'Product Page'.tr,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Obx(() {
        return controller.singleProductModel.value == null ||
                controller.productColorModel.value == null ||
                controller.productSizeModel.value == null
            ? Center(
                child: LoadingAnimationWidget.stretchedDots(
                color: AppColor.globalDefaultColor,
                size: 40,
              ))
            : SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              height: 300,
                              width: SizeConfig.screenWidth,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: controller.singleProductModel.value!
                                              .data!.singleProduct!.image ==
                                          null
                                      ? const DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              AssetsRes.PLACE_HOLDER),
                                        )
                                      : DecorationImage(
                                          fit: BoxFit.fill,
                                          image: CachedNetworkImageProvider(
                                            controller.index.value > -1
                                                ? controller
                                                    .singleProductModel
                                                    .value!
                                                    .data!
                                                    .otherImages![
                                                        controller.index.value]
                                                    .image!
                                                : controller
                                                    .singleProductModel
                                                    .value!
                                                    .data!
                                                    .singleProduct!
                                                    .image!,
                                            errorListener: () => const Image(
                                              image: AssetImage(
                                                  AssetsRes.PLACE_HOLDER),
                                            ),
                                          ),
                                        ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey[200]!.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.all(10.0),
                            //   child: FavoriteButton(
                            //     iconSize: 38,
                            //     isFavorite: controller.singleProductModel.value!
                            //         .data!.wishlistProduct!,
                            //     valueChanged: (isFavorite) {
                            //       addRemoveProductWishlist(controller
                            //           .singleProductModel
                            //           .value!
                            //           .data!
                            //           .singleProduct!
                            //           .id
                            //           .toString());
                            //     },
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      Obx(() {
                        return controller.singleProductModel.value!.data!
                                        .otherImages ==
                                    null ||
                                controller.singleProductModel.value!.data!
                                    .otherImages!.isEmpty
                            ? Container()
                            : Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    height: 100,
                                    child: ListView.separated(
                                        padding: const EdgeInsets.only(
                                          top: 5,
                                          bottom: 5,
                                          right: 10,
                                          left: 5,
                                        ),
                                        clipBehavior: Clip.hardEdge,
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) =>
                                            ItemPic(
                                              onTap: () {
                                                controller.index.value = index;
                                              },
                                              imagePath: controller
                                                  .singleProductModel
                                                  .value!
                                                  .data!
                                                  .otherImages![index]
                                                  .image!,
                                              borderColor: controller
                                                          .index.value ==
                                                      index
                                                  ? AppColor.globalDefaultColor
                                                  : Colors.white,
                                            ),
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(width: 5),
                                        itemCount: controller.singleProductModel
                                            .value!.data!.otherImages!.length),
                                  ),
                                ],
                              );
                      }),
                      const SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        subtitle: Text(
                          controller.singleProductModel.value!.data!
                                  .singleProduct!.categoryName ??
                              '',
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        title: Text(
                          controller.singleProductModel.value!.data!
                              .singleProduct!.name!,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        trailing: RatingBar.builder(
                          ignoreGestures: true,
                          glow: false,
                          updateOnDrag: false,
                          itemSize: 15,
                          initialRating: double.parse(controller
                              .singleProductModel
                              .value!
                              .data!
                              .singleProduct!
                              .productReview!),
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          itemCount: 5,
                          tapOnlyMode: true,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemPadding: const EdgeInsets.symmetric(
                            horizontal: 1.0,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: Text(
                          'SKU:${controller.singleProductModel.value!.data!.singleProduct!.sku}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ListTile(
                        title: Text(
                          'Color '.tr,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller
                              .productColorModel.value!.colors!.length,
                          itemBuilder: (context, index) => SizedBox(
                            width: 105,
                            child: Obx(() {
                              return RadioListTile(
                                activeColor: AppColor.globalDefaultColor,
                                contentPadding: const EdgeInsets.all(0),
                                title: Text(controller.productColorModel.value!
                                    .colors![index].name!),
                                value: controller.productColorModel.value!
                                    .colors![index].id!,
                                groupValue:
                                    int.parse(controller.colorProduct.value),
                                onChanged: (value) {
                                  controller.colorProduct.value =
                                      value.toString();
                                },
                              );
                            }),
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Size '.tr,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              controller.productSizeModel.value!.sizes!.length,
                          itemBuilder: (context, index) => SizedBox(
                            width: 120,
                            child: Obx(() {
                              return RadioListTile(
                                activeColor: AppColor.globalDefaultColor,
                                contentPadding: const EdgeInsets.all(0),
                                title: Text(controller.productSizeModel.value!
                                    .sizes![index].name!),
                                value: controller
                                    .productSizeModel.value!.sizes![index].id!,
                                groupValue:
                                    int.parse(controller.sizeProduct.value),
                                onChanged: (value) {
                                  controller.sizeProduct.value =
                                      value.toString();
                                },
                              );
                            }),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: Text(
                          textAlign: TextAlign.center,
                          controller.singleProductModel.value!.data!
                              .singleProduct!.description!,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          child: CounterButton(
                            count: controller.numberItem.value,
                            onChange: (int value) {
                              if (value < 0) {
                                controller.numberItem.value = 0;
                              } else {
                                controller.numberItem.value = value;
                              }
                            },
                            loading: false,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: Text(
                          controller.singleProductModel.value!.data!
                              .singleProduct!.salePrice!,
                          style: const TextStyle(
                            color: AppColor.globalDefaultColor,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(() {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: AddToCartButton(
                              trolley: const Icon(
                                Icons.shopping_cart_rounded,
                                color: Colors.white,
                              ),
                              text: Text(
                                'Add to cart'.tr,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                              ),
                              check: const SizedBox(
                                width: 48,
                                height: 48,
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                              borderRadius: BorderRadius.circular(24),
                              backgroundColor: AppColor.globalDefaultColor,
                              onPressed: (id) async {
                                if (id == AddToCartButtonStateId.idle &&
                                    controller.colorProduct.value != '0' &&
                                    controller.sizeProduct.value != '0' &&
                                    controller.numberItem.value > 0) {
                                  //handle logic when pressed on idle state button.
                                  controller.stateId.value =
                                      AddToCartButtonStateId.loading;

                                  await ConstantActions.guestAddToCart(
                                    productId: controller.singleProductModel
                                        .value!.data!.singleProduct!.id!
                                        .toString(),
                                    colorId: controller.colorProduct.value,
                                    sizeId: controller.sizeProduct.value,
                                    quantity:
                                        controller.numberItem.value.toString(),
                                    deviceId: await FlutterUdid.udid,
                                    storeId: controller.singleProductModel
                                        .value!.data!.singleProduct!.storeId
                                        .toString(),
                                  );

                                  // await addToCart(
                                  //   colorId: controller.colorProduct.value,
                                  //   productId: controller.singleProductModel
                                  //       .value!.data!.singleProduct!.id!
                                  //       .toString(),
                                  //   quantity:
                                  //       controller.numberItem.value.toString(),
                                  //   sizeId: controller.sizeProduct.value,
                                  // );
                                  Future.delayed(const Duration(seconds: 3),
                                      () {
                                    controller.stateId.value =
                                        AddToCartButtonStateId.done;
                                  });
                                } else if (id == AddToCartButtonStateId.done) {
                                  // handle logic when pressed on done state button.
                                  controller.stateId.value =
                                      AddToCartButtonStateId.idle;
                                } else {
                                  Get.snackbar(
                                    'Add to cart'.tr,
                                    'Please fill all required fields'.tr,
                                    icon: const Icon(
                                      Icons.error,
                                      color: Colors.white,
                                    ),
                                    snackPosition: SnackPosition.TOP,
                                    backgroundColor:
                                        AppColor.globalDefaultColor,
                                    borderRadius: 15,
                                    margin: const EdgeInsets.all(15),
                                    colorText: Colors.white,
                                    duration: const Duration(seconds: 2),
                                    isDismissible: true,
                                    dismissDirection:
                                        DismissDirection.horizontal,
                                    forwardAnimationCurve: Curves.easeInBack,
                                  );
                                }
                              },
                              stateId: controller.stateId.value,
                            ),
                          ),
                        );
                      }),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Button(
                          borderColor: AppColor.globalDefaultColor,
                          textColor: AppColor.globalDefaultColor,
                          background: Colors.white,
                          radius: 50,
                          height: 45,
                          borderWidth: 0.8,
                          onPressed: () {},
                          text: 'propose a suggested price'.tr,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ]),
              );
      }),
    ));
  }
}
