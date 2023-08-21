import 'package:albausalah_app/res/assets_res.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CategoryItemList extends StatelessWidget {
  CategoryItemList({
    Key? key,
    required this.text,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  String text;
  String? image;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey[400]!,
          width: 0.2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListTile(
          onTap: onTap,
          title: Text(
            text,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          leading: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: const BorderRadius.all(Radius.circular(100)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Center(
                child: image == null
                    ? const Image(image: AssetImage(AssetsRes.PLACE_HOLDER))
                    : CachedNetworkImage(
                        width: 40,
                        height: 40,
                        imageUrl: image!,
                        errorWidget: (context, url, error) => const Image(
                            image: AssetImage(AssetsRes.PLACE_HOLDER)),
                        placeholder: (context, url) => const Image(
                            image: AssetImage(AssetsRes.PLACE_HOLDER)),
                      ),

                // Image(
                //
                //     image: AssetImage(
                //       ,
                //     )),
              ),
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
