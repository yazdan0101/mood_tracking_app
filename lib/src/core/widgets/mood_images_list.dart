import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_tracking_app/src/core/enums/mood_type.dart';
import 'package:mood_tracking_app/src/core/providers/mood_enrty_provider.dart';
import 'package:mood_tracking_app/src/core/providers/mood_image_path_provider.dart';
import 'package:mood_tracking_app/src/core/widgets/mood_image.dart';
import 'package:mood_tracking_app/src/router/routes.dart';

class MoodImagesList extends ConsumerWidget {
  const MoodImagesList({required this.isHome, super.key});

  final bool isHome;

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final svgImagesPathList = ref.read(moodImagesPathListProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      child: LayoutBuilder(
        builder: (final context, final constraints) => Container(
          height: 90,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: colorScheme.surface,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: constraints.maxWidth),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  svgImagesPathList.length,
                  (final index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: InkWell(
                      onTap: () {
                        if (isHome) {
                          context.push(DetailsRoute().location);
                        }
                        final moodNotifier =
                            ref.read(moodEntryProvider.notifier);
                        final selectedMood = switch (index) {
                          0 => MoodType.sad.name,
                          1 => MoodType.angry.name,
                          2 => MoodType.okay.name,
                          3 => MoodType.good.name,
                          _ => MoodType.happy.name,
                        };
                        moodNotifier.updateMoodType(selectedMood);
                      },
                      child: MoodImage(
                        index: index,
                        moodImagePath:
                            'assets/images/${svgImagesPathList[index]}',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
