import 'package:albausalah_app/shared/helper/cache_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../api/repository/http_repository.dart';
import '../../../../api/repository/http_repository_impl.dart';
import '../../../../shared/components/constants/style/color.dart';
import '../../../../shared/components/widgets/button/button.dart';
import '../../../../shared/components/widgets/my_job_item/my_job_item.dart';
import '../update_my_job/update_my_job.dart';
import 'model/my_jobs_model.dart';

class MyJobs extends StatefulWidget {
  const MyJobs({Key? key}) : super(key: key);

  @override
  State<MyJobs> createState() => _MyProductsState();
}

class _MyProductsState extends State<MyJobs> {
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
            'My Jobs'.tr,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Stack(
          children: [
            FutureBuilder<MyJobsModel?>(
              future: getMyJobs(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  if (snapshot.data!.jobs!.isEmpty) {
                    return Center(
                      child: Text(
                        'There are no jobs'.tr,
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
                      childAspectRatio: 2 / 3,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                    ),
                    itemCount: snapshot.data!.jobs!.length,
                    itemBuilder: (context, index) {
                      return MyJobItem(
                        onTapRemove: () {
                          softDeleteJob(
                              jobId: snapshot.data!.jobs![index].id.toString());
                          Future.delayed(const Duration(milliseconds: 500), () {
                            setState(() {});
                          });
                        },
                        onTapUpdate: () {
                          Get.to(
                            () => const UpdateMyJob(),
                            arguments:
                                snapshot.data!.jobs![index].id.toString(),
                          );
                        },
                        activeButton: snapshot.data!.jobs![index].status ==
                                "Active"
                            ? Button(
                                radius: 10,
                                height: 40,
                                onPressed: () {
                                  activeInactiveMyJob(
                                      jobId: snapshot.data!.jobs![index].id
                                          .toString());
                                  Future.delayed(
                                      const Duration(milliseconds: 500), () {
                                    setState(() {});
                                  });
                                },
                                text: 'Active'.tr,
                              )
                            : Button(
                                radius: 10,
                                height: 40,
                                onPressed: () {
                                  activeInactiveMyJob(
                                      jobId: snapshot.data!.jobs![index].id
                                          .toString());
                                  Future.delayed(
                                      const Duration(milliseconds: 500), () {
                                    setState(() {});
                                  });
                                },
                                text: 'Inactive'.tr,
                              ),
                        name: snapshot.data!.jobs![index].title ?? '',
                        body: snapshot.data!.jobs![index].description ?? '',
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
          ],
        ),
      ),
    );
  }

  Future<MyJobsModel?> getMyJobs() async {
    HttpRepository httpRepository = HttpRepositoryImpl();
    CacheUtils cacheUtils = CacheUtils(GetStorage());

    late Rx<Response?> myJobsResponse = Rx<Response?>(null);
    MyJobsModel? myJobsModel = MyJobsModel();

    try {
      myJobsResponse.value = await httpRepository.getMyJobs(
        lang: cacheUtils.getLanguage()!,
      );

      if (myJobsResponse.value == null) {
        return null;
      }
      myJobsModel = MyJobsModel.fromJson(myJobsResponse.value!.body);

      return myJobsModel;
    } catch (e) {
      Get.snackbar(
        'Get My Jobs'.tr,
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

  activeInactiveMyJob({required String jobId}) async {
    HttpRepository httpRepository = HttpRepositoryImpl();
    CacheUtils cacheUtils = CacheUtils(GetStorage());

    try {
      httpRepository.activeInactiveMyJob(
        jobId: jobId,
        lang: cacheUtils.getLanguage()!,
      );
    } catch (e) {
      Get.snackbar(
        'toggle job activation'.tr,
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

  softDeleteJob({required String jobId}) async {
    HttpRepository httpRepository = HttpRepositoryImpl();
    CacheUtils cacheUtils = CacheUtils(GetStorage());

    try {
      httpRepository.softDeleteJob(
        jobId: jobId,
        lang: cacheUtils.getLanguage()!,
      );
    } catch (e) {
      Get.snackbar(
        'Soft Delete Job'.tr,
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
