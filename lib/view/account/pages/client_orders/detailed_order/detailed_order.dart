import 'package:albausalah_app/shared/components/widgets/size_config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../api/repository/http_repository.dart';
import '../../../../../api/repository/http_repository_impl.dart';
import '../../../../../res/assets_res.dart';
import '../../../../../shared/components/constants/style/color.dart';
import '../../../../../shared/helper/cache_utils.dart';
import 'model/order_detail_model.dart';

class DetailedOrder extends StatefulWidget {
  DetailedOrder({
    Key? key,
    required this.orderId,
  }) : super(key: key);

  String orderId;

  @override
  State<DetailedOrder> createState() => _DetailedOrderState();
}

class _DetailedOrderState extends State<DetailedOrder> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.6,
        title: Text(
          'Detailed Order'.tr,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: FutureBuilder<OrderDetailModel?>(
        future: getOrderDetail(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Container(
                height: SizeConfig.screenHeight,
                width: SizeConfig.screenWidth,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  color: Colors.white,
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
                    ),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Align(
                            alignment: Alignment.topRight,
                            child: Image(
                                width: 80,
                                height: 70,
                                image: AssetImage(AssetsRes.ALBAUSALAH_LOGO)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Invoice information :'.tr,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: RichText(
                              text: TextSpan(
                                text: 'Name : '.tr,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                      text: snapshot.data!.data!.customerName ??
                                          '',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      )),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: RichText(
                              text: TextSpan(
                                text: 'Phone number : '.tr,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                      text: snapshot.data!.data!.phone ?? '',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      )),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: RichText(
                              text: TextSpan(
                                text: 'Email : '.tr,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                      text: snapshot.data!.data!.email ?? '',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      )),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: RichText(
                              text: TextSpan(
                                text: 'City : '.tr,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                      text: snapshot.data!.data!.city ?? '',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      )),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: RichText(
                              text: TextSpan(
                                text: 'Address : '.tr,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                      text: snapshot.data!.data!.address ?? '',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      )),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            height: 1,
                            color: AppColor.globalDefaultColor,
                            indent: 20,
                            endIndent: 20,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Invoice body information : '.tr,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.arrow_drop_down_circle_outlined,
                                color: AppColor.globalDefaultColor,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          //**********************************************
                          SizedBox(
                            height: SizeConfig.screenHeight / 2,
                            child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              primary: false,
                              itemBuilder: (context, index) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: RichText(
                                        text: TextSpan(
                                          text: 'REF : '.tr,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          children: [
                                            TextSpan(
                                                text: (snapshot
                                                            .data!
                                                            .data!
                                                            .order!
                                                            .saleOperations![
                                                                index]
                                                            .saleId ??
                                                        '')
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: RichText(
                                        text: TextSpan(
                                          text: 'Product : '.tr,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          children: [
                                            TextSpan(
                                                text: snapshot
                                                        .data!
                                                        .data!
                                                        .order!
                                                        .saleOperations![index]
                                                        .productName ??
                                                    '',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: RichText(
                                        text: TextSpan(
                                          text: 'Size : '.tr,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          children: [
                                            TextSpan(
                                                text: snapshot
                                                        .data!
                                                        .data!
                                                        .order!
                                                        .saleOperations![index]
                                                        .sizeName ??
                                                    '',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: RichText(
                                        text: TextSpan(
                                          text: 'Color : '.tr,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          children: [
                                            TextSpan(
                                                text: snapshot
                                                        .data!
                                                        .data!
                                                        .order!
                                                        .saleOperations![index]
                                                        .colorName ??
                                                    '',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: RichText(
                                        text: TextSpan(
                                          text: 'Price : '.tr,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          children: [
                                            TextSpan(
                                                text: snapshot
                                                        .data!
                                                        .data!
                                                        .order!
                                                        .saleOperations![index]
                                                        .product!
                                                        .salePrice ??
                                                    '',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: RichText(
                                        text: TextSpan(
                                          text: 'Quantity : '.tr,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          children: [
                                            TextSpan(
                                                text: (snapshot
                                                            .data!
                                                            .data!
                                                            .order!
                                                            .saleOperations![
                                                                index]
                                                            .quantity ??
                                                        '')
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: RichText(
                                        text: TextSpan(
                                          text: 'Total amount : '.tr,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          children: [
                                            TextSpan(
                                                text: snapshot
                                                        .data!
                                                        .data!
                                                        .order!
                                                        .saleOperations![index]
                                                        .subTotal ??
                                                    '',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: RichText(
                                        text: TextSpan(
                                          text: 'Tax : '.tr,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          children: [
                                            TextSpan(
                                                text: snapshot
                                                        .data!
                                                        .data!
                                                        .order!
                                                        .saleOperations![index]
                                                        .endTax ??
                                                    '',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: RichText(
                                        text: TextSpan(
                                          text: 'Final sum : '.tr,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          children: [
                                            TextSpan(
                                                text: snapshot
                                                        .data!
                                                        .data!
                                                        .order!
                                                        .saleOperations![index]
                                                        .endTotal ??
                                                    '',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ]),
                              separatorBuilder: (context, index) =>
                                  const Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Divider(
                                    height: 1,
                                    color: AppColor.globalDefaultColor,
                                    indent: 20,
                                    endIndent: 20,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                              itemCount: snapshot
                                  .data!.data!.order!.saleOperations!.length,
                            ),
                          ),

                          //**********************************************
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            height: 1,
                            color: AppColor.globalDefaultColor,
                            indent: 20,
                            endIndent: 20,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Invoice footer information :'.tr,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: RichText(
                              text: TextSpan(
                                text: 'Total : '.tr,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                      text: snapshot
                                              .data!.data!.order!.subTotal ??
                                          '',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      )),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: RichText(
                              text: TextSpan(
                                text: 'Tax : '.tr,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                      text:
                                          snapshot.data!.data!.order!.endTax ??
                                              '',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      )),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: RichText(
                              text: TextSpan(
                                text: 'Final sum : '.tr,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                      text: snapshot
                                              .data!.data!.order!.endTotal ??
                                          '',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      )),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: RichText(
                              text: TextSpan(
                                text: 'Quantity : '.tr,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                      text: (snapshot.data!.data!.order!
                                              .saleOperations!.length)
                                          .toString(),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      )),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: RichText(
                              text: TextSpan(
                                text: 'Date and day : '.tr,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                      text: snapshot
                                              .data!.data!.order!.createdAt ??
                                          '',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      )),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: RichText(
                              text: TextSpan(
                                text: 'Status : '.tr,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                      text:
                                          snapshot.data!.data!.order!.status ??
                                              '',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      )),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    )),
              ),
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
    ));
  }

  Future<OrderDetailModel?> getOrderDetail() async {
    HttpRepository httpRepository = HttpRepositoryImpl();
    CacheUtils cacheUtils = CacheUtils(GetStorage());

    late Rx<Response?> orderDetailResponse = Rx<Response?>(null);
    OrderDetailModel? orderDetailModel = OrderDetailModel();

    try {
      orderDetailResponse.value = await httpRepository.getOrderDetails(
        lang: cacheUtils.getLanguage()!,
        orderId: widget.orderId,
      );

      if (orderDetailResponse.value == null) {
        return null;
      }
      orderDetailModel =
          OrderDetailModel.fromJson(orderDetailResponse.value!.body);

      return orderDetailModel;
    } catch (e) {
      Get.snackbar(
        'Get Order Detail'.tr,
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
