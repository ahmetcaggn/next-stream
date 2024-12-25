// ignore_for_file: public_member_api_docs model class

import 'package:freezed_annotation/freezed_annotation.dart';

part 'model_video.freezed.dart';

/// Model class for video responses
@freezed
class ModelVideo with _$ModelVideo {
  /// Creates instance of [ModelVideo]
  const factory ModelVideo({
    required int id,
    required String title,
    required String description,
    required String filePath,
    required DateTime creationDate,
    required int userId,
  }) = _ModelVideo;
}
