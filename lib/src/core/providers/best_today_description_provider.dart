import 'package:flutter_riverpod/flutter_riverpod.dart';

class BestTodayDescriptionNotifier extends StateNotifier<String?> {
  BestTodayDescriptionNotifier() : super(null);

  void addDescription(final String description) {
    state = description;
  }

  void removeDescription() {
    state = null;
  }
}

final bestTodayDescriptionProvider =
    StateNotifierProvider<BestTodayDescriptionNotifier, String?>(
        (ref) => BestTodayDescriptionNotifier());
