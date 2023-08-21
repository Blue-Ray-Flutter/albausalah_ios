import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loading_icon_button/loading_icon_button.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../../../../../api/repository/http_repository.dart';
import '../../../../../shared/components/constants/style/color.dart';
import '../../../../../shared/helper/cache_utils.dart';
import '../../../../../shared/helper/helper_utils.dart';
import '../../../../base/base_widget.dart';
import '../model/register_model.dart';

class CustomerController extends GetxController {
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;

  CustomerController({required this.httpRepository, required this.cacheUtils});

  Rx<GeoPoint?> notifier = Rx<GeoPoint?>(null);
  RxString address = RxString('');
  var image = ''.obs;

  final bool show = true;

  final formKey = GlobalKey<FormState>();

  Rx<RegisterModel?> registerModel = Rx<RegisterModel?>(null);

  RxString codeCountry = RxString('');

  final nameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmationPasswordController = TextEditingController();
  final addressController = TextEditingController();

  RxBool withFaceSocial = false.obs;
  RxBool withGoogleSocial = false.obs;

  RxString providerId = RxString('');
  RxString provider = RxString('');

  RxDouble lat = RxDouble(0.0);
  RxDouble long = RxDouble(0.0);

  final LoadingButtonController btnController = LoadingButtonController();

  Future<void> registerCustomer() async {
    var status = await OneSignal.shared.getDeviceState();
    if (status == null || status.userId == null) {
      return;
    }
    String playerId = status.userId!;
    try {
      late Rx<Response?> registerResponse = Rx<Response?>(null);
      registerResponse.value = await httpRepository.register(
        playerId: playerId,
        email: emailController.value.text,
        password: passwordController.value.text,
        passwordConfirmation: confirmationPasswordController.value.text,
        lang: 'en',
        providerStatus: '2',
        userType: '1',
        name: nameController.text,
        phone: phoneController.text,
        addressAr: addressController.text,
        addressEn: addressController.text,
        countryCode: codeCountry.value.substring(1),
        userName: userNameController.text,
        longitude: long.toString(),
        latitude: lat.toString(),
        profilePhotoUrl: File(image.value),
      );

      if (registerResponse.value == null) {
        return;
      }

      registerModel.value =
          RegisterModel.fromJson(registerResponse.value!.body);

      cacheUtils.getLanguage() == null || cacheUtils.getLanguage()!.isEmpty
          ? await cacheUtils.saveLanguage(language: 'en')
          : null;

      await cacheUtils.login(
        name: registerModel.value!.userData!.name!,
        token: registerModel.value!.token!,
        email: registerModel.value!.userData!.email!,
        phone: registerModel.value!.userData!.phone!,
        uid: registerModel.value!.userData!.id!,
        userType: registerModel.value!.userType!,
      );

      await cacheUtils.savePhoto(photo: image.value);

      Get.offAll(() => const BaseWidget());
    } catch (e) {
      Get.snackbar(
        'Register Customer'.tr,
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

  Future<void> registerCustomerWithSocial({
    required String provider,
    required String providerId,
  }) async {
    try {
      late Rx<Response?> registerResponse = Rx<Response?>(null);
      registerResponse.value = await httpRepository.registerWithSocial(
        providerId: providerId,
        provider: provider,
        email: emailController.text,
        password: passwordController.text,
        passwordConfirmation: confirmationPasswordController.text,
        lang: 'en',
        providerStatus: '1',
        userType: '1',
        name: nameController.text,
        phone: phoneController.text,
        addressAr: addressController.text,
        addressEn: addressController.text,
        countryCode: codeCountry.value.substring(1),
        userName: userNameController.text,
        longitude: long.toString(),
        latitude: lat.toString(),
        profilePhotoUrl: File(image.value),
      );

      if (registerResponse.value == null) {
        return;
      }

      registerModel.value =
          RegisterModel.fromJson(registerResponse.value!.body);

      await cacheUtils.login(
        name: registerModel.value!.userData!.name!,
        token: registerModel.value!.token!,
        email: registerModel.value!.userData!.email!,
        phone: registerModel.value!.userData!.phone!,
        uid: registerModel.value!.userData!.id!,
        userType: registerModel.value!.userType!,
      );

      Get.offAll(() => const BaseWidget());
    } catch (e) {
      Get.snackbar(
        'Register Customer'.tr,
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

  Future<void> getAddressFromLatLng({
    required double latitude,
    required double longitude,
  }) async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    lat.value = latitude;
    long.value = longitude;
    try {
      List<Placemark> placeMarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placeMarks.isNotEmpty) {
        Placemark placeMark = placeMarks[0];
        address.value =
            '${placeMark.street}, ${placeMark.subLocality}, ${placeMark.locality}, ${placeMark.administrativeArea}, ${placeMark.country}';
        addressController.text = address.value;
      }
    } catch (e) {
      throw Exception("get Address From LatLng");
    }
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar('Location'.tr,
          'Location services are disabled. Please enable the services'.tr);
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar('Location'.tr, 'Location permissions are denied'.tr);
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Get.snackbar(
          'Location'.tr,
          'Location permissions are permanently denied, we cannot request permissions.'
              .tr);
      return false;
    }
    return true;
  }

  facebookSignUp() async {
    try {
      final result =
          await FacebookAuth.i.login(permissions: ['public_profile', 'email']);
      if (result.status == LoginStatus.success) {
        try {
          final userData = await FacebookAuth.i.getUserData();
          withFaceSocial.value = true;
          emailController.text = userData['email'];
          nameController.text = userData['name'];
        } catch (e) {
          withFaceSocial.value = true;
          withGoogleSocial.value = false;
          e.printError();
        }
      }
    } catch (error) {
      throw Exception("Facebook sign up");
    }
  }

  googleSignUp() async {
    GoogleSignInAccount? currentUser = await GoogleSignIn().signIn();
    if (currentUser != null) {
      emailController.text = currentUser.email;
      nameController.text = currentUser.displayName ?? "";
      withFaceSocial.value = false;
      withGoogleSocial.value = true;
      provider.value = "Google";
      providerId.value = currentUser.id.toString();
    }
  }

  getFromGallery() async {
    var path = await HelperUtils.importImage();
    if (path != null) {
      image.value = path;
    }
  }
}
