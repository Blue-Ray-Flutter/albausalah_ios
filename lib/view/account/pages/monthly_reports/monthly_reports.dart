import 'package:albausalah_app/shared/helper/cache_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../api/repository/http_repository.dart';
import '../../../../api/repository/http_repository_impl.dart';
import '../../../../shared/components/constants/style/color.dart';
import 'model/montly_reports_model.dart';

class MonthlyReports extends StatefulWidget {
  const MonthlyReports({Key? key}) : super(key: key);

  @override
  State<MonthlyReports> createState() => _MonthlyReportsState();
}

class _MonthlyReportsState extends State<MonthlyReports> {
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
            'Monthly Reports'.tr,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: FutureBuilder<MontlyReportsModel?>(
          future: getMonthlyReports(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              if (snapshot.data!.monthlyReports!.isEmpty ||
                  snapshot.data!.monthlyReports == null) {
                return Center(
                  child: Text(
                    'There are no reports'.tr,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.4),
                      fontSize: 20,
                    ),
                  ),
                );
              }
              return ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                physics: const ScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 5,
                  right: 5,
                  bottom: 30,
                ),
                itemCount: snapshot.data!.monthlyReports!.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 0.5,
                              blurRadius: 2,
                              offset: const Offset(
                                0,
                                3,
                              ),
                            ),
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 0.5,
                              blurRadius: 2,
                              offset: const Offset(
                                3,
                                0,
                              ),
                            ),
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 0.5,
                              blurRadius: 2,
                              offset: const Offset(
                                0,
                                -3,
                              ),
                            ),
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 0.5,
                              blurRadius: 2,
                              offset: const Offset(
                                -3,
                                0,
                              ),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Year :'.tr,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  (snapshot.data!.monthlyReports![index].year ??
                                          '')
                                      .toString(),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Month :'.tr,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  (snapshot.data!.monthlyReports![index]
                                              .month ??
                                          '')
                                      .toString(),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Price :'.tr,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  (snapshot.data!.monthlyReports![index]
                                              .price ??
                                          '')
                                      .toString(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ));
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

  Future<MontlyReportsModel?> getMonthlyReports() async {
    HttpRepository httpRepository = HttpRepositoryImpl();
    CacheUtils cacheUtils = CacheUtils(GetStorage());

    late Rx<Response?> monthlyReportsResponse = Rx<Response?>(null);
    MontlyReportsModel? monthlyReportsModel = MontlyReportsModel();

    try {
      monthlyReportsResponse.value = await httpRepository.getMonthlyReports(
        lang: cacheUtils.getLanguage()!,
      );

      if (monthlyReportsResponse.value == null) {
        return null;
      }
      monthlyReportsModel =
          MontlyReportsModel.fromJson(monthlyReportsResponse.value!.body);

      return monthlyReportsModel;
    } catch (e) {
      Get.snackbar(
        'Get Monthly Reports'.tr,
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
}
