import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mood_tracking_app/src/core/providers/mood_colors_provider.dart';

class MoodImage extends ConsumerWidget {
  const MoodImage({
    required this.index,
    required this.moodImagePath,
    super.key,
  });

  final String moodImagePath;
  final int index;

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final moodColors = ref.read(moodColorsProvider);
    return Container(
      width: 90,
      height: 90,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: moodColors[index],
      ),
      child: SvgPicture.asset(
        moodImagePath,
      ),
    );
  }
}
