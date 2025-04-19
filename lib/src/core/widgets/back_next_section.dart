import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
                'Back',
                style: textTheme.bodyLarge
                    ?.copyWith(color: colorScheme.onSecondary),
              )
            ],
          ),
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                Text(
                  'Next',
                  style: textTheme.bodyLarge,
                ),
                const SizedBox(
                  width: 8,
                ),
                const Icon(
                  Icons.arrow_forward,
                  size: 30,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
