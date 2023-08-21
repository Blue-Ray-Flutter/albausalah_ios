import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../res/assets_res.dart';

class HowRegisterItem extends StatelessWidget {
  HowRegisterItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.body,
    required this.image,
    this.heightImage,
    this.widthImage,
    this.heightContainer,
    this.widthBorder,
  }) : super(key: key);

  IconData icon;
  String title;
  String body;
  String? image;
  double? widthBorder;
  double? widthImage;
  double? heightImage;
  double? heightContainer;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.grey[300]!,
            width: widthBorder ?? 0.4,
          )),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: heightImage,
            width: widthImage,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: image == null
                ? const Image(
                    fit: BoxFit.fill,
                    image: AssetImage(AssetsRes.MASK),
                  )
                : CachedNetworkImage(
                    height: heightImage,
                    width: widthImage,
                    imageUrl: image!,
                    fit: BoxFit.fill,
                    errorWidget: (context, url, error) => const Image(
                      image: AssetImage(AssetsRes.PLACE_HOLDER),
                      fit: BoxFit.fill,
                    ),
                    placeholder: (context, url) => const Image(
                      image: AssetImage(AssetsRes.PLACE_HOLDER),
                      fit: BoxFit.fill,
                    ),
                  ),
          ),
          Container(
            height: heightContainer,
            width: widthImage,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListTile(
                      leading: Icon(
                        icon,
                      ),
                      title: Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      body,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[400],
                      ),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
