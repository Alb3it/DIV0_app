import 'package:flutter/material.dart';
import '../variables/variables.dart';
import 'package:bubble/bubble.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MainBarRabbitLeft extends StatefulWidget {
  const MainBarRabbitLeft({Key? key, required this.type, required this.order})
      : super(key: key);
  final int type;
  final int order;
  @override
  _MainBarRabbitLeftState createState() => _MainBarRabbitLeftState(type, order);
}

class _MainBarRabbitLeftState extends State<MainBarRabbitLeft> {
  final int type, order;
  _MainBarRabbitLeftState(this.type, this.order);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          Padding(
              padding: const EdgeInsets.only(right: 30, top: 20),
              child: SizedBox(
                child: Row(
                  children: [
                    Bubble(
                        nip: BubbleNip.leftBottom,
                        color: Colors.white,
                        radius: const Radius.circular(19),
                        nipOffset: 2,
                        elevation: 20,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 60),
                          child: Text(
                            mainRabbitBubble[type][order],
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12),
                          ),
                        ))
                  ],
                  mainAxisAlignment: MainAxisAlignment.end,
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 110),
                child: Container(
                  height: 70,
                  width: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 40,
                            offset: const Offset(0, 20)),
                      ],
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          mainBarIndex[type][0],
                          style: TextStyle(fontSize: 12),
                        ),
                        LinearPercentIndicator(
                          width: 260,
                          lineHeight: 20,
                          percent: mainBarPercent[type],
                          barRadius: const Radius.circular(10),
                          center: Text(
                            mainBarPercentSt[type],
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                          progressColor: Colors.black,
                        ),
                        Text(
                          mainBarIndex[type][1],
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          iconRabbit
        ],
      ),
    );
  }
}
