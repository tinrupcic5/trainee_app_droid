class TrainingLevel {
  final int? id;
  final String trainingLevelClassification;

  TrainingLevel({required this.id, required this.trainingLevelClassification});

  factory TrainingLevel.fromJson(Map<String, dynamic> json) {
    return TrainingLevel(
      id: json['id'],
      trainingLevelClassification: json['trainingLevelClassification'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'trainingLevelClassification': trainingLevelClassification,
    };
  }
}
