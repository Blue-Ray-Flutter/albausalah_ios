import 'package:albausalah_app/shared/components/constants/style/color.dart';
import 'package:albausalah_app/shared/components/widgets/button/button.dart';
import 'package:albausalah_app/shared/components/widgets/size_config/size_config.dart';
import 'package:albausalah_app/view/login/controller/login_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:loading_icon_button/loading_icon_button.dart';

import '../../../res/assets_res.dart';
import '../../../shared/components/widgets/button/icon_button.dart';
import '../../../shared/components/widgets/divider/or_divider.dart';
import '../../../shared/components/widgets/text_filed/text_form_filed_widget.dart';
import '../../register/register.dart';
import 'forgot_password.dart';

class LoginPage extends GetWidget<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
      body: Obx(() {
        return controller.flagStatus.value == null
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColor.globalDefaultColor,
                ),
              )
            : Form(
                key: controller.formKey,
                child: Obx(() {
                  return controller.loginSliderModel.value == null
                      ? Center(
                          child: LoadingAnimationWidget.stretchedDots(
                            color: AppColor.globalDefaultColor,
                            size: 40,
                          ),
                        )
                      : ListView(
                          padding: const EdgeInsets.only(
                            top: 50,
                            right: 10,
                            left: 10,
                          ),
                          children: [
                            CarouselSlider(
                              items: controller.loginSliderModel.value!.slider!
                                  .map((e) {
                                return Container(
                                  height: 140,
                                  margin: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: e.image!,
                                    errorWidget: (context, url, error) =>
                                        const Image(
                                            image: AssetImage(
                                                AssetsRes.PLACE_HOLDER)),
                                    placeholder: (context, url) => const Image(
                                        image:
                                            AssetImage(AssetsRes.PLACE_HOLDER)),
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
                              height: 20,
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
                            Text(
                              'Log in or create an account'.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[500],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Text(
                                'Email'.tr,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: DefaultFormField(
                                validator: (email) {
                                  if (email == null || email.isEmpty) {
                                    return 'Email Required'.tr;
                                  }
                                  return null;
                                },
                                controller: controller.emailController,
                                isPassword: false,
                                enabled: true,
                                readOnly: false,
                                radius: 15,
                                autofocus: false,
                                focusBorderColor: AppColor.globalDefaultColor,
                                textColor: AppColor.globalDefaultColor,
                                filled: true,
                                fillColor: Colors.grey[200],
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Text(
                                'Password'.tr,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Obx(
                              () => Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: DefaultFormField(
                                  validator: (pass) {
                                    if (pass == null || pass.isEmpty) {
                                      return 'Password Required'.tr;
                                    }
                                    return null;
                                  },
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      controller.hidePassFun();
                                    },
                                    icon: Icon(
                                      controller.ico.value,
                                      size: 23,
                                    ),
                                    color: AppColor.globalDefaultColor,
                                  ),
                                  controller: controller.passwordController,
                                  minLines: 1,
                                  maxLines: 1,
                                  isPassword: controller.hidePass.value,
                                  enabled: true,
                                  readOnly: false,
                                  radius: 15,
                                  autofocus: false,
                                  focusBorderColor: AppColor.globalDefaultColor,
                                  textColor: AppColor.globalDefaultColor,
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: TextButton(
                                  onPressed: () {
                                    Get.to(() => const ForgotPassword());
                                  },
                                  child: Text(
                                    'Forgot your password ?'.tr,
                                  )),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              child: Center(
                                child: ArgonButton(
                                  height: 50,
                                  roundLoadingShape: true,
                                  width: SizeConfig.screenWidth,
                                  onTap: (startLoading, stopLoading,
                                      btnState) async {
                                    startLoading();
                                    if (controller.formKey.currentState!
                                        .validate()) {
                                      await controller.logIn();
                                      await stopLoading();
                                    } else {
                                      await stopLoading();
                                      Get.snackbar(
                                        'Login'.tr,
                                        'Please Enter required field'.tr,
                                        icon: const Icon(
                                          Icons.warning,
                                          color: Colors.white,
                                        ),
                                        snackPosition: SnackPosition.TOP,
                                        backgroundColor:
                                            AppColor.globalDefaultColor,
                                        borderRadius: 15,
                                        margin: const EdgeInsets.all(15),
                                        colorText: Colors.white,
                                        duration: const Duration(seconds: 2),
                                        isDismissible: true,
                                        dismissDirection:
                                            DismissDirection.horizontal,
                                        forwardAnimationCurve:
                                            Curves.easeInBack,
                                      );
                                    }
                                  },
                                  loader: const Center(
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white,
                                      ),
                                    ),
                                  ),
                                  borderRadius: 15,
                                  color: AppColor.globalDefaultColor,
                                  child: Text(
                                    'Login'.tr,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
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
                                height: 55,
                                radius: 15,
                                onPressed: () {
                                  Get.to(() => const RegisterPage());
                                },
                                text: 'Create account'.tr,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),

                            Obx(
                              () => controller.flagStatus.value!
                                  ? Container()
                                  : const OrDivider(),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            // Obx(() => controller.flagStatus.value!
                            //     ? Container()
                            //     : Padding(
                            //         padding: const EdgeInsets.symmetric(
                            //           horizontal: 10,
                            //         ),
                            //         child: IconButtonWidget(
                            //           iconSize: 20,
                            //           backgroundColor: Colors.blue,
                            //           title: 'Login with facebook'.tr,
                            //           onTap: () {
                            //             controller.facebookLogin();
                            //           },
                            //           radius: 15,
                            //           icon: FontAwesomeIcons.facebookF,
                            //         ),
                            //       )),
                            const SizedBox(
                              height: 15,
                            ),
                            Obx(() => controller.flagStatus.value!
                                ? Container()
                                : Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: IconButtonWidget(
                                      iconSize: 20,
                                      backgroundColor: Colors.red,
                                      title: 'Login with google'.tr,
                                      onTap: () {
                                        controller.googleLogin();
                                      },
                                      radius: 15,
                                      icon: FontAwesomeIcons.google,
                                    ),
                                  )),
                            const SizedBox(
                              height: 40,
                            ),
                          ],
                        );
                }));
      }),
    ));
  }
}
