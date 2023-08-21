import 'package:albausalah_app/shared/components/constants/style/color.dart';
import 'package:albausalah_app/shared/components/widgets/my_site_request_item/my_site_request_item.dart';
import 'package:albausalah_app/view/account/pages/store_requests/controller/store_request_controller.dart';
import 'package:albausalah_app/view/account/pages/store_requests/model/show_my_location_inquireies_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class StoreRequest extends StatefulWidget {
  const StoreRequest({Key? key}) : super(key: key);

  @override
  State<StoreRequest> createState() => _StoreRequestState();
}

class _StoreRequestState extends State<StoreRequest> {
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
          title:  Text(
            'Store Request'.tr,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: FutureBuilder<ShowMyLocationInquireiesModel?>(
          future: StoreRequestController.showMyLocationInquireies(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              if (snapshot.data!.locationInquiries == null ||
                  snapshot.data!.locationInquiries!.isEmpty) {
                return Center(
                  child: Text(
                    'There are no location Inquiries'.tr,
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
                    isMySiteRequest: false,
                    senderName:
                        snapshot.data!.locationInquiries![index].storeName ??
                            '',
                    orderStatus: snapshot
                            .data!.locationInquiries![index].requestStatus ??
                        '',
                    phoneNumber:
                        snapshot.data!.locationInquiries![index].phone ?? '',
                    timeDate:
                        snapshot.data!.locationInquiries![index].createdAt ??
                            '',
                    onPressedCancel: () {},
                    onPressedDone: () async {},
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
