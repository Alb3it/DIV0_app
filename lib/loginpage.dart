import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import './selectpage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String url = 'http://test.divo.kr/auth/login/';

  void tryLogin() async {
    http.Response res = await http.post(Uri.parse(url), body: <String, String>{
      'email': id,
      'password': pw,
    });
    print(res.body);
    Map response = jsonDecode(res.body);
    if (response['message'] == 'success') {
      const storage = FlutterSecureStorage();
      storage.write(key: response['username'], value: 'STATUS_LOGIN');
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => SelectPage(map: response)));
    }
  }

  void navigatetoSignup() async {
    Navigator.pushNamed(context, '/login/signup');
  }

  static final TextEditingController _id = TextEditingController();
  static final TextEditingController _pw = TextEditingController();

  String get id => _id.text;
  String get pw => _pw.text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('login')),
        body: SingleChildScrollView(
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
              TextField(
                controller: _id,
                decoration:
                    const InputDecoration(hintText: 'Enter your E-mail'),
              ),
              TextField(
                controller: _pw,
                decoration: const InputDecoration(hintText: 'Enter your PW'),
              ),
              ElevatedButton(
                child: const Text('Login'),
                onPressed: tryLogin,
              ),
              ElevatedButton(
                  onPressed: navigatetoSignup, child: const Text('sign up'))
            ]))));
  }
}
