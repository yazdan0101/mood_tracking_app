import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracking_app/src/core/providers/mood_enrty_provider.dart';
import 'package:mood_tracking_app/src/core/providers/selected_activity_list_provider.dart';

class ActivityChip extends ConsumerWidget {
  const ActivityChip(
      {required this.activity, required this.iconData, super.key});

  final String activity;
  final IconData iconData;

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final selectedActivities = ref.watch(selectedActivityProvider);
    final isFellingSelected = selectedActivities.contains(activity);
    return InkWell(
      onTap: () {
        final activityNotifier = ref.read(selectedActivityProvider.notifier);
        if (isFellingSelected) {
          activityNotifier.removeActivity(activity);
        } else {
          activityNotifier.addActivity(activity);
        }
        final activities = ref.read(selectedActivityProvider);
        ref.read(moodEntryProvider.notifier).updateActivityList(activities);
      },
      child: Chip(
        avatar: Icon(
          iconData,
          color:
              isFellingSelected ? colorScheme.surface : colorScheme.onSurface,
        ),
        side: BorderSide.none,
        backgroundColor:
            isFellingSelected ? colorScheme.primary : colorScheme.onSecondary,
        label: Text(
          activity,
          style: textTheme.bodyMedium?.copyWith(
            color:
                isFellingSelected ? colorScheme.surface : colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
