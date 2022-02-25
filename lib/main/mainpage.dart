// ignore_for_file: unnecessary_const, prefer_const_constructors

import 'package:flutter/material.dart';
import '../mainpage_period/mainpage_day.dart';
import '../mainpage_period/mainpage_week.dart';
import '../mainpage_period/mainpage_month.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> pages = [
    MainPage_Day(),
    MainPage_Week(),
    MainPage_Month()
  ];
  final PageController pageController = PageController(
    initialPage: 0,
  );

  final selectedPeriod = <bool>[true, false, false];
  int periodSelected = 0;
  final DateTime date = DateTime.now().subtract(Duration(days: 1));

  void _onPageChanged(int page) {
    setState(() {
      periodSelected = page;
    });
  }

  void buttonSelected(int index) {
    setState(() {
      for (int i = 0; i < 3; i++) {
        if (i == index) {
          selectedPeriod[i] = true;
        } else {
          selectedPeriod[i] = false;
        }
      }
      periodSelected = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xffe5e5e5),
      appBar: AppBar(
        backgroundColor: Color(0xfae5e5e5),
        elevation: 0.0,
        title: SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(const TextSpan(children: [
                  TextSpan(
                      text: '안녕하세요',
                      style: TextStyle(fontSize: 14, color: Colors.black)),
                  TextSpan(text: '\n'),
                  WidgetSpan(
                      child: SizedBox(
                    height: 25,
                  )),
                  TextSpan(
                      text: '샤브향 대전테크노점',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Colors.black)),
                  TextSpan(
                      text: '님',
                      style: TextStyle(fontSize: 14, color: Colors.black)),
                ])),
                SizedBox(
                    child: Column(
                  children: [
                    SizedBox(height: 35),
                    ToggleButtons(
                      renderBorder: false,
                      fillColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      selectedColor: Colors.black,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(1.0),
                          decoration: periodSelected == 0
                              ? BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.black, width: 2.5)))
                              : null,
                          child: Text(
                            '일',
                            style: TextStyle(
                                fontWeight: periodSelected == 0
                                    ? FontWeight.w700
                                    : FontWeight.w400),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(1.0),
                          decoration: periodSelected == 1
                              ? BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.black, width: 2.5)))
                              : null,
                          child: Text(
                            '주',
                            style: TextStyle(
                                fontWeight: periodSelected == 1
                                    ? FontWeight.w700
                                    : FontWeight.w400),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(1.0),
                          decoration: periodSelected == 2
                              ? BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.black, width: 2.5)))
                              : null,
                          child: Text(
                            '월',
                            style: TextStyle(
                                fontWeight: periodSelected == 2
                                    ? FontWeight.w700
                                    : FontWeight.w400),
                          ),
                        ),
                      ],
                      isSelected: selectedPeriod,
                      onPressed: buttonSelected,
                      constraints: BoxConstraints(minWidth: 25),
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
        toolbarHeight: 100,
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowIndicator();
          return true;
        },
        child: PageView(
          children: pages,
          controller: pageController,
          onPageChanged: _onPageChanged,
        ),
      ),
    );
  }
}
