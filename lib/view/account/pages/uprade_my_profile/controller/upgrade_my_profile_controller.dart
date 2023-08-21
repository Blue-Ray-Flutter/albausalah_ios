import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:loading_icon_button/loading_icon_button.dart';

import '../../../../../api/repository/http_repository.dart';
import '../../../../../shared/components/constants/style/color.dart';
import '../../../../../shared/helper/cache_utils.dart';
import '../../../../../shared/helper/helper_utils.dart';
import '../../edit_information_for_customer/model/cities_model.dart';
import '../../edit_information_for_customer/model/my_information_model.dart';

class UpgradeMyProfileController extends GetxController {
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;
  UpgradeMyProfileController(
      {required this.httpRepository, required this.cacheUtils});

  Rx<MyInformationModel?> myInformationModel = Rx<MyInformationModel?>(null);
  Rx<CitiesModel?> citiesModel = Rx<CitiesModel?>(null);

  final LoadingButtonController btnController = LoadingButtonController();
  final bool show = true;

  final formKey = GlobalKey<FormState>();

  Rx<int> freeDeliveryStatusValue = Rx<int>(0);
  Rx<int> storeCityValue = Rx<int>(0);
  Rx<int> showInHomePageValue = Rx<int>(0);
  Rx<int> storeStatusValue = Rx<int>(0);
  Rx<int> storeTypeValue = Rx<int>(0);

  RxString codeCountry = RxString('');

  Rx<String?> currentAddress = Rx<String?>(null);
  Rx<Position?> currentPosition = Rx<Position?>(null);

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

      myInformationModel.refresh();

      nameController.text = myInformationModel.value!.userData!.name ?? '';
      userNameController.text =
          myInformationModel.value!.userData!.userName ?? '';
      emailController.text = myInformationModel.value!.userData!.email ?? '';
      addressController.text =
          myInformationModel.value!.userData!.addressEn ?? '';
      storeNameController.text =
          myInformationModel.value!.userData!.storeNameEn ?? '';
      phoneController.text = myInformationModel.value!.userData!.phone ?? '';
      descriptionController.text =
          myInformationModel.value!.userData!.storeDescriptionEn ?? '';
      regionController.text =
          myInformationModel.value!.userData!.storeRegion ?? '';
      streetController.text =
          myInformationModel.value!.userData!.storeStreet ?? '';

      mailBoxController.text =
          myInformationModel.value!.userData!.mailbox == null
              ? ''
              : myInformationModel.value!.userData!.mailbox.toString();

      buildingNumberController.text =
          myInformationModel.value!.userData!.buildingNumber == null
              ? ''
              : myInformationModel.value!.userData!.buildingNumber.toString();

      buildingNameController.text =
          myInformationModel.value!.userData!.buildingName ?? '';

      postalCodeController.text =
          myInformationModel.value!.userData!.postalCode == null
              ? ''
              : myInformationModel.value!.userData!.postalCode.toString();

      servicesController.text =
          myInformationModel.value!.userData!.storeServiceEn ?? '';
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

  upgradeMyProfile() async {
    try {
      httpRepository.upgradeMyProfile(
        lang: cacheUtils.getLanguage()!,
        userName: userNameController.text,
        countryCode: codeCountry.value.substring(1),
        phone: phoneController.text,
        name: nameController.text,
        email: emailController.text,
        passwordConfirmation: passwordController.text,
        address: addressController.text,
        buildingName: buildingNameController.text,
        buildingNumber: buildingNumberController.text,
        freeDeliveryStatus: freeDeliveryStatusValue.value.toString(),
        mailbox: mailBoxController.text,
        password: passwordController.text,
        postalCode: postalCodeController.text,
        showInHomePage: showInHomePageValue.value.toString(),
        storeCity: storeCityValue.value.toString(),
        storeDescription: descriptionController.text,
        storeName: storeNameController.text,
        storeRegion: regionController.text,
        storeService: servicesController.text,
        storeStatus: storeStatusValue.value.toString(),
        storeStreet: streetController.text,
        storeType: storeTypeValue.value.toString(),
        profilePhotoUrl: File(image.value),
        currentPosition: currentPosition.value,
      );

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

  getCities() async {
    late Rx<Response?> citiesResponse = Rx<Response?>(null);

    try {
      citiesResponse.value = await httpRepository.getCities(
        lang: cacheUtils.getLanguage()!,
      );

      if (citiesResponse.value == null) {
        return null;
      }
      citiesModel.value = CitiesModel.fromJson(citiesResponse.value!.body);
    } catch (e) {
      Get.snackbar(
        'Get Cities'.tr,
        'Something is wrong',
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

  @override
  Future<void> onInit() async {
    await getMyProfile();
    await getCities();
    super.onInit();
  }
}
