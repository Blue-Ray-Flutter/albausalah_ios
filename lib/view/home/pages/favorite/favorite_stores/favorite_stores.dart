import 'package:albausalah_app/shared/components/widgets/store_item/store_item.dart';
import 'package:albausalah_app/shared/helper/cache_utils.dart';
import 'package:albausalah_app/view/stores/store_page/view/store_page.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../api/repository/http_repository.dart';
import '../../../../../api/repository/http_repository_impl.dart';
import '../../../../../shared/components/actions/actions.dart';
import '../../../../../shared/components/constants/style/color.dart';
import '../../../../../shared/components/widgets/size_config/size_config.dart';
import 'model/favorite_store_model.dart';

class FavoriteStoresPage extends StatefulWidget {
  const FavoriteStoresPage({Key? key}) : super(key: key);

  @override
  State<FavoriteStoresPage> createState() => _FavoriteStoresPageState();
}

class _FavoriteStoresPageState extends State<FavoriteStoresPage> {
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
        title:  Text(
          'Favorite Store'.tr,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: FutureBuilder<FavoriteStoreModel?>(
        future: getFavoriteStore(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            if (snapshot.data!.stores == null ||
                snapshot.data!.stores!.isEmpty) {
              return Center(
                child: Text(
                  'There are no stores'.tr,
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
                    childAspectRatio: 2 / 3,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  itemCount: snapshot.data!.stores!.length,
                  itemBuilder: (context, index) {
                    return StoreItem(
                      followWidget: Container(),
                      widget: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FavoriteButton(
                          iconSize: 38,
                          isFavorite: true,
                          valueChanged: (isFavorite) {
                            ConstantActions.addRemoveStoreWishlist(
                                snapshot.data!.stores![index].id.toString());
                            Future.delayed(const Duration(milliseconds: 500),
                                () {
                              setState(() {});
                            });
                          },
                          //
                        ),
                      ),
                      heightContainer: 150,
                      nameShop: snapshot.data!.stores![index].storeName,
                      location: snapshot.data!.stores![index].storeLocation,
                      image: snapshot.data!.stores![index].profilePhotoUrl,
                      rate: double.parse(
                          snapshot.data!.stores![index].storeReview!),
                      widthBorder: 0.9,
                      onTap: () {
                        Get.to(
                          () => const StorePage(),
                          arguments: [
                            snapshot.data!.stores![index].id,
                            snapshot.data!.stores![index].followStore,
                          ],
                        );
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

  Future<FavoriteStoreModel?> getFavoriteStore() async {
    HttpRepository httpRepository = HttpRepositoryImpl();
    CacheUtils cacheUtils = CacheUtils(GetStorage());

    late Rx<Response?> favoriteResponse = Rx<Response?>(null);
    FavoriteStoreModel? favoriteStoreModel = FavoriteStoreModel();

    try {
      favoriteResponse.value = await httpRepository.getFavoriteStore(
        lang: cacheUtils.getLanguage()!,
      );

      if (favoriteResponse.value == null) {
        return null;
      }
      favoriteStoreModel =
          FavoriteStoreModel.fromJson(favoriteResponse.value!.body);
      return favoriteStoreModel;
    } catch (e) {
      Get.snackbar(
        'Get Favorite Store'.tr,
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
