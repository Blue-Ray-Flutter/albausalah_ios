import 'package:albausalah_app/shared/components/constants/style/color.dart';
import 'package:albausalah_app/view/stores/store_page/product_page/product_reviews/controller/product_reviews_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../res/assets_res.dart';
import '../../../../../shared/components/widgets/button/button.dart';
import '../../../../../shared/components/widgets/size_config/size_config.dart';
import '../../../../../shared/components/widgets/text_filed/text_form_filed_widget.dart';

class Reviews extends GetWidget<ProductReviewsController> {
  const Reviews({Key? key}) : super(key: key);

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
            title: Text(
              'Reviews'.tr,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            elevation: 0,
          ),
          backgroundColor: Colors.white,
          body: Column(
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
                      onTap: (value) {},
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
                            child:  Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Center(
                                child: Text(
                                  'Users Reviews'.tr,
                                  style: const TextStyle(
                                    fontSize: 13,
                                  ),
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
                            child:  Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Center(
                                child: Text(
                                  'Users Comments'.tr,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 13,
                                  ),
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
                      () => controller.productReviewsModel.value == null
                          ? Center(
                              child: LoadingAnimationWidget.stretchedDots(
                                color: AppColor.globalDefaultColor,
                                size: 40,
                              ),
                            )
                          : Stack(
                              children: [
                                controller.productReviewsModel.value!
                                        .productReviews!.isEmpty
                                    ? Center(
                                        child: Text(
                                          'There are no reviews'.tr,
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
                                                  leading: controller
                                                              .productReviewsModel
                                                              .value!
                                                              .productReviews![
                                                                  index]
                                                              .customerImage ==
                                                          null
                                                      ? const CircleAvatar(
                                                          radius: 25,
                                                          backgroundColor:
                                                              Colors.white,
                                                          backgroundImage:
                                                              AssetImage(
                                                            AssetsRes.PROFILE,
                                                          ),
                                                        )
                                                      : CircleAvatar(
                                                          radius: 25,
                                                          backgroundColor:
                                                              Colors.white,
                                                          backgroundImage:
                                                              CachedNetworkImageProvider(controller
                                                                  .productReviewsModel
                                                                  .value!
                                                                  .productReviews![
                                                                      index]
                                                                  .customerImage!),
                                                        ),
                                                  trailing: RatingBar.builder(
                                                    ignoreGestures: true,
                                                    glow: false,
                                                    updateOnDrag: false,
                                                    itemSize: 10,
                                                    initialRating: (controller
                                                            .productReviewsModel
                                                            .value!
                                                            .productReviews![
                                                                index]
                                                            .reviewValue)!
                                                        .toDouble(),
                                                    direction: Axis.horizontal,
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
                                                    onRatingUpdate: (rating) {},
                                                  ),
                                                  title: Text(controller
                                                          .productReviewsModel
                                                          .value!
                                                          .productReviews![
                                                              index]
                                                          .customerName ??
                                                      ''),
                                                  subtitle: Text(controller
                                                          .productReviewsModel
                                                          .value!
                                                          .productReviews![
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
                                                .productReviewsModel
                                                .value!
                                                .productReviews!
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
                                          constraints: BoxConstraints(
                                            maxHeight:
                                                SizeConfig.screenHeight * 0.8,
                                          ),
                                          isScrollControlled: true,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          context: context,
                                          builder: (builder) {
                                            return Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child: Container(
                                                  height:
                                                      SizeConfig.screenHeight *
                                                          0.6,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 15,
                                                    ),
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Form(
                                                        key: controller.formKey,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            const SizedBox(
                                                              height: 15,
                                                            ),
                                                             Text(
                                                              'Enter your rating '.tr,
                                                              style: const TextStyle(
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
                                                              initialRating: 0,
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
                                                                controller.rate
                                                                        .value =
                                                                    rating;
                                                              },
                                                            ),
                                                            const SizedBox(
                                                              height: 30,
                                                            ),
                                                             Text(
                                                              'Enter your comment'.tr,
                                                              style: const TextStyle(
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
                                                              controller: controller
                                                                  .noteController,
                                                              isPassword: false,
                                                              enabled: true,
                                                              readOnly: false,
                                                              radius: 15,
                                                              autofocus: false,
                                                              focusBorderColor:
                                                                  AppColor
                                                                      .globalDefaultColor,
                                                              textColor: AppColor
                                                                  .globalDefaultColor,
                                                              filled: true,
                                                              fillColor: Colors
                                                                  .grey[200],
                                                            ),
                                                            const SizedBox(
                                                              height: 15,
                                                            ),
                                                            Button(
                                                              radius: 15,
                                                              onPressed:
                                                                  () async {
                                                                await controller
                                                                    .addProductReview();
                                                              },
                                                              text: 'Send'.tr,
                                                            ),
                                                          ],
                                                        ),
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
                      () => controller.productCommentsModel.value == null
                          ? Center(
                              child: LoadingAnimationWidget.stretchedDots(
                                color: AppColor.globalDefaultColor,
                                size: 40,
                              ),
                            )
                          : Stack(
                              children: [
                                controller.productCommentsModel.value!
                                        .productComments!.isEmpty
                                    ? Center(
                                        child: Text(
                                          'There are no comments'.tr,
                                          style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.4),
                                            fontSize: 20,
                                          ),
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.only(
                                          top: 70,
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
                                              child: Column(
                                                children: [
                                                  ListTile(
                                                    leading: controller
                                                                    .productCommentsModel
                                                                    .value!
                                                                    .productComments![
                                                                        index]
                                                                    .profilePhotoUrl ==
                                                                null ||
                                                            controller
                                                                .productCommentsModel
                                                                .value!
                                                                .productComments![
                                                                    index]
                                                                .profilePhotoUrl!
                                                                .isEmpty
                                                        ? const CircleAvatar(
                                                            radius: 25,
                                                            backgroundColor:
                                                                Colors.white,
                                                            backgroundImage:
                                                                AssetImage(
                                                              AssetsRes.PROFILE,
                                                            ),
                                                          )
                                                        : CircleAvatar(
                                                            radius: 25,
                                                            backgroundColor:
                                                                Colors.white,
                                                            backgroundImage:
                                                                CachedNetworkImageProvider(controller
                                                                    .productCommentsModel
                                                                    .value!
                                                                    .productComments![
                                                                        index]
                                                                    .profilePhotoUrl!),
                                                          ),
                                                    trailing: TextButton(
                                                      onPressed: () async {
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
                                                                padding: MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                                child:
                                                                    Container(
                                                                        height: SizeConfig.screenHeight *
                                                                            0.6,
                                                                        decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(
                                                                                15)),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.symmetric(
                                                                            horizontal:
                                                                                15,
                                                                          ),
                                                                          child:
                                                                              Form(
                                                                            key:
                                                                                controller.commentKey,
                                                                            child:
                                                                                Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                const SizedBox(
                                                                                  height: 15,
                                                                                ),
                                                                                Text(
                                                                                  'Enter your comment'.tr,
                                                                                  style: const TextStyle(
                                                                                    color: Colors.black,
                                                                                    fontSize: 20,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                                ),
                                                                                const SizedBox(
                                                                                  height: 15,
                                                                                ),
                                                                                DefaultFormField(
                                                                                  minLines: 5,
                                                                                  maxLines: 10,
                                                                                  controller: controller.commentController,
                                                                                  isPassword: false,
                                                                                  enabled: true,
                                                                                  readOnly: false,
                                                                                  radius: 15,
                                                                                  autofocus: false,
                                                                                  focusBorderColor: AppColor.globalDefaultColor,
                                                                                  textColor: AppColor.globalDefaultColor,
                                                                                  filled: true,
                                                                                  fillColor: Colors.grey[200],
                                                                                ),
                                                                                const SizedBox(
                                                                                  height: 15,
                                                                                ),
                                                                                Button(
                                                                                  radius: 15,
                                                                                  onPressed: () async {
                                                                                    await controller.addProductComment(parentId: (controller.productCommentsModel.value!.productComments![index].id).toString());
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
                                                      child:  Text(
                                                        'Reply'.tr,
                                                        // style: TextStyle(
                                                        //   fontSize: 10,
                                                        // ),
                                                      ),
                                                    ),
                                                    title: Text(controller
                                                            .productCommentsModel
                                                            .value!
                                                            .productComments![
                                                                index]
                                                            .name ??
                                                        ''),
                                                    subtitle: Text(controller
                                                            .productCommentsModel
                                                            .value!
                                                            .productComments![
                                                                index]
                                                            .comment ??
                                                        ''),
                                                  ),
                                                  Container(
                                                    height: controller
                                                            .productCommentsModel
                                                            .value!
                                                            .productComments![
                                                                index]
                                                            .children!
                                                            .isEmpty
                                                        ? 0
                                                        : 220,
                                                    decoration:
                                                        const BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(10),
                                                      ),
                                                    ),
                                                    child: controller
                                                            .productCommentsModel
                                                            .value!
                                                            .productComments![
                                                                index]
                                                            .children!
                                                            .isEmpty
                                                        ? Container()
                                                        : Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                              horizontal: 15,
                                                            ),
                                                            child: ListView
                                                                .separated(
                                                                    itemBuilder:
                                                                        (context,
                                                                                indexx) =>
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                color: Colors.white,
                                                                                borderRadius: BorderRadius.circular(15),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.symmetric(
                                                                                  horizontal: 5,
                                                                                  vertical: 10,
                                                                                ),
                                                                                child: Column(
                                                                                  children: [
                                                                                    ListTile(
                                                                                      leading: controller.productCommentsModel.value!.productComments![index].children![indexx].profilePhotoUrl == null || controller.productCommentsModel.value!.productComments![index].children![indexx].profilePhotoUrl!.isEmpty
                                                                                          ? const CircleAvatar(
                                                                                              radius: 25,
                                                                                              backgroundColor: Colors.white,
                                                                                              backgroundImage: AssetImage(
                                                                                                AssetsRes.PROFILE,
                                                                                              ),
                                                                                            )
                                                                                          : CircleAvatar(
                                                                                              radius: 25,
                                                                                              backgroundColor: Colors.white,
                                                                                              backgroundImage: CachedNetworkImageProvider(controller.productCommentsModel.value!.productComments![index].children![indexx].profilePhotoUrl!),
                                                                                            ),
                                                                                      trailing: TextButton(
                                                                                        onPressed: () async {
                                                                                          showModalBottomSheet(
                                                                                              isScrollControlled: true,
                                                                                              shape: RoundedRectangleBorder(
                                                                                                borderRadius: BorderRadius.circular(15.0),
                                                                                              ),
                                                                                              context: context,
                                                                                              builder: (builder) {
                                                                                                return Padding(
                                                                                                  padding: MediaQuery.of(context).viewInsets,
                                                                                                  child: Container(
                                                                                                      height: SizeConfig.screenHeight * 0.6,
                                                                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                                                                                                      child: Padding(
                                                                                                        padding: const EdgeInsets.symmetric(
                                                                                                          horizontal: 15,
                                                                                                        ),
                                                                                                        child: Form(
                                                                                                          key: controller.commentKey,
                                                                                                          child: Column(
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              const SizedBox(
                                                                                                                height: 15,
                                                                                                              ),
                                                                                                              Text(
                                                                                                                'Enter your comment'.tr,
                                                                                                                style: const TextStyle(
                                                                                                                  color: Colors.black,
                                                                                                                  fontSize: 20,
                                                                                                                  fontWeight: FontWeight.bold,
                                                                                                                ),
                                                                                                              ),
                                                                                                              const SizedBox(
                                                                                                                height: 15,
                                                                                                              ),
                                                                                                              DefaultFormField(
                                                                                                                minLines: 5,
                                                                                                                maxLines: 10,
                                                                                                                controller: controller.commentController,
                                                                                                                isPassword: false,
                                                                                                                enabled: true,
                                                                                                                readOnly: false,
                                                                                                                radius: 15,
                                                                                                                autofocus: false,
                                                                                                                focusBorderColor: AppColor.globalDefaultColor,
                                                                                                                textColor: AppColor.globalDefaultColor,
                                                                                                                filled: true,
                                                                                                                fillColor: Colors.grey[200],
                                                                                                              ),
                                                                                                              const SizedBox(
                                                                                                                height: 15,
                                                                                                              ),
                                                                                                              Button(
                                                                                                                radius: 15,
                                                                                                                onPressed: () async {
                                                                                                                  await controller.addProductComment(parentId: (controller.productCommentsModel.value!.productComments![index].children![indexx].id).toString());
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
                                                                                        child:  Text(
                                                                                          'Reply'.tr,
                                                                                        ),
                                                                                      ),
                                                                                      title: Text(
                                                                                        controller.productCommentsModel.value!.productComments![index].children![indexx].name ?? '',
                                                                                      ),
                                                                                      subtitle: Text(controller.productCommentsModel.value!.productComments![index].children![indexx].comment ?? ''),
                                                                                    ),
                                                                                    const SizedBox(
                                                                                      height: 10,
                                                                                    ),
                                                                                    Container(
                                                                                      height: controller.productCommentsModel.value!.productComments![index].children![indexx].children!.isEmpty ? 0 : 145,
                                                                                      decoration: const BoxDecoration(
                                                                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                                                                      ),
                                                                                      child: controller.productCommentsModel.value!.productComments![index].children!.isEmpty
                                                                                          ? Container()
                                                                                          : Padding(
                                                                                              padding: const EdgeInsets.symmetric(
                                                                                                horizontal: 15,
                                                                                              ),
                                                                                              child: ListView.separated(
                                                                                                  itemBuilder: (context, indexxx) => Container(
                                                                                                        decoration: const BoxDecoration(
                                                                                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                                                                                        ),
                                                                                                        child: ListTile(
                                                                                                          leading: controller.productCommentsModel.value!.productComments![index].children![indexx].children![indexxx].profilePhotoUrl == null || controller.productCommentsModel.value!.productComments![index].children![indexx].children![indexxx].profilePhotoUrl!.isEmpty
                                                                                                              ? const CircleAvatar(
                                                                                                                  radius: 25,
                                                                                                                  backgroundColor: Colors.white,
                                                                                                                  backgroundImage: AssetImage(
                                                                                                                    AssetsRes.PROFILE,
                                                                                                                  ),
                                                                                                                )
                                                                                                              : CircleAvatar(
                                                                                                                  radius: 25,
                                                                                                                  backgroundColor: Colors.white,
                                                                                                                  backgroundImage: CachedNetworkImageProvider(controller.productCommentsModel.value!.productComments![index].children![indexx].children![indexxx].profilePhotoUrl!),
                                                                                                                ),
                                                                                                          title: Text(controller.productCommentsModel.value!.productComments![index].children![indexx].children![indexxx].name ?? ''),
                                                                                                          subtitle: Text(controller.productCommentsModel.value!.productComments![index].children![indexx].children![indexxx].comment ?? ''),
                                                                                                        ),
                                                                                                      ),
                                                                                                  separatorBuilder: (context, index) => const SizedBox(
                                                                                                        height: 10,
                                                                                                      ),
                                                                                                  itemCount: controller.productCommentsModel.value!.productComments![index].children![indexx].children!.length),
                                                                                            ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                    separatorBuilder:
                                                                        (context,
                                                                                index) =>
                                                                            const SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                    itemCount: controller
                                                                        .productCommentsModel
                                                                        .value!
                                                                        .productComments![
                                                                            index]
                                                                        .children!
                                                                        .length),
                                                          ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          separatorBuilder: (context, index) =>
                                              const SizedBox(
                                            height: 15,
                                          ),
                                          itemCount: controller
                                              .productCommentsModel
                                              .value!
                                              .productComments!
                                              .length,
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
                                          constraints: BoxConstraints(
                                              maxHeight:
                                                  SizeConfig.screenHeight *
                                                      0.8),
                                          isScrollControlled: true,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          context: context,
                                          builder: (builder) {
                                            return Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child: Container(
                                                  height:
                                                      SizeConfig.screenHeight *
                                                          0.6,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 15,
                                                    ),
                                                    child: Form(
                                                      key:
                                                          controller.commentKey,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          Text(
                                                            'Enter your comment'
                                                                .tr,
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.black,
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
                                                            controller: controller
                                                                .commentController,
                                                            isPassword: false,
                                                            enabled: true,
                                                            readOnly: false,
                                                            radius: 15,
                                                            autofocus: false,
                                                            focusBorderColor:
                                                                AppColor
                                                                    .globalDefaultColor,
                                                            textColor: AppColor
                                                                .globalDefaultColor,
                                                            filled: true,
                                                            fillColor: Colors
                                                                .grey[200],
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          Button(
                                                            radius: 15,
                                                            onPressed:
                                                                () async {
                                                              await controller
                                                                  .addProductComment();
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
                                    text: 'Add comment'.tr,
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
