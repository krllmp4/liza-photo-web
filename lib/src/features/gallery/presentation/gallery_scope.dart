import 'package:flutter/widgets.dart';

import 'package:liza_photo_web/src/features/gallery/domain/repository/i_gallery_repository.dart';
import 'package:liza_photo_web/src/features/gallery/internal/gallery_repository_module.dart';
import 'package:liza_photo_web/src/features/gallery/presentation/view_model/gallery_view_model.dart';

class GalleryScope extends StatefulWidget {
  const GalleryScope({
    required this.child,
    this.repository,
    super.key,
  });

  final Widget child;
  final IGalleryRepository? repository;

  static GalleryViewModel viewModelOf(BuildContext context) {
    final inherited = context
        .dependOnInheritedWidgetOfExactType<_GalleryInherited>();
    assert(inherited != null, 'GalleryScope was not found in the widget tree');
    return inherited!.viewModel;
  }

  @override
  State<GalleryScope> createState() => _GalleryScopeState();
}

class _GalleryScopeState extends State<GalleryScope> {
  late final GalleryViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = GalleryViewModel(
      repository: widget.repository ?? GalleryRepositoryModule.getRepository(),
    )..load();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _GalleryInherited(
      viewModel: _viewModel,
      child: widget.child,
    );
  }
}

class _GalleryInherited extends InheritedWidget {
  const _GalleryInherited({
    required this.viewModel,
    required super.child,
  });

  final GalleryViewModel viewModel;

  @override
  bool updateShouldNotify(_GalleryInherited oldWidget) {
    return viewModel != oldWidget.viewModel;
  }
}
