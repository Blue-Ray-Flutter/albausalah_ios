import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_icon_button/loading_icon_button.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../../api/repository/http_repository.dart';
import '../../../../shared/components/constants/style/color.dart';
import '../../../../shared/helper/cache_utils.dart';
import '../../../account/pages/my_jobs/model/my_jobs_model.dart';
import '../../../stores/store_page/model/products_model.dart';
import '../../../stores/store_page/model/store_reviews_model.dart';
import '../../../stores/store_page/model/store_svervice_model.dart';

class GuestStorePageController extends GetxController {
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;

  GuestStorePageController(
      {required this.httpRepository, required this.cacheUtils});

  final LoadingButtonController btnController = LoadingButtonController();

  Rx<ProductsModel?> productsModel = Rx<ProductsModel?>(null);
  Rx<StoreReviewsModel?> storeReviewsModel = Rx<StoreReviewsModel?>(null);
  Rx<StoreSverviceModel?> storeSverviceModel = Rx<StoreSverviceModel?>(null);
  Rx<MyJobsModel?> myJobsModel = Rx<MyJobsModel?>(null);

  final commentController = TextEditingController();
  final messageController = TextEditingController();
  final fileController = TextEditingController();
  final phoneController = TextEditingController();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageApplyController = TextEditingController();
  final commentApplyController = TextEditingController();

  RxInt selectedValueStoreType = RxInt(0);

  RxBool isChecked1 = false.obs;
  RxBool isChecked2 = false.obs;

  Rx<SfRangeValues> values =
      Rx<SfRangeValues>(const SfRangeValues(1.00, 100.00));
  RxString codeCountry = RxString('');

  final bool show = true;
  Rx<bool> isDoneUpload = RxBool(false);
  Rx<File>? file = Rx(File(''));
  Rx<File>? cvFile = Rx(File(''));

  Future<void> openFileExplorer() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'jpeg',
        'jpg',
        'png',
        'gif',
        'mp4',
        'ogx',
        'oga',
        'ogv',
        'ogg',
        'webm',
      ],
    );

    if (result != null) {
      file!.value = File(result.files.single.path!);
      fileController.text = file!.value.path;
      isDoneUpload.value = true;
    } else {
      isDoneUpload.value = false;
    }
  }

  Future<void> openCVFileExplorer() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'docx',
        'doc',
        'pdf',
      ],
    );

    if (result != null) {
      cvFile!.value = File(result.files.single.path!);
      fileController.text = cvFile!.value.path;
      isDoneUpload.value = true;
    } else {
      isDoneUpload.value = false;
    }
  }

  final formKey = GlobalKey<FormState>();
  final fromAddNewMessageKey = GlobalKey<FormState>();
  final fromApplyJob = GlobalKey<FormState>();

  RxString storeId = RxString('');
  RxBool followStore = RxBool(false);
  RxDouble rate = RxDouble(0.0);

  getProducts({String? search}) async {
    late Rx<Response?> productsResponse = Rx<Response?>(null);

    try {
      productsResponse.value = await httpRepository.guestShowProducts(
        max: values.value.end.toInt().toString(),
        min: values.value.start.toInt().toString(),
        radio: "option$selectedValueStoreType",
        storeId: storeId.value,
        search: search,
        lang: cacheUtils.getLanguage() ?? 'en',
        check1: (isChecked1.value ? (1).toString() : ''),
        check2: (isChecked2.value ? (2).toString() : ''),
        categoryIds: null,
      );

      if (productsResponse.value == null) {
        return null;
      }
      productsModel.value =
          ProductsModel.fromJson(productsResponse.value!.body);
      productsModel.refresh();
    } catch (e) {
      Get.snackbar(
        'Get Products'.tr,
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

  applyJob({required String jobId}) async {
    try {
      httpRepository.applyJob(
        lang: cacheUtils.getLanguage() ?? 'en',
        message: messageApplyController.text,
        email: emailController.text,
        name: nameController.text,
        phone: phoneController.text,
        cv: cvFile!.value,
        jobId: jobId,
      );
      fileController.text = '';
      phoneController.text = '';
      messageApplyController.text = '';
      emailController.text = '';
      nameController.text = '';
    } catch (e) {
      Get.snackbar(
        'Apply job'.tr,
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

  createNewMessage() async {
    try {
      httpRepository.createNewMessage(
        lang: cacheUtils.getLanguage() ?? 'en',
        receiverId: storeId.value,
        message: messageController.text,
      );
      messageController.text = '';
      fileController.text = '';
    } catch (e) {
      Get.snackbar(
        'Create New Message'.tr,
        'Something went wrong',
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

  getStoreReviews() async {
    late Rx<Response?> storeReviewsResponse = Rx<Response?>(null);

    try {
      storeReviewsResponse.value = await httpRepository.getStoreReviews(
        storeId: storeId.value,
        lang: cacheUtils.getLanguage() ?? 'en',
      );

      if (storeReviewsResponse.value == null) {
        return null;
      }
      storeReviewsModel.value =
          StoreReviewsModel.fromJson(storeReviewsResponse.value!.body);
      storeReviewsModel.refresh();
    } catch (e) {
      Get.snackbar(
        'Get Store Reviews'.tr,
        'Something went wrong',
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

  getShowStoreJobs() async {
    late Rx<Response?> getShowStoreJobsResponse = Rx<Response?>(null);

    try {
      getShowStoreJobsResponse.value = await httpRepository.getShowStoreJobs(
        storeId: storeId.value,
        lang: cacheUtils.getLanguage() ?? 'en',
      );

      if (getShowStoreJobsResponse.value == null) {
        return null;
      }
      myJobsModel.value =
          MyJobsModel.fromJson(getShowStoreJobsResponse.value!.body);
      storeReviewsModel.refresh();
    } catch (e) {
      Get.snackbar(
        'Get Show Store Jobs'.tr,
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

  getServices() async {
    late Rx<Response?> storeServiceResponse = Rx<Response?>(null);

    try {
      storeServiceResponse.value = await httpRepository.getServices(
        storeId: storeId.value,
        lang: cacheUtils.getLanguage() ?? 'en',
      );

      if (storeServiceResponse.value == null) {
        return null;
      }
      storeSverviceModel.value =
          StoreSverviceModel.fromJson(storeServiceResponse.value!.body);
      storeSverviceModel.refresh();
    } catch (e) {
      Get.snackbar(
        'Get Store Services'.tr,
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

  addStoreReview() async {
    try {
      httpRepository.addStoreReview(
        storeId: storeId.value,
        lang: cacheUtils.getLanguage() ?? 'en',
        reviewValue: rate.value.toInt().toString(),
        reviewNote: commentController.text,
      );
      rate.value = 0.0;
      commentController.text = '';
      Get.back();
      storeReviewsModel.value = null;
      Future.delayed(const Duration(milliseconds: 500), () async {
        await getStoreReviews();
      });
    } catch (e) {
      Get.snackbar(
        'Add Store Review'.tr,
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
    storeId.value = Get.arguments[0].toString();
    followStore.value = Get.arguments[1];
    await getProducts();
    await getShowStoreJobs();
    await getStoreReviews();
    await getServices();
    super.onInit();
  }
}
