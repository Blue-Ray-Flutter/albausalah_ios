import 'package:albausalah_app/shared/components/widgets/button/button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../api/repository/http_repository.dart';
import '../../../../api/repository/http_repository_impl.dart';
import '../../../../res/assets_res.dart';
import '../../../../shared/components/actions/actions.dart';
import '../../../../shared/components/constants/style/color.dart';
import '../../../../shared/components/widgets/size_config/size_config.dart';
import '../../../../shared/helper/cache_utils.dart';
import '../../../stores/store_page/view/store_page.dart';
import 'model/following_stores_model.dart';

class FollowStores extends StatefulWidget {
  const FollowStores({Key? key}) : super(key: key);

  @override
  State<FollowStores> createState() => _FollowStoresState();
}

class _FollowStoresState extends State<FollowStores> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, // <-- SEE HERE
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0.6,
          title: Text(
            'Follow Stores'.tr,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: FutureBuilder<FollowingStoresModel?>(
          future: getMyFollowingStores(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              if (snapshot.data!.following == null ||
                  snapshot.data!.following!.isEmpty) {
                return Center(
                  child: Text(
                    'There are no followers'.tr,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.4),
                      fontSize: 20,
                    ),
                  ),
                );
              }
              return ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(
                  top: 15,
                  bottom: 30,
                ),
                itemBuilder: (context, index) => ListTile(
                  onTap: () => Get.to(() => const StorePage(), arguments: [
                    snapshot.data!.following![index].id.toString(),
                    true,
                  ]),
                  leading: snapshot.data!.following![index].profilePhotoUrl ==
                          null
                      ? const CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          foregroundImage: AssetImage(AssetsRes.PROFILE),
                        )
                      : CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          foregroundImage: CachedNetworkImageProvider(snapshot
                              .data!.following![index].profilePhotoUrl!),
                        ),
                  title: Text(
                    snapshot.data!.following![index].name!,
                  ),
                  trailing: Button(
                    radius: 10,
                    background: Colors.white,
                    textColor: AppColor.globalDefaultColor,
                    height: 40,
                    width: 110,
                    onPressed: () {
                      ConstantActions.followStores(
                          snapshot.data!.following![index].id!.toString());
                      Future.delayed(const Duration(milliseconds: 500), () {
                        setState(() {});
                      });
                    },
                    text: 'Following'.tr,
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 15,
                ),
                itemCount: snapshot.data!.following!.length,
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

  Future<FollowingStoresModel?> getMyFollowingStores() async {
    HttpRepository httpRepository = HttpRepositoryImpl();
    CacheUtils cacheUtils = CacheUtils(GetStorage());

    late Rx<Response?> followingResponse = Rx<Response?>(null);
    FollowingStoresModel? followingModel = FollowingStoresModel();

    try {
      followingResponse.value = await httpRepository.followingStores(
        lang: cacheUtils.getLanguage()!,
      );

      if (followingResponse.value == null) {
        return null;
      }
      followingModel =
          FollowingStoresModel.fromJson(followingResponse.value!.body);

      return followingModel;
    } catch (e) {
      Get.snackbar(
        'Get My Following'.tr,
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
