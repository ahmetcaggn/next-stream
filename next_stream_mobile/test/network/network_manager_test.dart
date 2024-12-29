import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:next_stream_mobile/product/network/core/network_manager.dart';
import 'package:next_stream_mobile/product/network/core/request/http_request_method.dart';
import 'package:next_stream_mobile/product/network/core/response/app_response_result.dart';
import 'package:next_stream_mobile/product/network/request/request_get_video.dart';

void main() async {
  final networkManager = NetworkManager();

  late HttpServer server;
  try {
    server = await HttpServer.bind('localhost', 0)
      ..listen((HttpRequest request) async {
        final body = await request.fold<List<int>>(
            [], (previous, element) => previous..addAll(element));
        final bodyString = String.fromCharCodes(body);

        // ignore: avoid_print test
        print('request: ${request.method} ${request.uri.path}');
        // ignore: avoid_print test
        print('body: $bodyString');

        if (request.method == HttpRequestMethod.get.value) {
          if (request.uri.path == '/api/videos') {
            request.response
              ..statusCode = HttpStatus.ok
              ..write('''
                [
                  {
                    "id": 1,
                    "title": "video",
                    "description": "video description",
                    "fileName": "1d8b0fda-3229-4ae7-a2d1-cec47a7765b4.png",
                    "createdAt": "2024-12-26T05:04:08.817+00:00",
                    "playlists": null,
                    "userId": -1
                  },
                  {
                    "id": 2,
                    "title": null,
                    "description": null,
                    "fileName": "1d8b0fda-3229-4ae7-a2d1-cec47a7765b4.png",
                    "createdAt": "2024-12-26T05:04:08.817+00:00",
                    "playlists": null,
                    "userId": -1
                  }
                ]
                ''');
          } else if (request.uri.path == '/api/videos/1') {
            request.response
              ..statusCode = HttpStatus.ok
              ..write('''
                  {
                    "id": 1,
                    "title": "video",
                    "description": "video description",
                    "fileName": "1d8b0fda-3229-4ae7-a2d1-cec47a7765b4.png",
                    "createdAt": "2024-12-26T05:04:08.817+00:00",
                    "playlists": null,
                    "userId": -1
                  }
                ''');
          } else if (request.uri.path == '/api/videos/2') {
            request.response
              ..statusCode = HttpStatus.ok
              ..write('''
                  {
                    "id": 2,
                    "title": null,
                    "description": null,
                    "fileName": "1d8b0fda-3229-4ae7-a2d1-cec47a7765b4.png",
                    "createdAt": "2024-12-26T05:04:08.817+00:00",
                    "playlists": null,
                    "userId": -1
                  }
                ''');
          } else {
            request.response
              ..statusCode = HttpStatus.notFound
              ..write('Not Found');
          }
        } else if (request.method == HttpRequestMethod.post.value) {
          if (request.uri.path == '/api/videos') {
            request.response
              ..statusCode = HttpStatus.ok
              ..write('''
                {
                  "id": 1,
                  "title": "video",
                  "description": "video description",
                  "fileName": "1d8b0fda-3229-4ae7-a2d1-cec47a7765b4.png",
                  "createdAt": "2024-12-26T05:04:08.817+00:00",
                  "playlists": null,
                  "userId": -1
                }
                ''');
          } else {
            request.response
              ..statusCode = HttpStatus.notFound
              ..write('Not Found');
          }
        } else {
          request.response
            ..statusCode = HttpStatus.methodNotAllowed
            ..write('Method Not Allowed');
        }

        await request.response.close();
      });
  } on Exception catch (_) {
    fail('test server failed to start');
  }

  await networkManager.init(baseUrl: 'http://localhost:${server.port}');

  group('NetworkManager Internal API', () {
    test('request success', () async {
      final result = await networkManager.request(
        const RequestGetVideo(videoId: 1),
      );

      expect(result.isSuccess, isTrue);
      final data = result.asSuccess.data;

      expect(data.id, 1);
      expect(data.title, 'video');
      expect(data.description, 'video description');
      expect(data.fileName, '1d8b0fda-3229-4ae7-a2d1-cec47a7765b4.png');
      expect(data.createdAt, DateTime.parse('2024-12-26T05:04:08.817+00:00'));
      expect(data.userId, -1);
    });

    test('request success with null title and description', () async {
      final result = await networkManager.request(
        const RequestGetVideo(videoId: 2),
      );

      expect(result, isA<AppResponseResultSuccess>());
      if (result is AppResponseResultError) {
        fail('should be success');
      }
      final data = result.asSuccess.data;

      expect(data.id, 2);
      expect(data.title, null);
      expect(data.description, null);
      expect(data.fileName, '1d8b0fda-3229-4ae7-a2d1-cec47a7765b4.png');
      expect(data.createdAt, DateTime.parse('2024-12-26T05:04:08.817+00:00'));
      expect(data.userId, -1);
    });

    test('request with not found', () async {
      final result = await networkManager.request(
        const RequestGetVideo(videoId: 3),
      );

      if (result.isSuccess) {
        fail('the response should be error');
      } else {
        final response = result.asError;
        expect(response.statusCode, HttpStatus.notFound);
      }
    });
  });
}
