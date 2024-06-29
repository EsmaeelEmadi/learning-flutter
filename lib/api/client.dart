import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:home/models/auth/auth.dart';
import 'package:home/utils/storage.dart';

class DioClient {
  DioClient();

  final Dio _dio = Dio(BaseOptions(
      baseUrl: dotenv.env["BASE_URL"] ?? "NOT FOUND",
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      responseType: ResponseType.json));

  Future<bool> isAuthenticated() async {
    String? accessToken = await TokenStorage.getAccessToken();
    String? refreshToken = await TokenStorage.getRefreshToken();

    if (accessToken == null || refreshToken == null) {
      return false;
    }

    final cred = {'accessToken': accessToken, 'refreshToken': refreshToken};

    final response = await _dio.post('auth/refresh', data: cred);

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        Credentials credentials = Credentials.fromJson(response.data);
        await TokenStorage.saveTokens(
          credentials.accessToken?.accessToken,
          credentials.accessToken?.expiresIn,
          credentials.refreshToken?.refreshToken,
          credentials.refreshToken?.refreshExpiresIn,
          credentials.issuedAt,
        );
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future get(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    try {
      String? accessToken = await TokenStorage.getAccessToken();

      // Create Options if not provided
      options ??= Options();

      // Add the access token to the headers
      options.headers = {
        ...?options.headers,
        'Authorization': 'Bearer $accessToken',
      };

      final response = await _dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
      throw "something went wrong";
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        if (e.requestOptions.headers['Retried'] != null) {
          throw (e);
        }

        final cred = {
          'accessToken': await TokenStorage.getAccessToken(),
          'refreshToken': await TokenStorage.getRefreshToken()
        };

        try {
          final response = await _dio.post('auth/refresh', data: cred);

          if (response.statusCode == 200 || response.statusCode == 201) {
            Credentials credentials = Credentials.fromJson(response.data);
            await TokenStorage.saveTokens(
              credentials.accessToken?.accessToken,
              credentials.accessToken?.expiresIn,
              credentials.refreshToken?.refreshToken,
              credentials.refreshToken?.refreshExpiresIn,
              credentials.issuedAt,
            );

            options ??= Options();

            options.headers = {
              ...?options.headers,
              'Authorization': 'Bearer ${TokenStorage.getAccessToken()}',
              "Retried": "true"
            };

            final res = await get(
              path,
              data: data,
              queryParameters: queryParameters,
              options: options,
              cancelToken: cancelToken,
              onReceiveProgress: onReceiveProgress,
            );

            return res.data;
          } else {
            rethrow;
          }
        } catch (e) {
          throw (e);
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Credentials> login(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    try {
      final Response response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        Credentials credentials = Credentials.fromJson(response.data);

        await TokenStorage.saveTokens(
          credentials.accessToken?.accessToken,
          credentials.accessToken?.expiresIn,
          credentials.refreshToken?.refreshToken,
          credentials.refreshToken?.refreshExpiresIn,
          credentials.issuedAt,
        );

        return credentials;
      }

      print("??????????????????");
      print("something went wrong");
      throw "something went wrong";
    } catch (e) {
      print("================");
      print(e);
      rethrow;
    }
  }
}
