import 'dart:io';

import 'package:albausalah_app/res/assets_res.dart';
import 'package:albausalah_app/shared/components/widgets/lib/chatview.dart';
import 'package:albausalah_app/shared/components/widgets/lib/src/widgets/image_message_view.dart';
import 'package:albausalah_app/shared/components/widgets/lib/src/widgets/text_message_view.dart';
import 'package:albausalah_app/shared/components/widgets/lib/src/widgets/video_message_view.dart';
import 'package:albausalah_app/shared/components/widgets/lib/src/widgets/voice_message_view.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../../size_config/size_config.dart';

class MixedMessageView extends StatefulWidget {
  const MixedMessageView({
    Key? key,
    required this.messages,
    required this.message,
    required this.isMessageBySender,
    this.mixedMessageConfig,
    this.messageReactionConfig,
    this.highlightMixed = false,
    this.highlightScale = 1.2,
    this.inComingChatBubbleConfig,
    this.outgoingChatBubbleConfig,
    this.chatBubbleMaxWidth,
    this.highlightColor,
  }) : super(key: key);

  final double? chatBubbleMaxWidth;

  final ChatBubble? inComingChatBubbleConfig;

  /// Provides configuration of chat bubble appearance from current user of chat.
  final ChatBubble? outgoingChatBubbleConfig;

  /// Provides message instance of chat.
  final List<Message> messages;

  final Message message;

  /// Represents current message is sent by current user.
  final bool isMessageBySender;

  /// Provides configuration for image message appearance.
  final ImageMessageConfiguration? mixedMessageConfig;

  /// Provides configuration of reaction appearance in chat bubble.
  final MessageReactionConfiguration? messageReactionConfig;

  /// Represents flag of highlighting image when user taps on replied image.
  final bool highlightMixed;

  /// Provides scale of highlighted image when user taps on replied image.
  final double highlightScale;

  final Color? highlightColor;

  @override
  State<MixedMessageView> createState() => _MixedMessageViewState();
}

