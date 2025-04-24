import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_tracking_app/src/core/providers/mood_enrty_provider.dart';
import 'package:mood_tracking_app/src/core/providers/post_mood_entry_provider.dart';
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
                FlutterI18n.translate(context, 'back'),
                style: textTheme.bodyLarge
                    ?.copyWith(color: colorScheme.onSecondary),
              ),
            ],
          ),
          InkWell(
            onTap: () async {
              final moodEntry = ref.read(moodEntryProvider);

              final isFormValid = moodEntry.moodType != null &&
                  (moodEntry.feelingList?.isNotEmpty ?? false) &&
                  (moodEntry.activityList?.isNotEmpty ?? false) &&
                  (moodEntry.sleepQuality?.isNotEmpty ?? false) &&
                  (moodEntry.bestAboutToday?.isNotEmpty ?? false);

              if (!isFormValid) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(FlutterI18n.translate(context, 'answer_req')),
                  ),
                );
                return;
              }
              if (pageIndex == 0) {
                context.push(CommentRoute().location);
                return;
              }
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (final _) =>
                    const Center(child: CircularProgressIndicator()),
              );

              try {
                await ref.read(postMoodEntryProvider(moodEntry).future);
                if (context.mounted) {
                  context
                    ..pop()
                    ..push('/successful');
                }
              } catch (err) {
                if (context.mounted) {
                  context.pop();
                }
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        FlutterI18n.translate(
                          context,
                          'submit_failed',
                          translationParams: {'err': err.toString()},
                        ),
                      ),
                    ),
                  );
                }
              }
            },
            child: Row(
              children: [
                Text(
                  pageIndex == 0
                      ? FlutterI18n.translate(context, 'next')
                      : FlutterI18n.translate(context, 'complete'),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward, size: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
