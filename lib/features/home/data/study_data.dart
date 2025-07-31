import 'package:freezed_annotation/freezed_annotation.dart';

part 'study_data.freezed.dart';
part 'study_data.g.dart';

@freezed
class StudyData with _$StudyData {
  const factory StudyData({
    @JsonKey(name: 'user_id') required String userId,
    required List<Subject> subjects,
  }) = _StudyData;

  factory StudyData.fromJson(Map<String, dynamic> json) => _$StudyDataFromJson(json);
}

@freezed
class Chapter with _$Chapter {
  factory Chapter({
    required int id,
    required String title,
    required String summary,
    @JsonKey(name: 'is_read') required bool isRead,
  }) = _Chapter;

  factory Chapter.fromJson(Map<String, dynamic> json) => _$ChapterFromJson(json);
}

@freezed
class Subject with _$Subject {
  factory Subject({
    required String id,
    required String title,
    required String category,
    @JsonKey(name: 'start_date') required String startDate,
    @JsonKey(name: 'exam_date') required String examDate,
    @JsonKey(name: 'is_completed') required bool isCompleted,
    required List<Chapter> chapters,
    @JsonKey(name: 'weekly_plan') required List<WeeklyPlan> weeklyPlan,
  }) = _Subject;

  factory Subject.fromJson(Map<String, dynamic> json) => _$SubjectFromJson(json);
}

@freezed
class WeeklyPlan with _$WeeklyPlan {
  factory WeeklyPlan({
    required int week,
    required String start,
    required String end,
    required List<int> chapters,
  }) = _WeeklyPlan;

  factory WeeklyPlan.fromJson(Map<String, dynamic> json) => _$WeeklyPlanFromJson(json);
}
