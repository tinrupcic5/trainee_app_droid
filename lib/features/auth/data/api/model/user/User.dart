import 'package:trainee_app/features/auth/data/api/model/role/Role.dart';

class User {
  final int? id;
  final String userName;
  final String createdAt;
  final String lastTimeOnline;
  final Role role;

  User({
    required this.id,
    required this.userName,
    required this.createdAt,
    required this.lastTimeOnline,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      userName: json['userName'],
      createdAt: json['createdAt'],
      lastTimeOnline: json['lastTimeOnline'],
      role: Role.fromJson(json['role']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'createdAt': createdAt,
      'lastTimeOnline': lastTimeOnline,
      'role': role.toJson(),
    };
  }
}
