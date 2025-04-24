import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracking_app/src/core/widgets/custom_scaffold.dart';
import 'package:mood_tracking_app/src/core/widgets/home_profile_widget.dart';
import 'package:mood_tracking_app/src/core/widgets/mood_images_list.dart';
import 'package:mood_tracking_app/src/core/widgets/vertical_gap_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) =>
      const CustomScaffold(
        title: null,
        body: Column(
          children: [
            HomeProfileWidget(),
            VerticalGapWidget(),
            MoodImagesList(
              isHome: true,
            ),
          ],
        ),
      );
}
