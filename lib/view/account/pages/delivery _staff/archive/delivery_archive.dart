import 'package:albausalah_app/view/account/pages/my_products/update_my_product/update_my_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../api/repository/http_repository.dart';
import '../../../../../api/repository/http_repository_impl.dart';
import '../../../../../shared/components/constants/style/color.dart';
import '../../../../../shared/components/widgets/delivery_staff_item/delivery_staff_item.dart';
import '../../../../../shared/helper/cache_utils.dart';
import '../../../../stores/store_page/product_page/product_page.dart';
import '../model/delivery_staff_model.dart';

class DeliveryArchive extends StatefulWidget {
  const DeliveryArchive({Key? key}) : super(key: key);

  @override
  State<DeliveryArchive> createState() => _DeliveryArchiveState();
}

class _DeliveryArchiveState extends State<DeliveryArchive> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, // <-- SEE HERE
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0.6,
          title: Text(
            'Archive'.tr,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: FutureBuilder<DeliveryStaffModel?>(
          future: getDeliveryStaff(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              if (snapshot.data!.employees == null ||
                  snapshot.data!.employees!.isEmpty) {
                return Center(
                  child: Text(
                    'There are no employees'.tr,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.4),
                      fontSize: 20,
                    ),
                  ),
                );
              }
              return GridView.builder(
                physics: const ScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 5,
                  right: 5,
                  bottom: 30,
                ),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: snapshot.data!.employees!.length,
                itemBuilder: (context, index) {
                  return Stack(
                    alignment: Alignment.topRight,
                    children: [
                      DeliveryStaffItem(
                        haveUpdate: false,
                        onTapUpdate: () {
                          Get.to(
                            () => const UpdateMyProduct(),
                            arguments:
                                snapshot.data!.employees![index].id.toString(),
                          );
                        },
                        activeButton: Container(),
                        name: snapshot.data!.employees![index].name ?? '',
                        image: snapshot.data!.employees![index].profilePhotoUrl,
                        onTap: () {
                          Get.to(() => const ProductPage(),
                              arguments: snapshot.data!.employees![index].id);
                        },
                        phone: snapshot.data!.employees![index].phone,
                        email: snapshot.data!.employees![index].email,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            restoreSoftDeleteDeliveryEmployees(
                                employeeId: snapshot.data!.employees![index].id
                                    .toString());
                            Future.delayed(const Duration(milliseconds: 500),
                                () {
                              setState(() {});
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.grey[300],
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Icon(
                                Icons.refresh,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: LoadingAnimationWidget.stretchedDots(
                  color: AppColor.globalDefaultColor,
                  size: 40,
                ),
              );
            }
            return Center(
                child: Text(
              'Something went wrong'.tr,
              style: TextStyle(
                color: Colors.black.withOpacity(0.4),
                fontSize: 23,
              ),
            ));
          },
        ),
      ),
    );
  }

  Future<DeliveryStaffModel?> getDeliveryStaff() async {
    HttpRepository httpRepository = HttpRepositoryImpl();

    late Rx<Response?> deliveryStaffResponse = Rx<Response?>(null);
    DeliveryStaffModel? deliveryStaffModel = DeliveryStaffModel();

    try {
      deliveryStaffResponse.value =
          await httpRepository.showSoftDeleteDeliveryEmployees();

      if (deliveryStaffResponse.value == null) {
        return null;
      }
      deliveryStaffModel =
          DeliveryStaffModel.fromJson(deliveryStaffResponse.value!.body);

      return deliveryStaffModel;
    } catch (e) {
      Get.snackbar(
        'Get Delivery Archive'.tr,
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
        forwardAnimationCurve: Curves.easeOutBack,
      );
      e.printError();
    }
    return null;
  }

  activeInactiveMyProduct({required String productId}) async {
    HttpRepository httpRepository = HttpRepositoryImpl();
    CacheUtils cacheUtils = CacheUtils(GetStorage());

    try {
      httpRepository.activeInactiveMyProduct(
        productId: productId,
        lang: cacheUtils.getLanguage()!,
      );
    } catch (e) {
      Get.snackbar(
        'Active Inactive My Product'.tr,
        'Something wrong',
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

  restoreSoftDeleteDeliveryEmployees({required String employeeId}) async {
    HttpRepository httpRepository = HttpRepositoryImpl();
    try {
      httpRepository.restoreSoftDeleteDeliveryEmployees(
        employeeId: employeeId,
      );
    } catch (e) {
      Get.snackbar(
        'Restore Soft Delete Delivery Employees'.tr,
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
}
