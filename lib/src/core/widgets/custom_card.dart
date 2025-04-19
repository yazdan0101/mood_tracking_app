import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomCard extends ConsumerWidget {
  const CustomCard(
      {required this.title, required this.wrapChildren, super.key});

  final List<Widget> wrapChildren;
  final String title;

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final screenWidth = MediaQuery.of(context).size.width;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Text(
                title,
                style: textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: screenWidth,
                child: Wrap(
                  runSpacing: 8,
                  spacing: 8,
                  children: wrapChildren,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
