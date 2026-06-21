import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:liza_photo_web/src/features/gallery/domain/model/gallery_photo.dart';

class PhotoGrid extends StatelessWidget {
  const PhotoGrid({required this.photos, required this.onPhotoTap, super.key});

  final List<GalleryPhoto> photos;
  final ValueChanged<int> onPhotoTap;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columnCount = switch (constraints.maxWidth) {
          < 620 => 1,
          < 980 => 2,
          _ => 3,
        };
        final columns = List.generate(columnCount, (_) => <int>[]);

        for (var index = 0; index < photos.length; index++) {
          columns[index % columnCount].add(index);
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var column = 0; column < columnCount; column++) ...[
              if (column > 0) const SizedBox(width: 6),
              Expanded(
                child: Column(
                  children: [
                    for (final index in columns[column]) ...[
                      _PhotoTile(
                        photo: photos[index],
                        onTap: () => onPhotoTap(index),
                      ),
                      const SizedBox(height: 6),
                    ],
                  ],
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}

class _PhotoTile extends StatefulWidget {
  const _PhotoTile({required this.photo, required this.onTap});

  final GalleryPhoto photo;
  final VoidCallback onTap;

  @override
  State<_PhotoTile> createState() => _PhotoTileState();
}

class _PhotoTileState extends State<_PhotoTile> {
  var _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: ClipRect(
          child: Stack(
            children: [
              AnimatedScale(
                scale: _hovered ? 1.018 : 1,
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeOut,
                child: CachedNetworkImage(
                  imageUrl: widget.photo.thumbnailUrl,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                  fadeInDuration: const Duration(milliseconds: 450),
                  placeholder: (_, _) => const AspectRatio(
                    aspectRatio: 3 / 4,
                    child: _PhotoPlaceholder(),
                  ),
                  errorWidget: (_, _, _) => const AspectRatio(
                    aspectRatio: 3 / 4,
                    child: _PhotoPlaceholder(),
                  ),
                ),
              ),
              Positioned.fill(
                child: AnimatedOpacity(
                  opacity: _hovered && widget.photo.title.isNotEmpty ? 1 : 0,
                  duration: const Duration(milliseconds: 180),
                  child: ColoredBox(
                    color: const Color(0x33000000),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          widget.photo.title.toUpperCase(),
                          style: Theme.of(
                            context,
                          ).textTheme.labelLarge?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PhotoPlaceholder extends StatefulWidget {
  const _PhotoPlaceholder();

  @override
  State<_PhotoPlaceholder> createState() => _PhotoPlaceholderState();
}

class _PhotoPlaceholderState extends State<_PhotoPlaceholder>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween(begin: 0.45, end: 0.9).animate(_controller),
      child: ColoredBox(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
      ),
    );
  }
}
