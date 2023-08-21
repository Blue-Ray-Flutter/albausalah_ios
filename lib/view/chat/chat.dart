import 'package:albausalah_app/shared/helper/cache_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../api/repository/http_repository.dart';
import '../../api/repository/http_repository_impl.dart';
import '../../res/assets_res.dart';
import '../../shared/components/constants/style/color.dart';
import 'chat_details/chat_page.dart';
import 'model/my_messages_model.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MyMessagesModel?>(
      future: getMyMessages(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          if (snapshot.data!.messages == null ||
              snapshot.data!.messages!.isEmpty) {
            return Center(
              child: Text(
                'There are no messages'.tr,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.4),
                  fontSize: 20,
                ),
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.only(
              top: 100,
            ),
            child: ListView.separated(
                padding: const EdgeInsets.only(
                  bottom: 40,
                  right: 5,
                  left: 5,
                ),
                itemCount: snapshot.data!.messages!.length,
                scrollDirection: Axis.vertical,
                physics: const ScrollPhysics(),
                separatorBuilder: (context, index) => Divider(
                      indent: 20,
                      endIndent: 20,
                      color: Colors.grey[200],
                    ),
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(
                        snapshot.data!.messages![index].otherSide!.name ?? ''),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) async {
                      await deleteChat(
                        messageId:
                            snapshot.data!.messages![index].id.toString(),
                        receiverId: snapshot.data!.messages![index].receiverId
                            .toString(),
                        senderId:
                            snapshot.data!.messages![index].senderId.toString(),
                      );
                      Future.delayed(const Duration(milliseconds: 500), () {
                        setState(() {});
                      });
                    },
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.only(
                        left: 0,
                        right: 10,
                      ),
                      onTap: () {
                        Get.to(
                          () => const ChatPage(),
                          arguments: [
                            snapshot.data!.messages![index].id,
                            snapshot.data!.messages![index].otherSide!.name,
                            snapshot.data!.messages![index].otherSide!
                                .profilePhotoUrl,
                            snapshot.data!.messages![index].otherSide!.id,
                          ],
                        );
                      },
                      leading: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: snapshot.data!.messages![index].otherSide!
                                    .profilePhotoUrl ==
                                null
                            ? const CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage(
                                  AssetsRes.PROFILE,
                                ),
                              )
                            : CircleAvatar(
                                backgroundColor: Colors.white,
                                onBackgroundImageError: (exception,
                                        stackTrace) =>
                                    const AssetImage(AssetsRes.PLACE_HOLDER),
                                radius: 25,
                                backgroundImage: CachedNetworkImageProvider(
                                  snapshot.data!.messages![index].otherSide!
                                      .profilePhotoUrl!,
                                ),
                              ),
                      ),
                      title: Transform.translate(
                        offset: const Offset(-16, 0),
                        child: Text(
                            snapshot.data!.messages![index].otherSide!.name ??
                                'user'),
                      ),
                      subtitle: Transform.translate(
                        offset: const Offset(-16, 0),
                        child: Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            snapshot.data!.messages![index].messageOperations!
                                    .isEmpty
                                ? ''
                                : snapshot.data!.messages![index]
                                        .messageOperations![0].messageDetails ??
                                    ''),
                      ),
                      trailing: Text(
                        snapshot.data!.messages![index].lastMessageTime ?? '',
                        style: TextStyle(
                          color: Colors.grey.withOpacity(1),
                        ),
                      ),
                    ),
                  );
                }),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: LoadingAnimationWidget.stretchedDots(
              color: AppColor.globalDefaultColor,
              size: 40,
            ),
          );
        }
        return Center(
            child: Text(
          'Something went wrong'.tr,
          style: TextStyle(
            color: Colors.black.withOpacity(0.4),
            fontSize: 23,
          ),
        ));
      },
    );
  }

  Future<MyMessagesModel?> getMyMessages() async {
    HttpRepository httpRepository = HttpRepositoryImpl();
    CacheUtils cacheUtils = CacheUtils(GetStorage());

    late Rx<Response?> myMessagesResponse = Rx<Response?>(null);
    MyMessagesModel? myMessagesModel = MyMessagesModel();

    try {
      myMessagesResponse.value = await httpRepository.getMyMessages(
        lang: cacheUtils.getLanguage() ?? 'en',
      );

      if (myMessagesResponse.value == null) {
        return null;
      }
      myMessagesModel =
          MyMessagesModel.fromJson(myMessagesResponse.value!.body);

      return myMessagesModel;
    } catch (e) {
      Get.snackbar(
        'Get My Messages'.tr,
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
        forwardAnimationCurve: Curves.easeOutBack,
      );
      e.printError();
    }
  }

  deleteChat(
      {required String messageId,
      required String receiverId,
      required String senderId}) async {
    HttpRepository httpRepository = HttpRepositoryImpl();
    try {
      httpRepository.deleteChat(
        lang: 'en',
        messageId: messageId,
        receiverId: receiverId,
        senderId: senderId,
      );
    } catch (e) {
      Get.snackbar(
        'Delete chat'.tr,
        'error',
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
        forwardAnimationCurve: Curves.easeOutBack,
      );
      e.printError();
    }
    return null;
  }
}
