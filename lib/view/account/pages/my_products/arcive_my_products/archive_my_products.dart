import 'package:albausalah_app/shared/components/widgets/my_products_item/my_products_item.dart';
import 'package:albausalah_app/shared/helper/cache_utils.dart';
import 'package:albausalah_app/view/account/pages/my_products/update_my_product/update_my_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../api/repository/http_repository.dart';
import '../../../../../api/repository/http_repository_impl.dart';
import '../../../../../shared/components/constants/style/color.dart';
import '../../../../stores/store_page/product_page/product_page.dart';
import '../model/my_products_model.dart';

class ArchiveMyProducts extends StatefulWidget {
  const ArchiveMyProducts({Key? key}) : super(key: key);

  @override
  State<ArchiveMyProducts> createState() => _MyProductsState();
}

class _MyProductsState extends State<ArchiveMyProducts> {
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
            'My Products'.tr,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: FutureBuilder<MyProductsModel?>(
          future: getMyProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              if (snapshot.data!.products!.isEmpty) {
                return Center(
                  child: Text(
                    'There are no products'.tr,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.4),
                      fontSize: 20,
                    ),
                  ),
                );
              }
              return GridView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 5,
                  right: 5,
                  bottom: 30,
                ),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 2 / 4.15,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: snapshot.data!.products!.length,
                itemBuilder: (context, index) {
                  return Stack(
                    alignment: Alignment.topRight,
                    children: [
                      MyProductItem(
                        onTapUpdate: () {
                          Get.to(
                            () => const UpdateMyProduct(),
                            arguments:
                                snapshot.data!.products![index].id.toString(),
                          );
                        },
                        activeButton: Container(),
                        name: snapshot.data!.products![index].name ?? '',
                        body: snapshot.data!.products![index].description ?? '',
                        image: snapshot.data!.products![index].image,
                        price: double.parse(
                            snapshot.data!.products![index].salePrice ?? "0.0"),
                        rate: double.parse(
                            snapshot.data!.products![index].productReview!),
                        onTap: () {
                          Get.to(
                            () => const ProductPage(),
                            arguments: [
                              snapshot.data!.products![index].id,
                              snapshot.data!.products![index].storeId
                                  .toString(),
                            ],
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            restoreSoftDeleteProduct(
                                productId: snapshot.data!.products![index].id
                                    .toString());
                            Future.delayed(const Duration(milliseconds: 500),
                                () {
                              setState(() {});
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.grey[300],
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Icon(
                                Icons.refresh,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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

  Future<MyProductsModel?> getMyProducts() async {
    HttpRepository httpRepository = HttpRepositoryImpl();
    CacheUtils cacheUtils = CacheUtils(GetStorage());

    late Rx<Response?> myProductsResponse = Rx<Response?>(null);
    MyProductsModel? myProductsModel = MyProductsModel();

    try {
      myProductsResponse.value = await httpRepository.showSoftDeleteProducts(
        lang: cacheUtils.getLanguage()!,
      );

      if (myProductsResponse.value == null) {
        return null;
      }
      myProductsModel =
          MyProductsModel.fromJson(myProductsResponse.value!.body);

      return myProductsModel;
    } catch (e) {
      Get.snackbar(
        'Get Archive Products'.tr,
        'Something went wrong',
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

  restoreSoftDeleteProduct({required String productId}) async {
    HttpRepository httpRepository = HttpRepositoryImpl();
    CacheUtils cacheUtils = CacheUtils(GetStorage());

    try {
      httpRepository.restoreSoftDeleteProduct(
        productId: productId,
        lang: cacheUtils.getLanguage()!,
      );
    } catch (e) {
      Get.snackbar(
        'Restore Deleted Product'.tr,
        'Something went wrong',
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
