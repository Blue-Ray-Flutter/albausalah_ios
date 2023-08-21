import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../res/assets_res.dart';
import '../button/button.dart';

class DeliveryStaffItem extends StatelessWidget {
  DeliveryStaffItem({
    Key? key,
    required this.name,
    required this.onTap,
    required this.image,
    required this.phone,
    required this.email,
    required this.activeButton,
    required this.onTapUpdate,
    this.haveUpdate = true,
  }) : super(key: key);

  String? name;
  String? image;
  String? phone;
  String? email;
  Widget activeButton;
  bool haveUpdate;

  final void Function()? onTap;
  final void Function()? onTapUpdate;

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
                    email ?? '',
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
                  Text(
                    phone ?? '',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  haveUpdate
                      ? Button(
                          height: 40,
                          radius: 10,
                          onPressed: onTapUpdate!,
                          text: 'Edit',
                        )
                      : Container(),
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
        ),
      ],
    );
  }
}
