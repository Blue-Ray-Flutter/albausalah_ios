import 'package:albausalah_app/shared/components/constants/style/color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../api/repository/http_repository.dart';
import '../../../../api/repository/http_repository_impl.dart';
import '../../../../shared/helper/cache_utils.dart';
import 'model/about_store_model.dart';

class AboutStore extends StatefulWidget {
  AboutStore({Key? key, required this.storeId}) : super(key: key);

  String storeId;

  @override
  State<AboutStore> createState() => _AboutStoreState();
}

class _AboutStoreState extends State<AboutStore> {
  bool isClickedMail = false;
  bool isClickedPhone = false;
  bool isClickedWebSite = false;

  Future<void> openGoogleMaps(double latitude, double longitude) async {
    final url =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch Google Maps.'.tr;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.6,
        title: Text(
          'About US'.tr,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: FutureBuilder<AboutStoreModel?>(
        future: getAboutStore(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return ListView(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                bottom: 20,
                top: 20,
              ),
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    border: Border.all(
                      width: .5,
                      color: AppColor.globalDefaultColor,
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        snapshot.data!.storeInfo!.aboutStore ?? '',
                        style: const TextStyle(
                          fontSize: 21,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        snapshot.data!.storeInfo!.sroreDescription ?? '',
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ListTile(
                        onTap: () {
                          snapshot.data!.storeInfo!.latitude == null &&
                                  snapshot.data!.storeInfo!.longitude == null
                              ? null
                              : openGoogleMaps(
                                  double.parse(
                                    snapshot.data!.storeInfo!.latitude ??
                                        '31.9557901',
                                  ),
                                  double.parse(
                                    snapshot.data!.storeInfo!.longitude ??
                                        '35.8608073',
                                  ),
                                );
                        },
                        leading: const Icon(
                          Icons.location_on_outlined,
                        ),
                        title: Text(
                          snapshot.data!.storeInfo!.latitude == null &&
                                  snapshot.data!.storeInfo!.longitude == null
                              ? 'Request'
                              : 'https://www.google.com/maps/@${snapshot.data!.storeInfo!.latitude},${snapshot.data!.storeInfo!.longitude},15z?entry=ttu',
                          style: const TextStyle(
                            fontSize: 15,
                            color: AppColor.globalDefaultColor,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () async {
                          await launchUrl(Uri(
                            scheme: 'mailto'.tr,
                            path: snapshot.data!.storeInfo!.email ?? '',
                          ));
                          setState(() {
                            isClickedMail = true;
                          });
                        },
                        leading: const Icon(
                          Icons.email_outlined,
                          color: Colors.black38,
                        ),
                        title: Text(
                          snapshot.data!.storeInfo!.email ?? '',
                          style: TextStyle(
                            fontSize: 15,
                            color: isClickedMail
                                ? Colors.black26
                                : AppColor.globalDefaultColor,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () async {
                          await launchUrl(Uri(
                            scheme: 'tel',
                            path: snapshot.data!.storeInfo!.phone ?? '+00',
                          ));
                          setState(() {
                            isClickedPhone = true;
                          });
                        },
                        leading: const Icon(
                          Icons.phone,
                          color: Colors.black38,
                        ),
                        title: Text(
                          snapshot.data!.storeInfo!.phone ?? '',
                          style: TextStyle(
                            fontSize: 15,
                            color: isClickedPhone
                                ? Colors.black26
                                : AppColor.globalDefaultColor,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () async {
                          await launchUrl(Uri.parse(
                              snapshot.data!.storeInfo!.website ??
                                  'https://google.com'));
                          setState(() {
                            isClickedWebSite = true;
                          });
                        },
                        leading: const Icon(
                          FontAwesomeIcons.earth,
                          color: Colors.black38,
                        ),
                        title: Text(
                          snapshot.data!.storeInfo!.website ?? '',
                          style: TextStyle(
                              fontSize: 15,
                              color: isClickedWebSite
                                  ? Colors.black26
                                  : AppColor.globalDefaultColor),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    border: Border.all(
                      width: .5,
                      color: AppColor.globalDefaultColor,
                    ),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(FontAwesomeIcons.building),
                        subtitle: Text(
                          snapshot.data!.storeInfo!.storeName ?? '',
                        ),
                        title: Text(
                          'Store name'.tr,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () async {
                          await launchUrl(Uri(
                            scheme: 'tel',
                            path: snapshot.data!.storeInfo!.phone ?? '+00',
                          ));
                          setState(() {
                            isClickedPhone = true;
                          });
                        },
                        leading: const Icon(
                          Icons.phone,
                          color: Colors.black38,
                        ),
                        subtitle: Text(
                          snapshot.data!.storeInfo!.phone ?? '',
                          style: TextStyle(
                            color: isClickedPhone
                                ? Colors.black26
                                : AppColor.globalDefaultColor,
                          ),
                        ),
                        title: Text(
                          'Phone'.tr,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () async {
                          await launchUrl(Uri(
                            scheme: 'tel',
                            path: snapshot.data!.storeInfo!.fax ?? '+00',
                          ));
                        },
                        leading: const Icon(Icons.fax),
                        subtitle: Text(snapshot.data!.storeInfo!.fax ?? ''),
                        title: Text(
                          'Fax'.tr,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.work_outline),
                        subtitle: Text(
                          snapshot.data!.storeInfo!.storeWorkStatus ?? '',
                        ),
                        title: Text(
                          'Working status'.tr,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.access_time),
                        subtitle: Text(
                          snapshot.data!.storeInfo!.workHours ?? '',
                        ),
                        title: Text(
                          'Work time'.tr,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    border: Border.all(
                      width: .5,
                      color: AppColor.globalDefaultColor,
                    ),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(FontAwesomeIcons.building),
                        subtitle: Text(
                          snapshot.data!.storeInfo!.storeRegion ?? '',
                        ),
                        title: Text(
                          'Store region'.tr,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.add_road,
                          color: Colors.black38,
                        ),
                        subtitle: Text(
                          snapshot.data!.storeInfo!.storeStreet ?? '',
                          style: const TextStyle(
                            color: Colors.black26,
                          ),
                        ),
                        title: Text(
                          'Store Street'.tr,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(FontAwesomeIcons.building),
                        subtitle:
                            Text(snapshot.data!.storeInfo!.buildingName ?? ''),
                        title: Text(
                          'Building Name'.tr,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(FontAwesomeIcons.building),
                        subtitle: Text(
                          '${snapshot.data!.storeInfo!.buildingNumber}' ?? '',
                        ),
                        title: Text(
                          'Building Number'.tr,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.markunread_mailbox_outlined),
                        subtitle: Text(
                          '${snapshot.data!.storeInfo!.mailbox}' ?? '',
                        ),
                        title: Text(
                          'Mailbox'.tr,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.email),
                        subtitle: Text(
                          '${snapshot.data!.storeInfo!.postalCode}' ?? '',
                        ),
                        title: Text(
                          'Postal Code'.tr,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
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
    );
  }

  Future<AboutStoreModel?> getAboutStore() async {
    HttpRepository httpRepository = HttpRepositoryImpl();
    CacheUtils cacheUtils = CacheUtils(GetStorage());

    late Rx<Response?> aboutStoreResponse = Rx<Response?>(null);
    AboutStoreModel? aboutStoreModel = AboutStoreModel();

    try {
      aboutStoreResponse.value = await httpRepository.aboutStore(
        storeId: widget.storeId,
      );

      if (aboutStoreResponse.value == null) {
        return null;
      }
      aboutStoreModel =
          AboutStoreModel.fromJson(aboutStoreResponse.value!.body);

      return aboutStoreModel;
    } catch (e) {
      Get.snackbar(
        'Get about Store'.tr,
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
        duration: const Duration(seconds: 4),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        forwardAnimationCurve: Curves.easeOutBack,
      );
      e.printError();
    }
    return null;
  }
}
