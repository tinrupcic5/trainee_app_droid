class School {
  final int? id;
  final String schoolName;

  School({
    required this.id,
    required this.schoolName,
  });

  factory School.fromJson(Map<String, dynamic> json) {
    return School(
      id: json['id'],
      schoolName: json['schoolName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'schoolName': schoolName,
    };
  }
}
