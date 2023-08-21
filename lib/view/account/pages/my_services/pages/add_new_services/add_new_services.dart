import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_icon_button/loading_icon_button.dart';

import '../../../../../../shared/components/constants/style/color.dart';
import '../../../../../../shared/components/widgets/size_config/size_config.dart';
import '../../../../../../shared/components/widgets/text_filed/text_form_filed_widget.dart';
import 'controller/add_new_services_controller.dart';

class AddNewServices extends GetWidget<AddNewServicesController> {
  const AddNewServices({Key? key}) : super(key: key);

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
          'Add new service'.tr,
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
            top: 40,
          ),
          children: [
             Text(
              'Title *'.tr,
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
                  return 'Service is required'.tr;
                }
                return null;
              },
              controller: controller.titleController,
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
              child: CoolDropdown(
                resultWidth: SizeConfig.screenWidth,
                dropdownItemPadding: const EdgeInsets.all(5),
                dropdownItemGap: 5,
                dropdownHeight: 130,
                dropdownList:  [
                  {'label': 'Active'.tr, 'value': 1},
                  {'label': 'Inactive'.tr, 'value': 2},
                ],
                defaultValue:  {'label': 'Status *'.tr, 'value': 0},
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
                      controller.activeValue.value > 0) {
                    await controller.addNewServices();
                    await stopLoading();
                  } else {
                    Get.snackbar(
                      'field required'.tr,
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
