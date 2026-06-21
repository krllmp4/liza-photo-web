import 'package:flutter/widgets.dart';

final class AppLocaleController extends ChangeNotifier {
  Locale? _locale;

  Locale? get locale => _locale;

  void toggleLocale(Locale currentLocale) {
    _locale = Locale(
      currentLocale.languageCode == 'ru' ? 'en' : 'ru',
    );
    notifyListeners();
  }
}
