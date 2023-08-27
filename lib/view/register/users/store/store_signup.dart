import 'dart:io';

import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:loading_icon_button/loading_icon_button.dart';

import '../../../../res/assets_res.dart';
import '../../../../shared/components/constants/style/color.dart';
import '../../../../shared/components/widgets/button/icon_button.dart';
import '../../../../shared/components/widgets/divider/or_divider.dart';
import '../../../../shared/components/widgets/size_config/size_config.dart';
import '../../../../shared/components/widgets/text_filed/text_form_filed_widget.dart';
import 'controller/store_signup_controller.dart';

class StoreSignUp extends GetWidget<StoreSignupController> {
  const StoreSignUp({Key? key}) : super(key: key);

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
                  child: Obx(() {
                    return controller.citiesModel.value == null
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 80,
                            ),
                            child: Center(
                                child: LoadingAnimationWidget.stretchedDots(
                              color: AppColor.globalDefaultColor,
                              size: 40,
                            )),
                          )
                        : SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            physics: const ScrollPhysics(),
                            child: Form(
                              key: controller.formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Stack(
                                      alignment: Alignment.topRight,
                                      children: [
                                        controller.image.value.isEmpty
                                            ? Container(
                                                width: 100,
                                                height: 100,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
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
                                                        BorderRadius.circular(
                                                            100),
                                                    image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: FileImage(File(
                                                          controller
                                                              .image.value)),
                                                    )),
                                              ),
                                        Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[100],
                                              borderRadius:
                                                  const BorderRadius.all(
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
                                    'Store type *'.tr,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Obx(() {
                                    return Row(
                                      children: [
                                        Expanded(
                                          child: RadioListTile(
                                            title: Text('Existing'.tr),
                                            value: 1,
                                            groupValue: controller
                                                .selectedValueStoreType.value,
                                            onChanged: (value) {
                                              controller.selectedValueStoreType
                                                  .value = value!;
                                            },
                                          ),
                                        ),
                                        Expanded(
                                          child: RadioListTile(
                                            title: Text('Virtual store'.tr),
                                            value: 2,
                                            groupValue: controller
                                                .selectedValueStoreType.value,
                                            onChanged: (value) {
                                              controller.selectedValueStoreType
                                                  .value = value!;
                                            },
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Delivery type *'.tr,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Obx(() {
                                    return Row(
                                      children: [
                                        Expanded(
                                          child: RadioListTile(
                                            title: Text('Free delivery'.tr),
                                            value: 1,
                                            groupValue: controller
                                                .selectedValueDeliveryType
                                                .value,
                                            onChanged: (value) {
                                              controller
                                                  .selectedValueDeliveryType
                                                  .value = value!;
                                            },
                                          ),
                                        ),
                                        Expanded(
                                          child: RadioListTile(
                                            title: Text('Paid delivery'.tr),
                                            value: 2,
                                            groupValue: controller
                                                .selectedValueDeliveryType
                                                .value,
                                            onChanged: (value) {
                                              controller
                                                  .selectedValueDeliveryType
                                                  .value = value!;
                                            },
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Store name *'.tr,
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
                                        return 'Store Name is required'.tr;
                                      }
                                      return null;
                                    },
                                    controller: controller.storeNameController,
                                    borderColors: AppColor.globalDefaultColor,
                                    isPassword: false,
                                    enabled: true,
                                    readOnly: false,
                                    radius: 15,
                                    autofocus: false,
                                    focusBorderColor:
                                        AppColor.globalDefaultColor,
                                    textColor: AppColor.globalDefaultColor,
                                    filled: false,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Store description *'.tr,
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
                                      if (description == null ||
                                          description.isEmpty) {
                                        return 'Description is required'.tr;
                                      }
                                      return null;
                                    },
                                    controller:
                                        controller.descriptionController,
                                    minLines: 5,
                                    maxLines: 10,
                                    borderColors: AppColor.globalDefaultColor,
                                    isPassword: false,
                                    enabled: true,
                                    readOnly: false,
                                    radius: 15,
                                    autofocus: false,
                                    focusBorderColor:
                                        AppColor.globalDefaultColor,
                                    textColor: AppColor.globalDefaultColor,
                                    filled: false,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Services/products offered by the store *'
                                        .tr,
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
                                      if (services == null ||
                                          services.isEmpty) {
                                        return 'Service is required'.tr;
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
                                    focusBorderColor:
                                        AppColor.globalDefaultColor,
                                    textColor: AppColor.globalDefaultColor,
                                    filled: false,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Full name *'.tr,
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
                                    focusBorderColor:
                                        AppColor.globalDefaultColor,
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
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  DefaultFormField(
                                    validator: (name) {
                                      if (name == null || name.isEmpty) {
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
                                    focusBorderColor:
                                        AppColor.globalDefaultColor,
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
                                    isEmail: true,
                                    isPassword: false,
                                    enabled: true,
                                    readOnly: false,
                                    radius: 15,
                                    autofocus: false,
                                    focusBorderColor:
                                        AppColor.globalDefaultColor,
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
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15)),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 7,
                                        vertical: 5,
                                      ),
                                      child: InternationalPhoneNumberInput(
                                        textFieldController:
                                            controller.phoneController,
                                        onInputChanged: (PhoneNumber number) {
                                          controller.codeCountry.value =
                                              number.dialCode ?? '';
                                        },
                                        searchBoxDecoration:
                                            const InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                        ),
                                        onInputValidated: (bool value) {},
                                        autoFocus: false,
                                        selectorConfig: const SelectorConfig(
                                          selectorType: PhoneInputSelectorType
                                              .BOTTOM_SHEET,
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
                                              color:
                                                  AppColor.globalDefaultColor,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 0.0001,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 0.05,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 0.05,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                        formatInput: false,
                                        keyboardType: const TextInputType
                                            .numberWithOptions(
                                          signed: true,
                                          decimal: true,
                                        ),
                                        inputBorder: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                        onSaved: (PhoneNumber number) {},
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
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
                                    focusBorderColor:
                                        AppColor.globalDefaultColor,
                                    textColor: AppColor.globalDefaultColor,
                                    filled: false,
                                  ),
                                  const SizedBox(
                                    height: 10,
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
                                    height: 5,
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
                                    focusBorderColor:
                                        AppColor.globalDefaultColor,
                                    textColor: AppColor.globalDefaultColor,
                                    filled: false,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Store street *'.tr,
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
                                    focusBorderColor:
                                        AppColor.globalDefaultColor,
                                    textColor: AppColor.globalDefaultColor,
                                    filled: false,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Building number *'.tr,
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
                                    controller:
                                        controller.buildingNumberController,
                                    minLines: 1,
                                    maxLines: 1,
                                    borderColors: AppColor.globalDefaultColor,
                                    isPassword: false,
                                    isEmail: false,
                                    keyboardType: TextInputType.phone,
                                    enabled: true,
                                    readOnly: false,
                                    radius: 15,
                                    autofocus: false,
                                    focusBorderColor:
                                        AppColor.globalDefaultColor,
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
                                    controller:
                                        controller.buildingNameController,
                                    minLines: 1,
                                    maxLines: 1,
                                    borderColors: AppColor.globalDefaultColor,
                                    isPassword: false,
                                    enabled: true,
                                    readOnly: false,
                                    radius: 15,
                                    autofocus: false,
                                    focusBorderColor:
                                        AppColor.globalDefaultColor,
                                    textColor: AppColor.globalDefaultColor,
                                    filled: false,
                                  ),
                                  const SizedBox(
                                    height: 10,
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
                                    height: 5,
                                  ),
                                  Center(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: AppColor.globalDefaultColor,
                                            width: .4,
                                          )),
                                      child: CoolDropdown(
                                        resultWidth: SizeConfig.screenWidth,
                                        dropdownItemPadding:
                                            const EdgeInsets.all(5),
                                        dropdownItemGap: 5,
                                        dropdownHeight: 250,
                                        dropdownList: controller
                                            .citiesModel.value!.cities!
                                            .map((e) {
                                          return {
                                            'label': e.name,
                                            'value': e.id
                                          };
                                        }).toList(),
                                        defaultValue: {
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
                                        dropdownItemMainAxis:
                                            MainAxisAlignment.start,
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
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Center(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: AppColor.globalDefaultColor,
                                            width: .4,
                                          )),
                                      child: CoolDropdown(
                                        resultWidth: SizeConfig.screenWidth,
                                        dropdownItemPadding:
                                            const EdgeInsets.all(5),
                                        dropdownItemGap: 5,
                                        dropdownHeight: 150,
                                        dropdownList: [
                                          {
                                            'label': 'View in store'.tr,
                                            'value': 1
                                          },
                                          {'label': 'Enabled'.tr, 'value': 2},
                                          {'label': 'Disabled'.tr, 'value': 3},
                                        ],
                                        defaultValue: {
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
                                        dropdownItemMainAxis:
                                            MainAxisAlignment.start,
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
                                    isEmail: false,
                                    isPassword: false,
                                    enabled: true,
                                    readOnly: false,
                                    radius: 15,
                                    autofocus: false,
                                    focusBorderColor:
                                        AppColor.globalDefaultColor,
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
                                    isEmail: false,
                                    isPassword: false,
                                    enabled: true,
                                    readOnly: false,
                                    radius: 15,
                                    autofocus: false,
                                    focusBorderColor:
                                        AppColor.globalDefaultColor,
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
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  DefaultFormField(
                                    validator: (password) {
                                      if (password == null ||
                                          password.isEmpty) {
                                        return 'Password is required'.tr;
                                      }
                                      return null;
                                    },
                                    controller: controller.passwordController,
                                    minLines: 1,
                                    maxLines: 1,
                                    borderColors: AppColor.globalDefaultColor,
                                    isPassword: true,
                                    enabled: true,
                                    readOnly: false,
                                    radius: 15,
                                    autofocus: false,
                                    focusBorderColor:
                                        AppColor.globalDefaultColor,
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
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  DefaultFormField(
                                    validator: (cPassword) {
                                      if (cPassword == null ||
                                          cPassword.isEmpty) {
                                        return 'password confirmation is required'
                                            .tr;
                                      }
                                      return null;
                                    },
                                    controller:
                                        controller.confirmPasswordController,
                                    minLines: 1,
                                    maxLines: 1,
                                    borderColors: AppColor.globalDefaultColor,
                                    isPassword: true,
                                    enabled: true,
                                    readOnly: false,
                                    radius: 15,
                                    autofocus: false,
                                    focusBorderColor:
                                        AppColor.globalDefaultColor,
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
                                              .validate()) {
                                            if (controller
                                                .withFaceSocial.value) {
                                              controller
                                                  .registerStoreWithSocial(
                                                provider:
                                                    controller.provider.value,
                                                providerId:
                                                    controller.providerId.value,
                                              );
                                              stopLoading();

                                              controller
                                                  .userNameController.text = '';
                                              controller.emailController.text =
                                                  '';
                                              controller.providerId.value = '';
                                              controller.provider.value = '';
                                            } else if (controller
                                                .withGoogleSocial.value) {
                                              controller
                                                  .registerStoreWithSocial(
                                                provider:
                                                    controller.provider.value,
                                                providerId:
                                                    controller.providerId.value,
                                              );
                                              stopLoading();

                                              controller
                                                  .userNameController.text = '';
                                              controller.emailController.text =
                                                  '';
                                              controller.providerId.value = '';
                                              controller.provider.value = '';
                                            } else {
                                              controller.registerStore();
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
                                              duration:
                                                  const Duration(seconds: 2),
                                              isDismissible: true,
                                              dismissDirection:
                                                  DismissDirection.horizontal,
                                              forwardAnimationCurve:
                                                  Curves.easeOutBack,
                                            );
                                            stopLoading();
                                          }
                                        },
                                        loader: const Center(
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
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
                                  //           title:
                                  //               'Create account with facebook'
                                  //                   .tr,
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
                                            title:
                                                'Create account with google'.tr,
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
                          );
                  }),
                ),
              ),
            );
    }));
  }
}
