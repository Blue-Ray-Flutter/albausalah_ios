import 'package:albausalah_app/shared/helper/cache_utils.dart';
import 'package:albausalah_app/view/account/pages/client_orders/detailed_order/detailed_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../api/repository/http_repository.dart';
import '../../../../../api/repository/http_repository_impl.dart';
import '../../../../../shared/components/constants/style/color.dart';
import '../../../../../shared/components/widgets/order_item/order_item.dart';
import '../model/my_order_model.dart';

class MyOrderPage extends StatefulWidget {
  const MyOrderPage({Key? key}) : super(key: key);

  @override
  State<MyOrderPage> createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
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
            'My Orders'.tr,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: FutureBuilder<MyOrderModel?>(
          future: getMyOrders(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              if (snapshot.data!.sales!.isEmpty) {
                return Center(
                  child: Text(
                    'There are no orders'.tr,
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
                itemCount: snapshot.data!.sales!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: OrderItem(
                      price: snapshot.data!.sales![index].endTotal,
                      phone: snapshot.data!.sales![index].store!.phone ?? '',
                      onTap: () {
                        Get.to(() => DetailedOrder(
                              orderId:
                                  snapshot.data!.sales![index].id.toString(),
                            ));
                      },
                      address:
                          snapshot.data!.sales![index].store!.addressEn ?? '',
                      name: snapshot.data!.sales![index].store!.name ?? '',
                      date: snapshot.data!.sales![index].createdAt ?? '',
                    ),
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

  Future<MyOrderModel?> getMyOrders() async {
    HttpRepository httpRepository = HttpRepositoryImpl();
    CacheUtils cacheUtils = CacheUtils(GetStorage());

    late Rx<Response?> myOrdersResponse = Rx<Response?>(null);
    MyOrderModel? myOrdersModel = MyOrderModel();

    try {
      myOrdersResponse.value = await httpRepository.getMyOrders(
        lang: cacheUtils.getLanguage()!,
      );

      if (myOrdersResponse.value == null) {
        return null;
      }
      myOrdersModel = MyOrderModel.fromJson(myOrdersResponse.value!.body);

      return myOrdersModel;
    } catch (e) {
      Get.snackbar(
        'Get My Orders'.tr,
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
