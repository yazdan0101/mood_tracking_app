import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedFeelingsListNotifier extends StateNotifier<List<String>> {
  SelectedFeelingsListNotifier() : super([]);

  void addFeeling(final String feeling) {
    state = [...state, feeling];
  }

  void removeFeeling(final String feeling) {
    state.remove(feeling);
    state = [...state];
  }
}

final selectedFeelingsListProvider =
    StateNotifierProvider<SelectedFeelingsListNotifier, List<String>>(
  (final ref) => SelectedFeelingsListNotifier(),
);
