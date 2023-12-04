import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:fithealth/Conponment/Animition.dart';

void main() {
  runApp(MaterialApp(
    home: ExerciseCalendarPage(),
    theme: ThemeData(
      primarySwatch: Colors.blue,
      hintColor: Colors.orange,
      cardTheme: CardTheme(
        color: Colors.blue.shade100,
      ),
      textTheme: TextTheme(
        headline6: TextStyle(color: Colors.white),
      ),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
      ),
    ),
  ));
}

class ExerciseCalendarPage extends StatefulWidget {
  @override
  _ExerciseCalendarPageState createState() => _ExerciseCalendarPageState();
}

class _ExerciseCalendarPageState extends State<ExerciseCalendarPage> {
  DateTime _selectedDate = DateTime.now();
  String _formattedDate = '';

  Map<DateTime, Map<String, List<String>>> _data = {
    DateTime.utc(2023, 6, 7): {
      'exercise': ['Cycling', '45 min', 'Running', '45 min', 'Swimming', '30 min'],
      'food': ['Dinner', 'Grilled salmon, veggies', '600 kcal'],
    },
    DateTime.utc(2023, 6,6 ): {
      'exercise': ['Running', '30 min', 'Yoga', '60 min','Box','50 min'],
      'food': ['Breakfast', 'Oatmeal, banana', 'Lunch', 'Grilled chicken, salad, rice'],
    },
    DateTime.utc(2023, 6,5 ): {
      'exercise': ['Volleyball', '50 min', 'Basketball', '60 min','Barbell','50 min'],
      'food': ['Breakfast', '2 egg, milk,toast ', 'Lunch', 'Grilled Beff, salad, rice'],
    },
    DateTime.utc(2023, 6,4 ): {
      'exercise': ['Baseball', '20 min', 'Yoga', '60 min','Box','50 min'],
      'food': ['Breakfast', 'Oatmeal, banana', 'Lunch', 'Grilled chicken, salad, rice'],
    },
  };

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _formattedDate = DateFormat.yMMMMd().format(_selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    Map<String, List<String>> selectedData =
        _data[_selectedDate] ?? {'exercise': [], 'food': []};
    List<String> exerciseData = selectedData['exercise'] ?? [];
    List<String> foodData = selectedData['food'] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise Calendar Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2021, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: DateTime.now(),
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDate, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDate= selectedDay;
                  _formattedDate = DateFormat.yMMMMd().format(selectedDay);
                });
              },
              eventLoader: (day) => _data[day]?.keys?.toList() ?? [],
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: Theme.of(context).hintColor,
                  shape: BoxShape.circle,
                ),
                selectedTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Selected Date: $_formattedDate',
                style: TextStyle(fontSize: 18),
              ),
            ),
            if (exerciseData.isNotEmpty)
              buildSectionTitle('Exercise', Icons.directions_run),
            for (int i = 0; i < exerciseData.length-1; i += 2)
              buildAnimatedCard(exerciseData[i], exerciseData[i + 1], '',
                  Duration(milliseconds: 500)),
            if (foodData.isNotEmpty)
              buildSectionTitle('Food', Icons.fastfood),
            for (int i = 0; i < foodData.length-1; i += 2)
              buildAnimatedCard(foodData[i], foodData[i + 1], '',
                  Duration(milliseconds: 500)),
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).hintColor),
          SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget buildAnimatedCard(String title, String subtitle, String trailingText,
      Duration duration) {
    return AnimatedCard(
      title: title,
      subtitle: subtitle,
      trailingText: trailingText,
      duration: duration,
    );
  }

}