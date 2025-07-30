// services/parse_service.dart
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

}
