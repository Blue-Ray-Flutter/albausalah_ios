import 'package:albausalah_app/shared/components/constants/constant_data/constant_data.dart';
import 'package:albausalah_app/shared/components/constants/style/color.dart';
import 'package:albausalah_app/shared/components/widgets/lib/chatview.dart';
import 'package:albausalah_app/view/chat/chat_details/controller/chat_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ChatPage extends GetWidget<ChatDetailsController> {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return controller.currentUser.value == null ||
                controller.chatDetailsModel.value == null ||
                controller.chatController.value == null
            ? Center(
                child: LoadingAnimationWidget.stretchedDots(
                  color: AppColor.globalDefaultColor,
                  size: 40,
                ),
              )
            : ChatView(
                currentUser: controller.currentUser.value!,
                chatController: controller.chatController.value!,
                onSendTap: _onSendTap,
                // todo chat feature
                featureActiveConfig: const FeatureActiveConfig(
                  enableSwipeToSeeTime: true,
                  enableReactionPopup: false,
                  enableSwipeToReply: false,
                  enableDoubleTapToLike: false,
                  enableChatSeparator: true,
                ),
                chatViewState: ChatViewState.hasMessages,
                chatViewStateConfig: ChatViewStateConfiguration(
                  loadingWidgetConfig: const ChatViewStateWidgetConfiguration(
                    loadingIndicatorColor: AppColor.globalDefaultColor,
                  ),
                  onReloadButtonTap: () {},
                ),
                typeIndicatorConfig: TypeIndicatorConfiguration(
                  flashingCircleBrightColor: AppColor.globalDefaultColor,
                  flashingCircleDarkColor: AppColor.globalDefaultColor,
                ),
                appBar: ChatViewAppBar(
                  elevation: 1.0,

                  actions: [
                    IconButton(
                      onPressed: () {
                        controller.chatDetailsModel.value = null;
                        Future.delayed(const Duration(milliseconds: 500), () {
                          controller.onInit();
                        });
                      },
                      icon: const Icon(
                        Icons.refresh,
                        color: Colors.white,
                      ),
                    ),
                  ],

                  backGroundColor: AppColor.globalDefaultColor,
                  // todo profilePicture
                  profilePicture: controller.receiverImage.value == null ||
                          controller.receiverImage.value!.isEmpty
                      ? 'https://st3.depositphotos.com/9998432/13335/v/450/depositphotos_133352010-stock-illustration-default-placeholder-man-and-woman.jpg'
                      : controller.receiverImage.value,
                  backArrowColor: Colors.white,
                  chatTitle: controller.receiverName.value,
                  chatTitleTextStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    letterSpacing: 0.25,
                  ),
                  userStatusTextStyle: const TextStyle(color: Colors.grey),
                ),
                chatBackgroundConfig: ChatBackgroundConfiguration(
                  messageTimeIconColor: Colors.black,
                  messageTimeTextStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  defaultGroupSeparatorConfig:
                      DefaultGroupSeparatorConfiguration(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  ),
                  backgroundColor: Colors.greenAccent[100],
                ),
                sendMessageConfig: SendMessageConfiguration(
                  imagePickerIconsConfig: ImagePickerIconsConfiguration(
                    cameraIconColor: Colors.black,
                    galleryIconColor: Colors.black,
                  ),
                  replyMessageColor: Colors.black,
                  defaultSendButtonColor: AppColor.globalDefaultColor,
                  replyDialogColor: Colors.white,
                  replyTitleColor: Colors.white,
                  textFieldBackgroundColor: Colors.grey[200],
                  closeIconColor: Colors.white,
                  textFieldConfig: TextFieldConfiguration(
                    textStyle: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  micIconColor: Colors.white,
                  voiceRecordingConfiguration:
                      const VoiceRecordingConfiguration(
                    backgroundColor: AppColor.globalDefaultColor,
                    recorderIconColor: Colors.black,
                    waveStyle: WaveStyle(
                      showMiddleLine: false,
                      waveColor: Colors.white,
                      extendWaveform: true,
                    ),
                  ),
                ),
                chatBubbleConfig: ChatBubbleConfiguration(
                  outgoingChatBubbleConfig: ChatBubble(
                    linkPreviewConfig: LinkPreviewConfiguration(
                      backgroundColor: Colors.white,
                      bodyStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                      titleStyle: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    // receiptsWidgetConfig:
                    //     const ReceiptsWidgetConfig(showReceiptsIn: ShowReceiptsIn.all),
                    ///TODO
                    color: AppColor.globalDefaultColor,
                  ),
                  inComingChatBubbleConfig: ChatBubble(
                    linkPreviewConfig: LinkPreviewConfiguration(
                      linkStyle: const TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                      ),
                      backgroundColor: const Color(0xFFEEEEEE),
                      bodyStyle: const TextStyle(color: Colors.grey),
                      titleStyle: const TextStyle(color: Colors.black),
                    ),
                    textStyle: const TextStyle(color: Colors.black),
                    senderNameTextStyle: const TextStyle(color: Colors.black),

                    ///TODO
                    color: AppColor.globalDefaultColor.withBlue(90),
                  ),
                ),
                replyPopupConfig: ReplyPopupConfiguration(
                    backgroundColor: Colors.white,
                    buttonTextStyle: const TextStyle(color: Colors.black),
                    topBorderColor: const Color(0xFFBDBDBD),
                    onUnsendTap: (message) {
                      controller.deleteMessage(
                        operationId: message.id.toString(),
                        senderId: message.sendBy,
                        receiverId: ReceiverData.instance.receiverId.toString(),
                      );
                      controller.chatDetailsModel.value = null;
                      Future.delayed(const Duration(milliseconds: 500), () {
                        controller.onInit();
                      });
                    }),
                reactionPopupConfig: ReactionPopupConfiguration(
                  shadow: BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 27,
                  ),
                  backgroundColor: Colors.white,
                ),
                messageConfig: MessageConfiguration(
                  imageMessageConfig: ImageMessageConfiguration(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                    shareIconConfig: ShareIconConfiguration(
                      defaultIconBackgroundColor: const Color(0xff383152),
                      defaultIconColor: Colors.white,
                    ),
                  ),
                ),
                profileCircleConfig: ProfileCircleConfiguration(
                  profileImageUrl: controller.receiverImage.value,
                  bottomPadding: 10,
                ),
              );
      }),
    );
  }

  void _onSendTap(
    String message,
    ReplyMessage replyMessage,
    MessageType messageType,
  ) {
    final id = int.parse(
        controller.chatDetailsModel.value!.messageDetails!.first.id.toString());
    controller.chatController.value!.addMessage(
      Message(
        id: id.toString(),
        createdAt: DateTime.now(),
        message: message,
        sendBy: controller.currentUser.value!.id,
        replyMessage: replyMessage,
        messageType: messageType,
      ),
    );
  }
}
