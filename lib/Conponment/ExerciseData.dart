
class Exercise {
  final String name;
  final String duration;
  final String calories;
  final String date;
  Exercise({
    required this.name,
    required this.duration,
    required this.calories,
    required this.date
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'duration': duration,
      'calories': calories,
      'date':date
    };
  }
}
class Food {
  final String time;
  final String food;
  final String calories;
  final String date;

  Food({
    required this.time,
    required this.food,
    required this.calories,
    required this.date
  });

  Map<String, dynamic> toMap() {
    return {
      'time': time,
      'food': food,
      'calories':calories,
      'date':date
    };
  }

}