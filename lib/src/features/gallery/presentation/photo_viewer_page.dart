import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:liza_photo_web/src/core/localization/localization_extension.dart';
import 'package:liza_photo_web/src/core/theme/app_theme.dart';
import 'package:liza_photo_web/src/features/gallery/domain/model/gallery_photo.dart';

class PhotoViewerPage extends StatefulWidget {
  const PhotoViewerPage({
    required this.photos,
    required this.initialIndex,
    super.key,
  });

  final List<GalleryPhoto> photos;
  final int initialIndex;

  @override
  State<PhotoViewerPage> createState() => _PhotoViewerPageState();
}

class _PhotoViewerPageState extends State<PhotoViewerPage> {
  late final PageController _pageController = PageController(
    initialPage: widget.initialIndex,
  );
  late int _index = widget.initialIndex;

  void _move(int delta) {
    final target = (_index + delta).clamp(0, widget.photos.length - 1);
    _pageController.animateToPage(
      target,
      duration: const Duration(milliseconds: 260),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final photo = widget.photos[_index];
    return Scaffold(
      backgroundColor: AppTheme.ink,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: widget.photos.length,
              onPageChanged: (index) => setState(() => _index = index),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.fromLTRB(52, 62, 52, 72),
                child: CachedNetworkImage(
                  imageUrl: widget.photos[index].fullUrl,
                  fit: BoxFit.contain,
                  fadeInDuration: const Duration(milliseconds: 300),
                  placeholder: (_, _) => const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 1,
                    ),
                  ),
                  errorWidget: (_, _, _) => const Center(
                    child: Icon(
                      Icons.broken_image_outlined,
                      color: Colors.white54,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 12,
              child: IconButton(
                tooltip: context.l10n.close,
                color: Colors.white,
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close),
              ),
            ),
            Positioned(
              top: 18,
              right: 24,
              child: Text(
                '${_index + 1} / ${widget.photos.length}',
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
            if (_index > 0)
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  tooltip: context.l10n.previous,
                  color: Colors.white,
                  onPressed: () => _move(-1),
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
            if (_index < widget.photos.length - 1)
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  tooltip: context.l10n.next,
                  color: Colors.white,
                  onPressed: () => _move(1),
                  icon: const Icon(Icons.arrow_forward),
                ),
              ),
            Positioned(
              bottom: 18,
              left: 24,
              right: 24,
              child: Text(
                [
                  photo.title,
                  photo.category,
                ].where((text) => text.isNotEmpty).join(' — ').toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  letterSpacing: 0.8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
