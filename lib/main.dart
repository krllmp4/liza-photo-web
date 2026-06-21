import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:liza_photo_web/core/config/app_config.dart';
import 'package:liza_photo_web/core/theme/app_theme.dart';
import 'package:liza_photo_web/src/features/gallery/data/data_source/gallery_service.dart';
import 'package:liza_photo_web/src/features/gallery/data/repository/gallery_repository.dart';
import 'package:liza_photo_web/src/features/gallery/presentation/home_page.dart';
import 'package:liza_photo_web/src/features/gallery/presentation/view_model/gallery_view_model.dart';

void main() {
  final service = GalleryService(
    dio: Dio(BaseOptions(connectTimeout: const Duration(seconds: 8))),
    manifestUrl: AppConfig.galleryManifestUrl,
  );
  final viewModel = GalleryViewModel(
    repository: GalleryRepository(galleryService: service),
  );
  runApp(LizaPhotoApp(viewModel: viewModel));
}

class LizaPhotoApp extends StatelessWidget {
  const LizaPhotoApp({required this.viewModel, super.key});

  final GalleryViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Liza — Photographer',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: HomePage(viewModel: viewModel),
    );
  }
}
