import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './main/mainpage.dart';
import './keyword/keywordpage.dart';

class MainContainer extends StatefulWidget {
  const MainContainer({Key? key, required this.userInfo}) : super(key: key);
  final Map userInfo;
  @override
  _MainContainerState createState() => _MainContainerState(userInfo);
}

class _MainContainerState extends State<MainContainer> {
  Map userInfo;
  _MainContainerState(this.userInfo);

  final Widget iconFrist1 = SvgPicture.asset(
    'icons/_first1.svg',
  );
  final Widget iconSecond1 = SvgPicture.asset(
    'icons/_second1.svg',
  );
  final Widget iconThird1 = SvgPicture.asset(
    'icons/_third1.svg',
  );
  final Widget iconFourth1 = SvgPicture.asset(
    'icons/_fourth1.svg',
  );
  final Widget iconFifth1 = SvgPicture.asset(
    'icons/_fifth1.svg',
  );
  final Widget iconFirst2 = SvgPicture.asset('icons/_first2.svg');
  final Widget iconSecond2 = SvgPicture.asset('icons/_second2.svg');
  final Widget iconThird2 = SvgPicture.asset('icons/_third2.svg');
  final Widget iconFourth2 = SvgPicture.asset('icons/_fourth2.svg');
  final Widget iconFifth2 = SvgPicture.asset('icons/_fifth2.svg');

  int _currentIndex = 0;

  final List<Widget> _children = [
    MainPage(),
    KeywordPage(),
    KeywordPage(),
    KeywordPage(),
    KeywordPage()
  ];

  void _onTap(int Index) {
    setState(() {
      _currentIndex = Index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 10,
          onTap: _onTap,
          currentIndex: _currentIndex,
          selectedFontSize: 0,
          items: [
            BottomNavigationBarItem(
                icon: _currentIndex == 0 ? iconFirst2 : iconFrist1, label: ''),
            BottomNavigationBarItem(
                icon: _currentIndex == 1 ? iconSecond2 : iconSecond1,
                label: ''),
            BottomNavigationBarItem(
                icon: _currentIndex == 2 ? iconThird2 : iconThird1, label: ''),
            BottomNavigationBarItem(
                icon: _currentIndex == 3 ? iconFourth2 : iconFourth1,
                label: ''),
            BottomNavigationBarItem(
                icon: _currentIndex == 4 ? iconFifth2 : iconFifth1, label: ''),
          ],
          backgroundColor: const Color(0xffe5e5e5),
        ),
      ),
    );
  }
}
