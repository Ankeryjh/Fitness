import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fithealth/Conponment/Circlechart.dart';

class Yogapage extends StatefulWidget {
  @override
  _YogapageState createState() => _YogapageState();
}

class _YogapageState extends State<Yogapage> {
  int _countdownSeconds = 3;
  Timer _countdownTimer = Timer(Duration.zero, () {});
  Timer _exerciseTimer = Timer(Duration.zero, () {});
  int _exerciseSeconds = 0;
  int _caloriesBurned = 0;
  int _heartRate = 0;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    _exerciseTimer?.cancel();
    super.dispose();
  }

  void _startCountdown() {
    const oneSec = const Duration(seconds: 1);
    _countdownTimer = Timer.periodic(
      oneSec,
          (Timer timer) =>
          setState(() {
            if (_countdownSeconds < 1) {
              _countdownTimer.cancel();
              _startExercise();
            } else {
              _countdownSeconds = _countdownSeconds - 1;
            }
          }),
    );
  }

  void _startExercise() {
    const oneSec = const Duration(seconds: 1);
    _exerciseTimer = Timer.periodic(
      oneSec,
          (Timer timer) =>
          setState(() {
            _exerciseSeconds++;
            _caloriesBurned = _exerciseSeconds ~/ 10;
            _heartRate = 60 + _exerciseSeconds;
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yogapage'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          _buildCountdownOverlay(),
          _buildExerciseTimer(),
          _buildCaloriesBurned(),
          _buildHeartRate(),
          Positioned(
            top: 20,
            left: 20,
            child: SizedBox(
              width: 150,
              height: 150,
              child: CustomPaint(
                painter: TripleCircularProgressBar(
                  strokeWidth: 10,
                  exerciseValue: 0.8,
                  caloriesValue: 0.3,
                  heartRateValue: 0.1,
                  exerciseColor: Colors.blue,
                  caloriesColor: Colors.red,
                  heartRateColor: Colors.green,
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Yoga Exercise',
                  style: TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Image.asset(
                  'assets/images/Fitgirl_14.png',
                  height: 250,
                  width: 250,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCountdownOverlay() {
    return _countdownSeconds > 0
        ? Container(

      color: Colors.greenAccent,
      child: Center(
        child: Text(
          '$_countdownSeconds',
          style: TextStyle(
            fontSize: 150.0,
            color: Colors.black,
          ),
        ),
      ),
    )
        : Container();
  }

  Widget _buildExerciseTimer() {
    return Positioned(
      bottom: 20,
      left: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Exercise Time',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '${_exerciseSeconds ~/ 60}:${(_exerciseSeconds % 60)
                .toString()
                .padLeft(2, '0')}',
            style: TextStyle(
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCaloriesBurned() {
    return Positioned(
      bottom: 20,
      right: 20,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.local_fire_department,
            size: 50,
            color: Colors.redAccent,
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Calories Burned',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
              SizedBox(width: 10),
              Text(
                '$_caloriesBurned kcal',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeartRate() {
    return Positioned(
      top: 20,
      right: 20,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite,
            size: 50,
            color: Colors.redAccent,
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Heart Rate',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
              SizedBox(width: 10),
              Text(
                '$_heartRate bpm',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}