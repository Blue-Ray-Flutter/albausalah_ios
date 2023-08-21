import 'package:albausalah_app/shared/components/constants/style/color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/assets_res.dart';

class StoryItems extends StatefulWidget {
  StoryItems({
    Key? key,
    required this.onTap,
    required this.image,
    this.isView = false,
    this.isLive = false,
  }) : super(key: key);

  bool isView;
  String? image;
  bool isLive;
  final void Function()? onTap;

  @override
  State<StoryItems> createState() => _StoryItemsState();
}

class _StoryItemsState extends State<StoryItems> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: widget.isLive
          ? Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    border: widget.isView
                        ? Border.all(
                            color: Colors.grey[300]!,
                            width: 2,
                          )
                        : Border.all(
                            color: AppColor.globalDefaultColor,
                            width: 2,
                          ),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(3.5),
                      child: widget.image == null
                          ? const CircleAvatar(
                              radius: 31,
                              backgroundColor: Colors.white,
                              backgroundImage:
                                  AssetImage(AssetsRes.PLACE_HOLDER),
                            )
                          : CircleAvatar(
                              radius: 31,
                              backgroundColor: Colors.white,
                              backgroundImage: CachedNetworkImageProvider(
                                errorListener: () => const Image(
                                    image: AssetImage(AssetsRes.PLACE_HOLDER)),
                                widget.image!,
                              ),
                            )),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: -7,
                  child: Align(
                    child: Container(
                      width: 40,
                      height: 15,
                      decoration: const BoxDecoration(color: Colors.red),
                      child: Center(
                        child: Text(
                          'LIVE'.tr,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                border: widget.isView
                    ? Border.all(
                        color: Colors.grey[300]!,
                        width: 2,
                      )
                    : Border.all(
                        color: AppColor.globalDefaultColor,
                        width: 2,
                      ),
              ),
              child: Padding(
                  padding: const EdgeInsets.all(3.5),
                  child: widget.image == null
                      ? const CircleAvatar(
                          radius: 31,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(AssetsRes.PLACE_HOLDER),
                        )
                      : CircleAvatar(
                          radius: 31,
                          backgroundColor: Colors.white,
                          backgroundImage: CachedNetworkImageProvider(
                            errorListener: () => const Image(
                                image: AssetImage(AssetsRes.PLACE_HOLDER)),
                            widget.image!,
                          ),
                        )),
            ),
    );
  }
}
