import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracking_app/src/core/enums/sleep_quality.dart';

class SelectedSleepQualityNotifier extends StateNotifier<SleepQuality?> {
  SelectedSleepQualityNotifier() : super(null);

  void updateSleepQuality(final SleepQuality sleepQuality) {
    state = sleepQuality;
  }
}

final selectedSleepQualityProvider =
    StateNotifierProvider<SelectedSleepQualityNotifier, SleepQuality?>(
  (final ref) => SelectedSleepQualityNotifier(),
);
