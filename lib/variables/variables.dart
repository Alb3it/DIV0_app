import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final Widget iconDown = SvgPicture.asset('icons/angledown1.svg');
final Widget iconRabbit = SvgPicture.asset('icons/rabbit.svg');
final Widget iconCoin = SvgPicture.asset('icons/coin.svg');
final Widget iconCustom = SvgPicture.asset('icons/custom.svg');
final Widget iconCard = SvgPicture.asset('icons/card.svg');
final Widget iconRabbitR = SvgPicture.asset('icons/rabbitR.svg');
final Widget iconSearch = SvgPicture.asset('icons/search.svg');
final Widget iconWrite = SvgPicture.asset('icons/write.svg');
final Widget iconViewRank = SvgPicture.asset('icons/viewrank.svg');
final Widget iconPlaceRank = SvgPicture.asset('icons/placerank.svg');
final Widget iconBrandRank = SvgPicture.asset('icons/brandrank.svg');
final Widget iconSearchSection = SvgPicture.asset('icons/search_section.svg');
final Widget iconSearchCategory = SvgPicture.asset('icons/search_category.svg');
final Widget iconRightAngle = SvgPicture.asset('icons/rightAngle.svg');

List<String> mainSales = ['1,563,400원', '8,301,400원', '28,301,400원'];
List<String> mainSalesIncrement = ['+32,000', '-982,000', '+4,982,000'];

List<List<String>> mainSmallTitle = [
  ['주요 매출 지표', '주요 브랜드 지표', '주요 상권·업종 지표', '지표 종합 평가'],
  ['주요 매출 지표', '주요 브랜드 지표', '주요 상권·업종 지표', '지표 종합 평가'],
  ['주요 매출 지표', '주요 브랜드 지표', '주요 상권·업종 지표', '지표 종합 평가']
];
List<List<String>> mainRabbitBubble = [
  ['주형진이상현최석우김상훈', '이제 내 브랜드 마케팅을 점검해볼까요?', 'ㄹㅇㅋㅋ', '멘트 뭐로 하지'],
  ['주간 매출 멘트', '이제 내 브랜드 마케팅을 점검해볼까요?', 'ㄹㅇㅋㅋ', '멘트 뭐로 하지'],
  ['주간 매출 멘트', '이제 내 브랜드 마케팅을 점검해볼까요?', 'ㄹㅇㅋㅋ', '멘트 뭐로 하지']
];
List<List<String>> mainBarIndex = [
  ['점심', '저녁'],
  ['평일', '주말'],
  ['평일', '주말']
];
List<double> mainBarPercent = [0.58, 0.83, 0.83];
List<String> mainBarPercentSt = ['59%', '83%', '83%'];

List<List<List<Widget>>> mainSmallTileIcon = [
  [
    [iconCoin, iconCard, iconCustom],
    [iconViewRank, iconPlaceRank, iconBrandRank]
  ]
];
List<List<List<String>>> mainSmallTileTitle = [
  [
    ['결제단가', '결제건수', '재방문자 매출'],
    ['View 순위', 'Place 순위', '브랜드 순위']
  ]
];
List<List<List<String>>> mainSmallTileValue = [
  [
    ['24,000월', '139건', '13%'],
    ['4.2위', '12.9위', '35,278위']
  ]
];
List<List<List<Widget>>> mainBigTileIcon = [
  [
    [iconSearch, iconWrite],
    [iconSearchSection, iconSearchCategory]
  ]
];
List<List<List<String>>> mainBigTileTitle = [
  [
    ['13,254건', '52건'],
    ['13,254건', '52건']
  ]
];
List<List<List<String>>> mainBigTileSubTitle = [
  [
    ['브랜드 검색량', '브랜드 컨텐츠 발행량'],
    ['상권 검색량', '업종 검색량']
  ]
];
List<List<String>> mainLastTile = [
  [
    '내 가게에서 점심을 해결하는 직장인이 늘었어요',
    '단골들이 늘어나기 시작했어요',
    '내 가게가 검색결과 상위에 노출되기 시작했어요',
    '내 상권에 대한 관심이 떨어지고 있어요',
    '단가가 높은 메뉴의 선호도가 떨어지고 있어요'
  ],
  [
    '내 가게에서 점심을 해결하는 직장인이 늘었어요',
    '단골들이 늘어나기 시작했어요',
    '내 가게가 검색결과 상위에 노출되기 시작했어요',
    '내 상권에 대한 관심이 떨어지고 있어요',
    '단가가 높은 메뉴의 선호도가 떨어지고 있어요'
  ],
  [
    '내 가게에서 점심을 해결하는 직장인이 늘었어요',
    '단골들이 늘어나기 시작했어요',
    '내 가게가 검색결과 상위에 노출되기 시작했어요',
    '내 상권에 대한 관심이 떨어지고 있어요',
    '단가가 높은 메뉴의 선호도가 떨어지고 있어요'
  ]
];
