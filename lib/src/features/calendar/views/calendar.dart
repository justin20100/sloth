import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sloth/src/features/calendar/controllers/CalendarController.dart';
import 'package:sloth/src/features/calendar/models/EventModel.dart';
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
  late Map<DateTime, List<Map<String, dynamic>>> _events;
  CalendarController calendarController = CalendarController();
  EventModel eventModel = EventModel();

  @override
  void initState() {
    _events = {};
    _loadEvents(kFirstDay, kLastDay);
    super.initState();
  }

  _loadEvents(kFirstDay, kLastDay) async {
    _events = await eventModel.loadAllFirestoreEvents(kFirstDay, kLastDay);
    setState(() {
      _events;
    });
  }

  List _getEventsForTheDay(DateTime day) {
    List eventsForTheDay = [];

    for (DateTime eventDate in _events.keys) {
      if (eventDate.year == day.year &&
          eventDate.month == day.month &&
          eventDate.day == day.day) {
        eventsForTheDay.addAll(_events[eventDate]!);
      }
    }

    return eventsForTheDay;
  }

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
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kSmallHorizontalSpacer * 3,
              ),
              child: Column(
                children: [
                  // Calendar
                  TableCalendar(
                    eventLoader: (day) => _getEventsForTheDay(day),
                    selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    },
                    focusedDay: _focusedDay,
                    firstDay: kFirstDay,
                    lastDay: kLastDay,
                    rowHeight: 70,
                    daysOfWeekHeight:30,
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
                    locale: Localizations.localeOf(context).toString(),
                    calendarFormat: CalendarFormat.month,
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    headerVisible: true,
                    headerStyle: const HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: true,
                        titleTextStyle: kDateTextStyle,
                        rightChevronIcon: Icon(
                          Icons.keyboard_arrow_right_rounded,
                          color: kColorGreen,
                        ),
                        leftChevronIcon: Icon(
                          Icons.keyboard_arrow_left_rounded,
                          color: kColorGreen,
                        )),
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(height: kSmallVerticalSpacer),
                                  Text(
                                    day.day.toString(),
                                    style: kNumberDaysCalendarTextStyle,
                                  ),
                                ],
                              ),
                              day.day == kToday.day
                                  ? Positioned(
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
                                  : const SizedBox(
                                      height: 0,
                                    )
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(height: kSmallVerticalSpacer),
                                  Text(
                                    day.day.toString(),
                                    style: kNumberDaysCalendarTextStyle,
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
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      defaultBuilder: (
                        context,
                        day,
                        e,
                      ) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(height: kSmallVerticalSpacer),
                            Text(
                              day.day.toString(),
                              style: kNumberDaysCalendarTextStyle,
                            ),
                          ],
                        );
                      },
                      outsideBuilder: (
                        context,
                        day,
                        e,
                      ) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(height: kSmallVerticalSpacer),
                            Text(
                              day.day.toString(),
                              style: kNumberOutsideDaysCalendarTextStyle,
                            ),
                          ],
                        );
                      },
                      markerBuilder: (context, day, events) => events.isNotEmpty
                          ? Positioned(
                              bottom: 20,
                              child: Container(
                                width: 22,
                                height: 15,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: kColorGreen,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                child: Text(
                                  '${events.length}',
                                  style: const TextStyle(
                                      color: kColorWhite, fontSize: 11),
                                ),
                              ),
                            )
                          : null,
                    ),
                  ),
                  // Events list
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: kSmallVerticalSpacer,
                      ),
                      Text(
                        DateFormat.MMMMEEEEd(Localizations.localeOf(context).toString()).format(_selectedDay),
                        style: kDayDateCalendarTextStyle,
                      ),
                      const SizedBox(
                        height: kMicroVerticalSpacer * 2,
                      ),
                      _getEventsForTheDay(_selectedDay).isEmpty
                          ? Container(
                              alignment: Alignment.topLeft,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: kMicroVerticalSpacer / 2,
                                ),
                                child:
                                    Text("Pas d'événements pour cette journée"),
                              ))
                          : ListBody(
                              children: _getEventsForTheDay(_selectedDay)
                                  .map((event) {
                                String eventDate = event['date'].toString();
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: kMicroVerticalSpacer / 2,
                                  ),
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: kColorGreen,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: ListTile(
                                      onTap: () => {},
                                      title: event['type'] == 'd'
                                          ? const Text('Rapport quotidien',
                                              style:
                                                  kEventsCardCalendarTextStyle)
                                          : event['type'] == 'w'
                                              ? const Text(
                                                  'Analyse de symptômes',
                                                  style:
                                                      kEventsCardCalendarTextStyle)
                                              : event['type'] == 'a'
                                                  ? const Text(
                                                      'Rapport de la semaine',
                                                      style:
                                                          kEventsCardCalendarTextStyle)
                                                  : null,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                      const SizedBox(
                        height: kNormalVerticalSpacer,
                      )
                    ],
                  )
                ],
              )),
        ));
  }
}
