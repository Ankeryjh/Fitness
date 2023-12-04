import 'package:flutter/material.dart';
import 'package:fithealth/Index/MyHomepage.dart';
import 'package:fithealth/Login/RegistePage.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _errorMessage;

  Future<Database>? _database;

  @override
  void initState() {
    super.initState();
    _openDatabase();
  }

  Future<void> _openDatabase() async {
    _database = openDatabase(
      join(await getDatabasesPath(), 'user_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY, username TEXT, password TEXT)',
        );
      },
      version: 1,
    );
  }


  Future<bool> _checkUser(String username, String password) async {
    final db = await _database;
    final List<Map<String, dynamic>>? users =
    await db?.rawQuery('SELECT * FROM users WHERE username = ? AND password = ?', [username, password]);
    return users?.isNotEmpty ?? false;
  }
  void _onLoginPressed(BuildContext context) {
    final username = _usernameController.text;
    final password = _passwordController.text;

    if ((username == '1211020035' || username == '1211020069') && password == '123456') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage(title: "Fitness")),
      );
    } else {
      setState(() {
        _errorMessage = '用户名或密码错误，请重试。';
      });
    }
  }

  void _onRegisterPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegistePage()),
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
            'Fitness',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurpleAccent),
          ),
        ),

        body: Stack(
          children: [
            Image.asset(
              'assets/images/loginbgc.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                // color: Colors.white.withOpacity(0.2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 40),
                  Text(
                    'Welcome to Fitness',
                    style: TextStyle(
                      color: Color(0xFF756b8a),
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      fontFamily: AutofillHints.addressCityAndState,
                    ),
                    textAlign: TextAlign.left,
                    selectionColor: Colors.deepPurple,
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
                  if (_errorMessage != null)
                    Text(
                      _errorMessage!,
                      style: TextStyle(color: Colors.red),
                    ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text('Forgot Password'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => _onLoginPressed(context),
                    child: Text(
                      'Login in',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () => _onRegisterPressed(context),
                    child: Text(
                      'register',
                      style: TextStyle(fontSize: 18),
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
