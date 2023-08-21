import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:loading_icon_button/loading_icon_button.dart';

import '../../../../../shared/components/constants/style/color.dart';
import '../../../../../shared/components/widgets/size_config/size_config.dart';
import '../../../../../shared/components/widgets/text_filed/text_form_filed_widget.dart';
import '../controller/delivery_staff_controller.dart';

class AddNewEmployee extends GetWidget<DeliveryStaffController> {
  const AddNewEmployee({Key? key}) : super(key: key);

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
        title: Text(
          'Add Employee'.tr,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Form(
        key: controller.formKey,
        child: ListView(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 20,
            top: 20,
          ),
          children: [
            Text(
              'Name *'.tr,
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
              validator: (uName) {
                if (uName == null || uName.isEmpty) {
                  return 'User name is required'.tr;
                }
                return null;
              },
              controller: controller.userNameController,
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
              'Email *'.tr,
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
            Text(
              'Status *'.tr,
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
                  dropdownHeight: 130,
                  dropdownList: [
                    {'label': 'Active'.tr, 'value': 1},
                    {'label': 'Inactive'.tr, 'value': 2},
                  ],
                  defaultValue: {'label': 'Employee status *'.tr, 'value': 0},
                  isAnimation: true,
                  isResultLabel: true,
                  onChange: (value) {
                    controller.activeValue.value = value['value'];
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
                if (password == null || password.isEmpty) {
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
              focusBorderColor: AppColor.globalDefaultColor,
              textColor: AppColor.globalDefaultColor,
              filled: false,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Confirm Password *'.tr,
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
                if (cPassword == null || cPassword.isEmpty) {
                  return 'password confirmation is required'.tr;
                }
                return null;
              },
              controller: controller.cPasswordController,
              minLines: 1,
              maxLines: 1,
              borderColors: AppColor.globalDefaultColor,
              isPassword: true,
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
              'Employee image *'.tr,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColor.globalDefaultColor,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              height: 90,
              width: SizeConfig.screenWidth,
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
                      hint: 'Upload your photo'.tr,
                      isPassword: false,
                      enabled: true,
                      readOnly: true,
                      radius: 15,
                      autofocus: true,
                      focusBorderColor: Colors.white,
                      textColor: AppColor.globalDefaultColor,
                      filled: false,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.globalDefaultColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: RichText(
                            text: TextSpan(
                              children: SizeConfig.screenWidth > 400
                                  ? [
                                      TextSpan(
                                        text: 'Upload'.tr,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const WidgetSpan(
                                          child: SizedBox(width: 8)),
                                      const WidgetSpan(
                                        child: Icon(
                                          Icons.upload_outlined,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ]
                                  : [
                                      TextSpan(
                                        text: 'Upload'.tr,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 9,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
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
              height: 15,
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
              height: 15,
            ),
            Center(
              child: ArgonButton(
                height: 50,
                roundLoadingShape: true,
                width: SizeConfig.screenWidth,
                onTap: (startLoading, stopLoading, btnState) async {
                  startLoading();
                  if (controller.formKey.currentState!.validate() &&
                      controller.codeCountry.value.isNotEmpty &&
                      controller.file!.value.path.isNotEmpty) {
                    await controller.addNewEmployee();
                    await stopLoading();
                  } else {
                    Get.snackbar(
                      'Field required'.tr,
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
                child: Text(
                  'Save'.tr,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
