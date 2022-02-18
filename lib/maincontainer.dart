import 'package:flutter/material.dart';

class MainContainer extends StatefulWidget {
  const MainContainer({Key? key, required this.username}) : super(key: key);

  final String username;

  @override
  _MainContainerState createState() => _MainContainerState(username);
}

class _MainContainerState extends State<MainContainer> {
  String username;
  _MainContainerState(this.username);
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
