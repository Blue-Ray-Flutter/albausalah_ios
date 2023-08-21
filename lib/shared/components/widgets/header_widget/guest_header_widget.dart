import 'package:albausalah_app/res/assets_res.dart';
import 'package:albausalah_app/view/more/more_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../view/guest/cart/guest_cart.dart';
import '../../../../view/home/pages/search/search.dart';
import '../../constants/style/color.dart';
import '../size_config/size_config.dart';

class GuestHeaderWidget extends StatefulWidget {
  String? title;
  double sizeIcon;
  var containerColor;

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
  Function()? onPressed;

  GuestHeaderWidget({
    Key? key,
    this.centerTitle = false,
    this.containerSize = 75,
    this.containerColor,
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
  }) : super(key: key);

  @override
  State<GuestHeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<GuestHeaderWidget> {
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
                  ? Row(
                      children: [
                        InkWell(
                          child: const Icon(
                            color: Colors.black,
                            size: 25,
                            Icons.shopping_cart_outlined,
                          ),
                          onTap: () {
                            Get.to(() => const GuestCartPage());
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
                              size: 25,
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
              widget.haveMore
                  ? InkWell(
                      child: const Icon(
                        color: Colors.black,
                        size: 25,
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
                      size: 25,
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
