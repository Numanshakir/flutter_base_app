import 'package:buypass_seller/src/core/local/repository/shared_pref_repository.dart';
import 'package:buypass_seller/src/core/local/providers/shared_pref.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
abstract interface class SharedPrefService {
  Future<bool> setIsLogin();

  bool get isLogin;

  Future<bool> setAccessToken(String token);

  String? get accessToken;

  Future<void> setIsFirstTime(bool value);

  bool getIsFirstTime();

  Future<bool> clearAllData();

  Future<void> saveUserId(String userId);

  String get getUserId;

  Future<void> removeUserId(String userType);
}

final localDataProvider = Provider<SharedPrefService>(
  (ref) => SharedPreferencesService(
    ref.read(sharedPreferencesProvider).requireValue,
  ),
);
