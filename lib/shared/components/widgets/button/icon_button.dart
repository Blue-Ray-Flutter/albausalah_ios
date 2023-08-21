import 'package:albausalah_app/shared/components/constants/style/color.dart';
import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  double radius;
  double iconSize;

  String title;
  Color? iconColor;

  Color? backgroundColor;
  Color? textColor;
  double? textSize;
  IconData icon;
  final Function() onTap;

  IconButtonWidget({
    Key? key,
    required this.onTap,
    required this.radius,
    required this.title,
    this.textColor = Colors.white,
    this.textSize = 16,
    required this.icon,
    this.backgroundColor = AppColor.globalDefaultColor,
    this.iconSize = 20,
    this.iconColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: ListTile(
              title: Text(
                title,
                style: TextStyle(
                  color: textColor,
                  fontSize: textSize,
                ),
              ),
              leading: Icon(
                icon,
                color: iconColor,
                size: iconSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
