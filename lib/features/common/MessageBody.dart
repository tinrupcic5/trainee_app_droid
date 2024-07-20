class MessageBody {
  final String message;

  MessageBody({
    required this.message,
  });

  factory MessageBody.fromJson(Map<String, dynamic> json) {
    return MessageBody(
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
    };
  }
}
