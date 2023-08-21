import 'package:albausalah_app/shared/components/constants/style/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../api/repository/http_repository.dart';
import '../../../../api/repository/http_repository_impl.dart';
import '../../../../shared/components/widgets/how_register_item/how_register_item.dart';
import '../../../../shared/helper/cache_utils.dart';
import 'model/how_to_register_model.dart';

class HowRegister extends StatefulWidget {
  const HowRegister({Key? key}) : super(key: key);

  @override
  State<HowRegister> createState() => _HowRegisterState();
}

class _HowRegisterState extends State<HowRegister> {
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
          title:  Text(
            'How to register'.tr,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: FutureBuilder<HowToRegisterModel?>(
          future: getHowToRegister(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              return ListView(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 15,
                  bottom: 40,
                ),
                children: [
                  HowRegisterItem(
                    widthBorder: 0.9,
                    icon: Icons.person,
                    heightContainer: 200,
                    heightImage: 350,
                    image:
                        snapshot.data!.howToRegisterData!.customerRegisterImage,
                    title: 'How to register as a user'.tr,
                    body: snapshot
                        .data!.howToRegisterData!.customerRegisterDescription!,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  HowRegisterItem(
                    widthBorder: 0.9,
                    icon: Icons.storefront,
                    heightContainer: 200,
                    heightImage: 350,
                    image: snapshot.data!.howToRegisterData!.storeRegisterImage,
                    title: 'How to register as a store'.tr,
                    body: snapshot
                        .data!.howToRegisterData!.storeRegisterDescription!,
                  ),
                ],
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

  Future<HowToRegisterModel?> getHowToRegister() async {
    HttpRepository httpRepository = HttpRepositoryImpl();
    CacheUtils cacheUtils = CacheUtils(GetStorage());

    late Rx<Response?> howToRegisterResponse = Rx<Response?>(null);
    HowToRegisterModel? howToRegisterModel = HowToRegisterModel();

    try {
      howToRegisterResponse.value = await httpRepository.getHowToRegister(
        lang: cacheUtils.getLanguage()!,
      );

      if (howToRegisterResponse.value == null) {
        return null;
      }
      howToRegisterModel =
          HowToRegisterModel.fromJson(howToRegisterResponse.value!.body);

      return howToRegisterModel;
    } catch (e) {
      Get.snackbar(
        'How To register'.tr,
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
