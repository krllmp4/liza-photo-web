import 'package:dio/dio.dart';

final class GalleryService {
  const GalleryService({required Dio dio, required this.manifestUrl})
    : _dio = dio;

  final Dio _dio;
  final String manifestUrl;

  Future<List<Map<String, dynamic>>> fetchManifest() async {
    final response = await _dio.get<dynamic>(manifestUrl);
    final data = response.data;
    if (data is! List) {
      throw const FormatException('Gallery manifest must be a JSON array');
    }

    return data
        .map((item) => Map<String, dynamic>.from(item as Map))
        .toList(growable: false);
  }
}
