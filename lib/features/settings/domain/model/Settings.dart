class Settings {
  final int? id;
  final String language;

  Settings({
    this.id,
    required this.language,
  });

  factory Settings.fromJson(Map<String, dynamic> json) {
    return Settings(
      id: json['id'],
      language: json['language'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'language': language,
    };
  }
}
