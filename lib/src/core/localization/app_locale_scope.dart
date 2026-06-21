import 'package:flutter/widgets.dart';

import 'package:liza_photo_web/src/core/localization/app_locale_controller.dart';

class AppLocaleScope extends InheritedNotifier<AppLocaleController> {
  const AppLocaleScope({
    required AppLocaleController controller,
    required super.child,
    super.key,
  }) : super(notifier: controller);

  static AppLocaleController controllerOf(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<AppLocaleScope>();
    assert(scope != null, 'AppLocaleScope was not found in the widget tree');
    return scope!.notifier!;
  }
}
