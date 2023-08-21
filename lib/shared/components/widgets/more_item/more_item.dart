import 'package:flutter/material.dart';

class MoreItem extends StatelessWidget {
  MoreItem({
    Key? key,
    required this.leadIcon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  IconData leadIcon;
  String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.all(
            width: 1.5,
            color: Colors.grey[100]!,
          ),
        ),
        child: ListTile(
          leading: Icon(
            leadIcon,
          ),
          title: Text(
            title,
          ),
          trailing: const Icon(Icons.arrow_forward_ios_outlined),
          onTap: onTap,
        ),
      ),
    );
  }
}
