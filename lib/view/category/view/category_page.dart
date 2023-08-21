import 'package:albausalah_app/shared/components/constants/style/color.dart';
import 'package:albausalah_app/view/category/sub_category/sub_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../api/repository/http_repository.dart';
import '../../../api/repository/http_repository_impl.dart';
import '../../../shared/helper/cache_utils.dart';
import '../item/category_item_list.dart';
import '../model/category_home_model.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
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
                'Categories'.tr,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            body: FutureBuilder<CategoryHomeModel?>(
              future: getMainCategories(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(
                      top: 20,
                      bottom: 40,
                    ),
                    itemBuilder: (context, index) => CategoryItemList(
                      onTap: () {
                        Get.to(
                          () => const SubCategoryPage(),
                          arguments: snapshot.data!.categories![index].id,
                        );
                      },
                      text: snapshot.data!.categories![index].name!,
                      image: snapshot.data!.categories![index].image,
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 15,
                    ),
                    itemCount: snapshot.data!.categories!.length,
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
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
            )));
  }

  Future<CategoryHomeModel?> getMainCategories() async {
    HttpRepository httpRepository = HttpRepositoryImpl();
    CacheUtils cacheUtils = CacheUtils(GetStorage());

    late Rx<Response?> getMainCategoriesResponse = Rx<Response?>(null);
    CategoryHomeModel? categoryHomeModel = CategoryHomeModel();

    try {
      getMainCategoriesResponse.value = await httpRepository.getMainCategories(
        lang: cacheUtils.getLanguage() ?? 'en',
      );

      if (getMainCategoriesResponse.value == null) {
        return null;
      }
      categoryHomeModel =
          CategoryHomeModel.fromJson(getMainCategoriesResponse.value!.body);

      return categoryHomeModel;
    } catch (e) {
      Get.snackbar(
        'Get main categories'.tr,
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
