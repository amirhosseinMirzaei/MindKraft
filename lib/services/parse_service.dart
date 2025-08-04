// services/parse_service.dart
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class ParseService {

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  Future<ParseResponse> signUp({
    required String fullName,
    required String email,
    required String phone,
    required String password,
  }) async {
    final user = ParseUser(email, password, email);
    user.set('fullName', fullName);
    user.set('phone', phone);

    final response = await user.signUp();
    return response;
  }

  Future<ParseResponse> login({
    required String email,
    required String password,
  }) async {
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

  Future<void> uploadExamFile(File file, String subjectId, DateTime examDate) async {
    final user = await ParseUser.currentUser() as ParseUser;
    final parseFile = ParseFile(file);
    await parseFile.save();

    final examNote = ParseObject('ExamNote')
      ..set('file', parseFile)
      ..set('subjectId', subjectId)
      ..set('examDate', examDate)
      ..set('user', user); // 🔥 اینجا یوزر رو ست می‌کنی

    final response = await examNote.save();

    if (response.success) {
      print("✅ فایل با موفقیت آپلود شد.");
    } else {
      print("❌ خطا: ${response.error?.message}");
    }
  }

}
