import 'package:albausalah_app/res/assets_res.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ItemPic extends StatelessWidget {
  String? imagePath;
  Color borderColor;
  void Function() onTap;

  ItemPic({
    Key? key,
    required this.imagePath,
    required this.onTap,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
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
            image: imagePath == null
                ? const DecorationImage(
                    fit: BoxFit.fill, image: AssetImage(AssetsRes.PLACE_HOLDER))
                : DecorationImage(
                    fit: BoxFit.fill,
                    image: CachedNetworkImageProvider(imagePath!))),
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
      ),
    );
  }
}
