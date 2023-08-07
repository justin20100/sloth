import 'package:flutter/material.dart';
import 'package:sloth/src/kdatas/constants.dart';
import 'package:sloth/src/routing/routes.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kColorCream,
        appBar: AppBar(
          elevation: 2,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          toolbarHeight: 80,
          backgroundColor: kColorCream,
          leading: GestureDetector(
            onTap: () => {Navigator.pop(context)},
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: kColorGreen,
            ),
          ),
          title: const Text(
            'Calendrier',
            style: kAppBarTextStyle,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kSmallHorizontalSpacer * 3,
          ),
          child: TableCalendar(
            rowHeight: 70,
            daysOfWeekStyle: const DaysOfWeekStyle(
              weekdayStyle: kDaysCalendarTextStyle,
              weekendStyle: kDaysCalendarTextStyle,
            ),
            calendarStyle: CalendarStyle(
              defaultTextStyle: kNumberDaysCalendarTextStyle,
              weekendTextStyle: kNumberDaysCalendarTextStyle,
              todayDecoration: BoxDecoration(
                color: kColorGreen,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            locale: 'fr_FR',
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            calendarFormat: CalendarFormat.month,
            startingDayOfWeek: StartingDayOfWeek.monday,
            headerVisible: true,
            calendarBuilders: CalendarBuilders(todayBuilder: (context, day, e) {
              return GestureDetector(
                onTap: () => {Navigator.pushNamed(context, kCalendarRoute)},
                child: Container(
                  width: 35,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            day.day.toString(),
                            style: kNumberDaysCalendarTextStyle,
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 7,
                        child: Container(
                          width: 35,
                          height: 7,
                          decoration: BoxDecoration(
                            color: kColorGreen,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }, defaultBuilder: (context, day, e) {
              return GestureDetector(
                onTap: () => {Navigator.pushNamed(context, kCalendarRoute)},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      day.day.toString(),
                      style: kNumberDaysCalendarTextStyle,
                    ),
                  ],
                ),
              );
            }),
          ),
        ));
  }
}
