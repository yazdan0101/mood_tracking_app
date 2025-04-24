import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracking_app/src/core/enums/sleep_quality.dart';

const List<SleepQuality> initialSleepQuality = [
  SleepQuality.good,
  SleepQuality.okay,
  SleepQuality.bad,
];
const List<IconData> sleepQualityIcons = [
  Icons.sentiment_very_satisfied,
  Icons.sentiment_neutral,
  Icons.sentiment_dissatisfied_outlined,
];

class SleepQualityListListNotifier extends StateNotifier<List<SleepQuality>> {
  SleepQualityListListNotifier() : super(initialSleepQuality);

  void addSleepQuality(final SleepQuality sleepQuality) {
    state = [...state, sleepQuality];
  }
}

final sleepQualityListProvider =
    StateNotifierProvider<SleepQualityListListNotifier, List<SleepQuality>>(
  (final ref) => SleepQualityListListNotifier(),
);

final sleepQualityIconsProvider =
    Provider<List<IconData>>((final ref) => sleepQualityIcons);
