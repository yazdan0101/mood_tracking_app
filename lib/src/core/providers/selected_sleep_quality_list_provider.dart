import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedSleepQualityListNotifier extends StateNotifier<List<String>> {
  SelectedSleepQualityListNotifier() : super([]);

  void addSleepQuality(final String sleepQuality) {
    state = [...state, sleepQuality];
  }

  void removeSleepQuality(final String sleepQuality) {
    state.remove(sleepQuality);
    state = [...state];
  }
}

final selectedSleepQualityListProvider =
    StateNotifierProvider<SelectedSleepQualityListNotifier, List<String>>(
  (final ref) => SelectedSleepQualityListNotifier(),
);
