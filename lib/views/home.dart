import 'package:flutter/material.dart';
import 'package:sloth/partials/home/homeBloc.dart';
import 'package:sloth/routes/routes.dart';
import 'package:sloth/styles/constants.dart';
import 'package:sloth/tools/button.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../partials/burgerMenu/burgerMenu.dart';
import '../partials/burgerMenu/sideBar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Home> with TickerProviderStateMixin {
  final DateTime _focusedDay = DateTime.now();

/*  bool checkIfDreportDisplay(){

    if (0<kToday.hour && kToday.hour>12 && ){
      return true
    }else{
      return false
    }
  }*/

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
        drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.transparent,
          ),
          child: const Drawer(
            child: SidebarScreen(),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            // Navbar
            SliverAppBar(
              pinned: true,
              toolbarHeight: 90,
              backgroundColor: kColorCream,
              elevation: 0,
              leading: const BurgerMenu(),
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
            // header Week calendar
            SliverPersistentHeader(
              pinned: true,
              delegate: CustomSliverPersistentHeaderDelegate(
                child: GestureDetector(
                  onTap: () => {Navigator.pushNamed(context, kCalendarRoute)},
                  child: Container(
                    decoration: BoxDecoration(
                        color: kColorCream,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(35),
                            bottomRight: Radius.circular(35)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            blurRadius: 6,
                            offset: const Offset(0, 0),
                          ),
                        ]),
                    child: Padding(
                        padding: const EdgeInsets.only(
                            left: kSmallHorizontalSpacer * 3,
                            right: kSmallHorizontalSpacer * 3,
                            top: kSmallVerticalSpacer),
                        child: Column(
                          children: [
                            // Date of the day
                            Center(
                                child: Text(
                              getTheDate(),
                              style: kDateTextStyle,
                            )),
                            const SizedBox(
                              height: kSmallVerticalSpacer,
                            ),
                            // Week calendar
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
                              calendarBuilders: CalendarBuilders(
                                  todayBuilder: (context, day, e) {
                                return GestureDetector(
                                  onTap: () => {
                                    Navigator.pushNamed(context, kCalendarRoute)
                                  },
                                  child: Container(
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
                                          bottom: 7,
                                          child: Container(
                                            width: 35,
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
                                  ),
                                );
                              }, defaultBuilder: (context, day, e) {
                                return GestureDetector(
                                  onTap: () => {
                                    Navigator.pushNamed(context, kCalendarRoute)
                                  },
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
                          ],
                        )),
                  ),
                ),
              ),
            ),
            // Boxes
            SliverFillRemaining(
              child: ListView(
                padding: const EdgeInsets.only(
                    left: kNormalHorizontalSpacer,
                    right: kNormalHorizontalSpacer,
                    top: kNormalVerticalSpacer),
                children: [
                  // Day rapport box
                  HomeBloc(
                      text: AppLocalizations.of(context)!.home__boxDRepport),
                  const SizedBox(
                    height: kSmallVerticalSpacer,
                  ),
                  // Week rapport box
                  Container(
                    decoration: kHomeBoxDecoration,
                    padding: const EdgeInsets.only(
                        top: kNormalVerticalSpacer,
                        right: kNormalHorizontalSpacer,
                        bottom: kNormalVerticalSpacer,
                        left: kNormalHorizontalSpacer),
                    child: Column(
                      children: [
                        const Text(
                          'Le rapport hebdomadaire a été calculé pour vous',
                          style: kHomeBoxesTextStyle,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: kMicroVerticalSpacer * 3,
                        ),
                        Center(
                          child: Button(
                            label: 'Consulter',
                            onPressed: () {
                              Navigator.pushNamed(context, kHomeRoute);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: kSmallVerticalSpacer,
                  ),
                  // Symptomes box
                  Container(
                    decoration: kHomeBoxDecoration,
                    padding: const EdgeInsets.only(
                        top: kNormalVerticalSpacer,
                        right: kNormalHorizontalSpacer,
                        bottom: kNormalVerticalSpacer,
                        left: kNormalHorizontalSpacer),
                    child: Column(
                      children: [
                        const Text(
                          'Vous vous sentez mal ? identifiez vos symptômes.',
                          style: kHomeBoxesTextStyle,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: kMicroVerticalSpacer * 3,
                        ),
                        Center(
                          child: Button(
                            label: 'identifier',
                            onPressed: () {
                              Navigator.pushNamed(context, kHomeRoute);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: kSmallVerticalSpacer,
                  ),
                  // Articles box
                  Container(
                    decoration: kHomeBoxDecoration,
                    padding: const EdgeInsets.only(
                        top: kNormalVerticalSpacer,
                        right: kNormalHorizontalSpacer,
                        bottom: kNormalVerticalSpacer,
                        left: kNormalHorizontalSpacer),
                    child: Column(
                      children: [
                        const Text(
                          'Vous voulez en savoir plus sur la fatigue cognitive ?',
                          style: kHomeBoxesTextStyle,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: kMicroVerticalSpacer * 3,
                        ),
                        Center(
                          child: Button(
                            label: 'Voir les articles',
                            onPressed: () {
                              Navigator.pushNamed(context, kHomeRoute);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: kNormalVerticalSpacer,
                  ),
                ],
              ),
            )
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
  double get maxExtent => 150;

  @override
  double get minExtent => 10;

  @override
  bool shouldRebuild(CustomSliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
