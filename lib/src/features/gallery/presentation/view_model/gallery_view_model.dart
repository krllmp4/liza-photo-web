import 'package:flutter/foundation.dart';

import 'package:liza_photo_web/src/features/gallery/domain/model/gallery_photo.dart';
import 'package:liza_photo_web/src/features/gallery/domain/repository/i_gallery_repository.dart';

enum GalleryStatus { initial, loading, ready, error }

final class GalleryViewModel extends ChangeNotifier {
  GalleryViewModel({required IGalleryRepository repository})
    : _repository = repository;

  final IGalleryRepository _repository;

  GalleryStatus status = GalleryStatus.initial;
  List<GalleryPhoto> photos = const [];

  Future<void> load() async {
    status = GalleryStatus.loading;
    notifyListeners();
    try {
      photos = await _repository.getPhotos();
      status = GalleryStatus.ready;
    } catch (_) {
      status = GalleryStatus.error;
    }
    notifyListeners();
  }
}
