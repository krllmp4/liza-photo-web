import 'package:liza_photo_web/src/features/gallery/data/data_source/gallery_service.dart';
import 'package:liza_photo_web/src/features/gallery/domain/model/gallery_photo.dart';
import 'package:liza_photo_web/src/features/gallery/domain/repository/i_gallery_repository.dart';

final class GalleryRepository implements IGalleryRepository {
  const GalleryRepository({
    required GalleryService galleryService,
  }) : _galleryService = galleryService;

  final GalleryService _galleryService;

  @override
  Future<List<GalleryPhoto>> getPhotos() async {
    final items = await _galleryService.fetchManifest();
    return items.map(GalleryPhoto.fromJson).toList(growable: false);
  }
}
