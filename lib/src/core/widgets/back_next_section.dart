import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_tracking_app/src/core/providers/best_today_description_provider.dart';
import 'package:mood_tracking_app/src/core/providers/selected_activity_list_provider.dart';
import 'package:mood_tracking_app/src/core/providers/selected_feelings_list_provider.dart';
import 'package:mood_tracking_app/src/core/providers/selected_sleep_quality_list_provider.dart';
import 'package:mood_tracking_app/src/router/routes.dart';

class BackNextSection extends ConsumerWidget {
  const BackNextSection({required this.pageIndex, super.key});

  final int pageIndex;

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return Container(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.arrow_back,
                size: 30,
                color: colorScheme.onSecondary,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                'Back',
                style: textTheme.bodyLarge
                    ?.copyWith(color: colorScheme.onSecondary),
              )
            ],
          ),
          InkWell(
            onTap: () {
              final selectedFeelingList =
                  ref.read(selectedFeelingsListProvider);
              final selectedSleepQuality =
                  ref.read(selectedSleepQualityListProvider);
              final selectedActivity = ref.read(selectedActivityProvider);
              final bestOfToday = ref.read(bestTodayDescriptionProvider);
              final isFormValid = selectedFeelingList.isNotEmpty &&
                  selectedSleepQuality.isNotEmpty &&
                  selectedActivity.isNotEmpty &&
                  bestOfToday != null;
              if (isFormValid) {
                context.push(MoodCommentRoute().location);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: colorScheme.surface,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text(
                          'You must answer every question',
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
            child: Row(
              children: [
                Text(
                  'Next',
                  style: textTheme.bodyLarge,
                ),
                const SizedBox(
                  width: 8,
                ),
                const Icon(
                  Icons.arrow_forward,
                  size: 30,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
