import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:unitask/app/app_strings.dart';
import 'package:unitask/core/models/result.dart';
import 'package:unitask/models/auth_data.dart';

class AuthApiService {
  final String _signupUrl = '${AppStrings.apiHostUrl}/students/signup';
  final String _loginUrl = '${AppStrings.apiHostUrl}/students/login';

  Future<Result<void>> signup({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      //api던지고 성공
      final response = await http.post(
        Uri.parse(_signupUrl),
        body: jsonEncode({'email': email, 'password': password, 'name': name}),
      ); //url의 타입이 uri라 파싱
      final statusCode = response.statusCode;

      if (response.statusCode != 200) {
        return Failure(Exception('계정 생성을 실패했습니다.'));
      }
      return const Success(null);
    } on Exception catch (e) {
      return Failure(e);
    }
  }

  Future<Result<AuthData?>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(_loginUrl),
        body: jsonEncode({'email': email, 'password': password}),
      );

      final statusCode = response.statusCode;

      if (statusCode != 200) {
        debugPrint('로그인 API 에러: ${response.body}');
      }

      debugPrint('로그인 API 성공');

      final authData = AuthData.fromJson(response.body);
      // 방법 1
      return Success(authData);

      /* // 방법 2
    final jsonBody = jsonDecode(response.body);
    final authData = jsonDecode(response.body); */
    } on Exception catch (e) {
      return Failure(e);
    }
  }
}
