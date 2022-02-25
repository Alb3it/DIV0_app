import 'package:flutter/material.dart';
import 'package:untitled/component/main_sales_info.dart';

class MainPage_Week extends StatelessWidget {
  const MainPage_Week({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: ListView(
        physics: const BouncingScrollPhysics(),
        children: const [
          MainSalesInfo(type: 1),
        ],
      )),
    );
  }
}
