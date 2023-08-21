import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../api/repository/http_repository.dart';
import '../../../shared/components/constants/style/color.dart';
import '../../../shared/helper/cache_utils.dart';
import '../../login/model/login_slider_model.dart';

class RegisterController extends GetxController {
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;

  RegisterController({required this.httpRepository, required this.cacheUtils});

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Rx<LoginSliderModel?> registerSliderModel = Rx<LoginSliderModel?>(null);

  Rx<IconData> ico = Icons.visibility_outlined.obs;
  RxBool hidePass = true.obs;

  getRegisterSlider() async {
    late Rx<Response?> loginSliderResponse = Rx<Response?>(null);

    try {
      loginSliderResponse.value = await httpRepository.getLoginSlider();

      if (loginSliderResponse.value == null) {
        return null;
      }
      registerSliderModel.value =
          LoginSliderModel.fromJson(loginSliderResponse.value!.body);
    } catch (e) {
      Get.snackbar(
        'Get Register Slider'.tr,
        'Something went wrong'.tr,
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
        forwardAnimationCurve: Curves.easeInCirc,
      );
      e.printError();
    }
  }

  @override
  Future<void> onInit() async {
    await getRegisterSlider();
    super.onInit();
  }
}
