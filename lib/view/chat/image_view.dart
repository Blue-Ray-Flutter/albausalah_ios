import 'package:albausalah_app/shared/components/widgets/size_config/size_config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../res/assets_res.dart';

class ImageView extends StatelessWidget {
  String image;

  ImageView({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(),
        body: SizedBox(
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
            child: CachedNetworkImage(
              imageUrl: image,
              placeholder: (context, url) => Image(
                image: const AssetImage(AssetsRes.PLACE_HOLDER),
                errorBuilder: (context, error, stackTrace) => const Image(
                  image: AssetImage(AssetsRes.PLACE_HOLDER),
                ),
              ),
            )));
  }
}
