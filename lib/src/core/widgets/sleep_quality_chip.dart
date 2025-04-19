import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracking_app/src/core/providers/selected_sleep_quality_list_provider.dart';

class SleepQualityChip extends ConsumerWidget {
  const SleepQualityChip(
      {required this.iconData, required this.sleepQuality, super.key});

  final String sleepQuality;
  final IconData iconData;

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final selectedSleepQualities = ref.watch(selectedSleepQualityListProvider);
    final isSleepQualitySelected =
        selectedSleepQualities.contains(sleepQuality);
    return InkWell(
      onTap: () {
        final selectedSleepQualityListNotifier =
            ref.read(selectedSleepQualityListProvider.notifier);
        if (isSleepQualitySelected) {
          selectedSleepQualityListNotifier.removeSleepQuality(sleepQuality);
        } else {
          selectedSleepQualityListNotifier.addSleepQuality(sleepQuality);
        }
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
          sleepQuality,
          style: textTheme.bodyMedium?.copyWith(
              color: isSleepQualitySelected
                  ? colorScheme.surface
                  : colorScheme.onSurface),
        ),
      ),
    );
  }
}
