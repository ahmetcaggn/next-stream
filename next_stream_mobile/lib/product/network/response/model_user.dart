// ignore_for_file: public_member_api_docs model class

import 'package:next_stream_mobile/product/network/core/response/i_response_model.dart';

/// The model for the user type responses.
class ModelUser implements IResponseModel {
  /// Creates instance of [ModelUser]
  const ModelUser({
    required this.id,
    required this.username,
    required this.email,
  });

  /// Creates instance of [ModelUser] as empty.
  const ModelUser.empty()
      : id = 0,
        username = '',
        email = '';

  factory ModelUser.fromJson(Map<String, dynamic> json) {
    return ModelUser(
      id: json['id'] as int,
      username: json['username'] as String,
      email: json['email'] as String,
    );
  }

  final int id;
  final String username;
  final String email;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
    };
  }

  @override
  IResponseModel fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      throw Exception('Response data is not a Map<String, dynamic>');
    }

    return ModelUser.fromJson(json);
  }

  @override
  String toLogString() {
    return 'ModelUser{'
        'id: $id, '
        'username: $username, '
        'email: $email'
        '}';
  }
}
