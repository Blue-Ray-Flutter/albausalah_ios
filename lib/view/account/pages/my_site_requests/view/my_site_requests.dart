import 'package:albausalah_app/shared/components/constants/style/color.dart';
import 'package:albausalah_app/shared/components/widgets/my_site_request_item/my_site_request_item.dart';
import 'package:albausalah_app/view/account/pages/my_site_requests/controller/my_site_requests_controller.dart';
import 'package:albausalah_app/view/account/pages/my_site_requests/model/show_location_requests_model.dart';
import 'package:albausalah_app/view/location/location_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MySiteRequests extends StatefulWidget {
  const MySiteRequests({Key? key}) : super(key: key);

  @override
  State<MySiteRequests> createState() => _MySiteRequestsState();
}

class _MySiteRequestsState extends State<MySiteRequests> {
  Rx<GeoPoint?> notifier = Rx<GeoPoint?>(null);

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
            'My Site Requests'.tr,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: FutureBuilder<ShowLocationRequestsModel?>(
          future: MySiteRequestsController.showLocationRequests(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              if (snapshot.data!.locationInquiries == null ||
                  snapshot.data!.locationInquiries!.isEmpty) {
                return Center(
                  child: Text(
                    'There are no requests'.tr,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.4),
                      fontSize: 20,
                    ),
                  ),
                );
              }
              return ListView.separated(
                physics: const ScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                  bottom: 30,
                ),
                itemCount: snapshot.data!.locationInquiries!.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  return MySiteRequestItem(
                    isMySiteRequest: true,
                    senderName:
                        snapshot.data!.locationInquiries![index].customerName ??
                            '',
                    orderStatus: snapshot
                            .data!.locationInquiries![index].requestStatus ??
                        '',
                    phoneNumber:
                        snapshot.data!.locationInquiries![index].phone ?? '',
                    timeDate:
                        snapshot.data!.locationInquiries![index].createdAt ??
                            '',
                    onPressedCancel: () {
                      MySiteRequestsController.rejectLocationInquiry(
                        locationInquiryId: snapshot
                            .data!.locationInquiries![index].id
                            .toString(),
                      );
                    },
                    onPressedDone: () async {
                      var p = await Get.to(() => const SearchPage());
                      if (p != null) {
                        setState(() {
                          notifier.value = p as GeoPoint;
                        });
                        MySiteRequestsController.getAddressFromLatLng(
                          longitude: notifier.value!.longitude,
                          latitude: notifier.value!.latitude,
                        );

                        MySiteRequestsController.acceptLocationInquiry(
                          locationInquiryId: snapshot
                              .data!.locationInquiries![index].id
                              .toString(),
                          longitude: notifier.value!.longitude.toString(),
                          latitude: notifier.value!.latitude.toString(),
                        );
                      }
                    },
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
}
