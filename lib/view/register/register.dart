import 'package:albausalah_app/shared/components/constants/style/color.dart';
import 'package:albausalah_app/view/register/users/customer/customer_signup.dart';
import 'package:albausalah_app/view/register/users/store/store_signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/components/widgets/size_config/size_config.dart';
import 'controller/register_controller.dart';

class RegisterPage extends GetWidget<RegisterController> {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Register now'.tr,
                  style: const TextStyle(
                    color: AppColor.globalDefaultColor,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Create a new account within a minute'.tr,
                  style: const TextStyle(
                    color: AppColor.globalDefaultColor,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Container(
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TabBar(
                        onTap: (value) {
                          // controller.index.value = value;
                        },
                        indicatorColor: Colors.white,
                        indicator: const BoxDecoration(
                            color: AppColor.globalDefaultColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            )),
                        labelColor: Colors.white,
                        unselectedLabelColor: AppColor.globalDefaultColor,
                        overlayColor: MaterialStateProperty.all(
                          AppColor.globalDefaultColor,
                        ),
                        tabs: [
                          Tab(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 0.8,
                                  color: AppColor.globalDefaultColor,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Customer'.tr,
                                  style: const TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Tab(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 0.8,
                                  color: AppColor.globalDefaultColor,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Store'.tr,
                                  style: const TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 40,
                  ),
                  child: SizedBox(
                    height: (SizeConfig.screenHeight * 0.7),
                    child: const TabBarView(
                      physics: ScrollPhysics(),
                      children: [
                        Customer(),
                        StoreSignUp(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
