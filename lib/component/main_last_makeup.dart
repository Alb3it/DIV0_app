import 'package:flutter/material.dart';
import 'package:untitled/component/main_last_tile.dart';
import '../variables/variables.dart';
import 'package:bubble/bubble.dart';

class MainLastMakeUp extends StatefulWidget {
  const MainLastMakeUp({Key? key, required this.type, required this.order})
      : super(key: key);
  final int type, order;
  @override
  _MainLastMakeUpState createState() => _MainLastMakeUpState(type, order);
}

class _MainLastMakeUpState extends State<MainLastMakeUp> {
  final int type, order;
  _MainLastMakeUpState(this.type, this.order);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
              top: 25,
              left: 30,
              child: Bubble(
                  stick: true,
                  nip: BubbleNip.rightBottom,
                  color: Colors.white,
                  radius: const Radius.circular(19),
                  nipOffset: 2,
                  elevation: 20,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 90),
                    child: Text(
                      mainRabbitBubble[type][order],
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12),
                    ),
                  ))),
          Positioned(
            top: 110,
            left: 30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MainLastTile(type: type, order: 0, up: true),
                MainLastTile(type: type, order: 1, up: true),
                MainLastTile(type: type, order: 2, up: true),
                MainLastTile(type: type, order: 3, up: false),
                MainLastTile(type: type, order: 4, up: false),
              ],
            ),
          ),
          Positioned(right: 0, child: iconRabbitR),
        ],
      ),
    );
  }
}
