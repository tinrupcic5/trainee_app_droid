import 'package:json_annotation/json_annotation.dart';
part 'School.g.dart';

@JsonSerializable()
class School {
  final int id;
  final String schoolName;

  School({
    required this.id,
    required this.schoolName,
  });

  // From JSON
  factory School.fromJson(Map<String, dynamic> json) => _$SchoolFromJson(json);

  // To JSON
  Map<String, dynamic> toJson() => _$SchoolToJson(this);
}
