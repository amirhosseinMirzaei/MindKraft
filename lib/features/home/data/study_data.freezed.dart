// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'study_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

StudyData _$StudyDataFromJson(Map<String, dynamic> json) {
  return _StudyData.fromJson(json);
}

/// @nodoc
mixin _$StudyData {
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  List<Subject> get subjects => throw _privateConstructorUsedError;

  /// Serializes this StudyData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StudyData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudyDataCopyWith<StudyData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudyDataCopyWith<$Res> {
  factory $StudyDataCopyWith(StudyData value, $Res Function(StudyData) then) =
      _$StudyDataCopyWithImpl<$Res, StudyData>;
  @useResult
  $Res call({@JsonKey(name: 'user_id') String userId, List<Subject> subjects});
}

/// @nodoc
class _$StudyDataCopyWithImpl<$Res, $Val extends StudyData>
    implements $StudyDataCopyWith<$Res> {
  _$StudyDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudyData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userId = null, Object? subjects = null}) {
    return _then(
      _value.copyWith(
            userId:
                null == userId
                    ? _value.userId
                    : userId // ignore: cast_nullable_to_non_nullable
                        as String,
            subjects:
                null == subjects
                    ? _value.subjects
                    : subjects // ignore: cast_nullable_to_non_nullable
                        as List<Subject>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StudyDataImplCopyWith<$Res>
    implements $StudyDataCopyWith<$Res> {
  factory _$$StudyDataImplCopyWith(
    _$StudyDataImpl value,
    $Res Function(_$StudyDataImpl) then,
  ) = __$$StudyDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'user_id') String userId, List<Subject> subjects});
}

/// @nodoc
class __$$StudyDataImplCopyWithImpl<$Res>
    extends _$StudyDataCopyWithImpl<$Res, _$StudyDataImpl>
    implements _$$StudyDataImplCopyWith<$Res> {
  __$$StudyDataImplCopyWithImpl(
    _$StudyDataImpl _value,
    $Res Function(_$StudyDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StudyData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userId = null, Object? subjects = null}) {
    return _then(
      _$StudyDataImpl(
        userId:
            null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                    as String,
        subjects:
            null == subjects
                ? _value._subjects
                : subjects // ignore: cast_nullable_to_non_nullable
                    as List<Subject>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StudyDataImpl implements _StudyData {
  const _$StudyDataImpl({
    @JsonKey(name: 'user_id') required this.userId,
    required final List<Subject> subjects,
  }) : _subjects = subjects;

  factory _$StudyDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudyDataImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final String userId;
  final List<Subject> _subjects;
  @override
  List<Subject> get subjects {
    if (_subjects is EqualUnmodifiableListView) return _subjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subjects);
  }

  @override
  String toString() {
    return 'StudyData(userId: $userId, subjects: $subjects)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudyDataImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other._subjects, _subjects));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    userId,
    const DeepCollectionEquality().hash(_subjects),
  );

  /// Create a copy of StudyData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudyDataImplCopyWith<_$StudyDataImpl> get copyWith =>
      __$$StudyDataImplCopyWithImpl<_$StudyDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudyDataImplToJson(this);
  }
}

abstract class _StudyData implements StudyData {
  const factory _StudyData({
    @JsonKey(name: 'user_id') required final String userId,
    required final List<Subject> subjects,
  }) = _$StudyDataImpl;

  factory _StudyData.fromJson(Map<String, dynamic> json) =
      _$StudyDataImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  List<Subject> get subjects;

  /// Create a copy of StudyData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudyDataImplCopyWith<_$StudyDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Chapter _$ChapterFromJson(Map<String, dynamic> json) {
  return _Chapter.fromJson(json);
}

/// @nodoc
mixin _$Chapter {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get summary => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_read')
  bool get isRead => throw _privateConstructorUsedError;

  /// Serializes this Chapter to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Chapter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChapterCopyWith<Chapter> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapterCopyWith<$Res> {
  factory $ChapterCopyWith(Chapter value, $Res Function(Chapter) then) =
      _$ChapterCopyWithImpl<$Res, Chapter>;
  @useResult
  $Res call({
    int id,
    String title,
    String summary,
    @JsonKey(name: 'is_read') bool isRead,
  });
}

/// @nodoc
class _$ChapterCopyWithImpl<$Res, $Val extends Chapter>
    implements $ChapterCopyWith<$Res> {
  _$ChapterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Chapter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? summary = null,
    Object? isRead = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int,
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            summary:
                null == summary
                    ? _value.summary
                    : summary // ignore: cast_nullable_to_non_nullable
                        as String,
            isRead:
                null == isRead
                    ? _value.isRead
                    : isRead // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChapterImplCopyWith<$Res> implements $ChapterCopyWith<$Res> {
  factory _$$ChapterImplCopyWith(
    _$ChapterImpl value,
    $Res Function(_$ChapterImpl) then,
  ) = __$$ChapterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String title,
    String summary,
    @JsonKey(name: 'is_read') bool isRead,
  });
}

