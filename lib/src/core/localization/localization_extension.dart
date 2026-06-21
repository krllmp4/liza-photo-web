import 'package:flutter/widgets.dart';

import 'package:liza_photo_web/src/core/localization/generated/l10n.dart';

extension LocalizationBuildContext on BuildContext {
  L10n get l10n => L10n.of(this);
}
