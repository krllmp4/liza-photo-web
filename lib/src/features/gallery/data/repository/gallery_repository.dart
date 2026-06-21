import 'package:liza_photo_web/src/features/gallery/data/data_source/gallery_service.dart';
import 'package:liza_photo_web/src/features/gallery/domain/model/gallery_photo.dart';
import 'package:liza_photo_web/src/features/gallery/domain/repository/i_gallery_repository.dart';

final class GalleryRepository implements IGalleryRepository {
  const GalleryRepository({required GalleryService galleryService})
    : _galleryService = galleryService;

  final GalleryService _galleryService;

  @override
  Future<List<GalleryPhoto>> getPhotos() async {
    if (_galleryService.manifestUrl.isEmpty) return _demoPhotos;

    final manifestUri = Uri.parse(_galleryService.manifestUrl);
    final items = await _galleryService.fetchManifest();
    return items
        .map((item) {
          String resolve(String value) {
            final uri = Uri.parse(value);
            return uri.hasScheme
                ? value
                : manifestUri.resolve(value).toString();
          }

          return GalleryPhoto(
            id: item['id'] as String,
            thumbnailUrl: resolve(item['thumbnail'] as String),
            fullUrl: resolve(item['full'] as String),
            width: (item['width'] as num).toInt(),
            height: (item['height'] as num).toInt(),
            title: item['title'] as String? ?? '',
            category: item['category'] as String? ?? '',
          );
        })
        .toList(growable: false);
  }
}

const _demoPhotos = <GalleryPhoto>[
  GalleryPhoto(
    id: '01',
    thumbnailUrl:
        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=900&q=82',
    fullUrl:
        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=max&w=2000&q=90',
    width: 1200,
    height: 1600,
    title: 'Portrait I',
    category: 'Portraits',
  ),
  GalleryPhoto(
    id: '02',
    thumbnailUrl:
        'https://images.unsplash.com/photo-1529139574466-a303027c1d8b?auto=format&fit=crop&w=900&q=82',
    fullUrl:
        'https://images.unsplash.com/photo-1529139574466-a303027c1d8b?auto=format&fit=max&w=2000&q=90',
    width: 1400,
    height: 1000,
    title: 'Movement',
    category: 'Editorial',
  ),
  GalleryPhoto(
    id: '03',
    thumbnailUrl:
        'https://images.unsplash.com/photo-1524250502761-1ac6f2e30d43?auto=format&fit=crop&w=900&q=82',
    fullUrl:
        'https://images.unsplash.com/photo-1524250502761-1ac6f2e30d43?auto=format&fit=max&w=2000&q=90',
    width: 1200,
    height: 1800,
    title: 'Summer light',
    category: 'Portraits',
  ),
  GalleryPhoto(
    id: '04',
    thumbnailUrl:
        'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?auto=format&fit=crop&w=900&q=82',
    fullUrl:
        'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?auto=format&fit=max&w=2000&q=90',
    width: 1200,
    height: 1500,
    title: 'Quiet',
    category: 'Portraits',
  ),
  GalleryPhoto(
    id: '05',
    thumbnailUrl:
        'https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?auto=format&fit=crop&w=900&q=82',
    fullUrl:
        'https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?auto=format&fit=max&w=2000&q=90',
    width: 1500,
    height: 1000,
    title: 'Editorial I',
    category: 'Editorial',
  ),
  GalleryPhoto(
    id: '06',
    thumbnailUrl:
        'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?auto=format&fit=crop&w=900&q=82',
    fullUrl:
        'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?auto=format&fit=max&w=2000&q=90',
    width: 1200,
    height: 1700,
    title: 'Portrait II',
    category: 'Portraits',
  ),
  GalleryPhoto(
    id: '07',
    thumbnailUrl:
        'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?auto=format&fit=crop&w=900&q=82',
    fullUrl:
        'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?auto=format&fit=max&w=2000&q=90',
    width: 1200,
    height: 1500,
    title: 'Natural light',
    category: 'Portraits',
  ),
  GalleryPhoto(
    id: '08',
    thumbnailUrl:
        'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?auto=format&fit=crop&w=900&q=82',
    fullUrl:
        'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?auto=format&fit=max&w=2000&q=90',
    width: 1100,
    height: 1600,
    title: 'Portrait III',
    category: 'Portraits',
  ),
  GalleryPhoto(
    id: '09',
    thumbnailUrl:
        'https://images.unsplash.com/photo-1531123897727-8f129e1688ce?auto=format&fit=crop&w=900&q=82',
    fullUrl:
        'https://images.unsplash.com/photo-1531123897727-8f129e1688ce?auto=format&fit=max&w=2000&q=90',
    width: 1400,
    height: 1000,
    title: 'Daylight',
    category: 'Editorial',
  ),
];
