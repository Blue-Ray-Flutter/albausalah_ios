import 'package:albausalah_app/shared/components/constants/style/color.dart';
import 'package:albausalah_app/view/base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../../../api/repository/http_repository.dart';
import '../../../shared/helper/cache_utils.dart';
import '../../delivery/delivery_order.dart';
import '../model/login_model.dart';
import '../model/login_slider_model.dart';

class LoginController extends GetxController {
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;

  LoginController({required this.httpRepository, required this.cacheUtils});

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Rx<LoginModel?> loginModel = Rx<LoginModel?>(null);
  Rx<LoginSliderModel?> loginSliderModel = Rx<LoginSliderModel?>(null);

  Rx<IconData> ico = Icons.visibility_outlined.obs;
  RxBool hidePass = true.obs;

  late String? playerId;

  hidePassFun() {
    if (hidePass.value) {
      hidePass.value = false;
      ico.value = Icons.visibility_off_outlined;
      return;
    } else {
      hidePass.value = true;
      ico.value = Icons.visibility_outlined;
      return;
    }
  }

  Future<void> logIn() async {
    var status = await OneSignal.shared.getDeviceState();
    if (status == null || status.userId == null) {
      return;
    }
    String playerId = status.userId!;

    try {
      late Rx<Response?> loginResponse = Rx<Response?>(null);
      loginResponse.value = await httpRepository.login(
        email: emailController.value.text,
        password: passwordController.value.text,
        lang: cacheUtils.getLanguage() ?? 'en',
        providerStatus: '2',
        playerId: playerId,
      );

      if (loginResponse.value == null) {
        return;
      }

      loginModel.value = LoginModel.fromJson(loginResponse.value!.body);

      cacheUtils.getLanguage() == null || cacheUtils.getLanguage()!.isEmpty
          ? await cacheUtils.saveLanguage(language: 'en')
          : null;

      await cacheUtils.login(
        name: loginModel.value!.userData!.name!,
        token: loginModel.value!.token!,
        email: loginModel.value!.userData!.email!,
        phone: loginModel.value!.userData!.phone!,
        uid: loginModel.value!.userData!.id!,
        userType: loginModel.value!.userType!,
      );

      await cacheUtils.savePhoto(
          photo: '${loginModel.value!.userData!.profilePhotoUrl}');

      if (cacheUtils.getUserType() == "Delivery") {
        Get.offAll(() => const DeliveryOrder());
      } else {
        // await getCart();

        Get.offAll(() => const BaseWidget());
      }
    } catch (e) {
      Get.snackbar(
        'Login In'.tr,
        'Something went wrong'.tr,
        icon: const Icon(
          Icons.warning,
          color: AppColor.globalDefaultColor,
        ),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.white,
        borderRadius: 15,
        margin: const EdgeInsets.all(15),
        colorText: AppColor.globalDefaultColor,
        duration: const Duration(seconds: 2),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        forwardAnimationCurve: Curves.easeInCirc,
      );
      e.printError();
    }
  }

  Future<void> logInWithSocial({
    required String email,
    required String provider,
    required String providerId,
  }) async {
    try {
      late Rx<Response?> loginResponse = Rx<Response?>(null);
      loginResponse.value = await httpRepository.loginWithSocial(
        provider: provider,
        providerId: providerId,
        email: email,
        password: passwordController.value.text,
        lang: cacheUtils.getLanguage()!,
        providerStatus: '1',
      );

      if (loginResponse.value == null) {
        return;
      }
      loginModel.value = LoginModel.fromJson(loginResponse.value!.body);

      await cacheUtils.login(
        name: loginModel.value!.userData!.name!,
        token: loginModel.value!.token!,
        email: loginModel.value!.userData!.email!,
        phone: loginModel.value!.userData!.phone!,
        uid: loginModel.value!.userData!.id!,
        userType: loginModel.value!.userType!,
      );

      await cacheUtils.savePhoto(
          photo:
              'https://al-bausalah.com/${loginModel.value!.userData!.profilePhotoUrl}');

      Get.offAll(() => const BaseWidget());
    } catch (e) {
      Get.snackbar(
        'Login'.tr,
        'Something went wrong'.tr,
        icon: const Icon(
          Icons.warning,
          color: AppColor.globalDefaultColor,
        ),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.white,
        borderRadius: 15,
        margin: const EdgeInsets.all(15),
        colorText: AppColor.globalDefaultColor,
        duration: const Duration(seconds: 2),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        forwardAnimationCurve: Curves.easeInCirc,
      );
      e.printError();
    }
  }

  googleLogin() async {
    GoogleSignInAccount? currentUser = await GoogleSignIn().signIn();
    if (currentUser != null) {
      String email = currentUser.email;
      String name = currentUser.displayName ?? "";
      String id = currentUser.id.toString();
      String photoUrl = currentUser.photoUrl ?? "";
      await logInWithSocial(email: name, provider: 'Google', providerId: id);
    }
  }

  facebookLogin() async {
    try {
      final result =
          await FacebookAuth.i.login(permissions: ['public_profile', 'email']);
      if (result.status == LoginStatus.success) {
        try {
          final userData = await FacebookAuth.i.getUserData();
          logInWithSocial(
            email: userData['email'],
            provider: 'Facebook',
            providerId: userData['id'],
          );
        } catch (e) {
          e.printError();
        }
      }
    } catch (error) {}
  }

  getLoginSlider() async {
    late Rx<Response?> loginSliderResponse = Rx<Response?>(null);

    try {
      loginSliderResponse.value = await httpRepository.getLoginSlider();

      if (loginSliderResponse.value == null) {
        return null;
      }
      loginSliderModel.value =
          LoginSliderModel.fromJson(loginSliderResponse.value!.body);
    } catch (e) {
      Get.snackbar(
        'Get Login Slider'.tr,
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
    await getLoginSlider();
    super.onInit();
  }
}
