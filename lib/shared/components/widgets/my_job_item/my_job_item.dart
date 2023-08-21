import 'package:flutter/material.dart';

import '../button/button.dart';

class MyJobItem extends StatelessWidget {
  MyJobItem({
    Key? key,
    required this.body,
    required this.name,
    required this.activeButton,
    required this.onTapUpdate,
    required this.onTapRemove,
  }) : super(key: key);

  String? name;
  String? body;

  Widget activeButton;

  final void Function()? onTapUpdate;
  final void Function()? onTapRemove;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          width: 250,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[200]!.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  name ?? '',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  body ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Button(
                  height: 40,
                  radius: 10,
                  onPressed: onTapUpdate!,
                  text: 'Edit',
                ),
                const SizedBox(
                  height: 10,
                ),
                Button(
                  height: 40,
                  radius: 10,
                  onPressed: onTapRemove!,
                  text: 'Remove',
                ),
                const SizedBox(
                  height: 10,
                ),
                activeButton,
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
