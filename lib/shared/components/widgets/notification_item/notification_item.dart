import 'package:albausalah_app/shared/components/constants/style/color.dart';
import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  NotificationItem({
    Key? key,
    required this.title,
    required this.body,
    required this.onTap,
  }) : super(key: key);

  Widget? title;
  Widget? body;
  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: const Icon(
        Icons.notifications_rounded,
        color: AppColor.globalDefaultColor,
      ),
      title: title ?? const Text(''),
      subtitle: body ?? const Text(''),
    );
  }
}
