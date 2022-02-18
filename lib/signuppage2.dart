import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './Toast.dart' as Toast;

class SignupPage2 extends StatefulWidget {
  const SignupPage2({Key? key, required this.pn, required this.ct})
      : super(key: key);

  final String pn;
  final String ct;

  @override
  _SignupPage2State createState() => _SignupPage2State(pn, ct);
}

class _SignupPage2State extends State<SignupPage2> {
  String pn;
  String ct;
  _SignupPage2State(this.pn, this.ct);

  static final TextEditingController _username = TextEditingController();
  static final TextEditingController _email = TextEditingController();
  static final TextEditingController _pw = TextEditingController();

  String get username => _username.text;
  String get email => _email.text;
  String get pw => _pw.text;

  void trySignup() async {
    String url = 'http://test.divo.kr/auth/register/telephone/';
    http.Response res = await http.post(Uri.parse(url), body: {
      'certificateCode': ct,
      'phoneNumber': pn,
      'username': username,
      'email': email,
      'password': pw,
    });
    print(res.body);
    Map response = jsonDecode(res.body);
    if (response['message'] == 'success') {
      Navigator.pushReplacementNamed(context, '/login');
    } else {
      Toast.Message('Error Occured. Please Do it Again');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Write info')),
        body: Center(
          child: Column(children: [
            TextField(
              controller: _username,
              decoration: const InputDecoration(hintText: 'Write Username'),
            ),
            TextField(
              controller: _email,
              decoration: const InputDecoration(hintText: 'Write Email'),
            ),
            TextField(
              controller: _pw,
              decoration: const InputDecoration(hintText: 'Write PW'),
            ),
            ElevatedButton(onPressed: trySignup, child: const Text('Sign Up')),
          ]),
        ));
  }
}
