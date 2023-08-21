import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:loading_icon_button/loading_icon_button.dart';

import '../../../../res/assets_res.dart';
import '../../../../shared/components/constants/style/color.dart';
import '../../../../shared/components/widgets/size_config/size_config.dart';
import '../../../../shared/components/widgets/text_filed/text_form_filed_widget.dart';
import 'controller/edit_information_for_customer_controller.dart';

class EditInformationForCustomer
    extends GetWidget<EditInformationForCustomerController> {
  const EditInformationForCustomer({Key? key}) : super(key: key);

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
          'Edit Information'.tr,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Obx(
        () => controller.myInformationModel.value == null
            ? Center(
                child: LoadingAnimationWidget.stretchedDots(
                  color: AppColor.globalDefaultColor,
                  size: 40,
                ),
              )
            : SingleChildScrollView(
                physics: const ScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: const ScrollPhysics(),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Obx(() => controller.image.value.isNotEmpty
                                    ? Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: FileImage(
                                                  File(controller.image.value)),
                                            )),
                                      )
                                    : controller.myInformationModel.value!
                                                .userData!.profilePhotoUrl ==
                                            null
                                        ? Container(
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              image: const DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(
                                                    AssetsRes.PROFILE,
                                                  )),
                                            ))
                                        : Container(
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image:
                                                    CachedNetworkImageProvider(
                                                  controller
                                                      .myInformationModel
                                                      .value!
                                                      .userData!
                                                      .profilePhotoUrl!,
                                                  errorListener: () =>
                                                      const Image(
                                                    image: AssetImage(
                                                        AssetsRes.PLACE_HOLDER),
                                                  ),
                                                ),
                                              ),
                                            ))),
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(50))),
                                  child: Center(
                                    child: IconButton(
                                      iconSize: 15,
                                      onPressed: () {
                                        controller.getFromGallery();
                                      },
                                      icon: const Icon(
                                        Icons.camera_alt,
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
                           Text(
                            'Full Name *'.tr,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          DefaultFormField(
                            validator: (name) {
                              if (name == null || name.isEmpty) {
                                return 'Name is required'.tr;
                              }
                              return null;
                            },
                            controller: controller.nameController,
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
                            'User name *'.tr,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          DefaultFormField(
                            validator: (userName) {
                              if (userName == null || userName.isEmpty) {
                                return 'User name is required'.tr;
                              }
                              return null;
                            },
                            controller: controller.userNameController,
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
                            'Email Address *'.tr,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          DefaultFormField(
                            validator: (email) {
                              if (email == null || email.isEmpty) {
                                return 'Email is required'.tr;
                              }
                              return null;
                            },
                            controller: controller.emailController,
                            minLines: 1,
                            maxLines: 1,
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
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColor.globalDefaultColor,
                                width: 0.4,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
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
                                  controller.codeCountry.value =
                                      number.dialCode ?? '';
                                },
                                onInputValidated: (bool value) {},
                                autoFocus: false,
                                selectorConfig: const SelectorConfig(
                                  selectorType:
                                      PhoneInputSelectorType.BOTTOM_SHEET,
                                ),
                                ignoreBlank: false,
                                selectorTextStyle: const TextStyle(
                                  color: AppColor.globalDefaultColor,
                                ),
                                // initialValue: PhoneNumber(
                                //   dialCode:
                                //       controller.codeCountry.value.isEmpty
                                //           ? controller.myInformationModel
                                //               .value!.userData!.countryCode!
                                //           : controller.codeCountry.value,
                                // ),
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
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                  signed: true,
                                  decimal: true,
                                ),
                                inputBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                onSaved: (PhoneNumber number) {},
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                           Text(
                            'Address'.tr,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          DefaultFormField(
                            validator: (address) {
                              if (address == null || address.isEmpty) {
                                return 'Address is required'.tr;
                              }
                              return null;
                            },
                            controller: controller.addressController,
                            minLines: 5,
                            maxLines: 10,
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
                            'Password *'.tr,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          DefaultFormField(
                            validator: (password) {
                              if (password == null || password.isEmpty) {
                                return 'Password is required'.tr;
                              }
                              return null;
                            },
                            controller: controller.passwordController,
                            minLines: 1,
                            maxLines: 1,
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
                            'Confirm password *'.tr,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          DefaultFormField(
                            validator: (cPassword) {
                              if (cPassword == null || cPassword.isEmpty) {
                                return'password confirmation is required'.tr;
                              }
                              return null;
                            },
                            controller: controller.confirmPasswordController,
                            minLines: 1,
                            maxLines: 1,
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
                          Center(
                            child: ArgonButton(
                              height: 50,
                              roundLoadingShape: true,
                              width: SizeConfig.screenWidth,
                              onTap:
                                  (startLoading, stopLoading, btnState) async {
                                startLoading();
                                if (controller.formKey.currentState!
                                    .validate()) {
                                  await controller.updateMyProfile();
                                  await stopLoading(); // Move this line here
                                } else {
                                  Get.snackbar(
                                    'Field required'.tr,
                                    'Please Enter required field'.tr,
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
                              child:  Text(
                                'Save'.tr,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    ));
  }
}
