import 'dart:ui';
import 'package:fithealth/Login/LoginPage.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart' as sqflite_ffi;

class RegistePage extends StatefulWidget {

  const RegistePage({Key? key}) : super(key: key);

  @override
  _RegistePageState createState() => _RegistePageState();
}
class _RegistePageState extends State<RegistePage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  void initState() {
    super.initState();
    _openDatabase();
  }
  Database?  _database;

  Future<void> _openDatabase() async {

    sqflite_ffi.sqfliteFfiInit();
    databaseFactory = sqflite_ffi.databaseFactoryFfi;

    _database = await openDatabase(
      join(await getDatabasesPath(), 'user_database.db'),
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY, username TEXT, password TEXT)',
        );
      },
    );
  }
  Future<void> _insertUser(String username, String password) async {
    final db = await openDatabase(
      join(await getDatabasesPath(), 'user_database.db'),
      version: 1,
    );
    await db.insert(
      'users',
      {'username': username, 'password': password},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    await db.close();
  }


  void _onRegisterPressed(BuildContext context) {
    final username = _usernameController.text;
    final password = _passwordController.text;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Registration Successful'),
          content: Text('successfully registered.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Registration',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.orangeAccent
          ),
        ),
      ),
      body: Stack(
        children: [
          // background image with blur effect
          Image.asset(
            'assets/images/registerbgc.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),
                Text(
                  'Registration',
                  style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: AutofillHints.addressCityAndState,
                  ),
                  textAlign: TextAlign.left,
                  selectionColor: Colors.orangeAccent,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed:()=> _onRegisterPressed(context),
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 18,color: Colors.orangeAccent
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


}