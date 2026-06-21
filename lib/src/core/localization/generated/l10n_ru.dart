// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class L10nRu extends L10n {
  L10nRu([String locale = 'ru']) : super(locale);

  @override
  String get siteTitle => 'Лиза — фотограф';

  @override
  String get portfolio => 'ПОРТФОЛИО';

  @override
  String get about => 'ОБО МНЕ';

  @override
  String get contact => 'КОНТАКТЫ';

  @override
  String get heroTitle => 'ПОРТРЕТЫ, ИСТОРИИ\nИ ТИХИЕ МОМЕНТЫ';

  @override
  String get retryLoadingPhotos => 'ПОВТОРИТЬ ЗАГРУЗКУ';

  @override
  String get city => 'Санкт-Петербург';

  @override
  String get aboutTitle => 'СНИМАЮ ЛЮДЕЙ\nТАКИМИ, КАКИЕ ОНИ ЕСТЬ.';

  @override
  String get aboutBody =>
      'Меня зовут Лиза. Я снимаю портреты, истории и моменты, в которых важнее всего человек. Работаю в Санкт-Петербурге и готова к съёмкам в других городах.';

  @override
  String get contactTitle => 'ДАВАЙТЕ СОЗДАДИМ\nЧТО-ТО ВМЕСТЕ.';

  @override
  String get contactBody => 'Напишите, чтобы обсудить съёмку, дату и идею.';

  @override
  String get close => 'ЗАКРЫТЬ';

  @override
  String get previous => 'Предыдущая фотография';

  @override
  String get next => 'Следующая фотография';

  @override
  String get switchToEnglish => 'Переключить на английский';

  @override
  String get switchToRussian => 'Переключить на русский';
}
