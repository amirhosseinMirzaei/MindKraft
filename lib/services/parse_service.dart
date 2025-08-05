// services/parse_service.dart
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../features/home/data/study_data.dart';

class ParseService {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  Future<ParseResponse> signUp({required String fullName, required String email, required String phone, required String password}) async {
    final user = ParseUser(email, password, email);
    user.set('fullName', fullName);
    user.set('phone', phone);

    final response = await user.signUp();
    return response;
  }

  Future<ParseResponse> login({required String email, required String password}) async {
    final user = ParseUser(email, password, null);
    final response = await user.login();
    return response;
  }

  Future<void> logout() async {
    final currentUser = await ParseUser.currentUser();
    await _secureStorage.delete(key: 'accessToken');
    if (currentUser != null) {
      await currentUser.logout();
    }
    await _secureStorage.deleteAll();
  }

  Future<void> saveStudyDataToParse(StudyData studyData) async {
    final user = await ParseUser.currentUser() as ParseUser;

    for (final subject in studyData.subjects) {
      final parseSubject = ParseObject('Subject')
        ..set('userId', studyData.userId)
        ..set('title', subject.title)
        ..set('subjectId', subject.id)
        ..set('category', subject.category)
        ..set('startDate', subject.startDate)
        ..set('examDate', subject.examDate)
        ..set('isCompleted', subject.isCompleted)
        ..set('user', user);

      final subjectResponse = await parseSubject.save();

      if (subjectResponse.success) {
        final savedSubject = subjectResponse.result as ParseObject;

        // ذخیره Chapter ها
        for (final chapter in subject.chapters) {
          final parseChapter = ParseObject('Chapter')
            ..set('subject', savedSubject)
            ..set('chapterId', chapter.id)
            ..set('title', chapter.title)
            ..set('summary', chapter.summary)
            ..set('isRead', chapter.isRead);

          await parseChapter.save();
        }

        // ذخیره WeeklyPlan ها
        for (final plan in subject.weeklyPlan) {
          final parsePlan = ParseObject('WeeklyPlan')
            ..set('subject', savedSubject)
            ..set('week', plan.week)
            ..set('start', plan.start)
            ..set('end', plan.end)
            ..set('chapters', plan.chapters); // چون لیست int هست اوکیه

          await parsePlan.save();
        }
      } else {
        print("❌ خطا در ذخیره subject: ${subjectResponse.error?.message}");
      }
    }
  }

}
