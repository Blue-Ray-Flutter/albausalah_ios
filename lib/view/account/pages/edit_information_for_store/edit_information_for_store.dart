import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:loading_icon_button/loading_icon_button.dart';

import '../../../../res/assets_res.dart';
import '../../../../shared/components/constants/style/color.dart';
import '../../../../shared/components/widgets/size_config/size_config.dart';
import '../../../../shared/components/widgets/text_filed/text_form_filed_widget.dart';
import '../../../location/location_page.dart';
import 'controller/edit_information_for_store_controller.dart';

class EditInformationForStore
    extends GetWidget<EditInformationForStoreController> {
  const EditInformationForStore({Key? key}) : super(key: key);

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
        () => controller.myInformationModel.value == null ||
                controller.citiesModel.value == null
            ? Center(
                child: LoadingAnimationWidget.stretchedDots(
                  color: AppColor.globalDefaultColor,
                  size: 40,
                ),
              )
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
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
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          DefaultFormField(
                            validator: (name) {
                              if (name == null || name.isEmpty) {
                                return 'Full name is required'.tr;
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
                            'User Name *'.tr
                            ,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          DefaultFormField(
                            validator: (userName) {
                              if (userName == null || userName.isEmpty) {
                                return 'User name is required';
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
                              fontWeight: FontWeight.bold,
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
                          // Obx(() {
                          //   return Container(
                          //     decoration: BoxDecoration(
                          //       border: Border.all(
                          //         color: AppColor.globalDefaultColor,
                          //         width: 0.4,
                          //       ),
                          //       borderRadius:
                          //           const BorderRadius.all(Radius.circular(15)),
                          //       color: Colors.grey[50],
                          //     ),
                          //     child: Padding(
                          //       padding: const EdgeInsets.symmetric(
                          //         horizontal: 7,
                          //         vertical: 5,
                          //       ),
                          //       child: InternationalPhoneNumberInput(
                          //         textFieldController:
                          //             controller.phoneController,
                          //         onInputChanged: (PhoneNumber number) {
                          //           controller.codeCountry.value =
                          //               number.dialCode ?? '';
                          //         },
                          //         onInputValidated: (bool value) {},
                          //         autoFocus: false,
                          //         selectorConfig: const SelectorConfig(
                          //           selectorType:
                          //               PhoneInputSelectorType.BOTTOM_SHEET,
                          //         ),
                          //         ignoreBlank: false,
                          //         selectorTextStyle: const TextStyle(
                          //           color: AppColor.globalDefaultColor,
                          //         ),
                          //         // initialValue: PhoneNumber(
                          //         //   dialCode:
                          //         //       controller.codeCountry.value.isEmpty
                          //         //           ? controller.myInformationModel
                          //         //               .value!.userData!.countryCode!
                          //         //           : controller.codeCountry.value,
                          //         // ),
                          //         inputDecoration: InputDecoration(
                          //           border: OutlineInputBorder(
                          //             borderSide: const BorderSide(
                          //               color: AppColor.globalDefaultColor,
                          //             ),
                          //             borderRadius: BorderRadius.circular(15),
                          //           ),
                          //           enabledBorder: OutlineInputBorder(
                          //             borderSide: const BorderSide(
                          //               color: Colors.white,
                          //               width: 0.0001,
                          //             ),
                          //             borderRadius: BorderRadius.circular(15),
                          //           ),
                          //           focusedBorder: OutlineInputBorder(
                          //             borderSide: const BorderSide(
                          //               color: Colors.white,
                          //               width: 0.05,
                          //             ),
                          //             borderRadius: BorderRadius.circular(15),
                          //           ),
                          //           focusedErrorBorder: OutlineInputBorder(
                          //             borderSide: const BorderSide(
                          //               color: Colors.white,
                          //               width: 0.05,
                          //             ),
                          //             borderRadius: BorderRadius.circular(15),
                          //           ),
                          //         ),
                          //         formatInput: false,
                          //         keyboardType:
                          //             const TextInputType.numberWithOptions(
                          //           signed: true,
                          //           decimal: true,
                          //         ),
                          //         inputBorder: const OutlineInputBorder(
                          //           borderSide: BorderSide(color: Colors.white),
                          //           borderRadius:
                          //               BorderRadius.all(Radius.circular(15)),
                          //         ),
                          //         onSaved: (PhoneNumber number) {},
                          //       ),
                          //     ),
                          //   );
                          // }),
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
                            'Address *'.tr,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          DefaultFormField(
                            validator: (address) {
                              if (address == null || address.isEmpty) {
                                return 'Address  is required'.tr;
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
                            height: 15,
                          ),
                           Text(
                            'Store Name *'.tr,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          DefaultFormField(
                            validator: (storeName) {
                              if (storeName == null || storeName.isEmpty) {
                                return 'Store Name is required'.tr;
                              }
                              return null;
                            },
                            controller: controller.storeNameController,
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
                            'Store Description *'.tr,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          DefaultFormField(
                            validator: (description) {
                              if (description == null || description.isEmpty) {
                                return 'Description is required'.tr;
                              }
                              return null;
                            },
                            controller: controller.descriptionController,
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
                            'The services/products store provides *'.tr,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          DefaultFormField(
                            validator: (services) {
                              if (services == null || services.isEmpty) {
                                return 'Service Name is required'.tr;
                              }
                              return null;
                            },
                            controller: controller.servicesController,
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
                            height: 15,
                          ),
                           Text(
                            'Store Type *'.tr,
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
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  width: 0.5,
                                  color: AppColor.globalDefaultColor,
                                ),
                              ),
                              child: CoolDropdown(
                                resultWidth: SizeConfig.screenWidth,
                                dropdownItemPadding: const EdgeInsets.all(5),
                                dropdownItemGap: 5,
                                dropdownHeight: 150,
                                dropdownList:  [
                                  {'label': 'Enabled'.tr, 'value': 1},
                                  {'label': 'disabled'.tr, 'value': 2},
                                ],
                                defaultValue:  {
                                  'label': 'Choose your store type *'.tr,
                                  'value': 0
                                },
                                isAnimation: true,
                                isResultLabel: true,
                                onChange: (value) {
                                  controller.storeTypeValue.value =
                                      value['value'];
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
                            height: 15,
                          ),
                           Text(
                            'Store Status *'.tr,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  width: 0.5,
                                  color: AppColor.globalDefaultColor,
                                ),
                              ),
                              child: CoolDropdown(
                                resultWidth: SizeConfig.screenWidth,
                                dropdownItemPadding: const EdgeInsets.all(5),
                                dropdownItemGap: 5,
                                dropdownHeight: 150,
                                dropdownList:  [
                                  {'label': 'Active'.tr, 'value': 1},
                                  {'label': 'Inactive'.tr, 'value': 2},
                                ],
                                defaultValue:  {
                                  'label': 'Choose your store type *'.tr,
                                  'value': 0
                                },
                                isAnimation: true,
                                isResultLabel: true,
                                onChange: (value) {
                                  controller.storeStatusValue.value =
                                      value['value'];
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
                            height: 15,
                          ),
                           Text(
                            'Store City *'.tr,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  width: 0.5,
                                  color: AppColor.globalDefaultColor,
                                ),
                              ),
                              child: CoolDropdown(
                                resultWidth: SizeConfig.screenWidth,
                                dropdownItemPadding: const EdgeInsets.all(5),
                                dropdownItemGap: 5,
                                dropdownHeight: 250,
                                dropdownList: controller
                                    .citiesModel.value!.cities!
                                    .map((e) {
                                  return {'label': e.name, 'value': e.id};
                                }).toList(),
                                defaultValue:  {
                                  'label': 'Store City *'.tr,
                                  'value': 0
                                },
                                isAnimation: true,
                                isResultLabel: true,
                                onChange: (value) {
                                  controller.storeCityValue.value =
                                      value['value'];
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
                            height: 10,
                          ),
                           Text(
                            'Show store on home page *'.tr,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  width: 0.5,
                                  color: AppColor.globalDefaultColor,
                                ),
                              ),
                              child: CoolDropdown(
                                resultWidth: SizeConfig.screenWidth,
                                dropdownItemPadding: const EdgeInsets.all(5),
                                dropdownItemGap: 5,
                                dropdownHeight: 150,
                                dropdownList:  [
                                  {'label': 'View in store'.tr, 'value': 1},
                                  {'label': 'Enabled'.tr, 'value': 2},
                                  {'label': 'disabled'.tr, 'value': 3},
                                ],
                                defaultValue:  {
                                  'label': 'View store *'.tr,
                                  'value': 0
                                },
                                isAnimation: true,
                                isResultLabel: true,
                                onChange: (value) {
                                  controller.showInHomePageValue.value =
                                      value['value'];
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
                            height: 15,
                          ),
                           Text(
                            'Delivery status *'.tr,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  width: 0.5,
                                  color: AppColor.globalDefaultColor,
                                ),
                              ),
                              child: CoolDropdown(
                                resultWidth: SizeConfig.screenWidth,
                                dropdownItemPadding: const EdgeInsets.all(5),
                                dropdownItemGap: 5,
                                dropdownHeight: 150,
                                dropdownList:  [
                                  {'label': 'Free'.tr, 'value': 1},
                                  {'label': 'Paid'.tr, 'value': 2},
                                ],
                                defaultValue:  {
                                  'label': 'Delivery status *'.tr,
                                  'value': 0
                                },
                                isAnimation: true,
                                isResultLabel: true,
                                onChange: (value) {
                                  controller.freeDeliveryStatusValue.value =
                                      value['value'];
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
                            height: 15,
                          ),
                           Text(
                            'Store region *'.tr,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          DefaultFormField(
                            validator: (region) {
                              if (region == null || region.isEmpty) {
                                return 'Region is required'.tr;
                              }
                              return null;
                            },
                            controller: controller.regionController,
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
                            height: 15,
                          ),
                           Text(
                            'Street *'.tr,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          DefaultFormField(
                            validator: (street) {
                              if (street == null || street.isEmpty) {
                                return 'Street is required'.tr;
                              }
                              return null;
                            },
                            controller: controller.streetController,
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
                            'Building Name *'.tr,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          DefaultFormField(
                            validator: (buildingName) {
                              if (buildingName == null ||
                                  buildingName.isEmpty) {
                                return 'Building name is required'.tr;
                              }
                              return null;
                            },
                            controller: controller.buildingNameController,
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
                            'Building Number *'.tr,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          DefaultFormField(
                            validator: (buildingNumber) {
                              if (buildingNumber == null ||
                                  buildingNumber.isEmpty) {
                                return 'Building Number is required'.tr;
                              }
                              return null;
                            },
                            controller: controller.buildingNumberController,
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
                            'Mail Box *'.tr,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          DefaultFormField(
                            validator: (mailBox) {
                              if (mailBox == null || mailBox.isEmpty) {
                                return 'Mail box is required'.tr;
                              }
                              return null;
                            },
                            controller: controller.mailBoxController,
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
                            'Postal Code *'.tr,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          DefaultFormField(
                            validator: (postal) {
                              if (postal == null || postal.isEmpty) {
                                return 'Postal code is required'.tr;
                              }
                              return null;
                            },
                            controller: controller.postalCodeController,
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
                            'Location (Click on button to give your location)'.tr,
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
                            child:  Text('Pick address'.tr),
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
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Obx(
                            () => DefaultFormField(
                              validator: (pass) {
                                if (pass == null || pass.isEmpty) {
                                  return 'Password is Required'.tr;
                                }
                                return null;
                              },
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.hidePassFun();
                                },
                                icon: Icon(
                                  controller.ico.value,
                                  size: 23,
                                ),
                                color: AppColor.globalDefaultColor,
                              ),
                              controller: controller.passwordController,
                              minLines: 1,
                              maxLines: 1,
                              isPassword: controller.hidePass.value,
                              enabled: true,
                              readOnly: false,
                              radius: 15,
                              autofocus: false,
                              focusBorderColor: AppColor.globalDefaultColor,
                              textColor: AppColor.globalDefaultColor,
                              borderColors: AppColor.globalDefaultColor,
                              filled: false,
                            ),
                          ),

                          const SizedBox(
                            height: 10,
                          ),
                           Text(
                            'Confirm password *'.tr,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Obx(
                            () => DefaultFormField(
                              validator: (pass) {
                                if (pass == null || pass.isEmpty) {
                                  return 'password confirmation is required'.tr;
                                }
                                return null;
                              },
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.hideConfirmPassFun();
                                },
                                icon: Icon(
                                  controller.icoConfirm.value,
                                  size: 23,
                                ),
                                color: AppColor.globalDefaultColor,
                              ),
                              controller: controller.confirmPasswordController,
                              minLines: 1,
                              maxLines: 1,
                              isPassword: controller.hideConfirmPass.value,
                              enabled: true,
                              readOnly: false,
                              radius: 15,
                              autofocus: false,
                              focusBorderColor: AppColor.globalDefaultColor,
                              textColor: AppColor.globalDefaultColor,
                              borderColors: AppColor.globalDefaultColor,
                              filled: false,
                            ),
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
                                if (controller.formKey.currentState!
                                        .validate() &&
                                    controller.freeDeliveryStatusValue.value >
                                        0 &&
                                    controller.showInHomePageValue.value > 0 &&
                                    controller.storeCityValue.value > 0 &&
                                    controller.storeStatusValue.value > 0 &&
                                    controller.storeTypeValue.value > 0) {
                                  await controller.updateMyProfile();
                                  controller.btnController.reset();
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
