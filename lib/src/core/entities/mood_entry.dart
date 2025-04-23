import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mood_tracking_app/src/core/entities/user.dart';

part 'mood_entry.freezed.dart';
part 'mood_entry.g.dart';

@freezed
abstract class MoodEntry with _$MoodEntry {
  const factory MoodEntry({
    required final User user,
    final int? id,
    final String? moodType,
    final DateTime? occurredAt,
    final List<String>? feelingList,
    final String? sleepQuality,
    final List<String>? activityList,
    final String? bestAboutToday,
    final String? note,
  }) = _MoodEntry;

  factory MoodEntry.fromJson(final Map<String, dynamic> json) =>
      _$MoodEntryFromJson(json);
}
