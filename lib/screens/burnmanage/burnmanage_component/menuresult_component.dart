import 'package:burncheck/bloc/burnmanage/burnmanage_bloc.dart';
import 'package:burncheck/utils/my_api.dart';
import 'package:burncheck/utils/my_constant.dart';
import 'package:burncheck/utils/my_doctext.dart';
import 'package:burncheck/utils/my_textstyle.dart';
import 'package:burncheck/widgets/show_dialog.dart';
import 'package:burncheck/widgets/show_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:table_calendar/table_calendar.dart';

class MenuResultComponent extends StatefulWidget {
  const MenuResultComponent({
    super.key,
    required this.titleContent,
    required this.index,
  });
  final String titleContent;
  final int index;
  @override
  State<MenuResultComponent> createState() => _MenuResultComponentState();
}

class _MenuResultComponentState extends State<MenuResultComponent> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: ShowText(
          title: widget.titleContent,
          textStyle: MyTextstyle.h1White(),
        ),
        backgroundColor: MyConstant.bgRed,
        foregroundColor: MyConstant.textWhite,
      ),
      body: BlocBuilder<BurnmanageBloc, BurnmanageState>(
        builder: (context, state) {
          return SizedBox(
            child: widget.index == 0
                ? validateResult(context, size)
                : (widget.index == 1)
                ? reportResult(context, size)
                : (widget.index == 2)
                ? repleatCheck(context, size)
                : (widget.index == 3)
                ? mappingRequest(context, size, state)
                : null,
          );
        },
      ),
    );
  }

  Stack mappingRequest(BuildContext context, Size size, BurnmanageState state) {
    return Stack(
      children: [
        FlutterMap(
          options: MapOptions(initialCenter: LatLng(14, 100), initialZoom: 15),
          children: [
            TileLayer(
              urlTemplate: state.isBaseMapGG
                  ? MyApi.baseMapGG
                  : MyApi.satelliteMapGG,
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: LatLng(14, 100),
                  width: 80,
                  height: 80,
                  child: FlutterLogo(),
                ),
              ],
            ),
          ],
        ),
        Positioned(
          right: 16.0,
          child: SizedBox(
            height: size.height * 0.84,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  children: [
                    btnOnMap(Icons.layers, 1, state),
                    btnOnMap(Icons.pin_drop_outlined, 2, state),
                    btnOnMap(Icons.calendar_today_outlined, 3, state),
                    btnOnMap(Icons.navigation_rounded, 4, state),
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: MyConstant.bgWhite,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 3,
                          color: MyConstant.bgDarkGrey,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.my_location_outlined),
                        ShowText(title: ' ตำแหน่งของคุณ'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Padding btnOnMap(IconData icon, int menuIndex, BurnmanageState state) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: GestureDetector(
        onTap: () {
          switch (menuIndex) {
            case 1:
              context.read<BurnmanageBloc>().add(
                BurnmanageEventSwitchBasemap(),
              );
              break;
            case 2:
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  DateTime? rangeStart;
                  DateTime? rangeEnd;
                  RangeSelectionMode rangeSelectionMode =
                      RangeSelectionMode.toggledOn;

                  return Container(
                    height: 440,
                    color: MyConstant.bgWhite,
                    child: TableCalendar(
                      firstDay: DateTime(DateTime.now().year - 1, 1, 1),
                      lastDay: DateTime(DateTime.now().year + 1, 12, 31),
                      focusedDay: DateTime.now(),
                      headerVisible: true,
                      availableGestures: AvailableGestures.horizontalSwipe,
                      rangeStartDay: rangeStart,
                      rangeEndDay: rangeEnd,
                      rangeSelectionMode: rangeSelectionMode,
                      startingDayOfWeek: StartingDayOfWeek.sunday,
                      calendarFormat: CalendarFormat.month,
                      sixWeekMonthsEnforced: false,
                      shouldFillViewport: false,
                      daysOfWeekHeight: 34,
                      rowHeight: 54,
                      availableCalendarFormats: const {
                        CalendarFormat.month: 'Month',
                      },

                      onRangeSelected: (start, end, focusedDay) {
                        setState(() {
                          rangeStart = start;
                          rangeEnd = end;
                          focusedDay = focusedDay;
                          rangeSelectionMode = RangeSelectionMode.toggledOn;
                        });
                      },

                      onPageChanged: (focusedDay) {
                        focusedDay = focusedDay;
                      },

                      headerStyle: HeaderStyle(
                        titleCentered: true,
                        formatButtonVisible: false,
                        titleTextStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                        leftChevronIcon: Icon(
                          Icons.chevron_left,
                          color: const Color(0xFF8C939D),
                          size: 30,
                        ),
                        rightChevronIcon: Icon(
                          Icons.chevron_right,
                          color: const Color(0xFF8C939D),
                          size: 30,
                        ),
                        headerPadding: const EdgeInsets.only(bottom: 14),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: MyConstant.marketLightGrey2,
                              width: 1,
                            ),
                          ),
                        ),
                      ),

                      daysOfWeekStyle: DaysOfWeekStyle(
                        weekdayStyle: MyTextstyle.h2Black(),
                        weekendStyle: MyTextstyle.h2DarkGrey(),
                      ),

                      calendarStyle: CalendarStyle(
                        isTodayHighlighted: false,
                        outsideDaysVisible: false,
                        rangeHighlightColor: Color(0xFFF3E0E0),

                        defaultTextStyle: TextStyle(
                          color: MyConstant.textDarkGrey,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        weekendTextStyle: MyTextstyle.h2DarkGrey(),
                        withinRangeTextStyle: TextStyle(
                          color: MyConstant.textDarkGrey,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),

                        rangeStartTextStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                        rangeEndTextStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),

                        rangeStartDecoration: BoxDecoration(
                          color: Color(0xFFF3E0E0),
                          shape: BoxShape.circle,
                        ),
                        rangeEndDecoration: BoxDecoration(
                          color: Color(0xFFF3E0E0),
                          shape: BoxShape.circle,
                        ),

                        withinRangeDecoration: const BoxDecoration(
                          color: Colors.transparent,
                          shape: BoxShape.rectangle,
                        ),

                        selectedDecoration: BoxDecoration(
                          color: Color(0xFFF3E0E0),
                          shape: BoxShape.circle,
                        ),
                        selectedTextStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),

                        cellMargin: const EdgeInsets.symmetric(
                          horizontal: 0,
                          vertical: 6,
                        ),
                        cellPadding: EdgeInsets.zero,
                      ),

                      calendarBuilders: CalendarBuilders(
                        defaultBuilder: (context, day, focusedDay) {
                          return Center(
                            child: Text(
                              '${day.day}',
                              style: TextStyle(
                                color: MyConstant.textDarkGrey,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        },
                        todayBuilder: (context, day, focusedDay) {
                          return Center(
                            child: Text(
                              '${day.day}',
                              style: TextStyle(
                                color: MyConstant.textDarkGrey,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        },
                        withinRangeBuilder: (context, day, focusedDay) {
                          return Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            decoration: BoxDecoration(
                              color: Color(0xFFF3E0E0),
                              borderRadius: BorderRadius.circular(0),
                            ),
                            child: Text(
                              '${day.day}',
                              style: TextStyle(
                                color: MyConstant.textDarkGrey,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        },
                        rangeStartBuilder: (context, day, focusedDay) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            child: Row(
                              children: [
                                Container(
                                  width: 42,
                                  height: 42,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF3E0E0),
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${day.day}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 42,
                                    color: Color(0xFFF3E0E0),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        rangeEndBuilder: (context, day, focusedDay) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 42,
                                    color: Color(0xFFF3E0E0),
                                  ),
                                ),
                                Container(
                                  width: 42,
                                  height: 42,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF3E0E0),
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${day.day}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              );
              break;
            case 3:
              print(menuIndex);
              break;
            case 4:
              print(menuIndex);
              break;
            default:
              print(menuIndex);
              break;
          }
        },
        child: Container(
          width: 40.0,
          height: 40.0,
          decoration: BoxDecoration(
            color: MyConstant.bgWhite,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 3,
                color: MyConstant.bgDarkGrey,
              ),
            ],
          ),
          child: Icon(icon, color: MyConstant.textRed),
        ),
      ),
    );
  }

  Padding repleatCheck(BuildContext context, Size size) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12.0, 16.0, 12.0, 0.0),
      child: Column(
        children: [
          SizedBox(
            height: 48,
            child: TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: MyConstant.textBlack),
                hintText: 'ค้นหา',
                hintStyle: MyTextstyle.h3DarkGrey(),
                suffixIcon: Icon(Icons.close, color: MyConstant.textBlack),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(DocText.showditems.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: GestureDetector(
                        onTap: () => ShowDialog.showInformationItem(
                          context,
                          size,
                          DocText.showditems[index]["title"],
                          '',
                          200,
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          height: 72,
                          decoration: BoxDecoration(
                            color: MyConstant.bgWhite,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: Color(
                                  DocText.showditems[index]["dotColor"],
                                ),
                                offset: Offset(0, -4),
                              ),
                              BoxShadow(
                                color: MyConstant.bgDarkGrey,
                                blurRadius: 3,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: SizedBox(
                                  // width: 40.0,
                                  child: CircleAvatar(
                                    backgroundColor: Color(
                                      DocText.showditems[index]["statusColor"],
                                    ),
                                    radius: 12,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    ShowText(
                                      title: DocText.showditems[index]["title"],
                                    ),
                                    ShowText(
                                      title:
                                          DocText.showditems[index]["subtitle"],
                                      textStyle: MyTextstyle.b2DarkGrey(),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: 64,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      color:
                                          DocText.showditems[index]["badge"] !=
                                              null
                                          ? MyConstant.bgDarkGrey
                                          : null,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Center(
                                      child:
                                          DocText.showditems[index]["badge"] !=
                                              null
                                          ? ShowText(
                                              title: DocText
                                                  .showditems[index]["badge"],
                                              textStyle:
                                                  MyTextstyle.b2WhiteBold(),
                                            )
                                          : null,
                                    ),
                                  ),
                                  ShowText(
                                    title: DocText.showditems[index]["time"],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
          ShowText(title: 'ทบทวนสิทธิ์'),
        ],
      ),
    );
  }

  Padding reportResult(BuildContext context, Size size) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12.0, 16.0, 12.0, 0.0),
      child: Column(
        children: [
          SizedBox(
            height: 48,
            child: TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: MyConstant.textBlack),
                hintText: 'ค้นหา',
                hintStyle: MyTextstyle.h3DarkGrey(),
                suffixIcon: Icon(Icons.close, color: MyConstant.textBlack),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(DocText.showditems.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: GestureDetector(
                        onTap: () => ShowDialog.showInformationItem(
                          context,
                          size,
                          DocText.showditems[index]["title"],
                          '',
                          200,
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          height: 72,
                          decoration: BoxDecoration(
                            color: MyConstant.bgWhite,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: Color(
                                  DocText.showditems[index]["dotColor"],
                                ),
                                offset: Offset(0, -4),
                              ),
                              BoxShadow(
                                color: MyConstant.bgDarkGrey,
                                blurRadius: 3,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: SizedBox(
                                  // width: 40.0,
                                  child: CircleAvatar(
                                    backgroundColor: Color(
                                      DocText.showditems[index]["statusColor"],
                                    ),
                                    radius: 12,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    ShowText(
                                      title: DocText.showditems[index]["title"],
                                    ),
                                    ShowText(
                                      title:
                                          DocText.showditems[index]["subtitle"],
                                      textStyle: MyTextstyle.b2DarkGrey(),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: 64,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      color:
                                          DocText.showditems[index]["badge"] !=
                                              null
                                          ? MyConstant.bgDarkGrey
                                          : null,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Center(
                                      child:
                                          DocText.showditems[index]["badge"] !=
                                              null
                                          ? ShowText(
                                              title: DocText
                                                  .showditems[index]["badge"],
                                              textStyle:
                                                  MyTextstyle.b2WhiteBold(),
                                            )
                                          : null,
                                    ),
                                  ),
                                  ShowText(
                                    title: DocText.showditems[index]["time"],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
          ShowText(title: 'รายงานผล'),
        ],
      ),
    );
  }

  Padding validateResult(BuildContext context, Size size) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12.0, 16.0, 12.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 48,
            child: TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: MyConstant.textBlack),
                hintText: 'ค้นหา',
                hintStyle: MyTextstyle.h3DarkGrey(),
                suffixIcon: Icon(Icons.close, color: MyConstant.textBlack),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(DocText.showditems.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: GestureDetector(
                        onTap: () => ShowDialog.showInformationItem(
                          context,
                          size,
                          DocText.showditems[index]["title"],
                          '',
                          200,
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          height: 72,
                          decoration: BoxDecoration(
                            color: MyConstant.bgWhite,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: Color(
                                  DocText.showditems[index]["dotColor"],
                                ),
                                offset: Offset(0, -4),
                              ),
                              BoxShadow(
                                color: MyConstant.bgDarkGrey,
                                blurRadius: 3,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: SizedBox(
                                  // width: 40.0,
                                  child: CircleAvatar(
                                    backgroundColor: Color(
                                      DocText.showditems[index]["statusColor"],
                                    ),
                                    radius: 12,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    ShowText(
                                      title: DocText.showditems[index]["title"],
                                    ),
                                    ShowText(
                                      title:
                                          DocText.showditems[index]["subtitle"],
                                      textStyle: MyTextstyle.b2DarkGrey(),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: 64,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      color:
                                          DocText.showditems[index]["badge"] !=
                                              null
                                          ? MyConstant.bgDarkGrey
                                          : null,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Center(
                                      child:
                                          DocText.showditems[index]["badge"] !=
                                              null
                                          ? ShowText(
                                              title: DocText
                                                  .showditems[index]["badge"],
                                              textStyle:
                                                  MyTextstyle.b2WhiteBold(),
                                            )
                                          : null,
                                    ),
                                  ),
                                  ShowText(
                                    title: DocText.showditems[index]["time"],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
          ShowText(title: 'ตรวจสอบผล'),
        ],
      ),
    );
  }
}