/// @nodoc
class __$$ChapterImplCopyWithImpl<$Res>
    extends _$ChapterCopyWithImpl<$Res, _$ChapterImpl>
    implements _$$ChapterImplCopyWith<$Res> {
  __$$ChapterImplCopyWithImpl(
    _$ChapterImpl _value,
    $Res Function(_$ChapterImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Chapter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? summary = null,
    Object? isRead = null,
  }) {
    return _then(
      _$ChapterImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int,
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        summary:
            null == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                    as String,
        isRead:
            null == isRead
                ? _value.isRead
                : isRead // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChapterImpl implements _Chapter {
  _$ChapterImpl({
    required this.id,
    required this.title,
    required this.summary,
    @JsonKey(name: 'is_read') required this.isRead,
  });

  factory _$ChapterImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChapterImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String summary;
  @override
  @JsonKey(name: 'is_read')
  final bool isRead;

  @override
  String toString() {
    return 'Chapter(id: $id, title: $title, summary: $summary, isRead: $isRead)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChapterImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.isRead, isRead) || other.isRead == isRead));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, summary, isRead);

  /// Create a copy of Chapter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChapterImplCopyWith<_$ChapterImpl> get copyWith =>
      __$$ChapterImplCopyWithImpl<_$ChapterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChapterImplToJson(this);
  }
}

abstract class _Chapter implements Chapter {
  factory _Chapter({
    required final int id,
    required final String title,
    required final String summary,
    @JsonKey(name: 'is_read') required final bool isRead,
  }) = _$ChapterImpl;

  factory _Chapter.fromJson(Map<String, dynamic> json) = _$ChapterImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get summary;
  @override
  @JsonKey(name: 'is_read')
  bool get isRead;

  /// Create a copy of Chapter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChapterImplCopyWith<_$ChapterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Subject _$SubjectFromJson(Map<String, dynamic> json) {
  return _Subject.fromJson(json);
}

/// @nodoc
mixin _$Subject {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  String get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'exam_date')
  String get examDate => throw _privateConstructorUsedError; // 👈 اضافه شده
  @JsonKey(name: 'is_completed')
  bool get isCompleted => throw _privateConstructorUsedError;
  List<Chapter> get chapters => throw _privateConstructorUsedError;
  @JsonKey(name: 'weekly_plan')
  List<WeeklyPlan> get weeklyPlan => throw _privateConstructorUsedError;

  /// Serializes this Subject to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Subject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubjectCopyWith<Subject> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectCopyWith<$Res> {
  factory $SubjectCopyWith(Subject value, $Res Function(Subject) then) =
      _$SubjectCopyWithImpl<$Res, Subject>;
  @useResult
  $Res call({
    String id,
    String title,
    String category,
    @JsonKey(name: 'start_date') String startDate,
    @JsonKey(name: 'exam_date') String examDate,
    @JsonKey(name: 'is_completed') bool isCompleted,
    List<Chapter> chapters,
    @JsonKey(name: 'weekly_plan') List<WeeklyPlan> weeklyPlan,
  });
}

/// @nodoc
class _$SubjectCopyWithImpl<$Res, $Val extends Subject>
    implements $SubjectCopyWith<$Res> {
  _$SubjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Subject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? category = null,
    Object? startDate = null,
    Object? examDate = null,
    Object? isCompleted = null,
    Object? chapters = null,
    Object? weeklyPlan = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            category:
                null == category
                    ? _value.category
                    : category // ignore: cast_nullable_to_non_nullable
                        as String,
            startDate:
                null == startDate
                    ? _value.startDate
                    : startDate // ignore: cast_nullable_to_non_nullable
                        as String,
            examDate:
                null == examDate
                    ? _value.examDate
                    : examDate // ignore: cast_nullable_to_non_nullable
                        as String,
            isCompleted:
                null == isCompleted
                    ? _value.isCompleted
                    : isCompleted // ignore: cast_nullable_to_non_nullable
                        as bool,
            chapters:
                null == chapters
                    ? _value.chapters
                    : chapters // ignore: cast_nullable_to_non_nullable
                        as List<Chapter>,
            weeklyPlan:
                null == weeklyPlan
                    ? _value.weeklyPlan
                    : weeklyPlan // ignore: cast_nullable_to_non_nullable
                        as List<WeeklyPlan>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SubjectImplCopyWith<$Res> implements $SubjectCopyWith<$Res> {
  factory _$$SubjectImplCopyWith(
    _$SubjectImpl value,
    $Res Function(_$SubjectImpl) then,
  ) = __$$SubjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String category,
    @JsonKey(name: 'start_date') String startDate,
    @JsonKey(name: 'exam_date') String examDate,
    @JsonKey(name: 'is_completed') bool isCompleted,
    List<Chapter> chapters,
    @JsonKey(name: 'weekly_plan') List<WeeklyPlan> weeklyPlan,
  });
}

