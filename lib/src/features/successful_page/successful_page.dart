import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_tracking_app/src/core/providers/mood_enrty_provider.dart';
import 'package:mood_tracking_app/src/core/providers/selected_activity_list_provider.dart';
import 'package:mood_tracking_app/src/core/providers/selected_feelings_list_provider.dart';
import 'package:mood_tracking_app/src/core/providers/selected_sleep_quality_provider.dart';
import 'package:mood_tracking_app/src/core/widgets/custom_scaffold.dart';

class SuccessfulPage extends ConsumerWidget {
  const SuccessfulPage({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return CustomScaffold(
      title: const Text('Activity'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/images/image.png'),
              ),

              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Stimmung erfolgreich eingetragen!',
                  style: textTheme.bodyLarge?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 16),

              // Subtext
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Align(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Super! Deine Stimmung ist gespeichert. ',
                        style: textTheme.bodySmall,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Bleib dran, du machst ',
                              style: textTheme.bodySmall,
                            ),
                            TextSpan(
                              text: 'Fortschritte!',
                              style: textTheme.bodySmall
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),

              // Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ElevatedButton.icon(
                  onPressed: () {
                    ref
                      ..invalidate(moodEntryProvider)
                      ..invalidate(selectedFeelingsListProvider)
                      ..invalidate(selectedActivityProvider)
                      ..invalidate(selectedSleepQualityProvider);
                    context.go('/');
                  },
                  label: const Icon(
                    Icons.check_circle,
                    color: Colors.white,
                    size: 30,
                  ),
                  icon: Text(
                    'Danke! Zurück zu Home',
                    style: textTheme.bodyMedium
                        ?.copyWith(color: colorScheme.surface),
                  ),
                  style: theme.elevatedButtonTheme.style?.copyWith(
                    minimumSize: const WidgetStatePropertyAll(Size(400, 60)),
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
