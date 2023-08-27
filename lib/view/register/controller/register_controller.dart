import 'package:albausalah_app/shared/components/constants/constant_data/constant_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../api/repository/http_repository.dart';
import '../../../api/repository/http_repository_impl.dart';
import '../../../shared/components/constants/style/color.dart';
import '../../../shared/helper/cache_utils.dart';
import '../../login/model/flag_firebase.dart';
import '../../login/model/login_slider_model.dart';

class RegisterController extends GetxController {
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;

  RegisterController({required this.httpRepository, required this.cacheUtils});

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Rx<LoginSliderModel?> registerSliderModel = Rx<LoginSliderModel?>(null);
  Rx<bool?> flagStatus = Rx<bool?>(null);
  Rx<IconData> ico = Icons.visibility_outlined.obs;
  RxBool hidePass = true.obs;

  initFlag() async {
    try {
      Response? flagResponse;
      FlagFirebase? flagModel;
      HttpRepository httpRepository = HttpRepositoryImpl();
      CacheUtils cacheUtils = CacheUtils(GetStorage());

      flagResponse = await httpRepository.flagFirebase();
      flagModel = FlagFirebase.fromJson(flagResponse!.body);
      bool? flag = flagModel.status;

      if (flag == true) {
        await cacheUtils.saveFlag(flag: true);
        FlagSingleton.instance.setFlag = true;
        flagStatus.value = true;
        // Get.offAll(() => const BaseWidget());
      } else if (flag == false) {
        FlagSingleton.instance.setFlag = false;
        await cacheUtils.saveFlag(flag: false);
        flagStatus.value = false;
      }
    } catch (e) {
      flagStatus.value = false;
    }
  }

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
    initFlag();
    super.onInit();
  }
}
