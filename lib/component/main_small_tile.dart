import 'package:flutter/material.dart';
import '../variables/variables.dart';

class MainSmallTile extends StatefulWidget {
  const MainSmallTile(
      {Key? key, required this.type, required this.order, required this.icon})
      : super(key: key);
  final int type, order, icon;
  @override
  _MainSmallTileState createState() => _MainSmallTileState(type, order, icon);
}

class _MainSmallTileState extends State<MainSmallTile> {
  final int type, order, icon;
  _MainSmallTileState(this.type, this.order, this.icon);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 105,
        height: 105,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 40,
                offset: const Offset(0, 20)),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            mainSmallTileIcon[type][order][icon],
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(mainSmallTileTitle[type][order][icon]),
            ),
            Text(mainSmallTileValue[type][order][icon],
                style: const TextStyle(fontSize: 12, color: Color(0xffaaaaaa)))
          ],
        ));
  }
}
