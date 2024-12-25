// ignore_for_file: public_member_api_docs model class

import 'package:freezed_annotation/freezed_annotation.dart';

part 'model_user.freezed.dart';

/// The model for the user type responses.
@freezed
class ModelUser with _$ModelUser {
  /// Creates instance of [ModelUser]
  const factory ModelUser({
    required int id,
    required String username,
    required String email,
  }) = _ModelUser;
}
