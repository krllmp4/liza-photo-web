import 'package:flutter/material.dart';

import 'package:liza_photo_web/src/core/localization/app_locale_scope.dart';
import 'package:liza_photo_web/src/core/localization/localization_extension.dart';

class SiteHeader extends StatelessWidget {
  const SiteHeader({
    required this.onPortfolio,
    required this.onAbout,
    required this.onContacts,
    super.key,
  });

  final VoidCallback onPortfolio;
  final VoidCallback onAbout;
  final VoidCallback onContacts;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final localeController = AppLocaleScope.controllerOf(context);
    final currentLocale = Localizations.localeOf(context);
    final navigation = Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 2,
      children: [
        _NavigationItem(
          label: l10n.portfolio,
          onTap: onPortfolio,
        ),
        _NavigationItem(
          label: l10n.about,
          onTap: onAbout,
        ),
        _NavigationItem(
          label: l10n.contact,
          onTap: onContacts,
        ),
        Tooltip(
          message: currentLocale.languageCode == 'ru'
              ? l10n.switchToEnglish
              : l10n.switchToRussian,
          child: TextButton(
            onPressed: () => localeController.toggleLocale(
              currentLocale,
            ),
            child: Text(
              currentLocale.languageCode == 'ru' ? 'EN' : 'RU',
            ),
          ),
        ),
      ],
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 22, 24, 20),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final name = Text(
            'LIZA PHOTOGRAPHY',
            style: Theme.of(context).textTheme.labelLarge,
          );
          if (constraints.maxWidth < 620) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                name,
                const SizedBox(height: 10),
                navigation,
              ],
            );
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              name,
              navigation,
            ],
          );
        },
      ),
    );
  }
}

class _NavigationItem extends StatelessWidget {
  const _NavigationItem({
    required this.label,
    required this.onTap,
  });

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        label,
      ),
    );
  }
}
