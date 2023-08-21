import 'dart:convert';
import 'dart:io';

import 'package:albausalah_app/shared/components/widgets/lib/chatview.dart';
import 'package:albausalah_app/shared/components/widgets/lib/src/extensions/extensions.dart';
import 'package:albausalah_app/shared/components/widgets/lib/src/widgets/share_icon.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

class VideoMessageView extends StatefulWidget {
  const VideoMessageView({
    Key? key,
    required this.message,
    required this.isMessageBySender,
    this.videoMessageConfig,
    this.messageReactionConfig,
    this.highlightVideo = false,
    this.highlightScale = 1.2,
  }) : super(key: key);

  /// Provides message instance of chat.
  final Message message;

  /// Represents current message is sent by current user.
  final bool isMessageBySender;

  /// Provides configuration for video message appearance.
  final ImageMessageConfiguration? videoMessageConfig;

  /// Provides configuration of reaction appearance in chat bubble.
  final MessageReactionConfiguration? messageReactionConfig;

  /// Represents flag of highlighting video when user taps on replied image.
  final bool highlightVideo;

  /// Provides scale of highlighted video when user taps on replied image.
  final double highlightScale;

  @override
  State<VideoMessageView> createState() => _VideoMessageViewState();
}

class _VideoMessageViewState extends State<VideoMessageView> {
  String get videoUrl => widget.message.message!;

  Widget get iconButton => ShareIcon(
        shareIconConfig: widget.videoMessageConfig?.shareIconConfig,
        imageUrl: videoUrl,
      );

  Future<ClosedCaptionFile> _loadCaptions() async {
    final String fileContents = await DefaultAssetBundle.of(context)
        .loadString('assets/bumble_bee_captions.vtt');
    return WebVTTCaptionFile(
        fileContents); // For vtt files, use WebVTTCaptionFile
  }

  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(videoUrl)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: widget.isMessageBySender
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: [
        // if (isMessageBySender) iconButton,
        Stack(
          children: [
            GestureDetector(
              onTap: () => widget.videoMessageConfig?.onTap != null
                  ? widget.videoMessageConfig?.onTap!(videoUrl)
                  : null,
              child: Transform.scale(
                scale: widget.highlightVideo ? widget.highlightScale : 1.0,
                alignment: widget.isMessageBySender
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                  padding:
                      widget.videoMessageConfig?.padding ?? EdgeInsets.zero,
                  margin: widget.videoMessageConfig?.margin ??
                      EdgeInsets.only(
                        top: 6,
                        right: widget.isMessageBySender ? 6 : 0,
                        left: widget.isMessageBySender ? 0 : 6,
                        bottom: widget.message.reaction.reactions.isNotEmpty
                            ? 15
                            : 0,
                      ),
                  height: widget.videoMessageConfig?.height ?? 200,
                  width: widget.videoMessageConfig?.width ?? 150,
                  child: ClipRRect(
                    borderRadius: widget.videoMessageConfig?.borderRadius ??
                        BorderRadius.circular(14),
                    child: (() {
                      if (videoUrl.isUrl) {
                        return AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: InkWell(
                            onTap: () async {
                              await launchUrl(Uri.parse(
                                  videoUrl ?? 'https://al-bausalah.com/'));
                            },
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Center(
                                  child: _controller.value.isInitialized
                                      ? VideoPlayer(_controller)
                                      : Container(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _controller.value.isPlaying
                                            ? _controller.pause()
                                            : _controller.play();
                                      });
                                    },
                                    child: Icon(
                                      _controller.value.isPlaying
                                          ? Icons.pause
                                          : Icons.play_arrow,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                        // return AspectRatio(
                        //   aspectRatio: _controller.value.aspectRatio,
                        //   child: Stack(
                        //     alignment: Alignment.bottomCenter,
                        //     children: <Widget>[
                        //       VideoPlayer(
                        //         _controller,
                        //       ),
                        //       ClosedCaption(
                        //           text: _controller.value.caption.text),
                        //       _ControlsOverlay(controller: _controller),
                        //     ],
                        //   ),
                        // );
                      } else if (videoUrl.fromMemory) {
                        return Image.memory(
                          base64Decode(videoUrl
                              .substring(videoUrl.indexOf('base64') + 7)),
                          fit: BoxFit.fill,
                        );
                      } else {
                        return Image.file(
                          File(videoUrl),
                          fit: BoxFit.fill,
                        );
                      }
                    }()),
                  ),
                ),
              ),
            ),
            // if (message.reaction.reactions.isNotEmpty)
            //   ReactionWidget(
            //     isMessageBySender: isMessageBySender,
            //     reaction: message.reaction,
            //     messageReactionConfig: messageReactionConfig,
            //   ),
          ],
        ),
      ],
    );
  }
}

class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({required this.controller});

  static const List<Duration> _exampleCaptionOffsets = <Duration>[
    Duration(seconds: -10),
    Duration(seconds: -3),
    Duration(seconds: -1, milliseconds: -500),
    Duration(milliseconds: -250),
    Duration.zero,
    Duration(milliseconds: 250),
    Duration(seconds: 1, milliseconds: 500),
    Duration(seconds: 3),
    Duration(seconds: 10),
  ];
  static const List<double> _examplePlaybackRates = <double>[
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
    10.0,
  ];

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? const SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: const Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 30.0,
                      semanticLabel: 'Play',
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
        Align(
          alignment: Alignment.topLeft,
          child: PopupMenuButton<Duration>(
            initialValue: controller.value.captionOffset,
            tooltip: 'Caption Offset',
            onSelected: (Duration delay) {
              controller.setCaptionOffset(delay);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<Duration>>[
                for (final Duration offsetDuration in _exampleCaptionOffsets)
                  PopupMenuItem<Duration>(
                    value: offsetDuration,
                    child: Text('${offsetDuration.inMilliseconds}ms'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${controller.value.captionOffset.inMilliseconds}ms'),
            ),
          ),
        ),
      ],
    );
  }
}