class _MixedMessageViewState extends State<MixedMessageView> {
  Future<Widget> generateVideoThumbnail(String videoUrl) async {
    final thumbnailPath = await VideoThumbnail.thumbnailFile(
      video: videoUrl,
      imageFormat: ImageFormat.JPEG,
      maxHeight: 200,
      quality: 75,
    );
    return Image.file(File(thumbnailPath!));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: widget.isMessageBySender
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: widget.isMessageBySender
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            widget.messages.length == 1
                ? widget.messages[0].messageType.isVoice
                    ? VoiceMessageView(
                        screenWidth: MediaQuery.of(context).size.width,
                        message: widget.messages[0],
                        isMessageBySender: widget.isMessageBySender,
                        messageReactionConfig: widget.messageReactionConfig,
                        inComingChatBubbleConfig:
                            widget.inComingChatBubbleConfig,
                        outgoingChatBubbleConfig:
                            widget.outgoingChatBubbleConfig,
                      )
                    : widget.messages[0].messageType.isVideo
                        ? VideoMessageView(
                            message: widget.messages[0],
                            isMessageBySender: widget.isMessageBySender,
                            videoMessageConfig: widget.mixedMessageConfig,
                            messageReactionConfig: widget.messageReactionConfig,
                            highlightVideo: false,
                            highlightScale: widget.highlightScale,
                          )
                        : widget.messages[0].messageType.isImage
                            ? ImageMessageView(
                                message: widget.messages[0],
                                isMessageBySender: widget.isMessageBySender,
                                imageMessageConfig: widget.mixedMessageConfig,
                                messageReactionConfig:
                                    widget.messageReactionConfig,
                                highlightImage: false,
                                highlightScale: widget.highlightScale,
                              )
                            : Container()
                : Transform.scale(
                    scale: widget.highlightMixed ? widget.highlightScale : 1.0,
                    alignment: widget.isMessageBySender
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding:
                          widget.mixedMessageConfig?.padding ?? EdgeInsets.zero,
                      margin: widget.mixedMessageConfig?.margin ??
                          EdgeInsets.only(
                            top: 6,
                            right: widget.isMessageBySender ? 6 : 0,
                            left: widget.isMessageBySender ? 0 : 6,
                            bottom: 0,
                          ),
                      height: widget.messages.isEmpty
                          ? 0
                          : widget.messages.length == 1
                              ? 200
                              : widget.messages.length == 2
                                  ? 100
                                  : widget.messages.length <= 3
                                      ? 50
                                      : widget.messages.length <= 6 &&
                                              widget.messages.length >= 3
                                          ? 100
                                          : widget.messages.length <= 9 &&
                                                  widget.messages.length >= 6
                                              ? 150
                                              : widget.mixedMessageConfig
                                                      ?.height ??
                                                  200,
                      width: widget.messages.isEmpty
                          ? 0
                          : widget.messages.length == 1
                              ? 100
                              : widget.messages.length == 2
                                  ? 200
                                  : widget.mixedMessageConfig?.width ?? 150,
                      child: widget.messages.isEmpty
                          ? Container()
                          : GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: widget.messages.length == 1
                                    ? 1
                                    : widget.messages.length == 2
                                        ? 2
                                        : 3,
                                crossAxisSpacing: 2,
                                mainAxisSpacing: 2,
                              ),
                              itemCount: widget.messages.length >= 11
                                  ? 12
                                  : widget.messages.length,
                              itemBuilder: (context, index) => index >= 11
                                  ? Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Colors.grey.withOpacity(0.3),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '+${widget.messages.length - 11}',
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.black45,
                                          ),
                                        ),
                                      ),
                                    )
                                  : widget.messages[index].messageType.isVideo
                                      ? VideoMessageView(
                                          message: widget.messages[index],
                                          isMessageBySender:
                                              widget.isMessageBySender,
                                          videoMessageConfig:
                                              ImageMessageConfiguration(
                                            height: widget.messages.length == 1
                                                ? 100
                                                : widget.messages.length == 2
                                                    ? 90
                                                    : 46,
                                            width: widget.messages.length == 1
                                                ? 100
                                                : widget.messages.length == 2
                                                    ? 90
                                                    : 46,
                                            margin: const EdgeInsets.all(1),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          messageReactionConfig:
                                              widget.messageReactionConfig,
                                          highlightVideo: false,
                                          highlightScale: widget.highlightScale,
                                        )
                                      : widget.messages[index].messageType
                                              .isImage
                                          ? ImageMessageView(
                                              message: widget.messages[index],
                                              isMessageBySender:
                                                  widget.isMessageBySender,
                                              imageMessageConfig: widget
                                                          .messages.length ==
                                                      1
                                                  ? widget.mixedMessageConfig
                                                  : ImageMessageConfiguration(
                                                      height: widget.messages
                                                                  .length ==
                                                              2
                                                          ? 95
                                                          : 46,
                                                      width: widget.messages
                                                                  .length ==
                                                              2
                                                          ? 95
                                                          : 46,
                                                      margin:
                                                          const EdgeInsets.all(
                                                              1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                              messageReactionConfig:
                                                  widget.messageReactionConfig,
                                              highlightImage: false,
                                              highlightScale:
                                                  widget.highlightScale,
                                            )
                                          : widget.messages[index].messageType
                                                  .isVoice
                                              ? widget.messages[index].isUrl
                                                  ? InkWell(
                                                      onTap: () async {
                                                        await launchUrl(
                                                            Uri.parse(widget
                                                                    .messages[
                                                                        index]
                                                                    .message ??
                                                                'https://al-bausalah.com/'));
                                                      },
                                                      child: Container(
                                                        height: widget.messages
                                                                    .length ==
                                                                2
                                                            ? 90
                                                            : 46,
                                                        width: widget.messages
                                                                    .length ==
                                                                2
                                                            ? 90
                                                            : 46,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          image: const DecorationImage(
                                                              fit: BoxFit.cover,
                                                              opacity: 0.4,
                                                              image: AssetImage(
                                                                  AssetsRes
                                                                      .RECORD)),
                                                        ),
                                                        child: const Center(
                                                          child: Icon(
                                                            Icons.play_arrow,
                                                            size: 20,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  : Container(
                                                      height: widget.messages
                                                                  .length ==
                                                              2
                                                          ? 95
                                                          : 46,
                                                      width: widget.messages
                                                                  .length ==
                                                              2
                                                          ? 95
                                                          : 46,
                                                      decoration: BoxDecoration(
                                                        image: const DecorationImage(
                                                            fit: BoxFit.cover,
                                                            opacity: 0.4,
                                                            image: AssetImage(
                                                                AssetsRes
                                                                    .RECORD)),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: Colors.grey[400],
                                                      ),
                                                      child: const Center(
                                                        child: Icon(
                                                          Icons.play_arrow,
                                                          size: 20,
                                                        ),
                                                      ),
                                                    )
                                              : widget.messages[index]
                                                      .messageType.isText
                                                  ? Container()
                                                  : Container(),
                            ),
                    ),
                  ),
            TextMessageView(
              inComingChatBubbleConfig: widget.inComingChatBubbleConfig,
              outgoingChatBubbleConfig: widget.outgoingChatBubbleConfig,
              isMessageBySender: widget.isMessageBySender,
              message: widget.message,
              chatBubbleMaxWidth: widget.chatBubbleMaxWidth,
              messageReactionConfig: widget.messageReactionConfig,
              highlightColor: widget.highlightColor,
              highlightMessage: false,
            ),
          ],
        ),
      ],
    );
  }
}
