import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../res/assets_res.dart';

class CategorieItem extends StatelessWidget {
  CategorieItem({
    Key? key,
    required this.name,
    required this.onTap,
    required this.image,
  }) : super(key: key);

  String name;
  String? image;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: SizedBox(
          width: 80,
          height: 80,
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[100],
                      image: image == null
                          ? const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                AssetsRes.PLACE_HOLDER,
                              ),
                            )
                          : DecorationImage(
                              fit: BoxFit.fill,
                              image: CachedNetworkImageProvider(image!))),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                flex: 2,
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