/// @nodoc
class __$$SubjectImplCopyWithImpl<$Res>
    extends _$SubjectCopyWithImpl<$Res, _$SubjectImpl>
    implements _$$SubjectImplCopyWith<$Res> {
  __$$SubjectImplCopyWithImpl(
    _$SubjectImpl _value,
    $Res Function(_$SubjectImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Subject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? category = null,
    Object? startDate = null,
    Object? examDate = null,
    Object? isCompleted = null,
    Object? chapters = null,
    Object? weeklyPlan = null,
  }) {
    return _then(
      _$SubjectImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        category:
            null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                    as String,
        startDate:
            null == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                    as String,
        examDate:
            null == examDate
                ? _value.examDate
                : examDate // ignore: cast_nullable_to_non_nullable
                    as String,
        isCompleted:
            null == isCompleted
                ? _value.isCompleted
                : isCompleted // ignore: cast_nullable_to_non_nullable
                    as bool,
        chapters:
            null == chapters
                ? _value._chapters
                : chapters // ignore: cast_nullable_to_non_nullable
                    as List<Chapter>,
        weeklyPlan:
            null == weeklyPlan
                ? _value._weeklyPlan
                : weeklyPlan // ignore: cast_nullable_to_non_nullable
                    as List<WeeklyPlan>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SubjectImpl implements _Subject {
  _$SubjectImpl({
    required this.id,
    required this.title,
    required this.category,
    @JsonKey(name: 'start_date') required this.startDate,
    @JsonKey(name: 'exam_date') required this.examDate,
    @JsonKey(name: 'is_completed') required this.isCompleted,
    required final List<Chapter> chapters,
    @JsonKey(name: 'weekly_plan') required final List<WeeklyPlan> weeklyPlan,
  }) : _chapters = chapters,
       _weeklyPlan = weeklyPlan;

  factory _$SubjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubjectImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String category;
  @override
  @JsonKey(name: 'start_date')
  final String startDate;
  @override
  @JsonKey(name: 'exam_date')
  final String examDate;
  // 👈 اضافه شده
  @override
  @JsonKey(name: 'is_completed')
  final bool isCompleted;
  final List<Chapter> _chapters;
  @override
  List<Chapter> get chapters {
    if (_chapters is EqualUnmodifiableListView) return _chapters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chapters);
  }

  final List<WeeklyPlan> _weeklyPlan;
  @override
  @JsonKey(name: 'weekly_plan')
  List<WeeklyPlan> get weeklyPlan {
    if (_weeklyPlan is EqualUnmodifiableListView) return _weeklyPlan;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weeklyPlan);
  }

  @override
  String toString() {
    return 'Subject(id: $id, title: $title, category: $category, startDate: $startDate, examDate: $examDate, isCompleted: $isCompleted, chapters: $chapters, weeklyPlan: $weeklyPlan)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubjectImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.examDate, examDate) ||
                other.examDate == examDate) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            const DeepCollectionEquality().equals(other._chapters, _chapters) &&
            const DeepCollectionEquality().equals(
              other._weeklyPlan,
              _weeklyPlan,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    category,
    startDate,
    examDate,
    isCompleted,
    const DeepCollectionEquality().hash(_chapters),
    const DeepCollectionEquality().hash(_weeklyPlan),
  );

  /// Create a copy of Subject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubjectImplCopyWith<_$SubjectImpl> get copyWith =>
      __$$SubjectImplCopyWithImpl<_$SubjectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubjectImplToJson(this);
  }
}

