import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracking_app/src/core/providers/selected_feelings_list_provider.dart';

class FeelingChip extends ConsumerWidget {
  const FeelingChip({required this.feeling, required this.iconData, super.key});

  final String feeling;
  final IconData iconData;

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final selectedFeelings = ref.watch(selectedFeelingsListProvider);
    final isFellingSelected = selectedFeelings.contains(feeling);
    return InkWell(
      onTap: () {
        final feelingListNotifier =
            ref.read(selectedFeelingsListProvider.notifier);
        if (isFellingSelected) {
          feelingListNotifier.removeFeeling(feeling);
        } else {
          feelingListNotifier.addFeeling(feeling);
        }
      },
      child: Chip(
        avatar: Icon(
          iconData,
          color:
              isFellingSelected ? colorScheme.surface : colorScheme.onSurface,
        ),
        side: BorderSide.none,
        backgroundColor:
            isFellingSelected ? colorScheme.primary : colorScheme.onSecondary,
        label: Text(
          feeling,
          style: textTheme.bodyMedium?.copyWith(
              color: isFellingSelected
                  ? colorScheme.surface
                  : colorScheme.onSurface),
        ),
      ),
    );
  }
}
