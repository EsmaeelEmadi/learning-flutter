import 'package:flutter/material.dart';
import 'package:home/api/client.dart';
import 'package:home/models/auth/auth.dart';

class AuthApi {
  final DioClient client;

  AuthApi({required this.client});

  Future<Credentials> login(String username, String password) async {
    try {
      final Credentials response = await client.login("auth/login", data : { 
        "username": username,
        "password": password,
      });
      return response;
    } catch (e, s) {
      throw ApiException("$e\n$s");
    }
  }
}

class ApiException {
  final String message;

  ApiException(this.message);
}
