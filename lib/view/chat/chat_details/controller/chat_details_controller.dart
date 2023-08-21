import 'dart:io';

import 'package:albausalah_app/shared/components/widgets/lib/chatview.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../api/repository/http_repository.dart';
import '../../../../shared/components/constants/constant_data/constant_data.dart';
import '../../../../shared/components/constants/style/color.dart';
import '../../../../shared/helper/cache_utils.dart';
import '../model/chat_details_model.dart';

class ChatDetailsController extends GetxController {
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;
  ChatDetailsController(
      {required this.httpRepository, required this.cacheUtils});

  Rx<ChatDetailsModel?> chatDetailsModel = Rx<ChatDetailsModel?>(null);

  final formKey = GlobalKey<FormState>();

  RxString chatId = RxString('');
  RxString receiverName = RxString('');
  Rx<String?> receiverImage = Rx(null);
  RxInt otherSideId = RxInt(-1);
  Rx<File>? file = Rx(File(''));

  var focusNode = FocusNode().obs;

  final messageController = TextEditingController().obs;

  RxBool showEmojiKeyboard = false.obs;
  RxBool haveMassage = false.obs;

  Rx<ChatUser?> currentUser = Rx(null);

  Rx<ChatController?> chatController = Rx<ChatController?>(null);

  getChatDetails() async {
    late Rx<Response?> chatDetailsResponse = Rx<Response?>(null);

    try {
      chatDetailsResponse.value = await httpRepository.getMessageDetails(
        lang: cacheUtils.getLanguage()!,
        messageId: chatId.value,
      );

      if (chatDetailsResponse.value == null) {
        return null;
      }
      chatDetailsModel.value =
          ChatDetailsModel.fromJson(chatDetailsResponse.value!.body);
      chatDetailsModel.refresh();

      chatController.value = ChatController(
        initialMessageList: chatDetailsModel.value!.messageDetails!
            .map(
              (e) => e.productImage != null && e.otherMediaMessage!.isEmpty
                  ? Message(
                      id: e.id.toString(),
                      message: e.messageDetails,
                      createdAt: DateTime.parse(e.createdAt!),
                      sendBy: e.senderId.toString(),
                      messageType: MessageType.suggest,
                      me: e.senderId == myInformationModel!.userData!.id
                          ? true
                          : false,
                      isUrl: true,
                      photoMessage: Message(
                        id: e.id.toString(),
                        message: e.productImage,
                        me: e.senderId == myInformationModel!.userData!.id
                            ? true
                            : false,
                        isUrl: true,
                        createdAt: DateTime.parse(e.createdAt!),
                        sendBy: e.senderId.toString(),
                      ),
                    )
                  : Message(
                      id: e.id.toString(),
                      message: e.messageDetails,
                      createdAt: DateTime.parse(e.createdAt!),
                      sendBy: e.senderId.toString(),
                      messageType: MessageType.mixed,
                      isUrl: false,
                      me: e.senderId == myInformationModel!.userData!.id
                          ? true
                          : false,
                      messages: e.otherMediaMessage != null ||
                              e.otherMediaMessage!.isNotEmpty
                          ? e.otherMediaMessage!
                              .map(
                                (i) => Message(
                                  id: i.id.toString(),
                                  message: i.messageFile ?? '',
                                  createdAt: DateTime.parse(i.createdAt!),
                                  sendBy: e.senderId.toString(),
                                  me: e.senderId ==
                                          myInformationModel!.userData!.id
                                      ? true
                                      : false,
                                  isUrl: true,
                                  messageType: i.fileType == 'Video'
                                      ? MessageType.video
                                      : i.fileType == 'Audio'
                                          ? MessageType.voice
                                          : i.fileType == 'Image'
                                              ? MessageType.image
                                              : MessageType.custom,
                                ),
                              )
                              .toList()
                          : [],
                    ),
            )
            .toList(),
        scrollController: ScrollController(),
        // todo another side
        chatUsers: [
          ChatUser(
            id: otherSideId.value.toString(),
            name: receiverName.value,
            profilePhoto: receiverImage.value,
          )
        ],
      );
    } catch (e) {
      Get.snackbar(
        'Get Chat Details'.tr,
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

  createNewMessage(
      {required String receiverId,
      required String message,
      required List<File> files}) async {
    try {
      httpRepository.createNewMessage(
        lang: cacheUtils.getLanguage()!,
        receiverId: otherSideId.value.toString(),
        message: messageController.value.text,
        files: files,
      );

      messageController.value.text = '';
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

  Future<void> getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      file = File(pickedFile.path).obs;
      messageController.value.text = file!.value.path;
    } else {}
  }

  Future<void> getImageGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      file = File(pickedFile.path).obs;
      messageController.value.text = file!.value.path;
    } else {}
  }

  deleteMessage({
    required String operationId,
    required String senderId,
    required String receiverId,
  }) async {
    try {
      httpRepository.deleteMessage(
        lang: 'en',
        receiverId: receiverId,
        operationId: operationId,
        senderId: senderId,
      );
    } catch (e) {
      Get.snackbar(
        'Delete Message'.tr,
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
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url'.tr;
    }
  }

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null || result!.paths.isEmpty) {
      file!.value = File(result.files.single.path!);
      messageController.value.text = file!.value.path;
    } else {
      // User canceled the picker
    }
  }

  @override
  Future<void> onInit() async {
    chatId.value = Get.arguments[0].toString();
    receiverName.value = Get.arguments[1].toString();
    receiverImage.value = Get.arguments[2];
    otherSideId.value = Get.arguments[3];

    ReceiverData.instance.receiverId = Get.arguments[3].toString();

    currentUser.value = ChatUser(
      id: myInformationModel!.userData!.id.toString(),
      name: myInformationModel!.userData!.name ?? '',
      profilePhoto: myInformationModel!.userData!.profilePhotoUrl,
    );

    await getChatDetails();

    super.onInit();
  }
}
