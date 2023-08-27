import 'dart:io';

import 'package:albausalah_app/res/assets_res.dart';
import 'package:albausalah_app/shared/components/constants/style/color.dart';
import 'package:albausalah_app/view/register/users/customer/controller/customer_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:loading_icon_button/loading_icon_button.dart';

import '../../../../shared/components/widgets/button/icon_button.dart';
import '../../../../shared/components/widgets/divider/or_divider.dart';
import '../../../../shared/components/widgets/size_config/size_config.dart';
import '../../../../shared/components/widgets/text_filed/text_form_filed_widget.dart';
import '../../../location/location_page.dart';

class Customer extends GetWidget<CustomerController> {
  const Customer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Obx(() {
      return controller.flagStatus.value == null
          ? Container()
          : Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
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
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Obx(() => controller.image.value.isEmpty
                                    ? Container(
                                        width: 110,
                                        height: 110,
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
                                        width: 110,
                                        height: 110,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: FileImage(
                                                  File(controller.image.value)),
                                            )),
                                      )),
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
                            'User Name *'.tr,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          DefaultFormField(
                            validator: (uName) {
                              if (uName == null || uName.isEmpty) {
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
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 7,
                                vertical: 5,
                              ),
                              child: InternationalPhoneNumberInput(
                                searchBoxDecoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
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
                                inputDecoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
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
                            height: 15,
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
                            'Location (Click on button to give your location)'
                                .tr,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                minimumSize: Size(SizeConfig.screenWidth, 40)),
                            onPressed: () async {
                              var p = await Get.to(() => const SearchPage());

                              if (p != null) {
                                controller.notifier.value = p as GeoPoint;

                                controller.getAddressFromLatLng(
                                  longitude:
                                      controller.notifier.value!.longitude,
                                  latitude: controller.notifier.value!.latitude,
                                );
                              }
                            },
                            child: Text('Pick address'.tr),
                          ),
                          Obx(() {
                            return controller.address.value.isEmpty
                                ? Container()
                                : Text(
                                    'Address ${controller.address.value}'.tr,
                                    style: const TextStyle(
                                      color: AppColor.globalDefaultColor,
                                      fontSize: 14,
                                    ),
                                  );
                          }),
                          const SizedBox(
                            height: 20,
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
                                return 'password confirmation is required'.tr;
                              }
                              return null;
                            },
                            controller:
                                controller.confirmationPasswordController,
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
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                            ),
                            child: Center(
                              child: ArgonButton(
                                height: 50,
                                roundLoadingShape: true,
                                width: SizeConfig.screenWidth,
                                onTap: (startLoading, stopLoading,
                                    btnState) async {
                                  startLoading();
                                  if (controller.formKey.currentState!
                                          .validate() &&
                                      controller.image.value.isNotEmpty &&
                                      controller.codeCountry.value.isNotEmpty) {
                                    if (controller.withFaceSocial.value) {
                                      controller.registerCustomerWithSocial(
                                        provider: controller.provider.value,
                                        providerId: controller.providerId.value,
                                      );
                                      stopLoading();
                                      controller.userNameController.text = '';
                                      controller.emailController.text = '';
                                      controller.providerId.value = '';
                                      controller.provider.value = '';
                                    } else if (controller
                                        .withGoogleSocial.value) {
                                      controller.registerCustomerWithSocial(
                                        provider: controller.provider.value,
                                        providerId: controller.providerId.value,
                                      );
                                      stopLoading();
                                      controller.userNameController.text = '';
                                      controller.emailController.text = '';
                                      controller.providerId.value = '';
                                      controller.provider.value = '';
                                    } else {
                                      controller.registerCustomer();
                                      stopLoading();
                                    }
                                  } else {
                                    Get.snackbar(
                                      'Enter required fields'.tr,
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
                                    stopLoading();
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
                                  'Create account'.tr,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Obx(
                            () => controller.flagStatus.value!
                                ? Container()
                                : const OrDivider(),
                          ),
                          // const SizedBox(
                          //   height: 15,
                          // ),
                          // Obx(() => controller.flagStatus.value!
                          //     ? Container()
                          //     : Padding(
                          //         padding: const EdgeInsets.symmetric(
                          //           horizontal: 10,
                          //         ),
                          //         child: IconButtonWidget(
                          //           iconSize: 20,
                          //           backgroundColor: Colors.blue,
                          //           title: 'Create an account with facebook'.tr,
                          //           onTap: () {
                          //             controller.facebookSignUp();
                          //           },
                          //           radius: 15,
                          //           icon: FontAwesomeIcons.facebookF,
                          //         ),
                          //       )),
                          const SizedBox(
                            height: 15,
                          ),
                          Obx(() => controller.flagStatus.value!
                              ? Container()
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: IconButtonWidget(
                                    iconSize: 20,
                                    backgroundColor: Colors.red,
                                    title: 'Create account with google'.tr,
                                    onTap: () {
                                      controller.googleSignUp();
                                    },
                                    radius: 15,
                                    icon: FontAwesomeIcons.google,
                                  ),
                                )),
                          const SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
    }));
  }
}
