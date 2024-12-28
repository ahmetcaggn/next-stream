import 'package:flutter/material.dart';
import 'package:next_stream_mobile/product/network/response/model_video.dart';

/// The type of callback function when a video is pressed.
typedef OnVideoPressed = void Function(ModelVideo video);

/// The list of videos will be shown in the home screen.
class HomeVideoList extends StatelessWidget {
  /// Creates the [HomeVideoList] instance.
  const HomeVideoList({
    required this.videos,
    required this.onVideoPressed,
    super.key,
  });

  /// The list of videos will be presented in the list.
  final List<ModelVideo> videos;

  /// The callback function when a video is pressed.
  final OnVideoPressed onVideoPressed;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom + 16,
        top: 16,
      ),
      itemCount: videos.length,
      itemBuilder: (_, index) {
        final video = videos[index];
        return ListTile(
          title: Text(
            video.title ?? 'No Title',
            style: TextStyle(
              color:
                  video.title == null ? Theme.of(context).disabledColor : null,
            ),
          ),
          subtitle: Text(
            video.description ?? 'No Description',
            style: TextStyle(
              color: video.description == null
                  ? Theme.of(context).disabledColor
                  : null,
            ),
          ),
          tileColor: Theme.of(context).primaryColorLight,
          onTap: () => onVideoPressed(video),
        );
      },
      separatorBuilder: (_, __) {
        return const SizedBox(height: 8);
      },
    );
  }
}
