import 'package:flutter/material.dart';
import 'package:liza_photo_web/src/core/localization/localization_extension.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _InfoPage(
      eyebrow: context.l10n.about,
      title: context.l10n.aboutTitle,
      body: context.l10n.aboutBody,
    );
  }
}

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _InfoPage(
      eyebrow: context.l10n.contact,
      title: context.l10n.contactTitle,
      body: context.l10n.contactBody,
      links: const [
        _ContactLink(
          'EMAIL',
          'hello@lizochekkk-photography.ru',
          'mailto:hello@lizochekkk-photography.ru',
        ),
        _ContactLink('TELEGRAM', '@lizochekkk', 'https://t.me/lizochekkk'),
        _ContactLink(
          'INSTAGRAM',
          '@lizochekkk',
          'https://instagram.com/lizochekkk',
        ),
      ],
    );
  }
}

class _InfoPage extends StatelessWidget {
  const _InfoPage({
    required this.eyebrow,
    required this.title,
    required this.body,
    this.links = const [],
  });

  final String eyebrow;
  final String title;
  final String body;
  final List<_ContactLink> links;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(eyebrow, style: Theme.of(context).textTheme.labelLarge),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(context.l10n.close),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                title,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: MediaQuery.sizeOf(context).width < 640 ? 40 : 58,
                ),
              ),
              const SizedBox(height: 38),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 620),
                child: SelectableText(
                  body,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              if (links.isNotEmpty) ...[
                const SizedBox(height: 30),
                Wrap(
                  spacing: 24,
                  runSpacing: 12,
                  children: links
                      .map(
                        (link) => TextButton(
                          onPressed: () => launchUrl(Uri.parse(link.url)),
                          child: Text('${link.label}  ${link.value}'),
                        ),
                      )
                      .toList(growable: false),
                ),
              ],
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactLink {
  const _ContactLink(this.label, this.value, this.url);

  final String label;
  final String value;
  final String url;
}
