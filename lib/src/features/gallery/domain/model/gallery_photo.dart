class GalleryPhoto {
  const GalleryPhoto({
    required this.id,
    required this.thumbnailUrl,
    required this.fullUrl,
    required this.width,
    required this.height,
    this.title = '',
    this.category = '',
  });

  final String id;
  final String thumbnailUrl;
  final String fullUrl;
  final int width;
  final int height;
  final String title;
  final String category;

  double get aspectRatio => width / height;
}
