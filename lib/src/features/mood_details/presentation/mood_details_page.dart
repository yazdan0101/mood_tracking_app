import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracking_app/src/core/providers/the_best_about_today_description.dart';
import 'package:mood_tracking_app/src/core/widgets/activity_section.dart';
import 'package:mood_tracking_app/src/core/widgets/back_next_section.dart';
import 'package:mood_tracking_app/src/core/widgets/custom_scaffold.dart';
import 'package:mood_tracking_app/src/core/widgets/feeling_section.dart';
import 'package:mood_tracking_app/src/core/widgets/mood_images_list.dart';
import 'package:mood_tracking_app/src/core/widgets/sleep_quality_section.dart';
import 'package:mood_tracking_app/src/core/widgets/step_indicator.dart';

class MoodDetailsPage extends ConsumerWidget {
  const MoodDetailsPage({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return CustomScaffold(
      title: const Text('Mood'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const StepIndicator(
              numSteps: 2,
              pageIndex: 0,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Mood',
              style: textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            const MoodImagesList(onTap: null),
            const SizedBox(
              height: 20,
            ),
            const FeelingSection(),
            const SizedBox(
              height: 20,
            ),
            const SleepQualitySection(),
            const SizedBox(
              height: 20,
            ),
            const ActivitySection(),
            const SizedBox(
              height: 20,
            ),
            const TheBestAboutTodayDescription(),
            const SizedBox(
              height: 20,
            ),
            const BackNextSection(
              pageIndex: 0,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
