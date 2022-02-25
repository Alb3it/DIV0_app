import 'package:flutter/material.dart';
import '../variables/variables.dart';

class MainSmallTitle extends StatefulWidget {
  const MainSmallTitle({Key? key, required this.type, required this.order})
      : super(key: key);
  final int type;
  final int order;
  @override
  _MainSmallTitleState createState() => _MainSmallTitleState(type, order);
}

class _MainSmallTitleState extends State<MainSmallTitle> {
  final int type;
  final int order;
  _MainSmallTitleState(this.type, this.order);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 40, left: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              mainSmallTitle[type][order],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            )
          ],
        ));
  }
}
