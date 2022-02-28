class WeightModel {
  String weight;
  String date;

  String id;

  WeightModel({
    required this.weight,
    required this.date,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'weight': weight,
      'date': date,
      'id': id,
    };
  }

  factory WeightModel.fromMap(Map<String, dynamic> map) {
    return WeightModel(
      weight: map['weight'] as String,
      date: map['date'] as String,
      id: map['id'] as String,
    );
  }
}
