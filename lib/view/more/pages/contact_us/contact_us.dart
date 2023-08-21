import 'package:albausalah_app/res/assets_res.dart';
import 'package:albausalah_app/view/more/pages/contact_us/controller/contact_us_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../shared/components/constants/style/color.dart';
import '../../../../shared/components/widgets/button/button.dart';
import '../../../../shared/components/widgets/text_filed/text_form_filed_widget.dart';

class ContactUS extends GetWidget<ContactUsController> {
  const ContactUS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, // <-- SEE HERE
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.6,
        title: Text(
          'Contact US'.tr,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Obx(
        () => controller.contactUsModel.value == null
            ? Center(
                child: LoadingAnimationWidget.stretchedDots(
                  color: AppColor.globalDefaultColor,
                  size: 40,
                ),
              )
            : Form(
                key: controller.formKey,
                child: ListView(
                  padding: const EdgeInsets.only(
                    top: 20,
                    right: 20,
                    left: 20,
                    bottom: 40,
                  ),
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.grey[400]!,
                            width: 0.8,
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            ListTile(
                              onTap: () async {
                                await launchUrl(Uri(
                                  scheme: 'tel',
                                  path: controller
                                      .contactUsModel.value!.contactUs!.mobile!,
                                ));
                              },
                              leading: const Icon(
                                Icons.phone,
                                color: AppColor.globalDefaultColor,
                              ),
                              title: Text('Phone'.tr),
                              subtitle: Text(controller
                                  .contactUsModel.value!.contactUs!.mobile!),
                            ),
                            ListTile(
                              onTap: () async {
                                await launchUrl(Uri(
                                  scheme: 'mailto'.tr,
                                  path: controller.contactUsModel.value!
                                      .contactUs!.emailOne!,
                                ));
                              },
                              leading: const Icon(
                                Icons.email,
                                color: AppColor.globalDefaultColor,
                              ),
                              title: Text('Email'.tr),
                              subtitle: Text(controller
                                  .contactUsModel.value!.contactUs!.emailOne!),
                            ),
                            ListTile(
                              leading: const Icon(
                                Icons.location_on,
                                color: AppColor.globalDefaultColor,
                              ),
                              title: Text('Address'.tr),
                              subtitle: Text(controller
                                  .contactUsModel.value!.contactUs!.address!),
                            ),
                            ListTile(
                              onTap: () async {
                                await launchUrl(
                                    Uri.parse('https://web.whatsapp.com'));
                              },
                              leading: const Icon(
                                FontAwesomeIcons.whatsapp,
                                color: AppColor.globalDefaultColor,
                              ),
                              title: Text('Send a message on whatsapp'.tr),
                            ),
                            const Image(
                                height: 100,
                                width: 100,
                                image: AssetImage(
                                  AssetsRes.ALBAUSALAH_LOGO,
                                ))
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.grey[400]!,
                            width: 0.8,
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Text(
                              'Support Team'.tr,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            ListTile(
                              onTap: () async {
                                await launchUrl(Uri(
                                  scheme: 'tel',
                                  path: controller
                                      .contactUsModel.value!.contactUs!.mobile!,
                                ));
                              },
                              leading: const Icon(
                                Icons.phone,
                                color: AppColor.globalDefaultColor,
                              ),
                              title: Text('Support phone one'.tr),
                              subtitle: Text(controller.contactUsModel.value!
                                      .contactUs!.supportMobileOne ??
                                  ''),
                            ),
                            ListTile(
                              onTap: () async {
                                await launchUrl(Uri(
                                  scheme: 'tel',
                                  path: controller
                                      .contactUsModel.value!.contactUs!.mobile!,
                                ));
                              },
                              leading: const Icon(
                                Icons.phone,
                                color: AppColor.globalDefaultColor,
                              ),
                              title: Text('Support phone two'.tr),
                              subtitle: Text(controller.contactUsModel.value!
                                      .contactUs!.supportMobileTwo ??
                                  ''),
                            ),
                            ListTile(
                              onTap: () async {
                                await launchUrl(Uri(
                                  scheme: 'mailto',
                                  path: controller.contactUsModel.value!
                                      .contactUs!.emailOne!,
                                ));
                              },
                              leading: const Icon(
                                Icons.email,
                                color: AppColor.globalDefaultColor,
                              ),
                              title: Text('Support email one'.tr),
                              subtitle: Text(controller.contactUsModel.value!
                                      .contactUs!.supportEmailOne ??
                                  ''),
                            ),
                            ListTile(
                              onTap: () async {
                                await launchUrl(Uri(
                                  scheme: 'mailto'.tr,
                                  path: controller.contactUsModel.value!
                                      .contactUs!.emailOne!,
                                ));
                              },
                              leading: const Icon(
                                Icons.email,
                                color: AppColor.globalDefaultColor,
                              ),
                              title: Text('Support email two'.tr),
                              subtitle: Text(controller.contactUsModel.value!
                                      .contactUs!.supportEmailTwo ??
                                  ''),
                            ),
                            const Image(
                                height: 100,
                                width: 100,
                                image: AssetImage(
                                  AssetsRes.ALBAUSALAH_LOGO,
                                ))
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.grey[400]!,
                            width: 0.8,
                          )),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 40,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Subject'.tr,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            DefaultFormField(
                              validator: (subject) {
                                if (subject == null || subject.isEmpty) {
                                  return 'Subject is required'.tr;
                                }
                                return null;
                              },
                              controller: controller.subjectController,
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
                              'Name'.tr,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            DefaultFormField(
                              validator: (name) {
                                if (name == null || name.isEmpty) {
                                  return 'Name is required'.tr;
                                }
                                return null;
                              },
                              controller: controller.nameController,
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
                              'Email'.tr,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            DefaultFormField(
                              validator: (email) {
                                if (email == null || email.isEmpty) {
                                  return 'Email is required'.tr;
                                }
                                return null;
                              },
                              controller: controller.emailController,
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
                                  textFieldController:
                                      controller.phoneController,
                                  onInputChanged: (PhoneNumber number) {},
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
                                  initialValue: PhoneNumber(isoCode: 'JO'),
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
                              height: 15,
                            ),
                            Text(
                              'Message'.tr,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            DefaultFormField(
                              validator: (message) {
                                if (message == null || message.isEmpty) {
                                  return 'Message is required'.tr;
                                }
                                return null;
                              },
                              controller: controller.messageController,
                              minLines: 5,
                              maxLines: 10,
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
                              height: 20,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Button(
                                radius: 15,
                                height: 50,
                                width: 180,
                                onPressed: () {
                                  if (controller.formKey.currentState!
                                      .validate()) {
                                    controller.requestContactUs();
                                  } else {
                                    Get.snackbar(
                                      'Enter required fields '.tr,
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
                                text: 'Send'.tr,
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
    );
  }
}
