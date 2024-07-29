import 'package:json_annotation/json_annotation.dart';

part 'message_body.g.dart';

@JsonSerializable()
class MessageBody {
  // Define fields here
  MessageBody();

  factory MessageBody.fromJson(Map<String, dynamic> json) =>
      _$MessageBodyFromJson(json);
  Map<String, dynamic> toJson() => _$MessageBodyToJson(this);
}
