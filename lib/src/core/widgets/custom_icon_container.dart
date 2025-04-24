import 'package:flutter/material.dart';
import 'package:mood_tracking_app/main.dart';

class CustomIconContainer extends StatelessWidget {
  const CustomIconContainer({required this.child, super.key});

  final Widget child;

  @override
  Widget build(final BuildContext context) => Container(
        padding: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: child,
      );
}
