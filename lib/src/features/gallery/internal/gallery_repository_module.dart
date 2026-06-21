import 'package:liza_photo_web/src/features/gallery/data/repository/gallery_repository.dart';
import 'package:liza_photo_web/src/features/gallery/domain/repository/i_gallery_repository.dart';
import 'package:liza_photo_web/src/features/gallery/internal/api/gallery_service_module.dart';

abstract final class GalleryRepositoryModule {
  static IGalleryRepository? _repository;

  static IGalleryRepository getRepository() {
    return _repository ??= GalleryRepository(
      galleryService: GalleryServiceModule.getService(),
    );
  }
}
