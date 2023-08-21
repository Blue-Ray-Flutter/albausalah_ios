import 'package:albausalah_app/shared/components/constants/style/color.dart';
import 'package:albausalah_app/shared/components/widgets/size_config/size_config.dart';
import 'package:flutter/material.dart';

class MySiteRequestItem extends StatelessWidget {
  String senderName;
  String phoneNumber;
  String timeDate;
  String orderStatus;
  bool isMySiteRequest;
  void Function() onPressedDone;
  void Function() onPressedCancel;

  MySiteRequestItem({
    super.key,
    required this.senderName,
    required this.phoneNumber,
    required this.timeDate,
    required this.orderStatus,
    required this.onPressedDone,
    required this.onPressedCancel,
    required this.isMySiteRequest,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
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
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  isMySiteRequest ? 'Sender name : ' : 'Store name : ',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  senderName,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  'Phone number : ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  phoneNumber,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  'Time & Date : ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  timeDate,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  'Order Status : ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  orderStatus,
                  style: const TextStyle(
                    color: AppColor.globalDefaultColor,
                  ),
                ),
              ],
            ),
            isMySiteRequest
                ? orderStatus == "Pending"
                    ? Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Location (Click on button to give your location)',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          AppColor.globalDefaultColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      minimumSize:
                                          Size(SizeConfig.screenWidth, 40)),
                                  onPressed: onPressedDone,
                                  child: const Icon(Icons.done),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          AppColor.globalErrorColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      minimumSize:
                                          Size(SizeConfig.screenWidth, 40)),
                                  onPressed: onPressedCancel,
                                  child: const Icon(Icons.cancel_outlined),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Container()
                : Container()
          ],
        ),
      ),
    );
  }
}
