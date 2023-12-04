import 'package:flutter/material.dart';
import 'package:fithealth/Login/LoginPage.dart';
import 'package:fithealth/Index/MyHomepage.dart';
import 'package:fithealth/Conponment/Intrduction.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.deepPurple,
            unselectedItemColor: Colors.black26,
            selectedItemColor: Colors.deepPurpleAccent
        ),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: "Fitness"),
      // home: const LoginPage(),
      home: FitnessIntroScreen(),
    );
  }
}




