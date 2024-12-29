/// The event to upload video.
class EventUploadVideo {
  /// Creates instance of [EventUploadVideo]
  const EventUploadVideo({
    required this.title,
    required this.description,
    required this.filePath,
  });

  /// The title of the video.
  final String title;

  /// The description of the video.
  final String description;

  /// The local file path of the video.
  final String filePath;
}
