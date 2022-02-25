import 'dart:convert';
import './selectpage.dart';
import './signuppage.dart';
import './loginpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      supportedLocales: [const Locale('ko')],
      locale: const Locale('ko'),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      title: 'Navigation Basics',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              color: Color(0xffe5e5e5),
              titleTextStyle: TextStyle(
                fontFamilyFallback: ['Noto', 'Montserrat'],
              )),
          textTheme: const TextTheme(
            bodyText2: TextStyle(
                color: Colors.black,
                fontFamilyFallback: ['Noto', 'Montserrat'],
                fontSize: 14,
                fontWeight: FontWeight.w400),
          )),
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
        child: Center(
          child: Text('auto loggin....'),
        ));
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
    Map statusUserjson = jsonDecode(statusUser);
    print('autologin' + statusUser);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) =>
                SelectPage(userInfo: statusUserjson)));
  } else {
    Navigator.pushReplacementNamed(context, '/login');
  }
}
