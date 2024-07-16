import 'package:trainee_app/features/auth/data/api/model/user/UserDetailsRegisterRequest.dart';

class UserRegisterRequest {
  final String userName;
  final String password;
  final String role;
  final UserDetailsRegisterRequest userDetails;
  final String language;

  UserRegisterRequest({
    required this.userName,
    required this.password,
    required this.role,
    required this.userDetails,
    required this.language,
  });
}
