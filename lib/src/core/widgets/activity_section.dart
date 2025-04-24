import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracking_app/src/core/providers/activity_list_provider.dart';
import 'package:mood_tracking_app/src/core/widgets/activity_chip.dart';
import 'package:mood_tracking_app/src/core/widgets/custom_card.dart';

class ActivitySection extends ConsumerWidget {
  const ActivitySection({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final allActivities = ref.watch(activityListProvider);
    final allIcons = ref.watch(activityIconListProvider);
    return CustomCard(
      title: 'What did you do?',
      wrapChildren: List.generate(
        allActivities.length,
        (final index) => ActivityChip(
            activity: allActivities[index], iconData: allIcons[index],),
      ),
    );
  }
}
