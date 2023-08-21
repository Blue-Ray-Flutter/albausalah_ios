import 'package:albausalah_app/shared/components/actions/actions.dart';
import 'package:albausalah_app/shared/helper/helper_utils.dart';
import 'package:albausalah_app/view/home/model/StatusModel.dart';
import 'package:albausalah_app/view/stores/store_page/view/store_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../api/repository/http_repository.dart';
import '../../../../api/repository/http_repository_impl.dart';
import '../../../../res/assets_res.dart';
import '../../../../shared/components/constants/style/color.dart';
import '../../../../shared/components/widgets/story/story/controller/story_controller.dart';
import '../../../../shared/components/widgets/story/story/widgets/story_view.dart';

class StoryPage extends StatefulWidget {
  StoryPage({
    super.key,
    required this.image,
    required this.storeStatuses,
    required this.storeId,
    this.isMyStory = false,
    required this.follow,
    this.haveFollowButton = true,
    required this.onPressedFollow,
    required this.onPressedFollowing,
  });

  List<StoreStatuses>? storeStatuses;
  String? image;
  String? storeId;
  bool isMyStory;
  bool follow;
  bool haveFollowButton;
  final Function() onPressedFollow;
  final Function() onPressedFollowing;

  @override
  StoryPageState createState() => StoryPageState();
}

class StoryPageState extends State<StoryPage> {
  late ValueNotifier<StoryController> storyController =
      ValueNotifier<StoryController>(StoryController());