abstract class _Subject implements Subject {
  factory _Subject({
    required final String id,
    required final String title,
    required final String category,
    @JsonKey(name: 'start_date') required final String startDate,
    @JsonKey(name: 'exam_date') required final String examDate,
    @JsonKey(name: 'is_completed') required final bool isCompleted,
    required final List<Chapter> chapters,
    @JsonKey(name: 'weekly_plan') required final List<WeeklyPlan> weeklyPlan,
  }) = _$SubjectImpl;

  factory _Subject.fromJson(Map<String, dynamic> json) = _$SubjectImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get category;
  @override
  @JsonKey(name: 'start_date')
  String get startDate;
  @override
  @JsonKey(name: 'exam_date')
  String get examDate; // 👈 اضافه شده
  @override
  @JsonKey(name: 'is_completed')
  bool get isCompleted;
  @override
  List<Chapter> get chapters;
  @override
  @JsonKey(name: 'weekly_plan')
  List<WeeklyPlan> get weeklyPlan;

  /// Create a copy of Subject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubjectImplCopyWith<_$SubjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeeklyPlan _$WeeklyPlanFromJson(Map<String, dynamic> json) {
  return _WeeklyPlan.fromJson(json);
}

/// @nodoc
mixin _$WeeklyPlan {
  int get week => throw _privateConstructorUsedError;
  String get start => throw _privateConstructorUsedError;
  String get end => throw _privateConstructorUsedError;
  List<int> get chapters => throw _privateConstructorUsedError;

  /// Serializes this WeeklyPlan to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeeklyPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeeklyPlanCopyWith<WeeklyPlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeklyPlanCopyWith<$Res> {
  factory $WeeklyPlanCopyWith(
    WeeklyPlan value,
    $Res Function(WeeklyPlan) then,
  ) = _$WeeklyPlanCopyWithImpl<$Res, WeeklyPlan>;
  @useResult
  $Res call({int week, String start, String end, List<int> chapters});
}

