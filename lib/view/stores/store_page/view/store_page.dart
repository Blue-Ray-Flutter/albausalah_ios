import 'package:albausalah_app/res/assets_res.dart';
import 'package:albausalah_app/view/stores/pages/about_store/about_store.dart';
import 'package:albausalah_app/view/stores/store_page/product_page/product_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:loading_icon_button/loading_icon_button.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../../shared/components/actions/actions.dart';
import '../../../../shared/components/constants/style/color.dart';
import '../../../../shared/components/widgets/button/button.dart';
import '../../../../shared/components/widgets/product_item/product_item.dart';
import '../../../../shared/components/widgets/size_config/size_config.dart';
import '../../../../shared/components/widgets/text_filed/text_form_filed_widget.dart';
import '../controller/store_page_controller.dart';

class StorePage extends GetWidget<StorePageController> {
  const StorePage({Key? key}) : super(key: key);

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
                    controller.myJobsModel.value == null ||
                    controller.storeCategoriesModel.value == null
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
                                                  child:
                                                      controller.storeId
                                                                  .value ==
                                                              controller
                                                                  .cacheUtils
                                                                  .getUID()
                                                                  .toString()
                                                          ? Container(
                                                              height: 45,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(10),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                color: Colors
                                                                    .grey[200],
                                                              ),
                                                              child: Center(
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      'Follow'
                                                                          .tr,
                                                                      style:
                                                                          const TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            14,
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                      width: 10,
                                                                    ),
                                                                    const ImageIcon(
                                                                      size: 18,
                                                                      color: Colors
                                                                          .black,
                                                                      AssetImage(
                                                                        AssetsRes
                                                                            .ADD_FOLLOW,
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                          : controller
                                                                  .followStore
                                                                  .value
                                                              ? InkWell(
                                                                  onTap: () {
                                                                    controller
                                                                        .followStore
                                                                        .value = false;
                                                                    ConstantActions.followStores(controller
                                                                        .storeId
                                                                        .value);
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height: 50,
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            10),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                      color: AppColor
                                                                          .globalDefaultColor,
                                                                    ),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            'Following'.tr,
                                                                            style:
                                                                                const TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 14,
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            width:
                                                                                10,
                                                                          ),
                                                                          const ImageIcon(
                                                                            size:
                                                                                18,
                                                                            color:
                                                                                Colors.white,
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
                                                                    controller
                                                                        .followStore
                                                                        .value = true;
                                                                    ConstantActions.followStores(controller
                                                                        .storeId
                                                                        .value);
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height: 45,
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            10),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                      color: Colors
                                                                              .grey[
                                                                          200],
                                                                    ),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            'Follow'.tr,
                                                                            style:
                                                                                const TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: 14,
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            width:
                                                                                10,
                                                                          ),
                                                                          const ImageIcon(
                                                                            size:
                                                                                18,
                                                                            color:
                                                                                Colors.black,
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
                                                physics:
                                                    const BouncingScrollPhysics(),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 1),
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
                                                      'All Products'.tr,
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
                                            showModalBottomSheet(
                                                constraints: BoxConstraints(
                                                  maxHeight:
                                                      SizeConfig.screenHeight *
                                                          0.8,
                                                ),
                                                isScrollControlled: true,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                ),
                                                context: context,
                                                builder: (builder) {
                                                  return Padding(
                                                    padding:
                                                        MediaQuery.of(context)
                                                            .viewInsets,
                                                    child: Container(
                                                        height: SizeConfig
                                                                .screenHeight *
                                                            0.6,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)),
                                                        child: Form(
                                                          key: controller
                                                              .fromAddNewMessageKey,
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
                                                                'Your message *'
                                                                    .tr,
                                                                style:
                                                                    const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              DefaultFormField(
                                                                validator:
                                                                    (message) {
                                                                  if (message ==
                                                                          null ||
                                                                      message
                                                                          .isEmpty) {
                                                                    return 'Message password is required *'
                                                                        .tr;
                                                                  }
                                                                  return null;
                                                                },
                                                                controller:
                                                                    controller
                                                                        .messageController,
                                                                minLines: 5,
                                                                maxLines: 10,
                                                                hint:
                                                                    'Write your message'
                                                                        .tr,
                                                                borderColors:
                                                                    AppColor
                                                                        .globalDefaultColor,
                                                                isPassword:
                                                                    false,
                                                                enabled: true,
                                                                readOnly: false,
                                                                radius: 15,
                                                                autofocus:
                                                                    false,
                                                                focusBorderColor:
                                                                    AppColor
                                                                        .globalDefaultColor,
                                                                textColor: AppColor
                                                                    .globalDefaultColor,
                                                                filled: false,
                                                              ),
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              Text(
                                                                'Upload your file*'
                                                                    .tr,
                                                                style:
                                                                    const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              Container(
                                                                height: 90,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                    color: AppColor
                                                                        .globalDefaultColor,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15),
                                                                ),
                                                                child: Row(
                                                                  children: [
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          DefaultFormField(
                                                                        borderColors:
                                                                            Colors.white,
                                                                        controller:
                                                                            controller.fileController,
                                                                        hint: 'Your file'
                                                                            .tr,
                                                                        hintStyle:
                                                                            const TextStyle(
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        ),
                                                                        isPassword:
                                                                            false,
                                                                        enabled:
                                                                            true,
                                                                        readOnly:
                                                                            true,
                                                                        radius:
                                                                            15,
                                                                        autofocus:
                                                                            false,
                                                                        focusBorderColor:
                                                                            Colors.white,
                                                                        textColor:
                                                                            AppColor.globalDefaultColor,
                                                                        filled:
                                                                            false,
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                      width: 10,
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.symmetric(horizontal: 5),
                                                                        child:
                                                                            SizedBox(
                                                                          height:
                                                                              50,
                                                                          child:
                                                                              ElevatedButton(
                                                                            style:
                                                                                ElevatedButton.styleFrom(
                                                                              backgroundColor: AppColor.globalDefaultColor,
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(15),
                                                                              ),
                                                                            ),

                                                                            child:
                                                                                Text(
                                                                              'Upload'.tr,
                                                                              style: const TextStyle(
                                                                                color: Colors.black,
                                                                              ),
                                                                            ),
                                                                            //  iconData: PhosphorIcons.googleLogo,
                                                                            onPressed:
                                                                                () {
                                                                              Future.delayed(const Duration(seconds: 1), () async {
                                                                                await controller.openFileExplorer();
                                                                              });
                                                                            },
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
                                                                        .fromAddNewMessageKey
                                                                        .currentState!
                                                                        .validate()) {
                                                                      ConstantActions
                                                                          .createNewMessage(
                                                                        message: controller
                                                                            .messageController
                                                                            .text,
                                                                        receiverId: controller
                                                                            .storeId
                                                                            .value,
                                                                        files: [],
                                                                      );
                                                                      Get.back();
                                                                    } else {
                                                                      Get.snackbar(
                                                                        'Field required'
                                                                            .tr,
                                                                        'Please Enter required fields'
                                                                            .tr,
                                                                        icon:
                                                                            const Icon(
                                                                          Icons
                                                                              .error,
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
                                                                    }
                                                                  },
                                                                  loader:
                                                                      const Center(
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
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
                                                                    'Send'.tr,
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
                                                          ),
                                                        )),
                                                  );
                                                });
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
                                                  padding: EdgeInsets.only(
                                                    top: controller.cacheUtils
                                                                .getLanguage() ==
                                                            "en"
                                                        ? 130
                                                        : 140,
                                                  ),
                                                  child: GridView.builder(
                                                    primary: false,
                                                    physics:
                                                        const BouncingScrollPhysics(),
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
                                                                ConstantActions.addRemoveProductWishlist(controller
                                                                    .productsModel
                                                                    .value!
                                                                    .data!
                                                                    .showProducts![
                                                                        index]
                                                                    .id
                                                                    .toString());
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
                                                                const ProductPage(),
                                                            arguments: [
                                                              controller
                                                                  .productsModel
                                                                  .value!
                                                                  .data!
                                                                  .showProducts![
                                                                      index]
                                                                  .id,
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
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            right: 10,
                                            left: 10,
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                flex: 5,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 7,
                                                  ),
                                                  child: DefaultFormField(
                                                    onTap: () {},
                                                    onSubmit: (value) {},
                                                    onChange: (value) {
                                                      controller.getProducts(
                                                          search: value);
                                                    },
                                                    maxLines: 1,
                                                    minLines: 1,
                                                    prefixIcon:
                                                        Icons.search_rounded,
                                                    hint:
                                                        'Search for the product'
                                                            .tr,
                                                    isPassword: false,
                                                    enabled: true,
                                                    readOnly: false,
                                                    radius: 15,
                                                    autofocus: false,
                                                    focusBorderColor:
                                                        Colors.grey[700]!,
                                                    textColor: AppColor
                                                        .globalDefaultColor,
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
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                    border: Border.all(
                                                      width: 0.4,
                                                      color: Colors.grey[700]!,
                                                    ),
                                                  ),
                                                  child: InkWell(
                                                    onTap: () {
                                                      showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          context: context,
                                                          builder: (builder) {
                                                            return Padding(
                                                              padding: MediaQuery
                                                                      .of(context)
                                                                  .viewInsets,
                                                              child: Container(
                                                                  height: SizeConfig
                                                                          .screenHeight *
                                                                      0.8,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15)),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .symmetric(
                                                                      horizontal:
                                                                          15,
                                                                    ),
                                                                    child:
                                                                        SingleChildScrollView(
                                                                      child:
                                                                          Form(
                                                                        key: controller
                                                                            .formKey,
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            const SizedBox(
                                                                              height: 15,
                                                                            ),
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                  'Sort by category'.tr,
                                                                                  style: const TextStyle(
                                                                                    color: Colors.black,
                                                                                    fontSize: 20,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                                ),
                                                                                const Icon(
                                                                                  Icons.keyboard_arrow_down_rounded,
                                                                                  color: AppColor.globalDefaultColor,
                                                                                  size: 28,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            const SizedBox(
                                                                              height: 15,
                                                                            ),
                                                                            SizedBox(
                                                                              height: 120,
                                                                              child: ListView.separated(
                                                                                itemCount: controller.storeCategoriesModel.value!.categories!.length,
                                                                                separatorBuilder: (context, index) => const SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                itemBuilder: (context, index) => Obx(() {
                                                                                  return CheckboxListTile(
                                                                                    title: Text(controller.storeCategoriesModel.value!.categories![index].name ?? ''),
                                                                                    value: controller.selectCategory.contains(controller.storeCategoriesModel.value!.categories![index].id!.toString()),
                                                                                    onChanged: (bool? value) {
                                                                                      if (controller.selectCategory.contains(controller.storeCategoriesModel.value!.categories![index].id!.toString())) {
                                                                                        controller.selectCategory.remove(controller.storeCategoriesModel.value!.categories![index].id!.toString());
                                                                                      } else {
                                                                                        controller.selectCategory.add(controller.storeCategoriesModel.value!.categories![index].id!.toString());
                                                                                      }
                                                                                    },
                                                                                  );
                                                                                }),
                                                                              ),
                                                                            ),
                                                                            const SizedBox(
                                                                              height: 30,
                                                                            ),
                                                                            Text(
                                                                              'Sort by price'.tr,
                                                                              style: const TextStyle(
                                                                                color: Colors.black,
                                                                                fontSize: 20,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                            ),
                                                                            const SizedBox(
                                                                              height: 15,
                                                                            ),
                                                                            Obx(() {
                                                                              return SfRangeSlider(
                                                                                min: 0.0,
                                                                                max: 100.0,
                                                                                values: controller.values.value,
                                                                                interval: 20,
                                                                                showTicks: true,
                                                                                showLabels: true,
                                                                                enableTooltip: true,
                                                                                minorTicksPerInterval: 1,
                                                                                onChanged: (SfRangeValues values) {
                                                                                  controller.values.value = values;
                                                                                },
                                                                              );
                                                                            }),
                                                                            const SizedBox(
                                                                              height: 15,
                                                                            ),
                                                                            Text(
                                                                              'Sort by'.tr,
                                                                              style: const TextStyle(
                                                                                color: Colors.black,
                                                                                fontSize: 20,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                            ),
                                                                            const SizedBox(
                                                                              height: 15,
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
                                                                              'Sort by'.tr,
                                                                              style: const TextStyle(
                                                                                color: Colors.black,
                                                                                fontSize: 20,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                            ),
                                                                            const SizedBox(
                                                                              height: 15,
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
                                                                              height: 50,
                                                                            ),
                                                                            Button(
                                                                              height: 50,
                                                                              radius: 15,
                                                                              onPressed: () async {
                                                                                await controller.getProducts();
                                                                                Get.back();
                                                                                // await controller
                                                                                //     .addStoreReview();
                                                                              },
                                                                              text: 'Search'.tr,
                                                                            ),
                                                                            const SizedBox(
                                                                              height: 50,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  )),
                                                            );
                                                          });
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
                                                physics:
                                                    const BouncingScrollPhysics(),
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
                                                        color: Colors.grey
                                                            .withOpacity(0.2),
                                                        spreadRadius: 0.5,
                                                        blurRadius: 2,
                                                        offset: const Offset(
                                                          0,
                                                          3,
                                                        ),
                                                      ),
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.2),
                                                        spreadRadius: 0.5,
                                                        blurRadius: 2,
                                                        offset: const Offset(
                                                          3,
                                                          0,
                                                        ),
                                                      ),
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.2),
                                                        spreadRadius: 0.5,
                                                        blurRadius: 2,
                                                        offset: const Offset(
                                                          0,
                                                          -3,
                                                        ),
                                                      ),
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.2),
                                                        spreadRadius: 0.5,
                                                        blurRadius: 2,
                                                        offset: const Offset(
                                                          -3,
                                                          0,
                                                        ),
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
                                          showModalBottomSheet(
                                              isScrollControlled: true,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              context: context,
                                              builder: (builder) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.of(context)
                                                          .viewInsets,
                                                  child: Container(
                                                      height: SizeConfig
                                                              .screenHeight *
                                                          0.6,
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
                                                        child: Form(
                                                          key: controller
                                                              .formKey,
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              const SizedBox(
                                                                height: 15,
                                                              ),
                                                              Text(
                                                                'Enter your rating '
                                                                    .tr,
                                                                style:
                                                                    const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 15,
                                                              ),
                                                              RatingBar.builder(
                                                                itemSize: 45,
                                                                initialRating:
                                                                    0,
                                                                minRating: 0,
                                                                direction: Axis
                                                                    .horizontal,
                                                                allowHalfRating:
                                                                    false,
                                                                itemCount: 5,
                                                                itemPadding:
                                                                    const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            1.0),
                                                                itemBuilder:
                                                                    (context,
                                                                            _) =>
                                                                        const Icon(
                                                                  Icons.star,
                                                                  color: Colors
                                                                      .amber,
                                                                ),
                                                                onRatingUpdate:
                                                                    (rating) {
                                                                  controller
                                                                          .rate
                                                                          .value =
                                                                      rating;
                                                                },
                                                              ),
                                                              const SizedBox(
                                                                height: 30,
                                                              ),
                                                              Text(
                                                                'Enter your comment'
                                                                    .tr,
                                                                style:
                                                                    const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 15,
                                                              ),
                                                              DefaultFormField(
                                                                minLines: 5,
                                                                maxLines: 10,
                                                                controller:
                                                                    controller
                                                                        .commentController,
                                                                isPassword:
                                                                    false,
                                                                enabled: true,
                                                                readOnly: false,
                                                                radius: 15,
                                                                autofocus:
                                                                    false,
                                                                focusBorderColor:
                                                                    AppColor
                                                                        .globalDefaultColor,
                                                                textColor: AppColor
                                                                    .globalDefaultColor,
                                                                filled: true,
                                                                fillColor:
                                                                    Colors.grey[
                                                                        200],
                                                              ),
                                                              const SizedBox(
                                                                height: 15,
                                                              ),
                                                              Button(
                                                                radius: 15,
                                                                onPressed:
                                                                    () async {
                                                                  await controller
                                                                      .addStoreReview();
                                                                },
                                                                text: 'Send'.tr,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      )),
                                                );
                                              });
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
                                                            'Customer'
                                                        ? Button(
                                                            radius: 15,
                                                            height: 40,
                                                            background: AppColor
                                                                .globalDefaultColor,
                                                            onPressed: () {
                                                              showModalBottomSheet(
                                                                  isScrollControlled:
                                                                      true,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15.0),
                                                                  ),
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (builder) {
                                                                    return Container(
                                                                        height: SizeConfig.screenHeight *
                                                                            0.7,
                                                                        decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(
                                                                                15)),
                                                                        child:
                                                                            Form(
                                                                          key: controller
                                                                              .fromApplyJob,
                                                                          child:
                                                                              ListView(
                                                                            padding:
                                                                                const EdgeInsets.only(
                                                                              top: 20,
                                                                              bottom: 20,
                                                                              right: 10,
                                                                              left: 10,
                                                                            ),
                                                                            children: [
                                                                              Text(
                                                                                'Your name *'.tr,
                                                                                style: const TextStyle(
                                                                                  color: Colors.black,
                                                                                  fontSize: 15,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 10,
                                                                              ),
                                                                              DefaultFormField(
                                                                                validator: (name) {
                                                                                  if (name == null || name.isEmpty) {
                                                                                    return 'name is required *'.tr;
                                                                                  }
                                                                                  return null;
                                                                                },
                                                                                controller: controller.nameController,
                                                                                minLines: 1,
                                                                                maxLines: 1,
                                                                                hint: 'Write your name'.tr,
                                                                                borderColors: AppColor.globalDefaultColor,
                                                                                isPassword: false,
                                                                                enabled: true,
                                                                                readOnly: false,
                                                                                radius: 15,
                                                                                autofocus: false,
                                                                                focusBorderColor: AppColor.globalDefaultColor,
                                                                                textColor: AppColor.globalDefaultColor,
                                                                                filled: false,
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 10,
                                                                              ),
                                                                              Text(
                                                                                'Email *'.tr,
                                                                                style: const TextStyle(
                                                                                  color: Colors.black,
                                                                                  fontSize: 15,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 10,
                                                                              ),
                                                                              DefaultFormField(
                                                                                validator: (email) {
                                                                                  if (email == null || email.isEmpty) {
                                                                                    return 'Email is required *'.tr;
                                                                                  }
                                                                                  return null;
                                                                                },
                                                                                controller: controller.emailController,
                                                                                minLines: 1,
                                                                                maxLines: 1,
                                                                                hint: 'Write your email'.tr,
                                                                                borderColors: AppColor.globalDefaultColor,
                                                                                isPassword: false,
                                                                                enabled: true,
                                                                                readOnly: false,
                                                                                radius: 15,
                                                                                autofocus: false,
                                                                                focusBorderColor: AppColor.globalDefaultColor,
                                                                                textColor: AppColor.globalDefaultColor,
                                                                                filled: false,
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 10,
                                                                              ),
                                                                              Text(
                                                                                'Phone *'.tr,
                                                                                style: const TextStyle(
                                                                                  color: Colors.black,
                                                                                  fontSize: 15,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 10,
                                                                              ),
                                                                              Container(
                                                                                decoration: BoxDecoration(
                                                                                  border: Border.all(
                                                                                    color: AppColor.globalDefaultColor,
                                                                                    width: 0.4,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                                                                                  color: Colors.grey[50],
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.symmetric(
                                                                                    horizontal: 7,
                                                                                    vertical: 5,
                                                                                  ),
                                                                                  child: InternationalPhoneNumberInput(
                                                                                    textFieldController: controller.phoneController,
                                                                                    onInputChanged: (PhoneNumber number) {
                                                                                      controller.codeCountry.value = number.dialCode ?? '';
                                                                                    },
                                                                                    onInputValidated: (bool value) {},
                                                                                    autoFocus: false,
                                                                                    selectorConfig: const SelectorConfig(
                                                                                      selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                                                                                    ),
                                                                                    ignoreBlank: false,
                                                                                    selectorTextStyle: const TextStyle(
                                                                                      color: AppColor.globalDefaultColor,
                                                                                    ),
                                                                                    inputDecoration: InputDecoration(
                                                                                      border: OutlineInputBorder(
                                                                                        borderSide: const BorderSide(
                                                                                          color: AppColor.globalDefaultColor,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15),
                                                                                      ),
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: const BorderSide(
                                                                                          color: Colors.white,
                                                                                          width: 0.0001,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: const BorderSide(
                                                                                          color: Colors.white,
                                                                                          width: 0.05,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15),
                                                                                      ),
                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                        borderSide: const BorderSide(
                                                                                          color: Colors.white,
                                                                                          width: 0.05,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15),
                                                                                      ),
                                                                                    ),
                                                                                    formatInput: false,
                                                                                    keyboardType: const TextInputType.numberWithOptions(
                                                                                      signed: true,
                                                                                      decimal: true,
                                                                                    ),
                                                                                    inputBorder: const OutlineInputBorder(
                                                                                      borderSide: BorderSide(color: Colors.white),
                                                                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                                                                    ),
                                                                                    onSaved: (PhoneNumber number) {},
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 10,
                                                                              ),
                                                                              Text(
                                                                                'Message *'.tr,
                                                                                style: const TextStyle(
                                                                                  color: Colors.black,
                                                                                  fontSize: 15,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 10,
                                                                              ),
                                                                              DefaultFormField(
                                                                                validator: (message) {
                                                                                  if (message == null || message.isEmpty) {
                                                                                    return 'Message is required *';
                                                                                  }
                                                                                  return null;
                                                                                },
                                                                                controller: controller.messageApplyController,
                                                                                minLines: 5,
                                                                                maxLines: 10,
                                                                                hint: 'Write your message'.tr,
                                                                                borderColors: AppColor.globalDefaultColor,
                                                                                isPassword: false,
                                                                                enabled: true,
                                                                                readOnly: false,
                                                                                radius: 15,
                                                                                autofocus: false,
                                                                                focusBorderColor: AppColor.globalDefaultColor,
                                                                                textColor: AppColor.globalDefaultColor,
                                                                                filled: false,
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 10,
                                                                              ),
                                                                              Text(
                                                                                'Upload your file*'.tr,
                                                                                style: const TextStyle(
                                                                                  color: Colors.black,
                                                                                  fontSize: 15,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 10,
                                                                              ),
                                                                              Row(
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: DefaultFormField(
                                                                                      controller: controller.fileController,
                                                                                      hint: 'Your file'.tr,
                                                                                      hintStyle: const TextStyle(
                                                                                        overflow: TextOverflow.ellipsis,
                                                                                      ),
                                                                                      isPassword: false,
                                                                                      enabled: true,
                                                                                      readOnly: true,
                                                                                      radius: 15,
                                                                                      autofocus: false,
                                                                                      focusBorderColor: AppColor.globalDefaultColor,
                                                                                      textColor: AppColor.globalDefaultColor,
                                                                                      filled: false,
                                                                                    ),
                                                                                  ),
                                                                                  const SizedBox(
                                                                                    width: 10,
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Center(
                                                                                      child: LoadingButton(
                                                                                        height: 40,
                                                                                        borderRadius: 10,
                                                                                        primaryColor: Colors.grey[300],
                                                                                        showBox: controller.show,
                                                                                        //  iconData: PhosphorIcons.googleLogo,
                                                                                        onPressed: () {
                                                                                          Future.delayed(const Duration(seconds: 1), () async {
                                                                                            await controller.openCVFileExplorer();
                                                                                            controller.isDoneUpload.value ? controller.btnController.success() : controller.btnController.stop();
                                                                                          });
                                                                                        },
                                                                                        successIcon: Icons.done_outline_rounded,
                                                                                        controller: controller.btnController,
                                                                                        child: Text(
                                                                                          'Upload'.tr,
                                                                                          style: const TextStyle(
                                                                                            color: Colors.black,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 10,
                                                                              ),
                                                                              Center(
                                                                                child: ArgonButton(
                                                                                  height: 50,
                                                                                  roundLoadingShape: true,
                                                                                  width: SizeConfig.screenWidth,
                                                                                  onTap: (startLoading, stopLoading, btnState) async {
                                                                                    startLoading();
                                                                                    if (controller.fromApplyJob.currentState!.validate() && controller.cvFile!.value.path.isNotEmpty) {
                                                                                      await controller.applyJob(
                                                                                        jobId: controller.myJobsModel.value!.jobs![index].id.toString(),
                                                                                      );
                                                                                      stopLoading();
                                                                                      Get.back();
                                                                                    } else {
                                                                                      Get.snackbar(
                                                                                        'Field required'.tr,
                                                                                        'Please Enter required fields'.tr,
                                                                                        icon: const Icon(
                                                                                          Icons.error,
                                                                                          color: Colors.white,
                                                                                        ),
                                                                                        snackPosition: SnackPosition.TOP,
                                                                                        backgroundColor: AppColor.globalDefaultColor,
                                                                                        borderRadius: 15,
                                                                                        margin: const EdgeInsets.all(15),
                                                                                        colorText: Colors.white,
                                                                                        duration: const Duration(seconds: 2),
                                                                                        isDismissible: true,
                                                                                        dismissDirection: DismissDirection.horizontal,
                                                                                        forwardAnimationCurve: Curves.easeOutBack,
                                                                                      );
                                                                                      await stopLoading();
                                                                                    }
                                                                                  },
                                                                                  loader: const Center(
                                                                                    child: CircularProgressIndicator(
                                                                                      valueColor: AlwaysStoppedAnimation<Color>(
                                                                                        Colors.white,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  borderRadius: 15,
                                                                                  color: AppColor.globalDefaultColor,
                                                                                  child: Text(
                                                                                    'Send'.tr,
                                                                                    style: const TextStyle(
                                                                                      color: Colors.white,
                                                                                      fontSize: 16,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ));
                                                                  });
                                                            },
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
