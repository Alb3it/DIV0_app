import 'package:flutter/material.dart';
import 'package:untitled/component/main_bar_rabbit_left.dart';
import 'package:untitled/component/main_big_tile_rabbit_right.dart';
import 'package:untitled/component/main_last_makeup.dart';
import 'package:untitled/component/main_triple_tiles.dart';
import '../component/main_sales_info.dart';
import '../component/main_small_title.dart';
import '../component/main_big_tile_rabbit_left.dart';

class MainPage_Day extends StatefulWidget {
  const MainPage_Day({Key? key}) : super(key: key);

  @override
  State<MainPage_Day> createState() => _MainPage_DayState();
}

class _MainPage_DayState extends State<MainPage_Day> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: const [
          MainSalesInfo(
            type: 0,
          ),
          MainSmallTitle(type: 0, order: 0),
          MainBarRabbitLeft(type: 0, order: 0),
          MainTripleTiles(type: 0, order: 0),
          MainSmallTitle(type: 0, order: 1),
          MainBigTileRabbitRight(type: 0, order: 1, border: 0),
          MainTripleTiles(type: 0, order: 1),
          MainSmallTitle(type: 0, order: 2),
          MainBigTileRabbitLeft(type: 0, order: 2, border: 1),
          MainSmallTitle(type: 0, order: 3),
          MainLastMakeUp(type: 0, order: 3)
        ],
      ),
    ));
  }
}
