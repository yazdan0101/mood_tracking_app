import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const List<String> initialFeelings = [
  'Energized',
  'Euphoric',
  'Tired',
  'Content',
  'Cheerful',
  'Optimistic',
  'Happy',
  'Motivated',
  'Grateful',
  'Calm',
];
List<IconData> feelingIcons = [
  Icons.flash_on,
  Icons.mood,
  Icons.nights_stay,
  Icons.cloud,
  Icons.thumb_up,
  Icons.sentiment_satisfied,
  Icons.whatshot,
  Icons.volunteer_activism,
  Icons.front_hand_rounded,
  Icons.sentiment_satisfied,
];

class FeelingsListNotifier extends StateNotifier<List<String>> {
  FeelingsListNotifier() : super(initialFeelings);

  void addFeeling(final String feeling) {
    state.add(feeling);
  }
}

final feelingsListProvider =
    StateNotifierProvider<FeelingsListNotifier, List<String>>(
  (final ref) => FeelingsListNotifier(),
);

final feelingsIconsListProvider =
    Provider<List<IconData>>((final ref) => feelingIcons);
