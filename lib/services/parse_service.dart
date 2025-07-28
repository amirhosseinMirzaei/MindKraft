// services/parse_service.dart
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class ParseService {


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

}
