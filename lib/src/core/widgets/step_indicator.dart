import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StepIndicator extends ConsumerWidget {
  const StepIndicator(
      {required this.numSteps, required this.pageIndex, super.key,});

  final int numSteps;
  final int pageIndex;

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      children: List.generate(
        numSteps,
        (final index) => Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: index <= pageIndex
                  ? colorScheme.primary
                  : colorScheme.onSecondary,
            ),
            height: 6,
          ),
        ),
      ),
    );
  }
}
