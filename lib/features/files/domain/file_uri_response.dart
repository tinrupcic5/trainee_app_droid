import 'package:json_annotation/json_annotation.dart';

part 'file_uri_response.g.dart';

@JsonSerializable()
class FileUriResponse {
  final String type;
  final String? classPath;
  final String? name;
  final String? suffix;
  final String? uri;
  final String? contentComment;
  final String? notificationMessage;

  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  final DateTime createdAt;

  FileUriResponse({
    required this.type,
    this.classPath,
    this.name,
    this.suffix,
    this.uri,
    this.contentComment,
    this.notificationMessage,
    required this.createdAt,
  });

  // JSON serialization
  factory FileUriResponse.fromJson(Map<String, dynamic> json) =>
      _$FileUriResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FileUriResponseToJson(this);

  // Custom date parsing
  static DateTime _fromJson(String date) => DateTime.parse(date);
  static String _toJson(DateTime date) => date.toIso8601String();
}
