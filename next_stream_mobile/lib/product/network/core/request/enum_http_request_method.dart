// ignore_for_file: public_member_api_docs no need for enum fields

enum EnumHttpRequestMethod {
  get,
  post,
  patch,
  put,
  delete,
  head,
  ;

  /// Returns the string value of the enum. Applicable with dio.
  String get value {
    switch (this) {
      case EnumHttpRequestMethod.get:
        return 'GET';
      case EnumHttpRequestMethod.post:
        return 'POST';
      case EnumHttpRequestMethod.patch:
        return 'PATCH';
      case EnumHttpRequestMethod.put:
        return 'PUT';
      case EnumHttpRequestMethod.delete:
        return 'DELETE';
      case EnumHttpRequestMethod.head:
        return 'HEAD';
    }
  }
}
