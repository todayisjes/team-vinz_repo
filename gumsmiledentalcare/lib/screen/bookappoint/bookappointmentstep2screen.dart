import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelompokmbl/const.dart';
import 'package:kelompokmbl/provider/button.dart';
import 'package:kelompokmbl/provider/utils.dart';
import 'package:kelompokmbl/screen/bookappoint/bookappointmentstep3screen.dart';
import 'package:table_calendar/table_calendar.dart';

class Step2Screen extends StatefulWidget {
  const Step2Screen({super.key});

  @override
  State<Step2Screen> createState() => _Step2ScreenState();
}

class _Step2ScreenState extends State<Step2Screen> {
  CalendarFormat _format = CalendarFormat.month;
  DateTime _focusday = DateTime.now();
  DateTime _currentday = DateTime.now();
  int? _currentIndex;
  bool _isWekkend = false;
  bool _dateSelected = false;
  bool _timeSelected = false;

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Step 2 out of 4',
          style: GoogleFonts.inriaSans(
              fontSize: 13, color: Colors.black45, fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                _tableCalendar(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 25,
                  ),
                  child: Center(
                    child: Text(
                      'Select Time',
                      style: GoogleFonts.inriaSans(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          _isWekkend
              ? SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 30,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Weekend is not available, please select another date',
                      style: GoogleFonts.inriaSans(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                )
              : SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            _currentIndex = index;
                            _timeSelected = true;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: _currentIndex == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(15),
                            color:
                                _currentIndex == index ? kPrimaryColor : null,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '${index + 9}:00 ${index + 9 > 11 ? "PM" : "AM"}',
                            style: GoogleFonts.farro(
                              fontWeight: FontWeight.bold,
                              color:
                                  _currentIndex == index ? Colors.white : null,
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: 8,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1.5,
                  ),
                ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 80),
              child: Button(
                width: double.infinity,
                title: 'Next Step',
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BookAppointmentStep3Screen(),
                  ),
                ),
                disable: _timeSelected && _dateSelected ? false : true,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _tableCalendar() {
    return TableCalendar(
      focusedDay: _focusday,
      firstDay: DateTime.now(),
      lastDay: DateTime(2025, 12, 31),
      calendarFormat: _format,
      currentDay: _currentday,
      rowHeight: 48,
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(
          color: kPrimaryColor,
          shape: BoxShape.circle,
        ),
      ),
      availableCalendarFormats: {
        CalendarFormat.month: 'Month',
      },
      onFormatChanged: (format) {
        setState(() {
          _format = format;
        });
      },
      onDaySelected: ((selectedDay, focusedDay) {
        setState(() {
          _currentday = selectedDay;
          _focusday = focusedDay;
          _dateSelected = true;
        });
        if (selectedDay.weekday == 6 || selectedDay.weekday == 7) {
          _isWekkend = true;
          _timeSelected = false;
          _currentIndex = null;
        } else {
          _isWekkend = false;
        }
      }),
    );
  }
}
