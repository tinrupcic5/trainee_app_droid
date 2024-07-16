import 'package:shared_preferences/shared_preferences.dart';
import 'package:trainee_app/features/auth/data/api/model/user/UserLogin.dart';

class SharedPrefsManager {
  Future<void> saveUserTokenToLocalCache(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_token', token);
    print('User Token saved to local cache');
  }

  Future<void> saveUserLoginToLocalCache(
      String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_username', username);
    await prefs.setString('user_password', password);
    print('Username and password stored to local cache');
  }

  Future<void> deleteUserLoginFromLocalCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_username');
    await prefs.remove('user_password');
  }

  Future<void> deleteUserTokenFromLocalCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_token');
  }

  Future<UserLogin> getUserLoginFromLocalCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? username = prefs.getString('user_username');
    String? password = prefs.getString('user_password');

    return UserLogin(userName: username!, password: password!);
  }

  Future<String> getUserTokenFromLocalCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('user_token');
    return token!;
  }
}
