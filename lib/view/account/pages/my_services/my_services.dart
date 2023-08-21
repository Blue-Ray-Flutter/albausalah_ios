import 'package:albausalah_app/shared/components/widgets/button/button.dart';
import 'package:albausalah_app/shared/helper/cache_utils.dart';
import 'package:albausalah_app/view/account/pages/my_services/pages/add_new_services/add_new_services.dart';
import 'package:albausalah_app/view/account/pages/my_services/pages/update_services/update_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../api/repository/http_repository.dart';
import '../../../../api/repository/http_repository_impl.dart';
import '../../../../shared/components/constants/style/color.dart';
import '../../../../shared/components/widgets/service_item/service_item.dart';
import 'model/my_services_model.dart';

class MyServices extends StatefulWidget {
  const MyServices({Key? key}) : super(key: key);

  @override
  State<MyServices> createState() => _MyServicesState();
}

class _MyServicesState extends State<MyServices> {
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
            'My Services'.tr,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Stack(
          children: [
            FutureBuilder<MyServicesModel?>(
              future: getMyServices(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  if (snapshot.data!.services!.isEmpty) {
                    return Center(
                      child: Text(
                        'There are no services'.tr,
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
                      top: 60,
                      left: 5,
                      right: 5,
                      bottom: 30,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 250,
                      childAspectRatio: 2 / 3,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                    ),
                    itemCount: snapshot.data!.services!.length,
                    itemBuilder: (context, index) {
                      return ServiceItem(
                        name: snapshot.data!.services![index].title!,
                        deleteButton: Button(
                          height: 40,
                          radius: 10,
                          onPressed: () {
                            destroyMyService(
                                serviceId: snapshot.data!.services![index].id
                                    .toString());
                            Future.delayed(const Duration(milliseconds: 500),
                                () {
                              setState(() {});
                            });
                          },
                          text: 'Delete'.tr,
                        ),
                        activeInActiveButton:
                            snapshot.data!.services![index].status == "Active"
                                ? Button(
                                    radius: 10,
                                    height: 40,
                                    onPressed: () {
                                      activeInactiveMyServices(
                                          serviceId: snapshot
                                              .data!.services![index].id
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
                                      activeInactiveMyServices(
                                          serviceId: snapshot
                                              .data!.services![index].id
                                              .toString());
                                      Future.delayed(
                                          const Duration(milliseconds: 500),
                                          () {
                                        setState(() {});
                                      });
                                    },
                                    text: 'Inactive'.tr,
                                  ),
                        editButton: Button(
                          height: 40,
                          radius: 10,
                          onPressed: () {
                            Get.to(() => const UpdateService(),
                                    arguments: snapshot
                                        .data!.services![index].id
                                        .toString())!
                                .then((value) => setState(() {}));
                          },
                          text: 'Update'.tr,
                        ),
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
            Button(
              height: 40,
              onPressed: () {
                Get.to(() => const AddNewServices())!
                    .then((value) => setState(() {}));
              },
              text: 'Add'.tr,
            ),
          ],
        ),
      ),
    );
  }

  Future<MyServicesModel?> getMyServices() async {
    HttpRepository httpRepository = HttpRepositoryImpl();
    CacheUtils cacheUtils = CacheUtils(GetStorage());

    late Rx<Response?> myServicesResponse = Rx<Response?>(null);
    MyServicesModel? myServicesModel = MyServicesModel();

    try {
      myServicesResponse.value = await httpRepository.getMyServices(
        lang: cacheUtils.getLanguage() ?? '',
      );

      if (myServicesResponse.value == null) {
        return null;
      }
      myServicesModel =
          MyServicesModel.fromJson(myServicesResponse.value!.body);

      return myServicesModel;
    } catch (e) {
      Get.snackbar(
        'Get My Services'.tr,
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

  activeInactiveMyServices({required String serviceId}) async {
    HttpRepository httpRepository = HttpRepositoryImpl();
    CacheUtils cacheUtils = CacheUtils(GetStorage());

    try {
      httpRepository.activeInactiveMyService(
        serviceId: serviceId,
        lang: cacheUtils.getLanguage()!,
      );
    } catch (e) {
      Get.snackbar(
        'Toggle service activation'.tr,
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

  destroyMyService({required String serviceId}) async {
    HttpRepository httpRepository = HttpRepositoryImpl();
    CacheUtils cacheUtils = CacheUtils(GetStorage());

    try {
      httpRepository.destroyMyService(
        serviceId: serviceId,
        lang: cacheUtils.getLanguage()!,
      );
    } catch (e) {
      Get.snackbar(
        'Delete My Service'.tr,
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
