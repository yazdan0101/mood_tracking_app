import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
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
    final allFeelingTranslated = allFeelings
        .map(
          (final e) => FlutterI18n.translate(context, e.toLowerCase()),
        )
        .toList();
    return CustomCard(
      title: FlutterI18n.translate(context, 'feel'),
      wrapChildren: List.generate(
        allFeelings.length,
        (final index) => FeelingChip(
          feeling: allFeelingTranslated[index],
          iconData: allFeelingIcons[index],
        ),
      ),
    );
  }
}
