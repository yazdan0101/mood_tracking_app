import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracking_app/src/core/widgets/home_drawer.dart';
import 'package:mood_tracking_app/src/core/widgets/home_profile_widget.dart';
import 'package:mood_tracking_app/src/core/widgets/mood_images_list.dart';
import 'package:mood_tracking_app/src/core/widgets/vertical_gap_widget.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  @override
  Widget build(final BuildContext context, final WidgetRef ref) => Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              _openDrawer();
            },
            icon: const Icon(Icons.settings),
          ),
        ),
        drawer: const HomeDrawer(),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              children: [
                HomeProfileWidget(),
                VerticalGapWidget(),
                MoodImagesList(
                  isHome: true,
                ),
              ],
            ),
          ),
        ),
      );
}
