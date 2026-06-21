import 'package:liza_photo_web/src/features/gallery/data/repository/mock/mock_gallery_repository.dart';
import 'package:liza_photo_web/src/features/gallery/domain/repository/i_gallery_repository.dart';

abstract final class GalleryRepositoryModule {
  static IGalleryRepository? _repository;

  static IGalleryRepository getRepository() {
    return _repository ??= const MockGalleryRepository();
  }
}