/// @nodoc
class _$WeeklyPlanCopyWithImpl<$Res, $Val extends WeeklyPlan>
    implements $WeeklyPlanCopyWith<$Res> {
  _$WeeklyPlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeeklyPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? week = null,
    Object? start = null,
    Object? end = null,
    Object? chapters = null,
  }) {
    return _then(
      _value.copyWith(
            week:
                null == week
                    ? _value.week
                    : week // ignore: cast_nullable_to_non_nullable
                        as int,
            start:
                null == start
                    ? _value.start
                    : start // ignore: cast_nullable_to_non_nullable
                        as String,
            end:
                null == end
                    ? _value.end
                    : end // ignore: cast_nullable_to_non_nullable
                        as String,
            chapters:
                null == chapters
                    ? _value.chapters
                    : chapters // ignore: cast_nullable_to_non_nullable
                        as List<int>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WeeklyPlanImplCopyWith<$Res>
    implements $WeeklyPlanCopyWith<$Res> {
  factory _$$WeeklyPlanImplCopyWith(
    _$WeeklyPlanImpl value,
    $Res Function(_$WeeklyPlanImpl) then,
  ) = __$$WeeklyPlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int week, String start, String end, List<int> chapters});
}

/// @nodoc
class __$$WeeklyPlanImplCopyWithImpl<$Res>
    extends _$WeeklyPlanCopyWithImpl<$Res, _$WeeklyPlanImpl>
    implements _$$WeeklyPlanImplCopyWith<$Res> {
  __$$WeeklyPlanImplCopyWithImpl(
    _$WeeklyPlanImpl _value,
    $Res Function(_$WeeklyPlanImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WeeklyPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? week = null,
    Object? start = null,
    Object? end = null,
    Object? chapters = null,
  }) {
    return _then(
      _$WeeklyPlanImpl(
        week:
            null == week
                ? _value.week
                : week // ignore: cast_nullable_to_non_nullable
                    as int,
        start:
            null == start
                ? _value.start
                : start // ignore: cast_nullable_to_non_nullable
                    as String,
        end:
            null == end
                ? _value.end
                : end // ignore: cast_nullable_to_non_nullable
                    as String,
        chapters:
            null == chapters
                ? _value._chapters
                : chapters // ignore: cast_nullable_to_non_nullable
                    as List<int>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WeeklyPlanImpl implements _WeeklyPlan {
  _$WeeklyPlanImpl({
    required this.week,
    required this.start,
    required this.end,
    required final List<int> chapters,
  }) : _chapters = chapters;

  factory _$WeeklyPlanImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeeklyPlanImplFromJson(json);

  @override
  final int week;
  @override
  final String start;
  @override
  final String end;
  final List<int> _chapters;
  @override
  List<int> get chapters {
    if (_chapters is EqualUnmodifiableListView) return _chapters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chapters);
  }

  @override
  String toString() {
    return 'WeeklyPlan(week: $week, start: $start, end: $end, chapters: $chapters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeklyPlanImpl &&
            (identical(other.week, week) || other.week == week) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            const DeepCollectionEquality().equals(other._chapters, _chapters));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    week,
    start,
    end,
    const DeepCollectionEquality().hash(_chapters),
  );

  /// Create a copy of WeeklyPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeklyPlanImplCopyWith<_$WeeklyPlanImpl> get copyWith =>
      __$$WeeklyPlanImplCopyWithImpl<_$WeeklyPlanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeeklyPlanImplToJson(this);
  }
}

abstract class _WeeklyPlan implements WeeklyPlan {
  factory _WeeklyPlan({
    required final int week,
    required final String start,
    required final String end,
    required final List<int> chapters,
  }) = _$WeeklyPlanImpl;

  factory _WeeklyPlan.fromJson(Map<String, dynamic> json) =
      _$WeeklyPlanImpl.fromJson;

  @override
  int get week;
  @override
  String get start;
  @override
  String get end;
  @override
  List<int> get chapters;

  /// Create a copy of WeeklyPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeeklyPlanImplCopyWith<_$WeeklyPlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
