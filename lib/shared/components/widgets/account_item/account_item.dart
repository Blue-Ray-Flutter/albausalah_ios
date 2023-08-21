import 'package:albausalah_app/shared/components/constants/style/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountItem extends StatelessWidget {
  AccountItem({
    Key? key,
    required this.leadIcon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  String leadIcon;
  String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: ListTile(
        leading: ImageIcon(
          AssetImage(
            leadIcon,
          ),
          size: 25,
          color: AppColor.globalDefaultColor,
        ),
        title: Text(
          title.tr,
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_outlined,
        ),
        onTap: onTap,
      ),
    );
  }
}
