// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class L10nEn extends L10n {
  L10nEn([String locale = 'en']) : super(locale);

  @override
  String get siteTitle => 'Liza — Photographer';

  @override
  String get portfolio => 'PORTFOLIO';

  @override
  String get about => 'ABOUT';

  @override
  String get contact => 'CONTACT';

  @override
  String get heroTitle => 'PORTRAITS, STORIES\n& QUIET MOMENTS';

  @override
  String get retryLoadingPhotos => 'RETRY LOADING PHOTOS';

  @override
  String get city => 'Saint-Petersburg';

  @override
  String get aboutTitle => 'I PHOTOGRAPH\nPEOPLE AS THEY ARE.';

  @override
  String get aboutBody =>
      'My name is Liza. I photograph portraits, stories, and moments where the person matters most. I am based in Saint-Petersburg and available for projects in other cities.';

  @override
  String get contactTitle => 'LET’S MAKE\nSOMETHING TOGETHER.';

  @override
  String get contactBody =>
      'Get in touch to discuss your shoot, date, and idea.';

  @override
  String get close => 'CLOSE';

  @override
  String get previous => 'Previous photo';

  @override
  String get next => 'Next photo';

  @override
  String get switchToEnglish => 'Switch to English';

  @override
  String get switchToRussian => 'Switch to Russian';
}
