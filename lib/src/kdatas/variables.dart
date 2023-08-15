final kToday = DateTime.now();
final kYesterday = DateTime(kToday.year, kToday.month, kToday.day-1);
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);