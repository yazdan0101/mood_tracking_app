import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_tracking_app/src/core/providers/mood_image_path_provider.dart';
import 'package:mood_tracking_app/src/core/widgets/mood_image.dart';
import 'package:mood_tracking_app/src/router/routes.dart';

class MoodImagesContainer extends ConsumerWidget {
  const MoodImagesContainer({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final svgImagesPathList = ref.read(moodImagesPathListProvider);
    final colorScheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: () {
        context.push(MoodDetailsRoute().location);
      },
      child: Container(
        height: 90,
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
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
    );
  }
}
