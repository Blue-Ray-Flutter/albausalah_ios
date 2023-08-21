import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:loading_icon_button/loading_icon_button.dart';

import '../../../../../api/repository/http_repository.dart';
import '../../../../../shared/components/constants/style/color.dart';
import '../../../../../shared/helper/cache_utils.dart';
import '../../../../../shared/helper/helper_utils.dart';
import '../model/my_information_model.dart';

class EditInformationForCustomerController extends GetxController {
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;
  EditInformationForCustomerController(
      {required this.httpRepository, required this.cacheUtils});

  Rx<MyInformationModel?> myInformationModel = Rx<MyInformationModel?>(null);

  final LoadingButtonController btnController = LoadingButtonController();
  final bool show = true;

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();

  RxString codeCountry = RxString('');

  Rx<String?> currentAddress = Rx<String?>(null);
  Rx<Position?> currentPosition = Rx<Position?>(null);

  var image = ''.obs;

  getFromGallery() async {
    var path = await HelperUtils.importImage();
    if (path != null) {
      image.value = path;
    }
  }

  getMyProfile() async {
    late Rx<Response?> myInformationResponse = Rx<Response?>(null);

    try {
      myInformationResponse.value = await httpRepository.getMyProfile(
        lang: cacheUtils.getLanguage()!,
      );

      if (myInformationResponse.value == null) {
        return null;
      }
      myInformationModel.value =
          MyInformationModel.fromJson(myInformationResponse.value!.body);

      nameController.text = myInformationModel.value!.userData!.name ?? '';
      userNameController.text =
          myInformationModel.value!.userData!.userName ?? '';
      emailController.text = myInformationModel.value!.userData!.email ?? '';
      addressController.text =
          myInformationModel.value!.userData!.addressEn ?? '';

      phoneController.text = myInformationModel.value!.userData!.phone ?? '';
    } catch (e) {
      Get.snackbar(
        'Get My Profile'.tr,
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

  updateMyProfile() async {
    try {
      httpRepository.updateMyProfile(
        lang: 'en',
        userName: userNameController.text,
        countryCode: codeCountry.value.substring(1),
        phone: phoneController.text,
        name: nameController.text,
        email: emailController.text,
        passwordConfirmation: passwordController.text,
        address: addressController.text,
        password: passwordController.text,
        profilePhotoUrl: File(image.value),
        lat: '0',
        lan: '0',
      );
      confirmPasswordController.text = '';
      passwordController.text = '';
      image.value.isNotEmpty
          ? cacheUtils.savePhoto(
              photo: 'https://al-bausalah.com/${image.value}')
          : null;
    } catch (e) {
      Get.snackbar(
        'Update My Profile'.tr,
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
  void onInit() {
    getMyProfile();
    super.onInit();
  }
}
