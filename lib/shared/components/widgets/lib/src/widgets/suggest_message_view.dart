import 'dart:io';

import 'package:albausalah_app/shared/components/widgets/lib/chatview.dart';
import 'package:albausalah_app/shared/components/widgets/lib/src/widgets/image_message_view.dart';
import 'package:albausalah_app/shared/components/widgets/lib/src/widgets/text_message_view.dart';
import 'package:flutter/material.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../../size_config/size_config.dart';

class SuggestMessageView extends StatefulWidget {
  const SuggestMessageView({
    Key? key,
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
  State<SuggestMessageView> createState() => _MixedMessageViewState();
}

class _MixedMessageViewState extends State<SuggestMessageView> {
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
            ImageMessageView(
              message: widget.message.photoMessage!,
              isMessageBySender: widget.isMessageBySender,
              imageMessageConfig: widget.mixedMessageConfig,
              messageReactionConfig: widget.messageReactionConfig,
              highlightImage: false,
              highlightScale: widget.highlightScale,
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
