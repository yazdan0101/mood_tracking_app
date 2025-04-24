import 'package:flutter/material.dart';

class HomeProfileWidget extends StatelessWidget {
  const HomeProfileWidget({super.key});

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return Row(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: colorScheme.onSecondary,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 4),
                ),
                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 18,
                height: 18,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: const Icon(
                  Icons.edit,
                  size: 10,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, Admin',
                style: textTheme.labelLarge,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                'How are you feeling today?',
                style: textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
