import 'dart:io';

import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  File image;
  Color borderColor;
  void Function() onTap;

  ProductImage({
    Key? key,
    required this.image,
    required this.onTap,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: 80,
      height: 80,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            width: 1,
            color: borderColor,
          ),
          image: DecorationImage(fit: BoxFit.fill, image: FileImage(image))),
      // child: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: FadeInImage(
      //     fit: BoxFit.fill,
      //     imageErrorBuilder: (context, error, stackTrace) =>
      //         const Image(image: AssetImage(AssetsRes.PLACE_HOLDER)),
      //     placeholder: const AssetImage(AssetsRes.PLACE_HOLDER),
      //     image: NetworkImage(imagePath),
      //   ),
      // ),
    );
  }
}
