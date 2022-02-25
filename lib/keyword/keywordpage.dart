import 'package:flutter/material.dart';

class KeywordPage extends StatefulWidget {
  const KeywordPage({Key? key}) : super(key: key);

  @override
  _KeywordPageState createState() => _KeywordPageState();
}

class _KeywordPageState extends State<KeywordPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
            child:
                const Text('This is page not prepared yet. push to go initial'),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            }));
  }
}
