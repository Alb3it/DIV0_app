// ignore_for_file: prefer_const_constructors

import 'package:bloody_head/signuppage.dart';
import './signuppage.dart';
import './loginpage.dart';
import './maincontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Basics',
      routes: {
        '/': (context) => SplashPage(),
        '/login': (context) => LoginPage(),
        '/login/signup': (context) => SignupPage(),
      },
    );
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () => checkUser(context));
  }

  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber[200],
    );
  }
}

void checkUser(context) async {
  final storage = FlutterSecureStorage();
  print('${await storage.readAll()}');
  Map<String, String> allStorage = await storage.readAll();
  String statusUser = '';
  if (allStorage != null) {
    allStorage.forEach((k, v) {
      if (v == 'STATUS_LOGIN') statusUser = k;
    });
  } else {
    Navigator.pushReplacementNamed(context, '/login');
  }
  if (statusUser != null && statusUser != '') {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => MainContainer(
                  username: statusUser,
                )));
  } else {
    Navigator.pushReplacementNamed(context, '/login');
  }
}
