import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:trainee_app/features/auth/data/api/model/user/UserLogin.dart';
import 'package:trainee_app/features/auth/data/api/model/user/userdetails/UserDetails.dart';

class SharedPrefsManager {
  //TOKEN//
  Future<void> saveUserTokenToLocalCache(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_token', token);
    print('User Token saved to local cache');
  }

  Future<void> deleteUserTokenFromLocalCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_token');
  }

  Future<String> getUserTokenFromLocalCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('user_token');
    return token!;
  }

  //USER//
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

  Future<UserLogin> getUserLoginFromLocalCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? username = prefs.getString('user_username') ?? "";
    String? password = prefs.getString('user_password') ?? "";

    return UserLogin(userName: username, password: password);
  }

  //USER DETAILS//
  Future<void> saveUserDetailsToLocalCache(UserDetails userDetails) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userDetailsJson = jsonEncode(userDetails.toJson());
    await prefs.setString('user_details', userDetailsJson);
    print('User details stored to local cache');
  }

  Future<UserDetails?> getUserDetailsFromLocalCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userDetailsJson = prefs.getString('user_details');
    if (userDetailsJson != null) {
      Map<String, dynamic> userDetailsMap = jsonDecode(userDetailsJson);
      return UserDetails.fromJson(userDetailsMap);
    }
    return null;
  }

  Future<void> deleteUserDetailsFromLocalCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_details');
    print('User details removed from local cache');
  }

  //QR DATA//
  Future<void> saveQrCodeToLocalCache(String qrData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('qr_data', qrData);
    print('QR data stored to local cache');
  }

  Future<String> getQrCodeFromLocalCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? qrData = prefs.getString('qr_data');
    return qrData!;
  }

  Future<void> deleteQrCodeFromLocalCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('qr_data');
    print('QR data removed from local cache');
  }

  Future<void> deleteAllCache() async {
    await deleteQrCodeFromLocalCache();
    await deleteUserDetailsFromLocalCache();
    await deleteUserLoginFromLocalCache();
    await deleteUserTokenFromLocalCache();
    print('Everything removed from local cache');
  }
}
