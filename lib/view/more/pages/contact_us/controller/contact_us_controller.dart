import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../api/repository/http_repository.dart';
import '../../../../../shared/components/constants/style/color.dart';
import '../../../../../shared/helper/cache_utils.dart';
import '../model/contact_us_model.dart';

class ContactUsController extends GetxController {
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;

  ContactUsController({required this.httpRepository, required this.cacheUtils});

  Rx<ContactUsModel?> contactUsModel = Rx<ContactUsModel?>(null);

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final messageController = TextEditingController();
  final subjectController = TextEditingController();

  getContactUs() async {
    late Rx<Response?> contactUsResponse = Rx<Response?>(null);

    try {
      contactUsResponse.value = await httpRepository.getContactUs(
        lang: cacheUtils.getLanguage()!,
      );

      if (contactUsResponse.value == null) {
        return null;
      }
      contactUsModel.value =
          ContactUsModel.fromJson(contactUsResponse.value!.body);
    } catch (e) {
      Get.snackbar(
        'Get Contact Us'.tr,
        'Something wrong'.tr,
        icon: const Icon(
          Icons.warning,
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
      e.printError();
    }
  }

  requestContactUs() async {
    try {
      httpRepository.contactUsRequest(
        name: nameController.text,
        email: emailController.text,
        message: messageController.text,
        subject: subjectController.text,
        phone: phoneController.text,
        lang: cacheUtils.getLanguage()!,
      );
      nameController.text = '';
      emailController.text = '';
      messageController.text = '';
      subjectController.text = '';
      phoneController.text = '';
    } catch (e) {
      Get.snackbar(
        'Request Contact Us'.tr,
        'Something wrong'.tr,
        icon: const Icon(
          Icons.warning,
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
      e.printError();
    }
  }

  launchURL(url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url'.tr;
    }
  }

  @override
  Future<void> onInit() async {
    await getContactUs();
    super.onInit();
  }
}
