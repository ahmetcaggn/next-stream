// ignore_for_file: public_member_api_docs no need to document for endpoints

/// The static data class for organizing API endpoint constants.
abstract final class ApiEndpoints {
  static const String videos = '/api/videos';
  static String video(int id) => '/api/videos/$id';
  static const String createVideo = '/api/videos';
}
