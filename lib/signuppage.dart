import 'dart:convert';
import 'package:bloody_head/signuppage2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './Toast.dart' as Toast;

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  void reSend() async {
    String url = 'http://test.divo.kr/auth/register/message/' + phonenumber;
    await http.get(Uri.parse(url));
    Toast.Message("Message Sended");
  }

  void checkCert() async {
    String url = 'http://test.divo.kr/auth/register/message/' + phonenumber;
    http.Response res = await http.post(
      Uri.parse(url),
      body: {'certificateCode': cert},
    );
    Map message = jsonDecode(res.body);
    if (message['message'] == 'success') {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  SignupPage2(pn: phonenumber, ct: cert)));
    } else {
      Toast.Message("Wrong Number");
    }
  }

  static final TextEditingController _phonenumber = TextEditingController();
  static final TextEditingController _cert = TextEditingController();

  String get phonenumber => _phonenumber.text;
  String get cert => _cert.text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('signup')),
        body: SingleChildScrollView(
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
              TextField(
                controller: _phonenumber,
                decoration:
                    const InputDecoration(hintText: 'Enter your Phonenumber'),
              ),
              TextField(
                controller: _cert,
                decoration: const InputDecoration(
                    hintText: 'Enter your Certification number'),
              ),
              ElevatedButton(
                child: const Text('re-send'),
                onPressed: reSend,
              ),
              ElevatedButton(
                child: const Text('Certification'),
                onPressed: checkCert,
              ),
            ]))));
  }
}
