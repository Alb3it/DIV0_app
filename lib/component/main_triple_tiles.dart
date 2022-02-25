import 'package:flutter/material.dart';
import '../component/main_small_tile.dart';

class MainTripleTiles extends StatefulWidget {
  const MainTripleTiles({Key? key, required this.type, required this.order})
      : super(key: key);
  final int type, order;
  @override
  _MainTripleTilesState createState() => _MainTripleTilesState(type, order);
}

class _MainTripleTilesState extends State<MainTripleTiles> {
  final int type, order;
  _MainTripleTilesState(this.type, this.order);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MainSmallTile(type: type, order: order, icon: 0),
            MainSmallTile(type: type, order: order, icon: 1),
            MainSmallTile(type: type, order: order, icon: 2)
          ],
        ));
  }
}
