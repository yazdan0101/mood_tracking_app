// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mood_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MoodEntry {
  User get user;
  int? get id;
  String? get moodType;
  DateTime? get occurredAt;
  List<String>? get feelingList;
  String? get sleepQuality;
  List<String>? get activityList;
  String? get bestAboutToday;
  String? get note;

  /// Create a copy of MoodEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MoodEntryCopyWith<MoodEntry> get copyWith =>
      _$MoodEntryCopyWithImpl<MoodEntry>(this as MoodEntry, _$identity);

  /// Serializes this MoodEntry to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MoodEntry &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.moodType, moodType) ||
                other.moodType == moodType) &&
            (identical(other.occurredAt, occurredAt) ||
                other.occurredAt == occurredAt) &&
            const DeepCollectionEquality()
                .equals(other.feelingList, feelingList) &&
            (identical(other.sleepQuality, sleepQuality) ||
                other.sleepQuality == sleepQuality) &&
            const DeepCollectionEquality()
                .equals(other.activityList, activityList) &&
            (identical(other.bestAboutToday, bestAboutToday) ||
                other.bestAboutToday == bestAboutToday) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      user,
      id,
      moodType,
      occurredAt,
      const DeepCollectionEquality().hash(feelingList),
      sleepQuality,
      const DeepCollectionEquality().hash(activityList),
      bestAboutToday,
      note);

  @override
  String toString() {
    return 'MoodEntry(user: $user, id: $id, moodType: $moodType, occurredAt: $occurredAt, feelingList: $feelingList, sleepQuality: $sleepQuality, activityList: $activityList, bestAboutToday: $bestAboutToday, note: $note)';
  }
}

/// @nodoc
abstract mixin class $MoodEntryCopyWith<$Res> {
  factory $MoodEntryCopyWith(MoodEntry value, $Res Function(MoodEntry) _then) =
      _$MoodEntryCopyWithImpl;
  @useResult
  $Res call(
      {User user,
      int? id,
      String? moodType,
      DateTime? occurredAt,
      List<String>? feelingList,
      String? sleepQuality,
      List<String>? activityList,
      String? bestAboutToday,
      String? note});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$MoodEntryCopyWithImpl<$Res> implements $MoodEntryCopyWith<$Res> {
  _$MoodEntryCopyWithImpl(this._self, this._then);

  final MoodEntry _self;
  final $Res Function(MoodEntry) _then;

  /// Create a copy of MoodEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? id = freezed,
    Object? moodType = freezed,
    Object? occurredAt = freezed,
    Object? feelingList = freezed,
    Object? sleepQuality = freezed,
    Object? activityList = freezed,
    Object? bestAboutToday = freezed,
    Object? note = freezed,
  }) {
    return _then(_self.copyWith(
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      moodType: freezed == moodType
          ? _self.moodType
          : moodType // ignore: cast_nullable_to_non_nullable
              as String?,
      occurredAt: freezed == occurredAt
          ? _self.occurredAt
          : occurredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      feelingList: freezed == feelingList
          ? _self.feelingList
          : feelingList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      sleepQuality: freezed == sleepQuality
          ? _self.sleepQuality
          : sleepQuality // ignore: cast_nullable_to_non_nullable
              as String?,
      activityList: freezed == activityList
          ? _self.activityList
          : activityList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      bestAboutToday: freezed == bestAboutToday
          ? _self.bestAboutToday
          : bestAboutToday // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of MoodEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _MoodEntry implements MoodEntry {
  const _MoodEntry(
      {required this.user,
      this.id,
      this.moodType,
      this.occurredAt,
      final List<String>? feelingList,
      this.sleepQuality,
      final List<String>? activityList,
      this.bestAboutToday,
      this.note})
      : _feelingList = feelingList,
        _activityList = activityList;
  factory _MoodEntry.fromJson(Map<String, dynamic> json) =>
      _$MoodEntryFromJson(json);

  @override
  final User user;
  @override
  final int? id;
  @override
  final String? moodType;
  @override
  final DateTime? occurredAt;
  final List<String>? _feelingList;
  @override
  List<String>? get feelingList {
    final value = _feelingList;
    if (value == null) return null;
    if (_feelingList is EqualUnmodifiableListView) return _feelingList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? sleepQuality;
  final List<String>? _activityList;
  @override
  List<String>? get activityList {
    final value = _activityList;
    if (value == null) return null;
    if (_activityList is EqualUnmodifiableListView) return _activityList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? bestAboutToday;
  @override
  final String? note;

  /// Create a copy of MoodEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MoodEntryCopyWith<_MoodEntry> get copyWith =>
      __$MoodEntryCopyWithImpl<_MoodEntry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MoodEntryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MoodEntry &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.moodType, moodType) ||
                other.moodType == moodType) &&
            (identical(other.occurredAt, occurredAt) ||
                other.occurredAt == occurredAt) &&
            const DeepCollectionEquality()
                .equals(other._feelingList, _feelingList) &&
            (identical(other.sleepQuality, sleepQuality) ||
                other.sleepQuality == sleepQuality) &&
            const DeepCollectionEquality()
                .equals(other._activityList, _activityList) &&
            (identical(other.bestAboutToday, bestAboutToday) ||
                other.bestAboutToday == bestAboutToday) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      user,
      id,
      moodType,
      occurredAt,
      const DeepCollectionEquality().hash(_feelingList),
      sleepQuality,
      const DeepCollectionEquality().hash(_activityList),
      bestAboutToday,
      note);

  @override
  String toString() {
    return 'MoodEntry(user: $user, id: $id, moodType: $moodType, occurredAt: $occurredAt, feelingList: $feelingList, sleepQuality: $sleepQuality, activityList: $activityList, bestAboutToday: $bestAboutToday, note: $note)';
  }
}

/// @nodoc
abstract mixin class _$MoodEntryCopyWith<$Res>
    implements $MoodEntryCopyWith<$Res> {
  factory _$MoodEntryCopyWith(
          _MoodEntry value, $Res Function(_MoodEntry) _then) =
      __$MoodEntryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {User user,
      int? id,
      String? moodType,
      DateTime? occurredAt,
      List<String>? feelingList,
      String? sleepQuality,
      List<String>? activityList,
      String? bestAboutToday,
      String? note});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$MoodEntryCopyWithImpl<$Res> implements _$MoodEntryCopyWith<$Res> {
  __$MoodEntryCopyWithImpl(this._self, this._then);

  final _MoodEntry _self;
  final $Res Function(_MoodEntry) _then;

  /// Create a copy of MoodEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? user = null,
    Object? id = freezed,
    Object? moodType = freezed,
    Object? occurredAt = freezed,
    Object? feelingList = freezed,
    Object? sleepQuality = freezed,
    Object? activityList = freezed,
    Object? bestAboutToday = freezed,
    Object? note = freezed,
  }) {
    return _then(_MoodEntry(
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      moodType: freezed == moodType
          ? _self.moodType
          : moodType // ignore: cast_nullable_to_non_nullable
              as String?,
      occurredAt: freezed == occurredAt
          ? _self.occurredAt
          : occurredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      feelingList: freezed == feelingList
          ? _self._feelingList
          : feelingList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      sleepQuality: freezed == sleepQuality
          ? _self.sleepQuality
          : sleepQuality // ignore: cast_nullable_to_non_nullable
              as String?,
      activityList: freezed == activityList
          ? _self._activityList
          : activityList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      bestAboutToday: freezed == bestAboutToday
          ? _self.bestAboutToday
          : bestAboutToday // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of MoodEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

// dart format on
