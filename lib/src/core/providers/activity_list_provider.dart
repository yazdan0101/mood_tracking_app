import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const List<String> initialActivityList = [
  'meet',
  'Sleep',
  'Sport',
  'Travel',
  'Hobby',
  'Relax',
  'work',
];
const List<IconData> activityListIcons = [
  Icons.groups,
  Icons.bed,
  Icons.directions_run,
  Icons.pin_drop,
  Icons.summarize,
  Icons.weekend,
  Icons.description,
];

class ActivityListNotifier extends StateNotifier<List<String>> {
  ActivityListNotifier() : super(initialActivityList);

  void addActivity(final String activity) {
    state = [...state, activity];
  }
}

final activityListProvider =
    StateNotifierProvider<ActivityListNotifier, List<String>>(
  (final ref) => ActivityListNotifier(),
);

final activityIconListProvider =
    Provider<List<IconData>>((final ref) => activityListIcons);
