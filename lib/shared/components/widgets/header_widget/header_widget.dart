import 'package:albausalah_app/res/assets_res.dart';
import 'package:albausalah_app/view/home/pages/cart/cart_page.dart';
import 'package:albausalah_app/view/home/pages/favorite/favorite_stores/favorite_stores.dart';
import 'package:albausalah_app/view/home/pages/notification/notification_page.dart';
import 'package:albausalah_app/view/home/pages/search/search.dart';
import 'package:albausalah_app/view/more/more_page.dart';
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../constants/style/color.dart';
import '../size_config/size_config.dart';

class HeaderWidget extends StatefulWidget {
  String? title;
  double sizeIcon;
  var colorContainer;

  double containerSize;
  bool centerTitle;
  bool haveBack;
  bool haveLogo;
  bool haveFav;
  bool haveCart;
  bool haveLocation;
  bool haveSearch;
  bool haveNotification;
  bool haveMore;
  int numItem;
  int numNotification;
  Function()? onPressed;

  HeaderWidget({
    Key? key,
    this.centerTitle = false,
    this.containerSize = 75,
    this.colorContainer,
    this.sizeIcon = 22.0,
    this.haveCart = true,
    this.haveFav = true,
    this.haveLocation = true,
    this.haveSearch = true,
    this.haveNotification = true,
    this.haveMore = true,
    this.haveLogo = true,
    this.haveBack = false,
    this.title,
    this.onPressed,
    this.numItem = 0,
    this.numNotification = 0,
  }) : super(key: key);

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      color: Colors.white.withOpacity(0.4),
      height: widget.containerSize,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 10,
        ),
        child: Center(
          child: AppBar(
            elevation: 0,
            centerTitle: widget.centerTitle,
            actions: [
              widget.haveCart
                  ? InkWell(
                      onTap: () {
                        Get.to(() => const CartPage());
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Stack(
                              alignment: Alignment.topLeft,
                              children: [
                                const Icon(
                                  color: Colors.black,
                                  size: 28,
                                  Icons.shopping_cart_outlined,
                                ),
                                Positioned(
                                  bottom: 12,
                                  left: 13,
                                  child: Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: AppColor.globalDefaultColor,
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${widget.numItem}',
                                        style: const TextStyle(
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    )
                  : Container(),
              widget.haveFav
                  ? Row(
                      children: [
                        InkWell(
                          child: const Icon(
                              color: Colors.black,
                              size: 28,
                              Icons.favorite_border),
                          onTap: () {
                            Get.to(() => const FavoriteStoresPage());
                          },
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    )
                  : Container(),
              widget.haveSearch
                  ? Row(
                      children: [
                        InkWell(
                          child: const Icon(
                              color: Colors.black,
                              size: 28,
                              Icons.search_rounded),
                          onTap: () {
                            Get.to(() => const SearchPage());
                          },
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    )
                  : Container(),
              widget.haveNotification
                  ? InkWell(
                      onTap: () {
                        Get.to(() => const NotificationPage());
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Stack(
                              alignment: Alignment.topLeft,
                              children: [
                                const Icon(
                                    color: Colors.black87,
                                    size: 28,
                                    Icons.notifications_none),
                                Positioned(
                                  bottom: 12,
                                  left: 13,
                                  child: Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: AppColor.globalDefaultColor,
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${widget.numNotification}',
                                        style: const TextStyle(
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    )
                  : Container(),
              widget.haveMore
                  ? InkWell(
                      child: const Icon(
                        color: Colors.black,
                        size: 28,
                        Icons.more_vert,
                      ),
                      onTap: () {
                        Get.to(() => const MorePage());
                      },
                    )
                  : Container(),
            ],
            title: widget.haveLogo
                ? const Image(
                    width: 80,
                    height: 70,
                    image: AssetImage(AssetsRes.ALBAUSALAH_LOGO))
                : Text(
                    widget.title!,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
            leading: widget.haveBack
                ? InkWell(
                    onTap: widget.onPressed,
                    child: Icon(
                      size: 28,
                      Icons.arrow_back,
                      color: AppColor.globalIconColor,
                    ),
                  )
                : null,
            backgroundColor: Colors.white.withOpacity(0.0),
          ),
        ),
      ),
    );
  }
}
