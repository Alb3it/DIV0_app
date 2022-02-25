import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../variables/variables.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class MainSalesInfo extends StatefulWidget {
  const MainSalesInfo({Key? key, required this.type}) : super(key: key);
  final int type; //Day, Week, Month

  @override
  _MainSalesInfoState createState() => _MainSalesInfoState(type);
}

class _MainSalesInfoState extends State<MainSalesInfo> {
  final Widget iconDown = SvgPicture.asset('icons/angledown1.svg');
  final int type;
  final DateRangePickerController _controller = DateRangePickerController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.selectedDate = DateTime.now().subtract(const Duration(days: 1));
  }

  @override
  void selectDate(DateRangePickerSelectionChangedArgs date) {
    setState(() {
      _controller.selectedDate = date.value;
      Navigator.pop(context);
    });
  }

  _MainSalesInfoState(this.type);
  void pickDate() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext) {
          return Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
                color: Color(0xffe5e5e5),
              ),
              height: 370,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      width: 40,
                      height: 5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black.withOpacity(0.7)),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10, left: 20, right: 20, top: 20),
                      child: SfDateRangePicker(
                        view: DateRangePickerView.month,
                        selectionMode: DateRangePickerSelectionMode.single,
                        onSelectionChanged: selectDate,
                        controller: _controller,
                        backgroundColor: const Color(0xffe5e5e5),
                        monthCellStyle: const DateRangePickerMonthCellStyle(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            todayTextStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            disabledDatesTextStyle:
                                TextStyle(color: Color(0x55000000))),
                        headerHeight: 70,
                        headerStyle: const DateRangePickerHeaderStyle(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                                color: Colors.black),
                            backgroundColor: Color(0xffe5e5e5)),
                        selectionColor: Colors.black.withOpacity(0.5),
                        selectionTextStyle: TextStyle(color: Colors.white),
                        todayHighlightColor: Colors.black,
                        maxDate: DateTime.now(),
                        yearCellStyle: const DateRangePickerYearCellStyle(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                          todayTextStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ))
                ],
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: SizedBox(
                child: OutlinedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      '${_controller.selectedDate?.year}년 ${_controller.selectedDate?.month}월 ${_controller.selectedDate?.day}일'),
                  iconDown
                ],
              ),
              onPressed: pickDate,
              // ignore: prefer_const_constructors
              style: ButtonStyle(
                side: MaterialStateProperty.all(BorderSide.none),
                foregroundColor: MaterialStateProperty.all(Colors.black),
                fixedSize: MaterialStateProperty.all(const Size.fromWidth(165)),
                overlayColor: MaterialStateProperty.all(Colors.transparent),
              ),
            )),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                mainSales[type],
                style:
                    const TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
              )),
          Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                mainSalesIncrement[type],
                style: const TextStyle(
                  color: Color(0xffaaaaaa),
                  fontWeight: FontWeight.w500,
                ),
              )),
        ],
      ),
    );
  }
}
