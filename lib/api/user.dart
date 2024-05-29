import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:home/models/user/user.dart';


class UserApi {
  final Dio _dio;

  UserApi(this._dio) {
    assert(_dio.options.baseUrl.isNotEmpty);
  }

  Future<User> createUser() async {
    try {
      final response = await _dio.post('user');
      return response.data!.map((json) => User.fromJson(json));
    } catch (e, s) {
      debugPrint("$e\n$s");
      throw ApiException("An api error occurred");
    }
  }

  // Future<List<User>> getUsers() async {
  //   try {
  //     final response = await _dio.get<List>("users");
  //     return response.data!.map((json) => User.fromJson(json)).toList();
  //   } catch (e, s) {
  //     debugPrint("$e\n$s");
  //     throw ApiException("An api error occurred");
  //   }
  // }
}

class ApiException {
  final String message;

  ApiException(this.message);
}
