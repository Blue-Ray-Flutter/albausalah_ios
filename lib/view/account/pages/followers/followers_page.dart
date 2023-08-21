import 'package:albausalah_app/api/api_url/api_url.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../api/repository/http_repository.dart';
import '../../../../api/repository/http_repository_impl.dart';
import '../../../../res/assets_res.dart';
import '../../../../shared/components/constants/style/color.dart';
import '../../../../shared/helper/cache_utils.dart';
import '../../../stores/store_page/view/store_page.dart';
import 'model/followers_model.dart';

class Followers extends StatefulWidget {
  const Followers({Key? key}) : super(key: key);

  @override
  State<Followers> createState() => _FollowersState();
}

class _FollowersState extends State<Followers> {
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
          'My Followers'.tr,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: FutureBuilder<FollowersModel?>(
        future: getMyFollowers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            if (snapshot.data!.followers == null ||
                snapshot.data!.followers!.isEmpty) {
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
              padding: const EdgeInsets.only(
                top: 15,
                bottom: 30,
              ),
              itemBuilder: (context, index) => ListTile(
                  onTap: () {
                    snapshot.data!.followers![index].userType == 'Customer'
                        ? null
                        : Get.to(() => const StorePage(), arguments: [
                            snapshot.data!.followers![index].id.toString(),
                            false,
                          ]);
                  },
                  leading: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: snapshot.data!.followers![index].userType ==
                            'Customer'
                        ? snapshot.data!.followers![index].profilePhotoUrl ==
                                null
                            ? const CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.white,
                                foregroundImage: AssetImage(AssetsRes.PROFILE),
                              )
                            : CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.white,
                                backgroundImage: CachedNetworkImageProvider(
                                    '${UrlAPI.baseUrlImage}${snapshot.data!.followers![index].profilePhotoUrl!}',
                                    errorListener: () =>
                                        const AssetImage(AssetsRes.PROFILE)),
                              )
                        : snapshot.data!.followers![index].profilePhotoUrl ==
                                null
                            ? InkWell(
                                onTap: () => Get.to(
                                  () => const StorePage(),
                                  arguments: snapshot.data!.followers![index].id
                                      .toString(),
                                ),
                                child: const CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.white,
                                  foregroundImage:
                                      AssetImage(AssetsRes.PROFILE),
                                ),
                              )
                            : InkWell(
                                onTap: () => Get.to(
                                  () => const StorePage(),
                                  arguments: snapshot.data!.followers![index].id
                                      .toString(),
                                ),
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.white,
                                  backgroundImage: CachedNetworkImageProvider(
                                      '${UrlAPI.baseUrlImage}${snapshot.data!.followers![index].profilePhotoUrl!}',
                                      errorListener: () =>
                                          const AssetImage(AssetsRes.PROFILE)),
                                ),
                              ),
                  ),
                  title: Text(
                    snapshot.data!.followers![index].name!,
                  )),
              separatorBuilder: (context, index) => const SizedBox(
                height: 15,
              ),
              itemCount: snapshot.data!.followers!.length,
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

  Future<FollowersModel?> getMyFollowers() async {
    HttpRepository httpRepository = HttpRepositoryImpl();
    CacheUtils cacheUtils = CacheUtils(GetStorage());

    late Rx<Response?> followersResponse = Rx<Response?>(null);
    FollowersModel? followersModel = FollowersModel();

    try {
      followersResponse.value = await httpRepository.getMyFollowers(
        lang: cacheUtils.getLanguage()!,
      );

      if (followersResponse.value == null) {
        return null;
      }
      followersModel = FollowersModel.fromJson(followersResponse.value!.body);

      return followersModel;
    } catch (e) {
      Get.snackbar(
        'Get My Followers'.tr,
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
