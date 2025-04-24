import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracking_app/src/core/providers/sleep_quality_list_provider.dart';
import 'package:mood_tracking_app/src/core/widgets/custom_card.dart';
import 'package:mood_tracking_app/src/core/widgets/sleep_quality_chip.dart';

class SleepQualitySection extends ConsumerWidget {
  const SleepQualitySection({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final allSleepQualities = ref.watch(sleepQualityListProvider);
    final allSleepQualityIcons = ref.watch(sleepQualityIconsProvider);
    return CustomCard(
        title: 'How was your sleep?',
        wrapChildren: List.generate(
          allSleepQualities.length,
          (final index) => SleepQualityChip(
              sleepQuality: allSleepQualities[index],
              iconData: allSleepQualityIcons[index],),
        ),);
  }
}
