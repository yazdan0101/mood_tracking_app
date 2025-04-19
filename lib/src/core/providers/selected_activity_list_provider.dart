import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedActivityListNotifier extends StateNotifier<List<String>> {
  SelectedActivityListNotifier() : super([]);

  void addActivity(final String activity) {
    state = [...state, activity];
  }

  void removeActivity(final String activity) {
    state.remove(activity);
    state = [...state];
  }
}

final selectedActivityProvider =
    StateNotifierProvider<SelectedActivityListNotifier, List<String>>(
        (ref) => SelectedActivityListNotifier());
