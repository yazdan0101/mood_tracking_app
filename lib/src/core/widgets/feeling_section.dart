import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracking_app/src/core/providers/feelings_list_provider.dart';
import 'package:mood_tracking_app/src/core/widgets/custom_card.dart';
import 'package:mood_tracking_app/src/core/widgets/feeling_chip.dart';

class FeelingSection extends ConsumerWidget {
  const FeelingSection({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final allFeelings = ref.watch(feelingsListProvider);
    final allFeelingIcons = ref.watch(feelingsIconsListProvider);
    return CustomCard(
      title: 'How do you feel?',
      wrapChildren: List.generate(
        allFeelings.length,
        (final index) =>
            FeelingChip(feeling: allFeelings[index], iconData: allFeelingIcons[index]),
      ),
    );
  }
}
