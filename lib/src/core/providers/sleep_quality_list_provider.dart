import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const List<String> initialSleepQuality = ['Good', 'Okay', 'Bad'];
const List<IconData> sleepQualityIcons = [
  Icons.sentiment_very_satisfied,
  Icons.sentiment_neutral,
  Icons.sentiment_dissatisfied_outlined
];

class SleepQualityListListNotifier extends StateNotifier<List<String>> {
  SleepQualityListListNotifier() : super(initialSleepQuality);

  void addSleepQuality(final String sleepQuality) {
    state = [...state, sleepQuality];
  }
}

final sleepQualityListProvider =
    StateNotifierProvider<SleepQualityListListNotifier, List<String>>(
  (final ref) => SleepQualityListListNotifier(),
);

final sleepQualityIconsProvider = Provider<List<IconData>>((ref) => sleepQualityIcons);