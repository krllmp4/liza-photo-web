import 'package:liza_photo_web/src/features/gallery/domain/model/gallery_photo.dart';
import 'package:liza_photo_web/src/features/gallery/domain/repository/i_gallery_repository.dart';

final class MockGalleryRepository implements IGalleryRepository {
  const MockGalleryRepository();

  @override
  Future<List<GalleryPhoto>> getPhotos() => Future.value(_photos);
}

const _photos = <GalleryPhoto>[
  GalleryPhoto(
    thumbnailUrl:
        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=900&q=82',
    fullUrl:
        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=max&w=2000&q=90',
    title: 'Portrait I',
    category: 'Portraits',
  ),
  GalleryPhoto(
    thumbnailUrl:
        'https://images.unsplash.com/photo-1529139574466-a303027c1d8b?auto=format&fit=crop&w=900&q=82',
    fullUrl:
        'https://images.unsplash.com/photo-1529139574466-a303027c1d8b?auto=format&fit=max&w=2000&q=90',
    title: 'Movement',
    category: 'Editorial',
  ),
  GalleryPhoto(
    thumbnailUrl:
        'https://images.unsplash.com/photo-1524250502761-1ac6f2e30d43?auto=format&fit=crop&w=900&q=82',
    fullUrl:
        'https://images.unsplash.com/photo-1524250502761-1ac6f2e30d43?auto=format&fit=max&w=2000&q=90',
    title: 'Summer light',
    category: 'Portraits',
  ),
  GalleryPhoto(
    thumbnailUrl:
        'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?auto=format&fit=crop&w=900&q=82',
    fullUrl:
        'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?auto=format&fit=max&w=2000&q=90',
    title: 'Quiet',
    category: 'Portraits',
  ),
  GalleryPhoto(
    thumbnailUrl:
        'https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?auto=format&fit=crop&w=900&q=82',
    fullUrl:
        'https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?auto=format&fit=max&w=2000&q=90',
    title: 'Editorial I',
    category: 'Editorial',
  ),
  GalleryPhoto(
    thumbnailUrl:
        'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?auto=format&fit=crop&w=900&q=82',
    fullUrl:
        'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?auto=format&fit=max&w=2000&q=90',
    title: 'Portrait II',
    category: 'Portraits',
  ),
  GalleryPhoto(
    thumbnailUrl:
        'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?auto=format&fit=crop&w=900&q=82',
    fullUrl:
        'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?auto=format&fit=max&w=2000&q=90',
    title: 'Natural light',
    category: 'Portraits',
  ),
  GalleryPhoto(
    thumbnailUrl:
        'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?auto=format&fit=crop&w=900&q=82',
    fullUrl:
        'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?auto=format&fit=max&w=2000&q=90',
    title: 'Portrait III',
    category: 'Portraits',
  ),
  GalleryPhoto(
    thumbnailUrl:
        'https://images.unsplash.com/photo-1531123897727-8f129e1688ce?auto=format&fit=crop&w=900&q=82',
    fullUrl:
        'https://images.unsplash.com/photo-1531123897727-8f129e1688ce?auto=format&fit=max&w=2000&q=90',
    title: 'Daylight',
    category: 'Editorial',
  ),
];
