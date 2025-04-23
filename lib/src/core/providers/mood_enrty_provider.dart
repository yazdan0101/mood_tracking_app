import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracking_app/src/core/entities/mood_entry.dart';
import 'package:mood_tracking_app/src/core/entities/user.dart';
import 'package:mood_tracking_app/src/core/providers/user_provider.dart';

class MoodEntryNotifier extends StateNotifier<MoodEntry> {
  MoodEntryNotifier(final User user) : super(MoodEntry(user: user));

  void updateMoodType(final String moodType) {
    state = state.copyWith(
      moodType: moodType,
      occurredAt: DateTime.now(),
    );
  }

  void updateFeelingList(final List<String> feelingList) {
    state = state.copyWith(
      feelingList: feelingList,
    );
  }

  void updateSleepQuality(final String sleepQuality) {
    state = state.copyWith(
      sleepQuality: sleepQuality,
    );
  }

  void updateActivityList(final List<String> activityList) {
    state = state.copyWith(activityList: activityList);
  }

  void updateBestOfToday(final String best) {
    state = state.copyWith(
      bestAboutToday: best,
    );
  }

  void updateNote(final String note) {
    state = state.copyWith(note: note.isNotEmpty ? note : null);
  }
}

final moodEntryProvider =
    StateNotifierProvider<MoodEntryNotifier, MoodEntry>((final ref) {
  final user = ref.read(userProvider);
  return MoodEntryNotifier(user!);
});
