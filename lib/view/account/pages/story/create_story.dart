import 'package:albausalah_app/shared/components/constants/style/color.dart';
import 'package:albausalah_app/view/home/pages/story/story.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:loading_icon_button/loading_icon_button.dart';

import '../../../../res/assets_res.dart';
import '../../../../shared/components/widgets/size_config/size_config.dart';
import '../../../../shared/components/widgets/story_items/story_items.dart';
import '../../../../shared/components/widgets/text_filed/text_form_filed_widget.dart';
import 'controller/create_story_controller.dart';

class CreateStory extends GetWidget<CreateStoryController> {
  const CreateStory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.6,
        title:  Text(
          'My Status'.tr,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Form(
        key: controller.formKey,
        child: Obx(() {
          return controller.myStatusModel.value == null
              ? Center(
                  child: LoadingAnimationWidget.stretchedDots(
                    color: AppColor.globalDefaultColor,
                    size: 40,
                  ),
                )
              : ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 20,
                  ),
                  children: [
                    Obx(() {
                      return controller.myStatusModel.value!.statuses!.isEmpty
                          ? Container()
                          : Align(
                              alignment: Alignment.topLeft,
                              child: SizedBox(
                                height: 72,
                                child: StoryItems(
                                  isView: false,
                                  image:
                                      controller.cacheUtils.getPhoto() == null
                                          ? AssetsRes.PROFILE
                                          : controller.cacheUtils.getPhoto()!,
                                  onTap: () {
                                    // controller.isView.value = true;
                                    Get.to(
                                      () => StoryPage(
                                        haveFollowButton: false,
                                        follow: false,
                                        storeId: controller.cacheUtils
                                            .getUID()
                                            .toString(),
                                        image: controller.cacheUtils
                                                    .getPhoto() ==
                                                null
                                            ? AssetsRes.PROFILE
                                            : controller.cacheUtils.getPhoto()!,
                                        isMyStory: true,
                                        storeStatuses: controller
                                            .myStatusModel.value!.statuses,
                                        onPressedFollow: () {},
                                        onPressedFollowing: () {},
                                      ),
                                    )!
                                        .then((value) {
                                      controller.myStatusModel.value == null;
                                      Future.delayed(
                                          const Duration(milliseconds: 500),
                                          () {
                                        controller.onInit();
                                      });
                                    });
                                  },
                                ),
                              ),
                            );
                    }),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: AppColor.globalDefaultColor,
                          width: 0.4,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: DefaultFormField(
                              borderColors: Colors.white,
                              controller: controller.fileController,
                              hintStyle: TextStyle(
                                color: Colors.grey[400],
                              ),
                              hint: 'Upload your file'.tr,
                              isPassword: false,
                              enabled: true,
                              readOnly: true,
                              radius: 15,
                              autofocus: false,
                              focusBorderColor: Colors.white,
                              textColor: AppColor.globalDefaultColor,
                              filled: false,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                              ),
                              child: SizedBox(
                                height: 50,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        AppColor.globalDefaultColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  child:  Text(
                                    'Upload'.tr,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  //  iconData: PhosphorIcons.googleLogo,
                                  onPressed: () {
                                    Future.delayed(const Duration(seconds: 1),
                                        () async {
                                      await controller.openFileExplorer();
                                      controller.isDoneUpload.value
                                          ? controller.btnController.success()
                                          : controller.btnController.stop();
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
                      height: 20,
                    ),
                    Obx(() => controller.liveFeedValue.value == 1
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text(
                                textAlign: TextAlign.start,
                                'Add a link *'.tr,
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
                                validator: (link) {
                                  if (link == null || link.isEmpty) {
                                    return 'Link is required'.tr;
                                  }
                                  return null;
                                },
                                controller: controller.linkController,
                                hintStyle: TextStyle(
                                  color: Colors.grey[400],
                                ),
                                hint: 'Add a link'.tr,
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
                            ],
                          )
                        : Container()),
                    // const Text(
                    //   'Add a post *',
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 15,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // DefaultFormField(
                    //   validator: (post) {
                    //     if (post == null || post.isEmpty) {
                    //       return 'Post is required';
                    //     }
                    //     return null;
                    //   },
                    //   controller: controller.postController,
                    //   hintStyle: TextStyle(
                    //     color: Colors.grey[400],
                    //   ),
                    //   minLines: 5,
                    //   maxLines: 10,
                    //   hint: 'Add a post',
                    //   isPassword: false,
                    //   enabled: true,
                    //   readOnly: false,
                    //   radius: 15,
                    //   autofocus: false,
                    //   focusBorderColor: AppColor.globalDefaultColor,
                    //   textColor: AppColor.globalDefaultColor,
                    //   filled: false,
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                     Text(
                      'Live feed *'.tr,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            width: 0.4,
                            color: AppColor.globalDefaultColor,
                          ),
                        ),
                        padding: const EdgeInsets.all(3),
                        child: CoolDropdown(
                          resultWidth: SizeConfig.screenWidth,
                          dropdownItemPadding: const EdgeInsets.all(5),
                          dropdownItemGap: 5,
                          dropdownHeight: 130,
                          dropdownList:  [
                            {'label': 'Yes'.tr, 'value': 1},
                            {'label': 'No'.tr, 'value': 2},
                          ],
                          defaultValue:  {
                            'label':
                                'Does this case include live broadcasts ? *'.tr,
                            'value': 0
                          },
                          isAnimation: true,
                          isResultLabel: true,
                          onChange: (value) {
                            controller.liveFeedValue.value = value['value'];
                          },
                          dropdownItemReverse: true,
                          dropdownItemMainAxis: MainAxisAlignment.start,
                          resultMainAxis: MainAxisAlignment.start,
                          dropdownWidth: 200,
                          labelIconGap: 5,
                          resultTS: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          unselectedItemTS: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          resultIcon: const Icon(
                            Icons.arrow_drop_down_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: ArgonButton(
                        height: 50,
                        roundLoadingShape: true,
                        width: SizeConfig.screenWidth,
                        onTap: (startLoading, stopLoading, btnState) async {
                          startLoading();
                          if (controller.formKey.currentState!.validate() &&
                              controller.liveFeedValue.value > 0) {
                            await controller.createStatus();
                            controller.btnController.reset();
                            await stopLoading();
                          } else {
                            Get.snackbar(
                              '`Field required'.tr,
                              'Please Enter required field'.tr,
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

                          Future.delayed(const Duration(seconds: 3), () {
                            stopLoading();
                          });
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
                        child:  Text(
                          'Save'.tr,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
        }),
      ),
    ));
  }
}
