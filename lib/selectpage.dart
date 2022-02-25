import 'dart:convert';
import './maincontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class SelectPage extends StatefulWidget {
  SelectPage({Key? key, required this.userInfo}) : super(key: key);

  final Map userInfo;

  @override
  _SelectPageState createState() => _SelectPageState(userInfo);
}

class _SelectPageState extends State<SelectPage> {
  Map userInfo;
  _SelectPageState(this.userInfo);
  void logout() async {
    const storage = FlutterSecureStorage();
    storage.delete(key: jsonEncode(userInfo));
    Navigator.pushReplacementNamed(context, '/login');
  }

  void gotoMain() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) =>
                MainContainer(userInfo: userInfo)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select')),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(onPressed: gotoMain, child: const Text('고메 정식당')),
          ElevatedButton(onPressed: logout, child: const Text('logout')),
        ],
      )),
    );
  }
}
