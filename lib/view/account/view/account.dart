import 'package:albausalah_app/res/assets_res.dart';
import 'package:albausalah_app/view/account/controller/account_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../shared/components/widgets/account_item/account_item.dart';
import '../../../shared/components/widgets/size_config/size_config.dart';
import '../../../shared/helper/cache_utils.dart';

class AccountPage extends GetWidget<AccountController> {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    CacheUtils cacheUtils = CacheUtils(GetStorage());

    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: ListView(
        physics: const ScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          ListTile(
            leading: cacheUtils.getPhoto() == null
                ? const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(AssetsRes.PROFILE),
                  )
                : CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    backgroundImage: CachedNetworkImageProvider(
                      errorListener: () => const Image(
                          image: AssetImage(AssetsRes.PLACE_HOLDER)),
                      cacheUtils.getPhoto()!,
                    ),
                  ),
            title: Text(
              cacheUtils.getName() ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight - 240,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 40,
              ),
              itemBuilder: (context, index) =>
                  cacheUtils.getUserType() == 'Customer'
                      ? AccountItem(
                          leadIcon: controller.accountCustomerItem[index].icon,
                          title: controller.accountCustomerItem[index].title,
                          onTap: controller.accountCustomerItem[index].onTap,
                        )
                      : cacheUtils.getUserType() == 'Store'
                          ? AccountItem(
                              leadIcon: controller.accountStoreItem[index].icon,
                              title: controller.accountStoreItem[index].title,
                              onTap: controller.accountStoreItem[index].onTap,
                            )
                          : Container(),
              separatorBuilder: (context, index) => Column(
                children: [
                  const SizedBox(
                    height: 2,
                  ),
                  Divider(
                    indent: 20,
                    endIndent: 20,
                    height: 1,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                ],
              ),
              itemCount: cacheUtils.getUserType() == 'Customer'
                  ? controller.accountCustomerItem.length
                  : cacheUtils.getUserType() == 'Store'
                      ? controller.accountStoreItem.length
                      : 0,
            ),
          ),
        ],
      ),
    );
  }
}
