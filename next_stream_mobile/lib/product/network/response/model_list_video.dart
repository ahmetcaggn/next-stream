// ignore_for_file: public_member_api_docs model class

import 'package:next_stream_mobile/product/network/core/response/i_response_model.dart';
import 'package:next_stream_mobile/product/network/response/model_video.dart';

/// Model class for listing all videos responses
class ModelListVideo implements IResponseModel {
  /// Creates instance of [ModelListVideo] with data.
  const ModelListVideo({
    required this.videos,
  });

  /// Creates instance of sample [ModelListVideo] as empty.
  const ModelListVideo.empty() : videos = const [];

  final List<ModelVideo> videos;

  static const sample = ModelListVideo.empty();

  @override
  IResponseModel fromJson(dynamic json) {
    if (json is! List) {
      throw Exception('Response data is not a List');
    }

    return ModelListVideo(
      videos: json
          .map((e) => ModelVideo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  List<Map<String, dynamic>> toJson() {
    return videos.map((e) => e.toJson()).toList();
  }

  @override
  String toLogString() {
    return 'ModelListVideo{'
        'videos: ${videos.map<String>((e) => e.toLogString()).toList()}'
        '}';
  }
}