  // final storyController = StoryController();
  late ValueNotifier<int> id;
  late ValueNotifier<int> index;
  late ValueNotifier<bool> isVisible;
  late ValueNotifier<bool> isEnable = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    id = ValueNotifier<int>(0);
    index = ValueNotifier<int>(-1);
    isVisible = ValueNotifier<bool>(false);
  }

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<List<dynamic>>(
        valueListenable: ValueNotifier<List<dynamic>>(
            [id.value, index.value, isEnable.value]),
        builder: (BuildContext context, value, Widget? child) {
          return Stack(
            alignment: Alignment.topLeft,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      StoryView(
                        inline: true,
                        indicatorColor: AppColor.globalDefaultColor,
                        storyItems:
                            widget.storeStatuses!.mapIndexed((index, e) {
                          id = ValueNotifier<int>(e.id!);
                          this.index = ValueNotifier<int>(index);
                          return e.fileType == "video"
                              ? StoryItem.pageVideo(
                                  id: e.id.toString(),
                                  onVisibilityChanged: (visibilityInfo) {
                                    isVisible.value =
                                        visibilityInfo.visibleFraction > 0;
                                    if (isVisible.value) {
                                      watchStatus(
                                        storeId: widget.storeId.toString(),
                                        statusId: e.id.toString(),
                                      );
                                    }
                                    isVisible.value = false;
                                  },

                                  onPressed: () async {
                                    await launchURL(e.url ?? '');
                                  },
                                  caption: e.post ?? '',
                                  e.file!,
                                  controller: StoryController(),
                                  isLive:
                                      e.liveStatus == 'Inactive' ? false : true,
                                  // duration: Duration(microseconds: 500),
                                )
                              : e.fileType == "photo"
                                  ? StoryItem.pageImage(
                                      id: e.id.toString(),
                                      onVisibilityChanged: (visibilityInfo) {
                                        isVisible.value =
                                            visibilityInfo.visibleFraction > 0;
                                        if (isVisible.value) {
                                          watchStatus(
                                            storeId: widget.storeId.toString(),
                                            statusId: e.id.toString(),
                                          );
                                        }
                                        isVisible.value = false;
                                      },
                                      onPressed: () async {
                                        await launchURL(e.url ?? '');
                                      },
                                      url: e.file!,
                                      caption: e.post ?? '',
                                      controller: storyController.value,
                                      // isLive: false,
                                    )
                                  : e.file == null && e.fileType == null
                                      ? StoryItem.text(
                                          id: e.id.toString(),
                                          onVisibilityChanged:
                                              (visibilityInfo) {
                                            isVisible.value =
                                                visibilityInfo.visibleFraction >
                                                    0;
                                            if (isVisible.value) {
                                              watchStatus(
                                                storeId:
                                                    widget.storeId.toString(),
                                                statusId: e.id.toString(),
                                              );
                                            }
                                            isVisible.value = false;
                                          },
                                          onPressed: () async {
                                            await launchURL(e.url ?? '');
                                          },
                                          textStyle: const TextStyle(
                                            fontSize: 20,
                                          ),
                                          title: e.post!,
                                          isLive: false,
                                          backgroundColor: Colors.black,
                                        )
                                      : StoryItem.pageVideo(
                                          id: e.id.toString(),

                                          onVisibilityChanged:
                                              (visibilityInfo) {
                                            isVisible.value =
                                                visibilityInfo.visibleFraction >
                                                    0;
                                            if (isVisible.value) {
                                              watchStatus(
                                                storeId:
                                                    widget.storeId.toString(),
                                                statusId: e.id.toString(),
                                              );
                                            }
                                            isVisible.value = false;
                                          },
                                          onPressed: () {
                                            launchURL(e.url ?? '');
                                          },
                                          caption: e.post ?? '',
                                          e.file ?? '',
                                          controller: StoryController(),
                                          isLive: false,

                                          // duration: Duration(microseconds: 500),
                                        );
                        }).toList(),
                        onStoryShow: (StoryItem s) {},
                        onComplete: () {
                          // Navigator.pop(context);
                        },
                        progressPosition: ProgressPosition.top,
                        repeat: false,
                        controller: storyController.value,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 60,
                      right: 20,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            size: 30,
                            FontAwesomeIcons.close,
                            color: Colors.white,
                          ),
                        ),
                        widget.isMyStory
                            ? IconButton(
                                onPressed: () {
                                  if (widget.storeStatuses!.length == 1) {
                                    ConstantActions.destroyStatus(
                                        statusId: id.value.toString());
                                    Get.back();
                                    widget.storeStatuses!.removeAt(index.value);
                                    setState(() {});
                                  } else {
                                    ConstantActions.destroyStatus(
                                        statusId: id.value.toString());
                                    widget.storeStatuses!.removeAt(index.value);
                                    setState(() {});
                                  }
                                },
                                icon: const Icon(
                                  size: 30,
                                  Icons.delete_outline_outlined,
                                  color: Colors.white,
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 60,
                      left: 20,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: AppColor.globalDefaultColor,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(100),
                          )),
                      child: Padding(
                          padding: const EdgeInsets.all(2.5),
                          child: widget.image == null
                              ? InkWell(
                                  onTap: () {
                                    Get.to(
                                      () => const StorePage(),
                                      arguments: widget.storeId!.toString(),
                                    );
                                  },
                                  child: const CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.white,
                                    backgroundImage:
                                        AssetImage(AssetsRes.PROFILE),
                                  ),
                                )
                              : InkWell(
                                  onTap: () {
                                    Get.to(() => const StorePage(), arguments: [
                                      widget.storeId!.toString(),
                                      false,
                                    ]);
                                  },
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.white,
                                    backgroundImage: CachedNetworkImageProvider(
                                      errorListener: () => const Image(
                                          image: AssetImage(AssetsRes.PROFILE)),
                                      widget.image!,
                                    ),
                                  ),
                                )),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      widget.storeStatuses![index.value].liveStatus ==
                              'Inactive'
                          ? Container()
                          : Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                              ),
                              child: InkWell(
                                onTap: () async {
                                  storyController.value.pause();

                                  Future.delayed(
                                      const Duration(milliseconds: 1000),
                                      () async {
                                    launchURL(widget
                                            .storeStatuses![index.value].url ??
                                        'https://al-bausalah.com/');
                                    storyController.value.play();
                                  });
                                },
                                child: Container(
                                  width: 100,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey[400]!.withOpacity(0.98),
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Show Live'.tr,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Icon(
                                          Icons.live_tv,
                                          size: 15,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  createNewMessage({
    required String storeId,
    required String message,
  }) async {
    HttpRepository httpRepository = HttpRepositoryImpl();
    try {
      httpRepository.createNewMessage(
        lang: 'en',
        receiverId: storeId,
        message: message,
      );
    } catch (e) {
      Get.snackbar(
        'Create New Message'.tr,
        'Something went wrong'.tr,
        icon: const Icon(
          Icons.warning,
          color: Colors.white,
        ),
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColor.globalDefaultColor,
        borderRadius: 15,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        forwardAnimationCurve: Curves.easeInCirc,
      );
      e.printError();
    }
  }

  watchStatus({
    required String storeId,
    required String statusId,
  }) async {
    HttpRepository httpRepository = HttpRepositoryImpl();
    try {
      httpRepository.watchStatus(
        storeId: storeId,
        statusId: statusId,
      );
    } catch (e) {
      Get.snackbar(
        'Watch Status'.tr,
        'Something went wrong'.tr,
        icon: const Icon(
          Icons.warning,
          color: Colors.white,
        ),
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColor.globalDefaultColor,
        borderRadius: 15,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        forwardAnimationCurve: Curves.easeInCirc,
      );
      e.printError();
    }
  }

  launchURL(url) async {
    HelperUtils.launchExternalUrl(url);
    // if (await canLaunchUrl(url)) {
    //   await launchUrl(url);
    // } else {
    //   throw 'Could not launch $url'.tr;
    // }
  }
}
