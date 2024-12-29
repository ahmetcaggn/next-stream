// ignore_for_file: public_member_api_docs model class

import 'package:next_stream_mobile/product/network/core/response/i_response_model.dart';

/// Model class for video responses
class ModelVideo implements IResponseModel {
  /// Creates instance of [ModelVideo]
  const ModelVideo({
    required this.id,
    required this.title,
    required this.description,
    required this.fileName,
    required this.createdAt,
    required this.userId,
  });

  /// Creates instance of [ModelVideo] as empty.
  ModelVideo.empty()
      : id = 0,
        title = null,
        description = null,
        fileName = '',
        createdAt = DateTime.fromMicrosecondsSinceEpoch(0),
        userId = 0;

  factory ModelVideo.fromJson(Map<String, dynamic> json) {
    return ModelVideo(
      id: json['id'] as int,
      title: json['title'] as String?,
      description: json['description'] as String?,
      fileName: json['fileName'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      userId: json['userId'] as int,
    );
  }

  static List<ModelVideo> fromJsonList(dynamic json) {
    if (json is List) {
      return json
          .map((e) => ModelVideo.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  final int id;
  final String? title;
  final String? description;
  final String fileName;
  final DateTime createdAt;
  final int userId;

  static final sample = ModelVideo.empty();

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'filePath': fileName,
      'createAt': createdAt.toIso8601String(),
      'userId': userId,
    };
  }

  @override
  IResponseModel fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      throw Exception('Response data is not a Map<String, dynamic>');
    }

    return ModelVideo.fromJson(json);
  }

  @override
  String toLogString() {
    return 'ModelVideo{'
        'id: $id, '
        'title: $title, '
        'description: $description, '
        'fileName: $fileName, '
        'createdAt: $createdAt, '
        'userId: $userId'
        '}';
  }
}
