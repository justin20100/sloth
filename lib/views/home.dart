import 'package:flutter/material.dart';
import 'package:sloth/routes/routes.dart';
import 'package:sloth/styles/constants.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Home> with TickerProviderStateMixin {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kColorCream,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              toolbarHeight: 90,
              backgroundColor: kColorCream,
              elevation: 0,
              leading: GestureDetector(
                onTap: () =>
                    {Navigator.pushNamed(context, kNotificationsRoute)},
                child: const Padding(
                  padding: EdgeInsets.only(left: kSmallHorizontalSpacer),
                  child: Icon(
                    Icons.menu_rounded,
                    color: kColorGreen,
                    size: 40,
                  ),
                ),
              ),
              title: Image.asset('assets/img/slothLogo.jpg', width: 210),
              actions: [
                GestureDetector(
                  onTap: () =>
                      {Navigator.pushNamed(context, kNotificationsRoute)},
                  child: const Padding(
                    padding: EdgeInsets.only(right: kSmallHorizontalSpacer),
                    child: Icon(Icons.notifications_rounded,
                        color: kColorGreen, size: 35),
                  ),
                ),
              ],
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: CustomSliverPersistentHeaderDelegate(
                child: Container(
                  decoration: BoxDecoration(
                    color: kColorCream,
                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(45),bottomRight: Radius.circular(45)),
                    boxShadow: [BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      blurRadius: 6,
                      offset: const Offset(0, 0),
                    ),]
                  ),
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: kSmallHorizontalSpacer*3,
                          right: kSmallHorizontalSpacer*3,
                          top: kSmallVerticalSpacer),
                      child: Column(
                        children: [
                          Center(
                              child: Text(
                            getTheDate(),
                            style: kDateTextStyle,
                          )),
                          const SizedBox(
                            height: kSmallVerticalSpacer,
                          ),
                          TableCalendar(
                            rowHeight: 60,
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
                            calendarFormat: CalendarFormat.week,
                            startingDayOfWeek: StartingDayOfWeek.monday,
                            headerVisible: false,
                            selectedDayPredicate: (day) {
                              return isSameDay(_selectedDay, day);
                            },
                            onDaySelected: (selectedDay, focusedDay) {
                              if (!isSameDay(_selectedDay, selectedDay)) {
                                setState(() {
                                  _selectedDay = selectedDay;
                                  _focusedDay = focusedDay;
                                });
                              }
                            },
                          ),
                        ],
                      )),
                ),
              ),
            ),
            SliverFillRemaining(
              child: Padding(
                padding: const EdgeInsets.only(left: kNormalHorizontalSpacer,right: kNormalHorizontalSpacer),
                  child: ListView(
                    padding: const EdgeInsets.only(top: kNormalVerticalSpacer),
                    children: [
                      Container(
                        color: kColorWhite,
                        height: 100,
                      ),
                      SizedBox(
                        height: kSmallVerticalSpacer,
                      ),
                      Container(
                        color: kColorWhite,
                        height: 100,
                      ),
                      SizedBox(
                        height: kSmallVerticalSpacer,
                      ),
                      Container(
                        color: kColorWhite,
                        height: 100,
                      ),
                      SizedBox(
                        height: kSmallVerticalSpacer,
                      ),
                      Container(
                        color: kColorWhite,
                        height: 100,
                      ),
                      SizedBox(
                        height: kSmallVerticalSpacer,
                      ),
                      Container(
                        color: kColorWhite,
                        height: 100,
                      ),
                      SizedBox(
                        height: kSmallVerticalSpacer,
                      ),
                      Container(
                        color: kColorWhite,
                        height: 100,
                      ),
                      SizedBox(
                        height: kSmallVerticalSpacer,
                      ),
                      Container(
                        color: kColorWhite,
                        height: 100,
                      ),
                      SizedBox(
                        height: kSmallVerticalSpacer,
                      ),
                      Container(
                        color: kColorWhite,
                        height: 100,
                      ),
                      SizedBox(
                        height: kSmallVerticalSpacer,
                      ),
                    ],
                  ),
              )
            ),
          ],
        ));
  }
}

class CustomSliverPersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  final Widget child;

  CustomSliverPersistentHeaderDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent =>
      150; // Définissez ici la hauteur maximale souhaitée pour votre en-tête

  @override
  double get minExtent =>
      10; // Définissez ici la hauteur minimale souhaitée pour votre en-tête

  @override
  bool shouldRebuild(CustomSliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
