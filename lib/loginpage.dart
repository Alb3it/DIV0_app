import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';
import './selectpage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String url = 'https://test.divo.kr/auth/login/';

  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  void tryLogin() async {
    http.Response res = await http.post(Uri.parse(url), body: <String, String>{
      'email': id,
      'password': pw,
    });
    String response = utf8.decode(res.bodyBytes);
    print('fffffffffffffffffffffffff' + response);
    Map responsejson = jsonDecode(response);
    if (responsejson['message'] == 'success') {
      const storage = FlutterSecureStorage();
      storage.write(key: response, value: 'STATUS_LOGIN');
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  SelectPage(userInfo: responsejson)));
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
