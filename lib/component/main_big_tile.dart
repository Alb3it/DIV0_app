import 'package:flutter/material.dart';
import '../variables/variables.dart';

class MainBigTile extends StatefulWidget {
  const MainBigTile({Key? key, required this.type, required this.border})
      : super(key: key);
  final int type, border;
  @override
  _MainBigTileState createState() => _MainBigTileState(type, border);
}

class _MainBigTileState extends State<MainBigTile> {
  final int type, border;
  _MainBigTileState(this.type, this.border);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 350,
        height: 180,
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 140,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    mainBigTileIcon[type][border][0],
                    Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 10),
                        child: Text(
                          mainBigTileTitle[type][border][0],
                          style: TextStyle(fontSize: 18),
                        )),
                    Text(
                      mainBigTileSubTitle[type][border][0],
                      style: TextStyle(color: Color(0xffaaaaaaa)),
                    )
                  ],
                ),
              ),
              const VerticalDivider(
                endIndent: 25,
                indent: 25,
              ),
              SizedBox(
                width: 140,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    mainBigTileIcon[type][border][1],
                    Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 10),
                        child: Text(
                          mainBigTileTitle[type][border][1],
                          style: TextStyle(fontSize: 18),
                        )),
                    Text(
                      mainBigTileSubTitle[type][border][1],
                      style: TextStyle(color: Color(0xffaaaaaaa)),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
