import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracking_app/src/core/providers/best_today_description_provider.dart';
import 'package:mood_tracking_app/src/core/widgets/custom_text_field.dart';

class TheBestAboutTodayDescription extends ConsumerStatefulWidget {
  const TheBestAboutTodayDescription({super.key});

  @override
  ConsumerState createState() => _TheBestTodayDescriptionState();
}

class _TheBestTodayDescriptionState
    extends ConsumerState<TheBestAboutTodayDescription> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Text(
              'What was the best today?',
              style: textTheme.bodyMedium,
            ),
            CustomTextField(
              maxLines: 1,
              onChange: (final value) {
                final bestTodayDescNotifier =
                    ref.read(bestTodayDescriptionProvider.notifier);
                if (value.isEmpty) {
                  bestTodayDescNotifier.removeDescription();
                } else {
                  bestTodayDescNotifier.addDescription(value);
                }
              },
              controller: _controller,
            )
          ],
        ),
      ),
    );
  }
}
