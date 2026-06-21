import 'package:flutter/material.dart';

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
    final navigation = Wrap(
      spacing: 6,
      children: [
        _NavigationItem(label: 'PORTFOLIO', onTap: onPortfolio),
        _NavigationItem(label: 'ABOUT', onTap: onAbout),
        _NavigationItem(label: 'CONTACT', onTap: onContacts),
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
              children: [name, const SizedBox(height: 10), navigation],
            );
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [name, navigation],
          );
        },
      ),
    );
  }
}

class _NavigationItem extends StatelessWidget {
  const _NavigationItem({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onTap, child: Text(label));
  }
}
