class GalleryPhoto {
  const GalleryPhoto({
    required this.thumbnailUrl,
    required this.fullUrl,
    this.title = '',
    this.category = '',
  });

  final String thumbnailUrl;
  final String fullUrl;
  final String title;
  final String category;

  factory GalleryPhoto.fromJson(Map<String, Object?> json) {
    final thumbnail = json['thumbnail'];
    final full = json['full'];
    if (thumbnail is! String || full is! String) {
      throw const FormatException(
        'Every photo must contain thumbnail and full URLs',
      );
    }

    final title = json['title'];
    final category = json['category'];
    return GalleryPhoto(
      thumbnailUrl: thumbnail,
      fullUrl: full,
      title: title is String ? title : '',
      category: category is String ? category : '',
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is GalleryPhoto &&
            thumbnailUrl == other.thumbnailUrl &&
            fullUrl == other.fullUrl &&
            title == other.title &&
            category == other.category;
  }

  @override
  int get hashCode => Object.hash(thumbnailUrl, fullUrl, title, category);
}
