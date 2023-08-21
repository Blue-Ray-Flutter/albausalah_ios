import 'package:albausalah_app/shared/components/actions/actions.dart';
import 'package:albausalah_app/shared/components/widgets/product_item/product_item.dart';
import 'package:albausalah_app/view/stores/store_page/product_page/product_page.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../api/repository/http_repository.dart';
import '../../../../../api/repository/http_repository_impl.dart';
import '../../../../../shared/components/constants/style/color.dart';
import '../../../../../shared/components/widgets/size_config/size_config.dart';
import '../../../../../shared/helper/cache_utils.dart';
import 'model/favorite_product_model.dart';

class FavoriteProducts extends StatefulWidget {
  const FavoriteProducts({Key? key}) : super(key: key);

  @override
  State<FavoriteProducts> createState() => _FavoriteProductsState();
}

class _FavoriteProductsState extends State<FavoriteProducts> {
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
          'Favorite Products'.tr,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: FutureBuilder<FavoriteProductModel?>(
        future: getFavoriteProduct(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            if (snapshot.data!.products == null ||
                snapshot.data!.products!.isEmpty) {
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
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: SizedBox(
                child: GridView.builder(
                  physics: const ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(
                    bottom: 24,
                    top: 15,
                    left: 5,
                    right: 5,
                  ),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 250,
                    childAspectRatio: 2 / 4,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  itemCount: snapshot.data!.products!.length,
                  itemBuilder: (context, index) {
                    return ProductItem(
                      favWidget: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: FavoriteButton(
                            iconSize: 25,
                            isFavorite: true,
                            iconDisabledColor: Colors.grey,
                            valueChanged: (isFavorite) {
                              ConstantActions.addRemoveProductWishlist(snapshot
                                  .data!.products![index].id
                                  .toString());
                              Future.delayed(const Duration(milliseconds: 500),
                                  () {
                                setState(() {});
                              });
                            },
                          ),
                        ),
                      ),
                      name: snapshot.data!.products![index].name ?? '',
                      body: snapshot.data!.products![index].description ?? '',
                      image: snapshot.data!.products![index].image,
                      price: double.parse(
                          snapshot.data!.products![index].salePrice ?? '0.0'),
                      rate: double.parse(
                          snapshot.data!.products![index].productReview ?? '0'),
                      onTap: () {
                        Get.to(() => const ProductPage(),
                            arguments: snapshot.data!.products![index].id!);
                      },
                    );
                  },
                ),
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

  Future<FavoriteProductModel?> getFavoriteProduct() async {
    HttpRepository httpRepository = HttpRepositoryImpl();
    CacheUtils cacheUtils = CacheUtils(GetStorage());

    late Rx<Response?> favoriteResponse = Rx<Response?>(null);
    FavoriteProductModel? favoriteProductModel = FavoriteProductModel();

    try {
      favoriteResponse.value = await httpRepository.getFavoriteProduct(
        lang: cacheUtils.getLanguage()!,
      );

      if (favoriteResponse.value == null) {
        return null;
      }
      favoriteProductModel =
          FavoriteProductModel.fromJson(favoriteResponse.value!.body);

      return favoriteProductModel;
    } catch (e) {
      Get.snackbar(
        'Get Favorite Product'.tr,
        'error',
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
