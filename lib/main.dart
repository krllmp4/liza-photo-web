import 'package:flutter/material.dart';

import 'package:liza_photo_web/src/core/localization/app_locale_controller.dart';
import 'package:liza_photo_web/src/core/localization/app_locale_scope.dart';
import 'package:liza_photo_web/src/core/localization/generated/l10n.dart';
import 'package:liza_photo_web/src/core/localization/localization_extension.dart';
import 'package:liza_photo_web/src/core/theme/app_theme.dart';
import 'package:liza_photo_web/src/features/gallery/presentation/gallery_scope.dart';
import 'package:liza_photo_web/src/features/gallery/presentation/home_page.dart';

void main() {
  runApp(const LizaPhotoApp());
}

class LizaPhotoApp extends StatefulWidget {
  const LizaPhotoApp({super.key});

  @override
  State<LizaPhotoApp> createState() => _LizaPhotoAppState();
}

class _LizaPhotoAppState extends State<LizaPhotoApp> {
  final _localeController = AppLocaleController();

  @override
  void dispose() {
    _localeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppLocaleScope(
      controller: _localeController,
      child: ListenableBuilder(
        listenable: _localeController,
        builder: (context, _) => MaterialApp(
          onGenerateTitle: (context) => context.l10n.siteTitle,
          debugShowCheckedModeBanner: false,
          locale: _localeController.locale,
          supportedLocales: L10n.supportedLocales,
          localizationsDelegates: L10n.localizationsDelegates,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          home: const GalleryScope(
            child: HomePage(),
          ),
        ),
      ),
    );
  }
}
