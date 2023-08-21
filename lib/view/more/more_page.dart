import 'package:albausalah_app/view/more/controller/more_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/components/widgets/more_item/more_item.dart';
import '../../shared/components/widgets/size_config/size_config.dart';

class MorePage extends GetWidget<MoreController> {
  const MorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, // <-- SEE HERE
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'More'.tr,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Obx(() {
        return controller.moreItem.isEmpty
            ? Container()
            : ListView.separated(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 40,
                ),
                itemBuilder: (context, index) => MoreItem(
                  leadIcon: controller.moreItem[index].icon,
                  title: controller.moreItem[index].title,
                  onTap: controller.moreItem[index].onTap,
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: controller.moreItem.length,
              );
      }),
    );
  }
}
