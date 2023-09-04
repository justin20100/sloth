import 'package:flutter/material.dart';
import 'package:sloth/src/features/calendar/models/EventModel.dart';
import 'package:sloth/src/features/home/controllers/homeController.dart';
import 'package:sloth/src/features/home/views/widgets/burgerMenu/burgerMenu.dart';
import 'package:sloth/src/features/home/views/widgets/burgerMenu/sidebar.dart';
import 'package:sloth/src/features/home/views/widgets/dReportHomeBlock.dart';
import 'package:sloth/src/features/home/views/widgets/defaultHomeBlock.dart';
import 'package:sloth/src/features/home/views/widgets/wReportHomeBlock.dart';
import 'package:sloth/src/kdatas/constants.dart';
import 'package:sloth/src/routing/routes.dart';
import 'package:sloth/src/utils/functions.dart';
import 'package:sloth/src/widgets/snackbars/error_snackbar.dart';
import 'package:sloth/src/widgets/snackbars/success_snackbar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<Home> with TickerProviderStateMixin {
  late DateTime _focusedDay = DateTime.now();
  late DateTime _selectedDay = DateTime.now();
  late Map<DateTime, List<Map<String, dynamic>>> _events = {};
  final ValueNotifier<bool> _wReportVisibility = ValueNotifier(false);
  final ValueNotifier<bool> _dReportVisibility = ValueNotifier(false);
  final HomeController homeController = HomeController();
  final Tools tools = Tools();
  EventModel eventModel = EventModel();

  @override
  initState() {
    super.initState();
    initializeDateFormatting();
    _loadEvents(kFirstDay, kLastDay);
    checkBlocksVisibility();
    checkInternetConnection();
  }

  checkInternetConnection() async {
    if( await tools.checkInternetConnection()==false){
      ErrorSnackbar.show(context, AppLocalizations.of(context)!.home__internetError);
    }
  }
  checkBlocksVisibility() async {
    _dReportVisibility.value = await homeController.dReportHomeBlockVisibility();
    _wReportVisibility.value = await homeController.wReportHomeBlockVisibility();
  }
  _loadEvents(kFirstDay, kLastDay) async {
    _events = await eventModel.loadAllFirestoreEvents(kFirstDay, kLastDay);
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
    return WillPopScope(
      onWillPop: () async => !(Navigator.of(context).userGestureInProgress),
      child: Scaffold(
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
                leading: WidgetAnimator(
                  incomingEffect: WidgetTransitionEffects.incomingSlideInFromLeft(curve: Curves.easeOutCirc, duration: const Duration(milliseconds: 700)),
                  child: const BurgerMenu(),
                ),
                title: WidgetAnimator(
                  incomingEffect: WidgetTransitionEffects.incomingSlideInFromTop(curve: Curves.easeOutCirc, duration: const Duration(milliseconds: 700)),
                  child: Image.asset('assets/img/slothLogo.jpg', width: 210),
                ),
                actions: [
                  WidgetAnimator(
                    incomingEffect: WidgetTransitionEffects.incomingSlideInFromRight(curve: Curves.easeOutCirc, duration: const Duration(milliseconds: 700)),
                    child: GestureDetector(
                      onTap: () => {Navigator.pushNamed(context, kHistoryRoute)},
                      child: const Padding(
                        padding: EdgeInsets.only(right: kSmallHorizontalSpacer),
                        child: Icon(Icons.history_rounded , color: kColorGreen, size: 35),
                      ),
                    ),
                  ),
                ],
              ),
              // header Week calendar
              SliverPersistentHeader(
                pinned: true,
                delegate: CustomSliverPersistentHeaderDelegate(
                    child: WidgetAnimator(
                  incomingEffect: WidgetTransitionEffects.incomingSlideInFromTop(curve: Curves.easeOutCirc, duration: const Duration(milliseconds: 700)),
                  child: Container(
                    decoration: BoxDecoration(color: kColorCream, borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(35), bottomRight: Radius.circular(35)), boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 6,
                        offset: const Offset(0, 0),
                      ),
                    ]),
                    child: Padding(
                        padding: const EdgeInsets.only(left: kSmallHorizontalSpacer * 3, right: kSmallHorizontalSpacer * 3, top: kSmallVerticalSpacer),
                        child: Column(
                          children: [
                            // Date of the day
                            Center(
                                child: Text(
                              getTheDate(context),
                              style: kDateTextStyle,
                            )),
                            const SizedBox(
                              height: kSmallVerticalSpacer,
                            ),
                            // Week calendar
                            TableCalendar(
                              eventLoader: (day) => _getEventsForTheDay(day),
                              onDaySelected: (selectedDay, focusedDay) {
                                setState(() {
                                  _selectedDay = selectedDay;
                                  _focusedDay = focusedDay;
                                });
                                Navigator.pushReplacementNamed(context, kCalendarRoute, arguments: {
                                  'selectedDay': _selectedDay,
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
                              locale: Localizations.localeOf(context).toString(),
                              firstDay: kFirstDay,
                              lastDay: kLastDay,
                              focusedDay: _focusedDay,
                              calendarFormat: CalendarFormat.week,
                              startingDayOfWeek: StartingDayOfWeek.monday,
                              headerVisible: false,
                              calendarBuilders: CalendarBuilders(
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
                          ],
                        )),
                  ),
                )),
              ),
              // Boxes
              SliverFillRemaining(
                  child: WidgetAnimator(
                incomingEffect: WidgetTransitionEffects.incomingSlideInFromBottom(curve: Curves.easeOutCirc, duration: const Duration(milliseconds: 700)),
                child: ListView(
                  padding: const EdgeInsets.only(left: kNormalHorizontalSpacer, right: kNormalHorizontalSpacer, top: kNormalVerticalSpacer),
                  children: [
                    // Day rapport block
                    ValueListenableBuilder<bool>(
                      valueListenable: _dReportVisibility,
                      builder: (context, bool value, child) {
                        if (value) {
                          return Column(
                            children: [
                              DReportHomeBlock(
                                text: AppLocalizations.of(context)!.home__boxDRepport,
                              ),
                              const SizedBox(
                                height: kSmallVerticalSpacer,
                              )
                            ],
                          );
                        } else {
                          return const SizedBox(
                            height: 0,
                          );
                        }
                      },
                    ),
                    // week report block
                    ValueListenableBuilder<bool>(
                      valueListenable: _wReportVisibility,
                      builder: (context, bool value, child) {
                        if (value) {
                          return Column(
                            children: [
                              WReportHomeBlock(onPressed: () async {
                                if (await tools.checkInternetConnection() == true) {
                                    await homeController.calculateWReport();
                                    _wReportVisibility.value = !_wReportVisibility.value;
                                    SuccessSnackbar.show(context, "Le rapport de la semaine a été ajouté à votre calendrier avec succès");
                                } else {
                                  ErrorSnackbar.show(context, AppLocalizations.of(context)!.home__boxWRepportInternetError);
                                }
                              }),
                              const SizedBox(
                                height: kSmallVerticalSpacer,
                              )
                            ],
                          );
                        } else {
                          return const SizedBox(
                            height: 0,
                          );
                        }
                      },
                    ),
                    // Calendar block
                    DefaultHomeBlock(
                      text: "Vous devez parcourir votre calendrier ?",
                      buttonText: "Consulter le calendrier",
                      route: kCalendarRoute,
                    ),
                    const SizedBox(
                      height: kSmallVerticalSpacer,
                    ),

                    // Personnal file block
                    DefaultHomeBlock(
                      text: AppLocalizations.of(context)!.home__boxPersonnalFile,
                      buttonText: AppLocalizations.of(context)!.home__boxPersonnalFileButton,
                      route: kPersonnalSheetRoute,
                    ),
                    const SizedBox(
                      height: kSmallVerticalSpacer,
                    ),

                    // Articles block
                    DefaultHomeBlock(
                      text: AppLocalizations.of(context)!.home__boxArticles,
                      buttonText: AppLocalizations.of(context)!.home__boxArticlesButton,
                      route: kHomeRoute,
                    ),
                    const SizedBox(
                      height: kNormalVerticalSpacer,
                    ),
                  ],
                ),
              ))
            ],
          )),
    );
  }
}

class CustomSliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  CustomSliverPersistentHeaderDelegate({required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
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
