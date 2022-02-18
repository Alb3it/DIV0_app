import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class SelectPage extends StatefulWidget {
  const SelectPage({Key? key, required this.map}) : super(key: key);

  final Map map;

  @override
  _SelectPageState createState() => _SelectPageState(map);
}

class _SelectPageState extends State<SelectPage> {
  Map props;
  _SelectPageState(this.props);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select')),
      body: Center(
          child: Column(
        children: [Text(props['username']), Text(props['token'])],
      )),
    );
  }
}
