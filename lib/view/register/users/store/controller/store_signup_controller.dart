import 'dart:io';

import 'package:albausalah_app/api/repository/http_repository_impl.dart';
import 'package:albausalah_app/shared/components/constants/constant_data/constant_data.dart';
import 'package:albausalah_app/view/login/model/flag_firebase.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../../../../../api/repository/http_repository.dart';
import '../../../../../shared/components/constants/style/color.dart';
import '../../../../../shared/helper/cache_utils.dart';
import '../../../../../shared/helper/helper_utils.dart';
import '../../../../account/pages/edit_information_for_customer/model/cities_model.dart';
import '../../../../base/base_widget.dart';
import '../../customer/model/register_model.dart';

class StoreSignupController extends GetxController {
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;
  Rx<bool?> flagStatus = Rx<bool?>(null);
  StoreSignupController(
      {required this.httpRepository, required this.cacheUtils});

  Rx<CitiesModel?> citiesModel = Rx<CitiesModel?>(null);

  final nameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final mailBoxController = TextEditingController();
  final postalCodeController = TextEditingController();

  final addressController = TextEditingController();
  final servicesController = TextEditingController();
  final regionController = TextEditingController();
  final streetController = TextEditingController();
  final buildingNameController = TextEditingController();
  final buildingNumberController = TextEditingController();

  final storeNameController = TextEditingController();
  final descriptionController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();

  Rx<int> storeCityValue = Rx<int>(0);
  Rx<int> showInHomePageValue = Rx<int>(0);
  Rx<int> storeStatusValue = Rx<int>(0);

  RxBool withFaceSocial = false.obs;
  RxBool withGoogleSocial = false.obs;

  RxBool isChecked1 = false.obs;
  RxBool isChecked2 = false.obs;

  RxString providerId = RxString('');
  RxString provider = RxString('');

  Rx<RegisterModel?> registerModel = Rx<RegisterModel?>(null);

  var image = ''.obs;

  RxString codeCountry = RxString('');

  Rx<Position?> currentPosition = Rx<Position?>(null);

  final formKey = GlobalKey<FormState>();

  RxInt selectedValueStoreType = RxInt(0);
  RxInt selectedValueDeliveryType = RxInt(0);

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

  Future<void> registerStore() async {
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
        passwordConfirmation: confirmPasswordController.value.text,
        lang: 'en',
        providerStatus: '2',
        userType: '2',
        name: nameController.text,
        phone: phoneController.text,
        addressAr: addressController.text,
        addressEn: addressController.text,
        countryCode: codeCountry.value.substring(1),
        userName: userNameController.text,
        storeType: selectedValueStoreType.value.toString(),
        storeStreet: streetController.text,
        storeRegion: regionController.text,
        storeName: storeNameController.text,
        storeDescription: descriptionController.text,
        postalCode: postalCodeController.text,
        mailbox: mailBoxController.text,
        buildingNumber: buildingNumberController.text,
        buildingName: buildingNameController.text,
        city: storeCityValue.value.toString(),
        deliveryType: selectedValueDeliveryType.value.toString(),
        services: servicesController.text,
        showInHome: showInHomePageValue.value.toString(),
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

      Get.offAll(() => const BaseWidget());
    } catch (e) {
      Get.snackbar(
        'Register Store'.tr,
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

  Future<void> registerStoreWithSocial({
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
        passwordConfirmation: confirmPasswordController.text,
        lang: 'en',
        providerStatus: '1',
        userType: '2',
        name: nameController.text,
        phone: phoneController.text,
        addressAr: addressController.text,
        addressEn: addressController.text,
        countryCode: codeCountry.value.substring(1),
        userName: userNameController.text,
        longitude: currentPosition.value!.longitude.toString(),
        latitude: currentPosition.value!.latitude.toString(),
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

  // facebookSignUp() async {
  //   try {
  //     final result =
  //         await FacebookAuth.i.login(permissions: ['public_profile', 'email']);
  //     if (result.status == LoginStatus.success) {
  //       try {
  //         final userData = await FacebookAuth.i.getUserData();
  //         withFaceSocial.value = true;
  //         emailController.text = userData['email'];
  //         nameController.text = userData['name'];
  //       } catch (e) {
  //         withFaceSocial.value = true;
  //         withGoogleSocial.value = false;
  //         e.printError();
  //       }
  //     }
  //   } catch (error) {}
  // }

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

  Future<void> getCurrentPosition(context) async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;

    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      currentPosition.value = position;
    }).catchError((e) {
      debugPrint(e);
    });
  }

  getCities() async {
    late Rx<Response?> citiesResponse = Rx<Response?>(null);

    try {
      citiesResponse.value = await httpRepository.getCities(
        lang: 'en',
      );

      if (citiesResponse.value == null) {
        return null;
      }
      citiesModel.value = CitiesModel.fromJson(citiesResponse.value!.body);
    } catch (e) {
      Get.snackbar(
        'Get Cities'.tr,
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

  getFromGallery() async {
    var path = await HelperUtils.importImage();
    if (path != null) {
      image.value = path;
    }
  }

  @override
  Future<void> onInit() async {
    await getCities();
    initFlag();
    super.onInit();
  }
}
