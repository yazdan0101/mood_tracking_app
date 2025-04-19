import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracking_app/src/core/providers/best_today_description_provider.dart';

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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Text(
              'What was the best today?',
              style: textTheme.bodyMedium,
            ),
            TextField(
              controller: _controller,
              onChanged: (final value) {
                final bestTodayDescNotifier =
                    ref.read(bestTodayDescriptionProvider.notifier);
                if (value.isEmpty) {
                  bestTodayDescNotifier.removeDescription();
                } else {
                  bestTodayDescNotifier.addDescription(value);
                }
              },
              decoration: InputDecoration(
                border: const OutlineInputBorder(borderSide: BorderSide.none),
                hintText: 'Start to type',
                hintStyle: textTheme.bodySmall
                    ?.copyWith(color: colorScheme.onSecondary),
              ),
            )
          ],
        ),
      ),
    );
  }
}
