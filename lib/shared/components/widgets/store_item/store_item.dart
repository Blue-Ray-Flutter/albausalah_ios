import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../res/assets_res.dart';
import '../../constants/style/color.dart';

class StoreItem extends StatelessWidget {
  StoreItem({
    Key? key,
    required this.nameShop,
    required this.location,
    required this.image,
    required this.rate,
    required this.onTap,
    this.heightImage,
    this.widthImage,
    this.heightContainer,
    this.widthBorder,
    this.isFav,
    this.valueChanged,
    required this.widget,
    required this.followWidget,
    this.haveWidget = true,
    this.isAuthenticated = false,
  }) : super(key: key);

  String? nameShop;
  String? image;
  String? location;
  double rate;
  double? widthBorder;
  double? widthImage;
  double? heightImage;
  double? heightContainer;
  bool? isFav;
  final Function? valueChanged;
  final void Function()? onTap;
  bool? haveWidget;
  bool isAuthenticated;
  Widget widget;
  Widget followWidget;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
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
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  height: heightImage,
                  width: widthImage,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    image: image == null
                        ? const DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(AssetsRes.MASK),
                          )
                        : DecorationImage(
                            fit: BoxFit.fill,
                            image: CachedNetworkImageProvider(
                              image!,
                              errorListener: () => const Image(
                                image: AssetImage(AssetsRes.MASK),
                              ),
                            ),
                          ),
                  ),
                ),
                haveWidget! ? widget : Container()
              ],
            ),
            Container(
              height: heightContainer,
              width: widthImage,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  isAuthenticated
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(nameShop ?? ''),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: AppColor.globalDefaultColor,
                                ),
                                child: const Center(
                                    child: Icon(
                                  Icons.done,
                                  size: 15,
                                  color: Colors.white,
                                )),
                              ),
                            ],
                          ),
                        )
                      : Text(nameShop ?? ''),
                  const SizedBox(
                    height: 10,
                  ),
                  RatingBar.builder(
                    ignoreGestures: true,
                    glow: false,
                    updateOnDrag: false,
                    itemSize: 15,
                    initialRating: rate,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    tapOnlyMode: true,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemPadding: const EdgeInsets.symmetric(
                      horizontal: 2.0,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        location ?? '',
                        style: const TextStyle(fontSize: 13),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        color: AppColor.globalDefaultColor,
                        size: 20,
                        Icons.pin_drop,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  followWidget,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
