import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracking_app/src/core/providers/current_app_locale_provider.dart';
import 'package:mood_tracking_app/src/core/providers/supported_locale_provider.dart';
import 'package:mood_tracking_app/src/core/widgets/vertical_gap_widget.dart';

class HomeDrawer extends ConsumerWidget {
  const HomeDrawer({super.key});

  void _onChangeLocale(final BuildContext context, final WidgetRef ref,
      final String languageCode) {
    FlutterI18n.refresh(context, Locale(languageCode));
    ref
        .read(currentAppLocaleProvider.notifier)
        .changeLocale(Locale(languageCode));
  }

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final supportedLocale = ref.read(supportedLocalesProvider);
    final currentLocale = ref.watch(currentAppLocaleProvider);
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                Text(FlutterI18n.translate(context, 'settings')),
                const VerticalGapWidget(),
                Row(
                  children: [
                    const Icon(Icons.language),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(FlutterI18n.translate(context, 'language')),
                  ],
                ),
                const VerticalGapWidget(),
                RadioListTile.adaptive(
                  value: supportedLocale.last.languageCode,
                  groupValue: currentLocale.languageCode,
                  title: Text(FlutterI18n.translate(context, 'german')),
                  onChanged: (final languageCode) =>
                      _onChangeLocale(context, ref, languageCode!),
                ),
                RadioListTile.adaptive(
                  value: supportedLocale.first.languageCode,
                  groupValue: currentLocale.languageCode,
                  title: Text(FlutterI18n.translate(context, 'english')),
                  onChanged: (final languageCode) =>
                      _onChangeLocale(context, ref, languageCode!),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
