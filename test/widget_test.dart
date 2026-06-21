import 'package:flutter/material.dart' show Size;
import 'package:flutter_test/flutter_test.dart';
import 'package:liza_photo_web/main.dart';
import 'package:liza_photo_web/src/features/gallery/domain/model/gallery_photo.dart';
import 'package:liza_photo_web/src/features/gallery/domain/repository/i_gallery_repository.dart';
import 'package:liza_photo_web/src/features/gallery/presentation/view_model/gallery_view_model.dart';

void main() {
  testWidgets('renders the portfolio shell', (tester) async {
    final viewModel = GalleryViewModel(repository: _FakeGalleryRepository());

    await tester.pumpWidget(LizaPhotoApp(viewModel: viewModel));
    await tester.pump();

    expect(find.text('LIZA PHOTOGRAPHY'), findsOneWidget);
    expect(find.text('PORTFOLIO'), findsOneWidget);
    expect(find.text('ABOUT'), findsOneWidget);
    expect(find.text('CONTACT'), findsOneWidget);
  });

  testWidgets('opens about page on a narrow viewport', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final viewModel = GalleryViewModel(repository: _FakeGalleryRepository());
    await tester.pumpWidget(LizaPhotoApp(viewModel: viewModel));
    await tester.pump();

    await tester.tap(find.text('ABOUT'));
    await tester.pumpAndSettle();

    expect(find.text('I PHOTOGRAPH\nPEOPLE AS THEY ARE.'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}

class _FakeGalleryRepository implements IGalleryRepository {
  @override
  Future<List<GalleryPhoto>> getPhotos() async => const [];
}
