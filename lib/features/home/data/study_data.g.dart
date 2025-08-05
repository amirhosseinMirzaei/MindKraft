// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'study_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudyDataImpl _$$StudyDataImplFromJson(Map<String, dynamic> json) =>
    _$StudyDataImpl(
      userId: json['user_id'] as String,
      subjects:
          (json['subjects'] as List<dynamic>)
              .map((e) => Subject.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$StudyDataImplToJson(_$StudyDataImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'subjects': instance.subjects,
    };

_$ChapterImpl _$$ChapterImplFromJson(Map<String, dynamic> json) =>
    _$ChapterImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      summary: json['summary'] as String,
      isRead: json['is_read'] as bool,
    );

Map<String, dynamic> _$$ChapterImplToJson(_$ChapterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'summary': instance.summary,
      'is_read': instance.isRead,
    };

_$SubjectImpl _$$SubjectImplFromJson(Map<String, dynamic> json) =>
    _$SubjectImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      category: json['category'] as String,
      startDate: json['start_date'] as String,
      examDate: json['exam_date'] as String,
      isCompleted: json['is_completed'] as bool,
      chapters:
          (json['chapters'] as List<dynamic>)
              .map((e) => Chapter.fromJson(e as Map<String, dynamic>))
              .toList(),
      weeklyPlan:
          (json['weekly_plan'] as List<dynamic>)
              .map((e) => WeeklyPlan.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$SubjectImplToJson(_$SubjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'category': instance.category,
      'start_date': instance.startDate,
      'exam_date': instance.examDate,
      'is_completed': instance.isCompleted,
      'chapters': instance.chapters,
      'weekly_plan': instance.weeklyPlan,
    };

_$WeeklyPlanImpl _$$WeeklyPlanImplFromJson(Map<String, dynamic> json) =>
    _$WeeklyPlanImpl(
      week: (json['week'] as num).toInt(),
      start: json['start'] as String,
      end: json['end'] as String,
      chapters:
          (json['chapters'] as List<dynamic>)
              .map((e) => (e as num).toInt())
              .toList(),
    );

Map<String, dynamic> _$$WeeklyPlanImplToJson(_$WeeklyPlanImpl instance) =>
    <String, dynamic>{
      'week': instance.week,
      'start': instance.start,
      'end': instance.end,
      'chapters': instance.chapters,
    };
