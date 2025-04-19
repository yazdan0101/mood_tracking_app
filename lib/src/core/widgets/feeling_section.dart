import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracking_app/src/core/providers/feelings_list_provider.dart';
import 'package:mood_tracking_app/src/core/widgets/feeling_chip.dart';

class FeelingSection extends ConsumerWidget {
  const FeelingSection({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final allFeelings = ref.watch(feelingsListProvider);
    final allIcons = ref.watch(feelingsIconsListProvider);
    final textTheme = Theme.of(context).textTheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Text(
                'How do you feel?',
                style: textTheme.labelLarge,
              ),
              const SizedBox(
                height: 16,
              ),
              Wrap(
                runSpacing: 6,
                spacing: 6,
                children: List.generate(
                  allFeelings.length,
                  (final index) => FeelingChip(
                      feeling: allFeelings[index], iconData: allIcons[index]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
