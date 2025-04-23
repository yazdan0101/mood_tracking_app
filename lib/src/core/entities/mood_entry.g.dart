// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mood_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MoodEntry _$MoodEntryFromJson(Map<String, dynamic> json) => _MoodEntry(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      id: (json['id'] as num?)?.toInt(),
      moodType: json['moodType'] as String?,
      occurredAt: json['occurredAt'] == null
          ? null
          : DateTime.parse(json['occurredAt'] as String),
      feelingList: (json['feelingList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      sleepQuality: json['sleepQuality'] as String?,
      activityList: (json['activityList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      bestAboutToday: json['bestAboutToday'] as String?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$MoodEntryToJson(_MoodEntry instance) =>
    <String, dynamic>{
      'user': instance.user,
      'id': instance.id,
      'moodType': instance.moodType,
      'occurredAt': instance.occurredAt?.toIso8601String(),
      'feelingList': instance.feelingList,
      'sleepQuality': instance.sleepQuality,
      'activityList': instance.activityList,
      'bestAboutToday': instance.bestAboutToday,
      'note': instance.note,
    };
