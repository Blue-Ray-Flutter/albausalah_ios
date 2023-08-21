import 'package:albausalah_app/shared/components/widgets/size_config/size_config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../res/assets_res.dart';
import '../button/button.dart';

class MyProductItem extends StatelessWidget {
  MyProductItem({
    Key? key,
    required this.body,
    required this.name,
    required this.onTap,
    required this.image,
    required this.rate,
    required this.price,
    required this.activeButton,
    required this.onTapUpdate,
  }) : super(key: key);

  String? name;
  String? body;
  String? image;
  double? rate;
  double? price;
  Widget activeButton;

  final void Function()? onTap;
  final void Function()? onTapUpdate;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(
      alignment: Alignment.topRight,
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            width: SizeConfig.screenWidth * 0.45,
            height: SizeConfig.screenHeight * 0.43,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 0.5,
                  blurRadius: 2,
                  offset: const Offset(
                    0,
                    3,
                  ),
                ),
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 0.5,
                  blurRadius: 2,
                  offset: const Offset(
                    3,
                    0,
                  ),
                ),
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 0.5,
                  blurRadius: 2,
                  offset: const Offset(
                    0,
                    -3,
                  ),
                ),
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 0.5,
                  blurRadius: 2,
                  offset: const Offset(
                    -3,
                    0,
                  ),
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
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: image == null
                        ? const Image(
                            fit: BoxFit.cover,
                            width: 200,
                            height: 120,
                            image: AssetImage(
                              AssetsRes.PLACE_HOLDER,
                            ),
                          )
                        : CachedNetworkImage(
                            fit: BoxFit.cover,
                            width: 200,
                            height: 120,
                            imageUrl: image!,
                            errorWidget: (context, url, error) => const Image(
                                width: 200,
                                height: 120,
                                image: AssetImage(
                                  AssetsRes.PLACE_HOLDER,
                                )),
                            placeholder: (context, url) => const Image(
                                width: 200,
                                height: 120,
                                image: AssetImage(
                                  AssetsRes.PLACE_HOLDER,
                                )),
                          ),
                  ),
                  const SizedBox(
                    height: 5,
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
                    height: 5,
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
                    height: 5,
                  ),
                  RatingBar.builder(
                    ignoreGestures: true,
                    glow: false,
                    updateOnDrag: false,
                    itemSize: 15,
                    initialRating: rate ?? 0,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    tapOnlyMode: true,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemPadding: const EdgeInsets.symmetric(
                      horizontal: 1.0,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '$price',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Button(
                    height: 35,
                    radius: 10,
                    onPressed: onTapUpdate!,
                    text: 'Edit',
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  activeButton,
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
