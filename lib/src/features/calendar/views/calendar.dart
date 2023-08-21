import 'package:flutter/material.dart';
import 'package:sloth/src/kdatas/constants.dart';
import 'package:sloth/src/routing/routes.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late DateTime _focusedDay = DateTime.now();
  late DateTime _selectedDay = DateTime.now();

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
          title: Text(
            AppLocalizations.of(context)!.calendar__title,
            style: kAppBarTextStyle,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kSmallHorizontalSpacer * 3,
          ),
          child: TableCalendar(
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay; // update `_focusedDay` here as well
              });
            },
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
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              titleTextStyle:kDateTextStyle,
              rightChevronIcon: Icon(Icons.keyboard_arrow_right_rounded, color: kColorGreen,),
              leftChevronIcon: Icon(Icons.keyboard_arrow_left_rounded, color: kColorGreen,)
            ) ,
            calendarBuilders: CalendarBuilders(


                selectedBuilder: (context, day, e) {
                  return Container(
                      width: 35,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 60,
                            width: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: kColorWhite,
                              boxShadow: kBoxShadowItem,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                day.day.toString(),
                                style: kNumberDaysCalendarTextStyle,
                              ),
                            ],
                          ),
                          day.day == kToday.day?
                          Positioned(
                            bottom: 13,
                            child: Container(
                              width: 22,
                              height: 4,
                              decoration: BoxDecoration(
                                color: kColorGreen,
                                borderRadius:
                                BorderRadius.circular(10),
                              ),
                            ),
                          ):const SizedBox(height: 0,)
                        ],
                      ),
                  );
                },

                todayBuilder: (context, day, e) {
              return Container(
                  width: 35,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          Text(
                            day.day.toString(),
                            style:
                            kNumberDaysCalendarTextStyle,
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 13,
                        child: Container(
                          width: 22,
                          height: 4,
                          decoration: BoxDecoration(
                            color: kColorGreen,
                            borderRadius:
                            BorderRadius.circular(10),
                          ),
                        ),
                      )
                    ],
                  ),
              );
            },
                defaultBuilder: (context, day, e) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      day.day.toString(),
                      style: kNumberDaysCalendarTextStyle,
                    ),
                  ],
              );
            }),
          ),
        ));
  }
}
