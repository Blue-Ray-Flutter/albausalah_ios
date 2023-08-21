import 'package:albausalah_app/view/login/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../shared/components/actions/actions.dart';
import '../../../shared/components/constants/style/color.dart';
import '../../../shared/components/widgets/button/button.dart';
import '../../../shared/components/widgets/button/counter_button.dart';
import '../../../shared/components/widgets/cart_item/cart_item.dart';
import '../../../shared/components/widgets/size_config/size_config.dart';
import 'controller/guest_cart_controller.dart';

class GuestCartPage extends GetWidget<GuestCartController> {
  const GuestCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.6,
        title: Text(
          'Cart'.tr,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Obx(
        () => controller.cartModel.value == null
            ? Center(
                child: LoadingAnimationWidget.stretchedDots(
                  color: AppColor.globalDefaultColor,
                  size: 40,
                ),
              )
            : controller.cartModel.value!.yourCart!.customerCart!.isEmpty
                ? Center(
                    child: Text(
                      'Cart is Empty'.tr,
                      style: TextStyle(
                        fontSize: 21,
                        color: Colors.black.withOpacity(0.2),
                      ),
                    ),
                  )
                : SizedBox(
                    height: SizeConfig.screenHeight,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            child: Container(
                              width: SizeConfig.screenWidth,
                              height: SizeConfig.screenHeight * 0.5,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  width: 0.5,
                                  color: Colors.grey[300]!,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey[300]!.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Obx(
                                () => ListView.separated(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                    bottom: 20,
                                  ),
                                  separatorBuilder: (context, index) => Divider(
                                    color: Colors.grey[400],
                                    height: 2,
                                    endIndent: 15,
                                    indent: 15,
                                  ),
                                  itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 15,
                                    ),
                                    child: CartItem(
                                      counterWidget: Obx(
                                        () => Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 15,
                                          ),
                                          child: CounterButton(
                                            count: controller
                                                .cartModel
                                                .value!
                                                .yourCart!
                                                .customerCart![index]
                                                .quantity!,
                                            addIconHeight: 30,
                                            addIconWidth: 30,
                                            removeIconHeight: 30,
                                            removeIconWidth: 30,
                                            textHeight: 30,
                                            textWidth: 30,
                                            onChange: (int value) {
                                              if (value < 1) {
                                                controller
                                                    .cartModel
                                                    .value!
                                                    .yourCart!
                                                    .customerCart![index]
                                                    .quantityItem = 1;
                                                controller.cartModel.refresh();
                                              } else {
                                                controller
                                                    .cartModel
                                                    .value!
                                                    .yourCart!
                                                    .customerCart![index]
                                                    .quantityItem = value;
                                                controller.cartModel.refresh();
                                              }
                                            },
                                            loading: false,
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        ConstantActions.guestRemoveFromCart(
                                          itemId: controller
                                              .cartModel
                                              .value!
                                              .yourCart!
                                              .customerCart![index]
                                              .id!,
                                          deviceId: controller.deviceId.value!,
                                        );
                                        controller.cartModel.value == null;
                                        Future.delayed(
                                            const Duration(milliseconds: 500),
                                            () {
                                          controller.getCart(
                                              deviceId:
                                                  controller.deviceId.value ??
                                                      '');
                                        });

                                        // setState(() {});
                                      },
                                      image: controller
                                          .cartModel
                                          .value!
                                          .yourCart!
                                          .customerCart![index]
                                          .product!
                                          .image,
                                      nameProduct: controller
                                          .cartModel
                                          .value!
                                          .yourCart!
                                          .customerCart![index]
                                          .product!
                                          .name,
                                      totalPriceItem: controller
                                          .cartModel
                                          .value!
                                          .yourCart!
                                          .customerCart![index]
                                          .itemSubTotal!,
                                    ),
                                  ),
                                  itemCount: controller.cartModel.value!
                                      .yourCart!.customerCart!.length,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Container(
                            width: SizeConfig.screenWidth,
                            height: SizeConfig.screenHeight * 0.34,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey[300]!.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                border: Border.all(
                                  width: 0.5,
                                  color: Colors.grey[300]!,
                                )),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    'Order details'.tr,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Divider(
                                    color: Colors.grey[400],
                                    height: 2,
                                    endIndent: 15,
                                    indent: 15,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text: 'Total summation : '.tr,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          children: [
                                            TextSpan(
                                              text:
                                                  '${controller.cartModel.value!.yourCart!.subTotal}',
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: 'Tax : ',
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: controller.cartModel.value!
                                                  .yourCart!.tax,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: 'Total : ',
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          children: [
                                            TextSpan(
                                              text:
                                                  '${controller.cartModel.value!.yourCart!.endTotal}',
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0,
                                    ),
                                    child: Button(
                                      height: 40,
                                      radius: 15,
                                      onPressed: () async {
                                        Get.offAll(() => const LoginPage());
                                      },
                                      text: 'Complete the process'.tr,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0,
                                    ),
                                    child: Button(
                                      borderWidth: 0.8,
                                      textColor: AppColor.globalDefaultColor,
                                      borderColor: AppColor.globalDefaultColor,
                                      background: Colors.white,
                                      height: 40,
                                      radius: 15,
                                      onPressed: () {
                                        controller.updateCartQuantity(
                                          data: controller.cartModel.value!
                                              .yourCart!.customerCart!
                                              .map((e) => e.updateCart())
                                              .toList(),
                                        );
                                      },
                                      text: 'Cart update'.tr,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
      ),
    ));
  }

// Future<CartModel?> getCart() async {
//   HttpRepository httpRepository = HttpRepositoryImpl();
//   CacheUtils cacheUtils = CacheUtils(GetStorage());
//
//   late Rx<Response?> cartResponse = Rx<Response?>(null);
//   CartModel? cartModel = CartModel();
//
//   try {
//     cartResponse.value = await httpRepository.getCart(
//       lang: 'en',
//     );
//
//     if (cartResponse.value == null) {
//       return null;
//     }
//     cartModel = CartModel.fromJson(cartResponse.value!.body);
//
//     return cartModel;
//   } catch (e) {
//     Get.snackbar(
//       'Get cart'.tr,
//       'error',
//       icon: const Icon(
//         Icons.warning,
//         color: Colors.white,
//       ),
//       snackPosition: SnackPosition.TOP,
//       backgroundColor: AppColor.globalDefaultColor,
//       borderRadius: 15,
//       margin: const EdgeInsets.all(15),
//       colorText: Colors.white,
//       duration: const Duration(seconds: 4),
//       isDismissible: true,
//       dismissDirection: DismissDirection.horizontal,
//       forwardAnimationCurve: Curves.easeOutBack,
//     );
//     e.printError();
//   }
//   return null;
// }
}
