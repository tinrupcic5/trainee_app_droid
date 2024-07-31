import 'package:json_annotation/json_annotation.dart';
import 'package:trainee_app/features/school/domain/models/School.dart';

part 'profile_image.g.dart';

@JsonSerializable()
class ProfileImage {
  final int? id;
  final String name;
  final School school;
  final String uri;
  final String suffix;
  final String classPath;
  final String createdAt;

  ProfileImage({
    this.id,
    required this.name,
    required this.school,
    required this.uri,
    required this.suffix,
    required this.classPath,
    required this.createdAt,
  });

  // From JSON
  factory ProfileImage.fromJson(Map<String, dynamic> json) =>
      _$ProfileImageFromJson(json);

  // To JSON
  Map<String, dynamic> toJson() => _$ProfileImageToJson(this);
}
