import 'package:albausalah_app/res/assets_res.dart';
import 'package:albausalah_app/view/guest/guest_store_page/product_page/guest_product_page.dart';
import 'package:albausalah_app/view/login/view/login_page.dart';
import 'package:albausalah_app/view/stores/pages/about_store/about_store.dart';
import 'package:albausalah_app/view/welcome/welcome_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../shared/components/constants/style/color.dart';
import '../../../shared/components/widgets/button/button.dart';
import '../../../shared/components/widgets/product_item/product_item.dart';
import '../../../shared/components/widgets/size_config/size_config.dart';
import '../../../shared/components/widgets/text_filed/text_form_filed_widget.dart';
import 'controller/guest_store_page_controller.dart';

class GuestStorePage extends GetWidget<GuestStorePageController> {
  const GuestStorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return DefaultTabController(
      length: 4,
      child: SafeArea(
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
              'Store Page'.tr,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          body: Obx(() {
            return controller.productsModel.value == null ||
                    controller.storeReviewsModel.value == null ||
                    controller.storeSverviceModel.value == null ||
                    controller.myJobsModel.value == null
                ? Center(
                    child: LoadingAnimationWidget.stretchedDots(
                    color: AppColor.globalDefaultColor,
                    size: 40,
                  ))
                : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Stack(
                                alignment:
                                    controller.cacheUtils.getLanguage() == 'en'
                                        ? Alignment.topRight
                                        : Alignment.topLeft,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 2,
                                        color: Colors.grey[100]!,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey[200]!
                                              .withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: const Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 20,
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(100)),
                                                ),
                                                child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      top: 5,
                                                      bottom: 5,
                                                      right: 15,
                                                      left: 15,
                                                    ),
                                                    child: controller
                                                                .productsModel
                                                                .value!
                                                                .data!
                                                                .storeInfo!
                                                                .profilePhotoUrl ==
                                                            null
                                                        ? const CircleAvatar(
                                                            radius: 50,
                                                            backgroundColor:
                                                                Colors.white,
                                                            backgroundImage:
                                                                AssetImage(
                                                                    AssetsRes
                                                                        .MASK),
                                                          )
                                                        : CircleAvatar(
                                                            radius: 50,
                                                            backgroundColor:
                                                                Colors.white,
                                                            backgroundImage:
                                                                CachedNetworkImageProvider(
                                                              errorListener: () =>
                                                                  const Image(
                                                                      image: AssetImage(
                                                                          AssetsRes
                                                                              .PLACE_HOLDER)),
                                                              controller
                                                                  .productsModel
                                                                  .value!
                                                                  .data!
                                                                  .storeInfo!
                                                                  .profilePhotoUrl!,
                                                            ),
                                                          )),
                                              ),
                                              Expanded(
                                                  child: Text(
                                                controller
                                                        .productsModel
                                                        .value!
                                                        .data!
                                                        .storeInfo!
                                                        .storeNameEn ??
                                                    '',
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              )),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              right: 10,
                                              left: 10,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                    child: InkWell(
                                                  onTap: () {
                                                    Get.to(() => AboutStore(
                                                          storeId: controller
                                                              .storeId
                                                              .toString(),
                                                        ));
                                                  },
                                                  child: Container(
                                                    height: 45,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Colors.grey[200],
                                                    ),
                                                    child: Center(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'About US'.tr,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          const Icon(
                                                            Icons.info_outline,
                                                            size: 18,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                )),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: InkWell(
                                                    onTap: () {
                                                      Get.to(() =>
                                                          const LoginPage());
                                                    },
                                                    child: Container(
                                                      height: 45,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color: Colors.grey[200],
                                                      ),
                                                      child: Center(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              'Follow'.tr,
                                                              style:
                                                                  const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 14,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            const ImageIcon(
                                                              size: 18,
                                                              color:
                                                                  Colors.black,
                                                              AssetImage(
                                                                AssetsRes
                                                                    .ADD_FOLLOW,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          const Divider(
                                            height: 1,
                                            indent: 20,
                                            endIndent: 20,
                                            color: AppColor.globalDefaultColor,
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                            height: 50,
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(1.0),
                                              child: TabBar(
                                                onTap: (value) {
                                                  // controller.index.value = value;
                                                },
                                                indicatorColor: Colors.white,
                                                indicator: const BoxDecoration(
                                                    color: AppColor
                                                        .globalDefaultColor,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(10),
                                                    )),
                                                labelColor: Colors.white,
                                                unselectedLabelColor:
                                                    AppColor.globalDefaultColor,
                                                overlayColor:
                                                    MaterialStateProperty.all(
                                                  AppColor.globalDefaultColor,
                                                ),
                                                tabs: [
                                                  Tab(
                                                    child: Text(
                                                      'All Product'.tr,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ),
                                                  Tab(
                                                    child: Text(
                                                      'Reviews'.tr,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ),
                                                  Tab(
                                                    child: Text(
                                                      'Services'.tr,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ),
                                                  Tab(
                                                    child: Text(
                                                      'Jobs'.tr,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: IconButton(
                                          onPressed: () {
                                            Get.offAll(
                                                () => const WelcomePage());
                                            // showModalBottomSheet(
                                            //     shape: RoundedRectangleBorder(
                                            //       borderRadius:
                                            //       BorderRadius.circular(
                                            //           15.0),
                                            //     ),
                                            //     context: context,
                                            //     builder: (builder) {
                                            //       return Container(
                                            //           height: SizeConfig
                                            //               .screenHeight *
                                            //               0.6,
                                            //           decoration: BoxDecoration(
                                            //               borderRadius:
                                            //               BorderRadius
                                            //                   .circular(
                                            //                   15)),
                                            //           child: Form(
                                            //             key: controller
                                            //                 .fromAddNewMessageKey,
                                            //             child: ListView(
                                            //               padding:
                                            //               const EdgeInsets
                                            //                   .only(
                                            //                 top: 20,
                                            //                 bottom: 20,
                                            //                 right: 10,
                                            //                 left: 10,
                                            //               ),
                                            //               children: [
                                            //                 const Text(
                                            //                   'Your message *',
                                            //                   style: TextStyle(
                                            //                     color: Colors
                                            //                         .black,
                                            //                     fontSize: 15,
                                            //                     fontWeight:
                                            //                     FontWeight
                                            //                         .bold,
                                            //                   ),
                                            //                 ),
                                            //                 const SizedBox(
                                            //                   height: 10,
                                            //                 ),
                                            //                 DefaultFormField(
                                            //                   validator:
                                            //                       (message) {
                                            //                     if (message ==
                                            //                         null ||
                                            //                         message
                                            //                             .isEmpty) {
                                            //                       return 'Message password is required *';
                                            //                     }
                                            //                     return null;
                                            //                   },
                                            //                   controller: controller
                                            //                       .messageController,
                                            //                   minLines: 5,
                                            //                   maxLines: 10,
                                            //                   hint:
                                            //                   'Write your message',
                                            //                   borderColors: AppColor
                                            //                       .globalDefaultColor,
                                            //                   isPassword: false,
                                            //                   enabled: true,
                                            //                   readOnly: false,
                                            //                   radius: 15,
                                            //                   autofocus: false,
                                            //                   focusBorderColor:
                                            //                   AppColor
                                            //                       .globalDefaultColor,
                                            //                   textColor: AppColor
                                            //                       .globalDefaultColor,
                                            //                   filled: false,
                                            //                 ),
                                            //                 const SizedBox(
                                            //                   height: 10,
                                            //                 ),
                                            //                 const Text(
                                            //                   'Upload your file*',
                                            //                   style: TextStyle(
                                            //                     color: Colors
                                            //                         .black,
                                            //                     fontSize: 15,
                                            //                     fontWeight:
                                            //                     FontWeight
                                            //                         .bold,
                                            //                   ),
                                            //                 ),
                                            //                 const SizedBox(
                                            //                   height: 10,
                                            //                 ),
                                            //                 Row(
                                            //                   children: [
                                            //                     Expanded(
                                            //                       child:
                                            //                       DefaultFormField(
                                            //                         controller:
                                            //                         controller
                                            //                             .fileController,
                                            //                         hint:
                                            //                         'Your file',
                                            //                         hintStyle:
                                            //                         const TextStyle(
                                            //                           overflow:
                                            //                           TextOverflow
                                            //                               .ellipsis,
                                            //                         ),
                                            //                         isPassword:
                                            //                         false,
                                            //                         enabled:
                                            //                         true,
                                            //                         readOnly:
                                            //                         true,
                                            //                         radius: 15,
                                            //                         autofocus:
                                            //                         false,
                                            //                         focusBorderColor:
                                            //                         AppColor
                                            //                             .globalDefaultColor,
                                            //                         textColor:
                                            //                         AppColor
                                            //                             .globalDefaultColor,
                                            //                         filled:
                                            //                         false,
                                            //                       ),
                                            //                     ),
                                            //                     const SizedBox(
                                            //                       width: 10,
                                            //                     ),
                                            //                     Expanded(
                                            //                       child: Center(
                                            //                         child:
                                            //                         LoadingButton(
                                            //                           height:
                                            //                           40,
                                            //                           borderRadius:
                                            //                           10,
                                            //                           primaryColor:
                                            //                           Colors
                                            //                               .grey[300],
                                            //                           showBox:
                                            //                           controller
                                            //                               .show,
                                            //                           child:
                                            //                           Text(
                                            //                             'Upload',
                                            //                             style:
                                            //                             TextStyle(
                                            //                               color:
                                            //                               Colors.black,
                                            //                             ),
                                            //                           ),
                                            //                           //  iconData: PhosphorIcons.googleLogo,
                                            //                           onPressed:
                                            //                               () {
                                            //                             Future.delayed(
                                            //                                 const Duration(seconds: 1),
                                            //                                     () async {
                                            //                                   await controller
                                            //                                       .openFileExplorer();
                                            //                                   controller.isDoneUpload.value
                                            //                                       ? controller.btnController.success()
                                            //                                       : controller.btnController.stop();
                                            //                                 });
                                            //                           },
                                            //                           successIcon:
                                            //                           Icons
                                            //                               .done_outline_rounded,
                                            //                           controller:
                                            //                           controller
                                            //                               .btnController,
                                            //                         ),
                                            //                       ),
                                            //                     ),
                                            //                   ],
                                            //                 ),
                                            //                 const SizedBox(
                                            //                   height: 10,
                                            //                 ),
                                            //                 Center(
                                            //                   child:
                                            //                   ArgonButton(
                                            //                     height: 50,
                                            //                     roundLoadingShape:
                                            //                     true,
                                            //                     width: SizeConfig
                                            //                         .screenWidth,
                                            //                     onTap: (startLoading,
                                            //                         stopLoading,
                                            //                         btnState) async {
                                            //                       startLoading();
                                            //                       if (controller
                                            //                           .fromAddNewMessageKey
                                            //                           .currentState!
                                            //                           .validate()) {
                                            //                         await controller
                                            //                             .createNewMessage();
                                            //                         stopLoading();
                                            //                         Get.back();
                                            //                       } else {
                                            //                         Get.snackbar(
                                            //                           'Enter required',
                                            //                           'Please Enter required field',
                                            //                           icon:
                                            //                           const Icon(
                                            //                             Icons
                                            //                                 .error,
                                            //                             color: Colors
                                            //                                 .white,
                                            //                           ),
                                            //                           snackPosition:
                                            //                           SnackPosition
                                            //                               .TOP,
                                            //                           backgroundColor:
                                            //                           AppColor
                                            //                               .globalDefaultColor,
                                            //                           borderRadius:
                                            //                           15,
                                            //                           margin:
                                            //                           const EdgeInsets.all(
                                            //                               15),
                                            //                           colorText:
                                            //                           Colors
                                            //                               .white,
                                            //                           duration: const Duration(
                                            //                               seconds:
                                            //                               2),
                                            //                           isDismissible:
                                            //                           true,
                                            //                           dismissDirection:
                                            //                           DismissDirection
                                            //                               .horizontal,
                                            //                           forwardAnimationCurve:
                                            //                           Curves
                                            //                               .easeOutBack,
                                            //                         );
                                            //                         await stopLoading();
                                            //                       }
                                            //
                                            //                       Future.delayed(
                                            //                           const Duration(
                                            //                               seconds:
                                            //                               3),
                                            //                               () {
                                            //                             stopLoading();
                                            //                           });
                                            //                     },
                                            //                     loader:
                                            //                     const Center(
                                            //                       child:
                                            //                       CircularProgressIndicator(
                                            //                         valueColor:
                                            //                         AlwaysStoppedAnimation<
                                            //                             Color>(
                                            //                           Colors
                                            //                               .white,
                                            //                         ),
                                            //                       ),
                                            //                     ),
                                            //                     child:
                                            //                     const Text(
                                            //                       "Send",
                                            //                       style:
                                            //                       TextStyle(
                                            //                         color: Colors
                                            //                             .white,
                                            //                         fontSize:
                                            //                         16,
                                            //                       ),
                                            //                     ),
                                            //                     borderRadius:
                                            //                     15,
                                            //                     color: AppColor
                                            //                         .globalDefaultColor,
                                            //                   ),
                                            //                 ),
                                            //               ],
                                            //             ),
                                            //           ));
                                            //     });
                                          },
                                          icon: const Icon(
                                              CupertinoIcons.chat_bubble_text),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight - 105,
                          child: TabBarView(
                            physics: const ScrollPhysics(),
                            children: [
                              Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  Obx(
                                    () => controller.productsModel.value!.data!
                                            .showProducts!.isEmpty
                                        ? Center(
                                            child: Text(
                                              'There are no products'.tr,
                                              style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.4),
                                                fontSize: 20,
                                              ),
                                            ),
                                          )
                                        : Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                            ),
                                            child: Stack(
                                              alignment: Alignment.topCenter,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 120,
                                                  ),
                                                  child: GridView.builder(
                                                    physics:
                                                        const ScrollPhysics(),
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    shrinkWrap: true,
                                                    padding:
                                                        const EdgeInsets.only(
                                                      top: 20,
                                                      left: 5,
                                                      right: 5,
                                                      bottom: 30,
                                                    ),
                                                    gridDelegate:
                                                        const SliverGridDelegateWithMaxCrossAxisExtent(
                                                      maxCrossAxisExtent: 250,
                                                      childAspectRatio: 2 / 3.7,
                                                      crossAxisSpacing: 15,
                                                      mainAxisSpacing: 15,
                                                    ),
                                                    itemCount: controller
                                                        .productsModel
                                                        .value!
                                                        .data!
                                                        .showProducts!
                                                        .length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return ProductItem(
                                                        favWidget: Container(
                                                          height: 35,
                                                          width: 35,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .grey[200],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100),
                                                          ),
                                                          child: Center(
                                                            child:
                                                                FavoriteButton(
                                                              iconSize: 25,
                                                              isFavorite: controller
                                                                  .productsModel
                                                                  .value!
                                                                  .data!
                                                                  .showProducts![
                                                                      index]
                                                                  .wishlistProduct,
                                                              iconDisabledColor:
                                                                  Colors.grey,
                                                              valueChanged:
                                                                  (isFavorite) {
                                                                Get.offAll(() =>
                                                                    const WelcomePage());
                                                                // addRemoveProductWishlist(controller
                                                                //     .productsModel
                                                                //     .value!
                                                                //     .data!
                                                                //     .showProducts![
                                                                // index]
                                                                //     .id
                                                                //     .toString());
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                        name: controller
                                                            .productsModel
                                                            .value!
                                                            .data!
                                                            .showProducts![
                                                                index]
                                                            .name,
                                                        body: controller
                                                            .productsModel
                                                            .value!
                                                            .data!
                                                            .showProducts![
                                                                index]
                                                            .description,
                                                        image: controller
                                                            .productsModel
                                                            .value!
                                                            .data!
                                                            .showProducts![
                                                                index]
                                                            .image,
                                                        price: 25.0,
                                                        rate: double.parse(
                                                            controller
                                                                .productsModel
                                                                .value!
                                                                .data!
                                                                .showProducts![
                                                                    index]
                                                                .productReview!),
                                                        onTap: () {
                                                          Get.to(
                                                            () =>
                                                                const GuestProductPage(),
                                                            arguments: [
                                                              controller
                                                                  .productsModel
                                                                  .value!
                                                                  .data!
                                                                  .showProducts![
                                                                      index]
                                                                  .id
                                                                  .toString(),
                                                              controller.storeId
                                                                  .toString(),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 10,
                                      left: 10,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          'Search for the product name'.tr,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: DefaultFormField(
                                                onTap: () {},
                                                onSubmit: (value) {},
                                                onChange: (value) {
                                                  controller.getProducts(
                                                      search: value);
                                                },
                                                prefixIcon:
                                                    Icons.search_rounded,
                                                hint:
                                                    'Search for the product'.tr,
                                                isPassword: false,
                                                enabled: true,
                                                readOnly: false,
                                                radius: 15,
                                                autofocus: false,
                                                focusBorderColor:
                                                    AppColor.globalDefaultColor,
                                                textColor:
                                                    AppColor.globalDefaultColor,
                                                filled: false,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                    ),
                                                    context: context,
                                                    builder: (builder) {
                                                      return Padding(
                                                        padding: MediaQuery.of(
                                                                context)
                                                            .viewInsets,
                                                        child: Container(
                                                            height: SizeConfig
                                                                    .screenHeight *
                                                                0.8,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15)),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                horizontal: 15,
                                                              ),
                                                              child:
                                                                  SingleChildScrollView(
                                                                child: Form(
                                                                  key: controller
                                                                      .formKey,
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      const SizedBox(
                                                                        height:
                                                                            15,
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            'Sort by category'.tr,
                                                                            style:
                                                                                const TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: 20,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          const Icon(
                                                                            Icons.keyboard_arrow_down_rounded,
                                                                            color:
                                                                                AppColor.globalDefaultColor,
                                                                            size:
                                                                                28,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            15,
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            120,
                                                                        child: ListView
                                                                            .separated(
                                                                          itemCount:
                                                                              10,
                                                                          separatorBuilder: (context, index) =>
                                                                              const SizedBox(
                                                                            height:
                                                                                5,
                                                                          ),
                                                                          itemBuilder: (context, index) =>
                                                                              Obx(() {
                                                                            return CheckboxListTile(
                                                                              title: Text('Category $index'.tr),
                                                                              value: controller.isChecked1.value,
                                                                              onChanged: (bool? value) {
                                                                                controller.isChecked1.value = value!;
                                                                              },
                                                                            );
                                                                          }),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            30,
                                                                      ),
                                                                      Text(
                                                                        'Sort by price'
                                                                            .tr,
                                                                        style:
                                                                            const TextStyle(
                                                                          color:
                                                                              Colors.black,
                                                                          fontSize:
                                                                              20,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            15,
                                                                      ),
                                                                      Obx(() {
                                                                        return SfRangeSlider(
                                                                          min:
                                                                              0.0,
                                                                          max:
                                                                              100.0,
                                                                          values: controller
                                                                              .values
                                                                              .value,
                                                                          interval:
                                                                              20,
                                                                          showTicks:
                                                                              true,
                                                                          showLabels:
                                                                              true,
                                                                          enableTooltip:
                                                                              true,
                                                                          minorTicksPerInterval:
                                                                              1,
                                                                          onChanged:
                                                                              (SfRangeValues values) {
                                                                            controller.values.value =
                                                                                values;
                                                                          },
                                                                        );
                                                                      }),
                                                                      const SizedBox(
                                                                        height:
                                                                            15,
                                                                      ),
                                                                      Text(
                                                                        'Sort by'
                                                                            .tr,
                                                                        style:
                                                                            const TextStyle(
                                                                          color:
                                                                              Colors.black,
                                                                          fontSize:
                                                                              20,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            15,
                                                                      ),
                                                                      Obx(() {
                                                                        return Column(
                                                                          children: [
                                                                            RadioListTile(
                                                                              title: Text('Sort by average rating'.tr),
                                                                              value: 1,
                                                                              groupValue: controller.selectedValueStoreType.value,
                                                                              onChanged: (value) {
                                                                                controller.selectedValueStoreType.value = value!;
                                                                              },
                                                                            ),
                                                                            RadioListTile(
                                                                              title: Text('Sort by latest'.tr),
                                                                              value: 2,
                                                                              groupValue: controller.selectedValueStoreType.value,
                                                                              onChanged: (value) {
                                                                                controller.selectedValueStoreType.value = value!;
                                                                              },
                                                                            ),
                                                                            RadioListTile(
                                                                              title: Text('Sort by price: low to high'.tr),
                                                                              value: 3,
                                                                              groupValue: controller.selectedValueStoreType.value,
                                                                              onChanged: (value) {
                                                                                controller.selectedValueStoreType.value = value!;
                                                                              },
                                                                            ),
                                                                            RadioListTile(
                                                                              title: Text('Sort by price: high to low'.tr),
                                                                              value: 4,
                                                                              groupValue: controller.selectedValueStoreType.value,
                                                                              onChanged: (value) {
                                                                                controller.selectedValueStoreType.value = value!;
                                                                              },
                                                                            ),
                                                                          ],
                                                                        );
                                                                      }),
                                                                      Text(
                                                                        'Sort by'
                                                                            .tr,
                                                                        style:
                                                                            const TextStyle(
                                                                          color:
                                                                              Colors.black,
                                                                          fontSize:
                                                                              20,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            15,
                                                                      ),
                                                                      Obx(() {
                                                                        return Column(
                                                                          children: [
                                                                            CheckboxListTile(
                                                                              title: Text('Best seller'.tr),
                                                                              value: controller.isChecked1.value,
                                                                              onChanged: (bool? value) {
                                                                                controller.isChecked1.value = value!;
                                                                              },
                                                                            ),
                                                                            CheckboxListTile(
                                                                              title: Text('Offers'.tr),
                                                                              value: controller.isChecked2.value,
                                                                              onChanged: (bool? value) {
                                                                                controller.isChecked2.value = value!;
                                                                              },
                                                                            ),
                                                                          ],
                                                                        );
                                                                      }),
                                                                      const SizedBox(
                                                                        height:
                                                                            50,
                                                                      ),
                                                                      Button(
                                                                        height:
                                                                            50,
                                                                        radius:
                                                                            15,
                                                                        onPressed:
                                                                            () async {
                                                                          await controller
                                                                              .addStoreReview();
                                                                        },
                                                                        text: 'Send'
                                                                            .tr,
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            50,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            )),
                                                      );
                                                    });
                                              },
                                              child: Container(
                                                height: 55,
                                                width: 50,
                                                padding: const EdgeInsets.only(
                                                  top: 15,
                                                  bottom: 15,
                                                  right: 10,
                                                  left: 10,
                                                ),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
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
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Obx(
                                () => Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    controller.storeReviewsModel.value!
                                            .storeReviews!.isEmpty
                                        ? Center(
                                            child: Text(
                                              'There are no reviews'.tr,
                                              style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.4),
                                                fontSize: 20,
                                              ),
                                            ),
                                          )
                                        : Padding(
                                            padding: const EdgeInsets.only(
                                              right: 10,
                                              left: 10,
                                              top: 10,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                top: 60,
                                                left: 10,
                                                right: 10,
                                                bottom: 10,
                                              ),
                                              child: ListView.separated(
                                                itemBuilder: (context, index) =>
                                                    Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    border: Border.all(
                                                        width: 0.4,
                                                        color:
                                                            Colors.grey[200]!),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey[200]!
                                                            .withOpacity(0.2),
                                                        spreadRadius: 5,
                                                        blurRadius: 7,
                                                        offset: const Offset(0,
                                                            3), // changes position of shadow
                                                      ),
                                                    ],
                                                    color: Colors.white,
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 5,
                                                      vertical: 10,
                                                    ),
                                                    child: ListTile(
                                                      leading: controller
                                                                  .storeReviewsModel
                                                                  .value!
                                                                  .storeReviews![
                                                                      index]
                                                                  .customerImage ==
                                                              null
                                                          ? const CircleAvatar(
                                                              radius: 25,
                                                              backgroundColor:
                                                                  Colors.white,
                                                              backgroundImage:
                                                                  AssetImage(
                                                                AssetsRes
                                                                    .PROFILE,
                                                              ),
                                                            )
                                                          : CircleAvatar(
                                                              radius: 25,
                                                              backgroundColor:
                                                                  Colors.white,
                                                              backgroundImage:
                                                                  CachedNetworkImageProvider(controller
                                                                      .storeReviewsModel
                                                                      .value!
                                                                      .storeReviews![
                                                                          index]
                                                                      .customerImage!),
                                                            ),
                                                      trailing:
                                                          RatingBar.builder(
                                                        ignoreGestures: true,
                                                        glow: false,
                                                        updateOnDrag: false,
                                                        itemSize: 10,
                                                        initialRating: (controller
                                                                .storeReviewsModel
                                                                .value!
                                                                .storeReviews![
                                                                    index]
                                                                .reviewValue)!
                                                            .toDouble(),
                                                        direction:
                                                            Axis.horizontal,
                                                        allowHalfRating: true,
                                                        itemCount: 5,
                                                        tapOnlyMode: true,
                                                        itemBuilder:
                                                            (context, index) =>
                                                                const Icon(
                                                          Icons.star,
                                                          color: Colors.amber,
                                                        ),
                                                        itemPadding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 2.0,
                                                        ),
                                                        onRatingUpdate:
                                                            (rating) {},
                                                      ),
                                                      title: Text(controller
                                                              .storeReviewsModel
                                                              .value!
                                                              .storeReviews![
                                                                  index]
                                                              .customerName ??
                                                          ''),
                                                      subtitle: Text(controller
                                                              .storeReviewsModel
                                                              .value!
                                                              .storeReviews![
                                                                  index]
                                                              .reviewNote ??
                                                          ''),
                                                    ),
                                                  ),
                                                ),
                                                separatorBuilder:
                                                    (context, index) =>
                                                        const SizedBox(
                                                  height: 15,
                                                ),
                                                itemCount: controller
                                                    .storeReviewsModel
                                                    .value!
                                                    .storeReviews!
                                                    .length,
                                              ),
                                            ),
                                          ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                        top: 10,
                                        right: 20,
                                      ),
                                      child: Button(
                                        height: 50,
                                        radius: 15,
                                        onPressed: () {
                                          Get.offAll(() => const WelcomePage());
                                        },
                                        text: 'Add review'.tr,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Obx(
                                () => controller.storeSverviceModel.value!
                                        .storeInfo!.services!.isEmpty
                                    ? Center(
                                        child: Text(
                                          'There are no services'.tr,
                                          style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.4),
                                            fontSize: 20,
                                          ),
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.only(
                                          right: 10,
                                          left: 10,
                                          top: 10,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            bottom: 10,
                                          ),
                                          child: ListView.separated(
                                            itemBuilder: (context, index) =>
                                                Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                border: Border.all(
                                                    width: 0.4,
                                                    color: Colors.grey[200]!),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey[200]!
                                                        .withOpacity(0.2),
                                                    spreadRadius: 5,
                                                    blurRadius: 7,
                                                    offset: const Offset(0,
                                                        3), // changes position of shadow
                                                  ),
                                                ],
                                                color: Colors.white,
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 5,
                                                  vertical: 10,
                                                ),
                                                child: ListTile(
                                                  title: Text(controller
                                                          .storeSverviceModel
                                                          .value!
                                                          .storeInfo!
                                                          .services![index]
                                                          .titleEn ??
                                                      ''),
                                                ),
                                              ),
                                            ),
                                            separatorBuilder:
                                                (context, index) =>
                                                    const SizedBox(
                                              height: 15,
                                            ),
                                            itemCount: controller
                                                .storeSverviceModel
                                                .value!
                                                .storeInfo!
                                                .services!
                                                .length,
                                          ),
                                        ),
                                      ),
                              ),
                              Obx(
                                () => controller
                                        .myJobsModel.value!.jobs!.isEmpty
                                    ? Center(
                                        child: Text(
                                          'There are no jobs'.tr,
                                          style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.4),
                                            fontSize: 20,
                                          ),
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.only(
                                          right: 10,
                                          left: 10,
                                          top: 10,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            bottom: 10,
                                          ),
                                          child: ListView.separated(
                                            itemBuilder: (context, index) =>
                                                Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                border: Border.all(
                                                    width: 0.4,
                                                    color: Colors.grey[200]!),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey[200]!
                                                        .withOpacity(0.2),
                                                    spreadRadius: 5,
                                                    blurRadius: 7,
                                                    offset: const Offset(0,
                                                        3), // changes position of shadow
                                                  ),
                                                ],
                                                color: Colors.white,
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 5,
                                                  vertical: 5,
                                                ),
                                                child: Column(
                                                  children: [
                                                    ListTile(
                                                      title: Text(
                                                        controller
                                                                .myJobsModel
                                                                .value!
                                                                .jobs![index]
                                                                .title ??
                                                            '',
                                                      ),
                                                      subtitle: Text(
                                                        controller
                                                                .myJobsModel
                                                                .value!
                                                                .jobs![index]
                                                                .description ??
                                                            '',
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    controller.cacheUtils
                                                                .getUserType() ==
                                                            'Customer'.tr
                                                        ? Button(
                                                            radius: 15,
                                                            height: 40,
                                                            background: AppColor
                                                                .globalDefaultColor,
                                                            onPressed: () {},
                                                            text:
                                                                'Apply now'.tr,
                                                          )
                                                        : Container()
                                                  ],
                                                ),
                                              ),
                                            ),
                                            separatorBuilder:
                                                (context, index) =>
                                                    const SizedBox(
                                              height: 15,
                                            ),
                                            itemCount: controller
                                                .storeSverviceModel
                                                .value!
                                                .storeInfo!
                                                .services!
                                                .length,
                                          ),
                                        ),
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
          }),
        ),
      ),
    );
  }
}
