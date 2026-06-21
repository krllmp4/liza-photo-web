import 'package:flutter/material.dart';

import 'package:liza_photo_web/src/core/localization/localization_extension.dart';
import 'package:liza_photo_web/src/core/shared_widgets/site_header.dart';
import 'package:liza_photo_web/src/features/gallery/presentation/gallery_scope.dart';
import 'package:liza_photo_web/src/features/gallery/presentation/info_page.dart';
import 'package:liza_photo_web/src/features/gallery/presentation/photo_viewer_page.dart';
import 'package:liza_photo_web/src/features/gallery/presentation/view_model/gallery_view_model.dart';
import 'package:liza_photo_web/src/features/gallery/presentation/widgets/photo_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _portfolioKey = GlobalKey();

  void _open(Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => page,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = GalleryScope.viewModelOf(context);
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SiteHeader(
                onPortfolio: () {
                  final target = _portfolioKey.currentContext;
                  if (target != null) {
                    Scrollable.ensureVisible(
                      target,
                      duration: const Duration(milliseconds: 450),
                      curve: Curves.easeOut,
                    );
                  }
                },
                onAbout: () => _open(const AboutPage()),
                onContacts: () => _open(const ContactsPage()),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 44, 24, 72),
                child: Text(
                  context.l10n.heroTitle,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: screenWidth < 640 ? 41 : 58,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              key: _portfolioKey,
              child: ListenableBuilder(
                listenable: viewModel,
                builder: (context, _) {
                  if (viewModel.status == GalleryStatus.error) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(48),
                        child: TextButton(
                          onPressed: viewModel.load,
                          child: Text(context.l10n.retryLoadingPhotos),
                        ),
                      ),
                    );
                  }
                  if (viewModel.status != GalleryStatus.ready) {
                    return const SizedBox(
                      height: 420,
                      child: Center(
                        child: CircularProgressIndicator(strokeWidth: 1),
                      ),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: PhotoGrid(
                      photos: viewModel.photos,
                      onPhotoTap: (index) => _open(
                        PhotoViewerPage(
                          photos: viewModel.photos,
                          initialIndex: index,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 64, 24, 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('© 2026 LIZA'),
                    Text(context.l10n.city),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
