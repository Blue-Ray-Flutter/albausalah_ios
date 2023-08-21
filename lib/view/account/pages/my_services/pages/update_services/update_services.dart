import 'package:albausalah_app/shared/components/widgets/button/button.dart';
import 'package:albausalah_app/shared/components/widgets/size_config/size_config.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../shared/components/constants/style/color.dart';
import '../../../../../../shared/components/widgets/text_filed/text_form_filed_widget.dart';
import 'controller/update_services_controller.dart';

class UpdateService extends GetWidget<UpdateServiceController> {
  const UpdateService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, // <-- SEE HERE
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.6,
        title:  Text(
          'Update Service'.tr,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Form(
        key: controller.formKey,
        child: ListView(
          padding: const EdgeInsets.only(
            top: 20,
            right: 10,
            left: 10,
          ),
          children: [
             Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text(
                'Service title *'.tr,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: DefaultFormField(
                validator: (title) {
                  if (title == null || title.isEmpty) {
                    return 'Title Required'.tr;
                  }
                  return null;
                },
                controller: controller.titleController,
                isPassword: false,
                enabled: true,
                readOnly: false,
                radius: 15,
                autofocus: false,
                focusBorderColor: AppColor.globalDefaultColor,
                textColor: AppColor.globalDefaultColor,
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
             Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text(
                'Status *'.tr,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: CoolDropdown(
                resultHeight: 60,
                resultWidth: SizeConfig.screenWidth * 0.9,
                dropdownItemPadding: const EdgeInsets.all(5),
                dropdownItemGap: 5,
                dropdownHeight: 120,
                dropdownList:  [
                  {'label': 'Active'.tr, 'value': 1},
                  {'label': ' Inactive'.tr, 'value': 2},
                ],
                defaultValue:  {
                  'label': 'Choose your status *'.tr,
                  'value': 0
                },
                isAnimation: true,
                isResultLabel: true,
                onChange: (value) {
                  controller.statusValue.value = value['value'];
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
              height: 40,
            ),
            Button(
              radius: 15,
              height: 50,
              onPressed: () {
                if (controller.formKey.currentState!.validate() &&
                    controller.statusValue > 0) {
                  controller.updateService();
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
                }
              },
              text: 'Save'.tr,
            ),
          ],
        ),
      ),
    ));
  }
}
