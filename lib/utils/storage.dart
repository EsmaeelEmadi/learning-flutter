import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage {
  static const String _accessTokenKey = 'accessTokenKey';
  static const String _expiresIn = 'expiresIn';
  static const String _refreshTokenKey = 'refreshToken';
  static const String _refreshExpiresIn = "refreshExpiresIn";
  static const String _issuedAt = "issuedAt";

  // Save accessToken and refreshToken
  static Future<void> saveTokens(
    String? accessToken,
    String? expiresIn,
    String? refreshToken,
    String? refreshExpiresIn,
    String? issuedAt,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_accessTokenKey, accessToken ?? '');
    await prefs.setString(_expiresIn, expiresIn ?? '');
    await prefs.setString(_refreshTokenKey, refreshToken ?? '');
    await prefs.setString(_refreshExpiresIn, refreshExpiresIn ?? '');
    await prefs.setString(_issuedAt, issuedAt ?? '');
  }

  // Retrieve accessToken
  static Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_accessTokenKey);
  }

  static Future<String?> getAccessExpiresIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_expiresIn);
  }

  // Retrieve refreshToken
  static Future<String?> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_refreshTokenKey);
  }

  static Future<String?> getRefreshExpiresIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_refreshExpiresIn);
  }

  static Future<String?> getIssuedAt() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_issuedAt);
  }

  // Clear tokens
  static Future<void> clearTokens() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_accessTokenKey);
    await prefs.remove(_expiresIn);
    await prefs.remove(_refreshTokenKey);
    await prefs.remove(_refreshExpiresIn);
    await prefs.remove(_issuedAt);
  }
}
