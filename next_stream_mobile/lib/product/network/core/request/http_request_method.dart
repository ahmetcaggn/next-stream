// ignore_for_file: public_member_api_docs no need for enum fields

enum HttpRequestMethod {
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
      case HttpRequestMethod.get:
        return 'GET';
      case HttpRequestMethod.post:
        return 'POST';
      case HttpRequestMethod.patch:
        return 'PATCH';
      case HttpRequestMethod.put:
        return 'PUT';
      case HttpRequestMethod.delete:
        return 'DELETE';
      case HttpRequestMethod.head:
        return 'HEAD';
    }
  }
}
