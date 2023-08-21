import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../api/repository/http_repository.dart';
import '../../api/repository/http_repository_impl.dart';
import '../../res/assets_res.dart';
import '../../shared/components/constants/style/color.dart';
import '../../shared/components/widgets/button/button.dart';
import '../base/guest_base_widget.dart';
import '../login/model/login_slider_model.dart';
import '../login/view/login_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: FutureBuilder<LoginSliderModel?>(
        future: getSlider(),
        builder: (context, snapshot) {
          if ((snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData)) {
            return Form(
              // key: controller.formKey,
              child: ListView(
                padding: const EdgeInsets.only(
                  top: 50,
                  right: 10,
                  left: 10,
                ),
                children: [
                  CarouselSlider(
                    items: snapshot.data!.slider!.map((e) {
                      return Container(
                        height: 140,
                        margin: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: e.image!,
                          errorWidget: (context, url, error) => const Image(
                              image: AssetImage(AssetsRes.PLACE_HOLDER)),
                          placeholder: (context, url) => const Image(
                              image: AssetImage(AssetsRes.PLACE_HOLDER)),
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      viewportFraction: 1,
                      aspectRatio: 16 / 2,
                      enlargeCenterPage: true,
                      height: 250,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                   Text(
                    'Welcome'.tr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    child: Button(
                      height: 55,
                      radius: 15,
                      onPressed: () {
                        Get.to(() => const LoginPage());
                      },
                      text: 'Login'.tr,
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
                      borderWidth: 1,
                      textColor: AppColor.globalDefaultColor,
                      borderColor: AppColor.globalDefaultColor,
                      background: Colors.white,
                      height: 55,
                      radius: 15,
                      onPressed: () {
                        Get.offAll(() => const GuestBaseWidget());
                      },
                      text: 'Continue as visitor'.tr,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
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

  Future<LoginSliderModel?> getSlider() async {
    HttpRepository httpRepository = HttpRepositoryImpl();

    late Rx<Response?> sliderResponse = Rx<Response?>(null);
    LoginSliderModel? sliderModel = LoginSliderModel();

    try {
      sliderResponse.value = await httpRepository.getWelcomeSlider();

      if (sliderResponse.value == null) {
        return null;
      }
      sliderModel = LoginSliderModel.fromJson(sliderResponse.value!.body);

      return sliderModel;
    } catch (e) {
      Get.snackbar(
        'Get Slider'.tr,
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
