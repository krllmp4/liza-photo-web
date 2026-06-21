import 'package:dio/dio.dart';

final class GalleryService {
  const GalleryService({
    required Dio dio,
    required this.manifestUrl,
  }) : _dio = dio;

  final Dio _dio;
  final String manifestUrl;

  Future<List<Map<String, Object?>>> fetchManifest() async {
    final response = await _dio.get<Map<String, Object?>>(
      manifestUrl,
      queryParameters: {
        'v': DateTime.now().millisecondsSinceEpoch,
      },
    );
    final data = response.data;
    if (data == null) {
      throw const FormatException('Gallery manifest must be a JSON object');
    }

    final photos = data['photos'];
    if (photos is! List<Object?>) {
      throw const FormatException(
        'Gallery manifest must contain a photos array',
      );
    }

    return photos
        .map((photo) {
          if (photo is! Map<String, Object?>) {
            throw const FormatException(
              'Every item in photos must be a JSON object',
            );
          }
          return photo;
        })
        .toList(growable: false);
  }
}
