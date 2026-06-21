import 'package:dio/dio.dart';

import 'package:liza_photo_web/src/core/config/app_config.dart';
import 'package:liza_photo_web/src/features/gallery/data/data_source/gallery_service.dart';

abstract final class GalleryServiceModule {
  static GalleryService? _service;

  static GalleryService getService() {
    return _service ??= GalleryService(
      dio: Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 8),
          receiveTimeout: const Duration(seconds: 12),
        ),
      ),
      manifestUrl: AppConfig.galleryManifestUrl,
    );
  }
}
