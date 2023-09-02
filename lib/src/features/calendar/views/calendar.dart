import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sloth/src/features/calendar/controllers/CalendarController.dart';
import 'package:sloth/src/features/calendar/models/EventModel.dart';
import 'package:sloth/src/features/calendar/views/widgets/dReportDetails.dart';
import 'package:sloth/src/features/calendar/views/widgets/wReportDetails.dart';
import 'package:sloth/src/kdatas/constants.dart';
import 'package:sloth/src/routing/routes.dart';
import 'package:sloth/src/widgets/button.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late DateTime _focusedDay = DateTime.now();
  late DateTime _selectedDay = DateTime.now();
  late Map<DateTime, List<Map<String, dynamic>>> _events;
  late bool usedSelectedDay;
  EventModel eventModel = EventModel();

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
    _events = {};
    usedSelectedDay = false;
    _loadEvents(kFirstDay, kLastDay);
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
      if (eventDate.year == day.year && eventDate.month == day.month && eventDate.day == day.day) {
        eventsForTheDay.addAll(_events[eventDate]!);
      }
    }
    return eventsForTheDay;
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    if (arguments != null && arguments['selectedDay'] != null && usedSelectedDay != true) {
      _selectedDay = arguments['selectedDay'];
      _focusedDay = arguments['selectedDay'];
      usedSelectedDay = true;
    }
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
          leading: WidgetAnimator(
            incomingEffect: WidgetTransitionEffects.incomingSlideInFromLeft(curve: Curves.easeOutCirc, duration: const Duration(milliseconds: 700)),
            child: GestureDetector(
              onTap: () => {Navigator.popAndPushNamed(context, kHomeRoute)},
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: kColorGreen,
              ),
            ),
          ),
          title: WidgetAnimator(
            incomingEffect: WidgetTransitionEffects.incomingSlideInFromTop(curve: Curves.easeOutCirc, duration: const Duration(milliseconds: 700)),
            child: Text(
              AppLocalizations.of(context)!.calendar__title,
              style: kAppBarTextStyle,
            ),
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
                    daysOfWeekHeight: 30,
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
                                          borderRadius: BorderRadius.circular(10),
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
                                  style: const TextStyle(color: kColorWhite, fontSize: 11),
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
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: kMicroVerticalSpacer / 2,
                                ),
                                child: Text(AppLocalizations.of(context)!.calendar__noRepports),
                              ))
                          : ListBody(
                              children: _getEventsForTheDay(_selectedDay).map((event) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: kMicroVerticalSpacer / 2,
                                  ),
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(color: kColorGreen, borderRadius: BorderRadius.circular(10)),
                                    child: ListTile(
                                      onTap: () => {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                                padding: const EdgeInsets.only(top: kBigVerticalSpacer, right: kNormalHorizontalSpacer, bottom: kBigVerticalSpacer, left: kNormalHorizontalSpacer),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                        decoration: BoxDecoration(
                                                          color: kColorWhite,
                                                          borderRadius: BorderRadius.circular(10),
                                                        ),
                                                        height: MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height / 3.5),
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(top: 0, right: kBigHorizontalSpacer, bottom: 0, left: kBigHorizontalSpacer),
                                                          child: event["type"] == "d"
                                                              ? DReportDetails(eventDetails: event)
                                                              : event["type"] == "w"
                                                                  ? WReportDetails(eventDetails: event)
                                                                  : const SizedBox(
                                                                      height: 0,
                                                                    ),
                                                        )),
                                                    const SizedBox(
                                                      height: kSmallVerticalSpacer,
                                                    ),
                                                    Align(
                                                      alignment: Alignment.bottomRight,
                                                      child: Button(
                                                        label: 'Fermer',
                                                        onPressed: () {
                                                          Navigator.pop(context);
                                                        },
                                                      ),
                                                    )
                                                  ],
                                                ));
                                          },
                                        ),
                                      },
                                      title: event['type'] == 'd'
                                          ? Text('Rapport quotidien', style: kEventsCardCalendarTextStyle)
                                          : event['type'] == 'w'
                                              ? const Text('Rapport de la semaine', style: kEventsCardCalendarTextStyle)
                                              : event['type'] == 'a'
                                                  ? const Text('Analyse de symptômes', style: kEventsCardCalendarTextStyle)
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
