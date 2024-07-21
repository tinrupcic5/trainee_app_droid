import 'package:json_annotation/json_annotation.dart';

part 'SchoolRequest.g.dart';

@JsonSerializable()
class SchoolRequest {
  final int? schoolId;
  final String schoolName;

  SchoolRequest({
    this.schoolId,
    required this.schoolName,
  });

  // From JSON
  factory SchoolRequest.fromJson(Map<String, dynamic> json) =>
      _$SchoolRequestFromJson(json);

  // To JSON
  Map<String, dynamic> toJson() => _$SchoolRequestToJson(this);
}
