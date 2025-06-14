class Workout {
  String title;
  String category;
  int duration;
  DateTime date;

  Workout({
    required this.title,
    required this.category,
    required this.duration,
    required this.date,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'category': category,
        'duration': duration,
        'date': date.toIso8601String(),
      };

  factory Workout.fromJson(Map<String, dynamic> json) => Workout(
        title: json['title'],
        category: json['category'],
        duration: json['duration'],
        date: DateTime.parse(json['date']),
      );
}