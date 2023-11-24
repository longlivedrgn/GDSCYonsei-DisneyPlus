import 'dart:io';

import 'package:auto_orientation/auto_orientation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final File videoFile;
  const VideoPlayerWidget({super.key, required this.videoFile});

  @override
  VideoPlayerWidgetState createState() => VideoPlayerWidgetState();
}

class VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.file(widget.videoFile)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller.play());
  }

  Future setLandscape() async {
    // hide overlays statusbar
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  Future setAllOrientations() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    await SystemChrome.setPreferredOrientations(DeviceOrientation.values);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(context) => Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white, //change your color here
          ),
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
        ),
        body: Container(
          alignment: Alignment.topCenter,
          child: buildVideo(),
        ),
      );

  Widget buildVideo() => OrientationBuilder(builder: (context, orientation) {
        final isPortrait = orientation == Orientation.portrait;
        return Stack(
          fit: isPortrait ? StackFit.loose : StackFit.expand,
          children: <Widget>[
            buildVideoPlayer(),
            Positioned.fill(
              child: BasicOverlayWidget(
                controller: controller,
                onClickedFullScreen: () {
                  if (isPortrait) {
                    AutoOrientation.landscapeRightMode();
                  } else {
                    AutoOrientation.portraitUpMode();
                  }
                },
              ),
            ),
          ],
        );
      });

  Widget buildVideoPlayer() => buildFullScreen(
        child: AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: VideoPlayer(controller),
        ),
      );

  Widget buildFullScreen({@required child}) {
    if (controller.value.isInitialized) {
      final size = controller.value.size;
      final width = size.width;
      final height = size.height;

      if (width > 0 && height > 0) {
        return FittedBox(
          fit: BoxFit.fill,
          child: SizedBox(width: width, height: height, child: child),
        );
      }
    }
    return Container(); // 또는 빈 컨테이너를 반환하거나 오류 처리를 수행합니다.
  }
}

class BasicOverlayWidget extends StatelessWidget {
  final VideoPlayerController controller;
  final VoidCallback onClickedFullScreen;

  const BasicOverlayWidget({
    super.key,
    required this.controller,
    required this.onClickedFullScreen,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () =>
            controller.value.isPlaying ? controller.pause() : controller.play(),
        child: Stack(
          children: <Widget>[
            buildPlay(),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Row(children: [
                Expanded(child: buildIndicator()),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: onClickedFullScreen,
                  child: const Icon(
                    Icons.fullscreen,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ]),
            ),
          ],
        ),
      );

  Widget buildIndicator() => VideoProgressIndicator(
        controller,
        allowScrubbing: true,
      );

  Widget buildPlay() => controller.value.isPlaying
      ? Container()
      : Container(
          alignment: Alignment.center,
          color: Colors.black26,
          child: const Icon(Icons.play_arrow, color: Colors.white, size: 80),
        );
}
