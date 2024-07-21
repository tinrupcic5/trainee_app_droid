import 'package:trainee_app/features/auth/data/api/model/user/userdetails/UserDetails.dart';

class UserLoginResponse {
  final UserDetails userDetails;
  final String token;
  final String? qrData;
  final String refreshToken;

  UserLoginResponse({
    required this.userDetails,
    required this.token,
    this.qrData,
    required this.refreshToken,
  });

  factory UserLoginResponse.fromJson(Map<String, dynamic> json) {
    return UserLoginResponse(
      userDetails: UserDetails.fromJson(json['userDetails']),
      token: json['token'],
      qrData: json['qrData'] != null ? json['qrData'] as String : null,
      refreshToken: json['refreshToken'],
    );
  }
}
