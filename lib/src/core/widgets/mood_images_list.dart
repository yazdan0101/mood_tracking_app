import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracking_app/src/core/providers/mood_image_path_provider.dart';
import 'package:mood_tracking_app/src/core/widgets/mood_image.dart';

class MoodImagesList extends ConsumerWidget {
  const MoodImagesList({required this.onTap, super.key});

  final VoidCallback? onTap;

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final svgImagesPathList = ref.read(moodImagesPathListProvider);
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          height: 90,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: colorScheme.surface,
          ),
          child: ListView.builder(
            itemCount: svgImagesPathList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (final context, final index) => MoodImage(
              index: index,
              moodImagePath: 'assets/images/${svgImagesPathList[index]}',
            ),
          ),
        ),
      ),
    );
  }
}
