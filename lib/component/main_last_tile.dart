import 'package:flutter/material.dart';
import '../variables/variables.dart';

class MainLastTile extends StatefulWidget {
  const MainLastTile(
      {Key? key, required this.type, required this.order, required this.up})
      : super(key: key);
  final int type, order;
  final bool up;
  @override
  _MainLastTileState createState() => _MainLastTileState(type, order, up);
}

class _MainLastTileState extends State<MainLastTile> {
  final int type, order;
  final bool up;
  _MainLastTileState(this.type, this.order, this.up);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        width: 345,
        height: 75,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 40,
              offset: const Offset(0, 20)),
        ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Container(
                      width: 3,
                      height: 35,
                      decoration: BoxDecoration(
                        color: up ? Color(0xffff6961) : Color(0xff6093ac),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(3),
                            bottomRight: Radius.circular(3)),
                      ),
                    ),
                  ),
                  Text(mainLastTile[type][order])
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: iconRightAngle,
              )
            ]),
      ),
    );
  }
}
