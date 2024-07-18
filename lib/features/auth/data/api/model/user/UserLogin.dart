import 'package:json_annotation/json_annotation.dart';

part 'UserLogin.g.dart';

@JsonSerializable()
class UserLogin {
  final String userName;
  final String password;

  UserLogin({required this.userName, required this.password});

  factory UserLogin.fromJson(Map<String, dynamic> json) =>
      _$UserLoginFromJson(json);
  Map<String, dynamic> toJson() => _$UserLoginToJson(this);
}
