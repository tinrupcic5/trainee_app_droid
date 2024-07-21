class AuthHeaderRequest {
  final String header;

  AuthHeaderRequest({
    required this.header,
  });

  factory AuthHeaderRequest.fromJson(Map<String, dynamic> json) {
    return AuthHeaderRequest(
      header: json['header'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'header': header,
    };
  }
}
