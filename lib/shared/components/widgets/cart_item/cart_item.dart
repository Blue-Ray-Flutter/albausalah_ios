import 'package:albausalah_app/shared/components/widgets/size_config/size_config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../res/assets_res.dart';

class CartItem extends StatelessWidget {
  CartItem({
    Key? key,
    required this.image,
    required this.nameProduct,
    required this.totalPriceItem,
    required this.onPressed,
    required this.counterWidget,
  }) : super(key: key);

  final Function() onPressed;
  String? image;
  String? nameProduct;
  String? totalPriceItem;
  Widget counterWidget;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 150,
                  width: SizeConfig.screenWidth * 0.30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[100],
                    image: image == null
                        ? const DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(AssetsRes.PLACE_HOLDER),
                          )
                        : DecorationImage(
                            fit: BoxFit.fill,
                            image: CachedNetworkImageProvider(image!)),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  children: [
                    Text(
                      nameProduct ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        constraints: const BoxConstraints(
                          maxWidth: 150,
                          minHeight: 50,
                          minWidth: 100,
                          maxHeight: 50,
                        ),
                        child: counterWidget),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Total : ',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: '$totalPriceItem',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                IconButton(
                  onPressed: onPressed,
                  icon: const Icon(
                    size: 30,
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
