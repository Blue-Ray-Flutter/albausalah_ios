import 'package:albausalah_app/shared/components/widgets/button/button.dart';
import 'package:albausalah_app/view/account/pages/delivery%20_staff/update_employee/update_employee.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../api/repository/http_repository.dart';
import '../../../../api/repository/http_repository_impl.dart';
import '../../../../shared/components/constants/style/color.dart';
import '../../../../shared/components/widgets/delivery_staff_item/delivery_staff_item.dart';
import 'archive/delivery_archive.dart';
import 'model/delivery_staff_model.dart';
import 'new_employee/new_employee.dart';

class DeliveryStaff extends StatefulWidget {
  const DeliveryStaff({Key? key}) : super(key: key);

  @override
  State<DeliveryStaff> createState() => _DeliveryStaffState();
}

class _DeliveryStaffState extends State<DeliveryStaff> {
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
            'Delivery Staff'.tr,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 50,
              ),
              child: FutureBuilder<DeliveryStaffModel?>(
                future: getDeliveryStaff(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    if (snapshot.data!.employees!.isEmpty) {
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
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 250,
                        childAspectRatio: 2 / 4.15,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                      ),
                      itemCount: snapshot.data!.employees!.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          alignment: Alignment.topRight,
                          children: [
                            DeliveryStaffItem(
                              onTapUpdate: () {
                                Get.to(
                                  () => const UpdateEmployee(),
                                )!
                                    .then((value) => Future.delayed(
                                            const Duration(milliseconds: 1000),
                                            () async {
                                          setState(() {});
                                        }));
                              },
                              activeButton: snapshot
                                          .data!.employees![index].status ==
                                      "Active"
                                  ? Button(
                                      radius: 10,
                                      height: 40,
                                      onPressed: () {
                                        activeInactiveEmployee(
                                            employeeId: snapshot
                                                .data!.employees![index].id
                                                .toString());
                                        Future.delayed(
                                            const Duration(milliseconds: 500),
                                            () {
                                          setState(() {});
                                        });
                                      },
                                      text: 'Active'.tr,
                                    )
                                  : Button(
                                      radius: 10,
                                      height: 40,
                                      onPressed: () {
                                        activeInactiveEmployee(
                                            employeeId: snapshot
                                                .data!.employees![index].id
                                                .toString());
                                        Future.delayed(
                                            const Duration(milliseconds: 500),
                                            () {
                                          setState(() {});
                                        });
                                      },
                                      text: 'Inactive'.tr,
                                    ),
                              name: snapshot.data!.employees![index].name ?? '',
                              image: snapshot
                                  .data!.employees![index].profilePhotoUrl,
                              onTap: () {},
                              phone: snapshot.data!.employees![index].phone,
                              email: snapshot.data!.employees![index].email,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: InkWell(
                                onTap: () {
                                  softDeleteDeliveryEmployee(
                                      employeeId: snapshot
                                          .data!.employees![index].id
                                          .toString());
                                  Future.delayed(
                                      const Duration(milliseconds: 500), () {
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
                                      Icons.delete_outline_outlined,
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
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
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
            SizedBox(
              height: 50,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Button(
                    radius: 10,
                    width: 140,
                    height: 40,
                    onPressed: () {
                      Get.to(() => const DeliveryArchive())!
                          .then((value) => setState(() {}));
                    },
                    text: 'Archive'.tr,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Button(
                    radius: 10,
                    width: 140,
                    height: 40,
                    onPressed: () {
                      Get.to(() => const AddNewEmployee())!.then((value) =>
                          Future.delayed(const Duration(milliseconds: 1000),
                              () async {
                            setState(() {});
                          }));
                    },
                    text: 'Add employee'.tr,
                  ),
                ],
              ),
            ),
          ],
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
          await httpRepository.getMyDeliveryEmployees();

      if (deliveryStaffResponse.value == null) {
        return null;
      }
      deliveryStaffModel =
          DeliveryStaffModel.fromJson(deliveryStaffResponse.value!.body);

      return deliveryStaffModel;
    } catch (e) {
      Get.snackbar(
        'Get Delivery Staff'.tr,
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

  activeInactiveEmployee({required String employeeId}) async {
    HttpRepository httpRepository = HttpRepositoryImpl();

    try {
      httpRepository.activeInactiveEmployee(
        employeeId: employeeId,
      );
    } catch (e) {
      Get.snackbar(
        'Active Inactive Employee'.tr,
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
  }

  softDeleteDeliveryEmployee({required String employeeId}) async {
    HttpRepository httpRepository = HttpRepositoryImpl();
    try {
      httpRepository.softDeleteDeliveryEmployee(
        employeeId: employeeId,
      );
    } catch (e) {
      Get.snackbar(
        'Soft Delete employee'.tr,
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
  }
}
