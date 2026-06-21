import 'package:liza_photo_web/src/features/gallery/domain/model/gallery_photo.dart';

abstract interface class IGalleryRepository {
  Future<List<GalleryPhoto>> getPhotos();
}
