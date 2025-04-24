import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracking_app/src/core/enums/sleep_quality.dart';
import 'package:mood_tracking_app/src/core/providers/mood_enrty_provider.dart';

class SleepQualityChip extends ConsumerWidget {
  const SleepQualityChip({
    required this.iconData,
    required this.sleepQuality,
    super.key,
  });

  final SleepQuality sleepQuality;
  final IconData iconData;

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final selectedSleepQuality = ref.watch(
      moodEntryProvider.select(
        (final state) => state.sleepQuality,
      ),
    );
    final isSleepQualitySelected = selectedSleepQuality == sleepQuality.name;
    return InkWell(
      onTap: () {
        ref
            .read(moodEntryProvider.notifier)
            .updateSleepQuality(sleepQuality.name);
      },
      child: Chip(
        avatar: Icon(
          iconData,
          color: isSleepQualitySelected
              ? colorScheme.surface
              : colorScheme.onSurface,
        ),
        side: BorderSide.none,
        backgroundColor: isSleepQualitySelected
            ? colorScheme.primary
            : colorScheme.onSecondary,
        label: Text(
          FlutterI18n.translate(context, sleepQuality.name),
          style: textTheme.bodyMedium?.copyWith(
            color: isSleepQualitySelected
                ? colorScheme.surface
                : colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
