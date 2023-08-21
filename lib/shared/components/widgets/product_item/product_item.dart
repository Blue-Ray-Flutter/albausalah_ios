import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../res/assets_res.dart';

class ProductItem extends StatelessWidget {
  ProductItem({
    Key? key,
    required this.body,
    required this.name,
    required this.onTap,
    required this.image,
    required this.rate,
    required this.price,
    required this.favWidget,
  }) : super(key: key);

  String? name;
  String? body;
  String? image;
  double? rate;
  double? price;
  Widget favWidget;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            width: 250,
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
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: image == null
                            ? const Image(
                                width: 200,
                                height: 120,
                                image: AssetImage(
                                  AssetsRes.PLACE_HOLDER,
                                ),
                              )
                            : CachedNetworkImage(
                                width: 200,
                                height: 130,
                                imageUrl: image!,
                                errorWidget: (context, url, error) =>
                                    const Image(
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
                        height: 10,
                      ),
                      Text(
                        name ?? '',
                        textAlign: TextAlign.center,
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
                        height: 10,
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
                        height: 10,
                      ),
                      Text(
                        '$price',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: favWidget,
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
