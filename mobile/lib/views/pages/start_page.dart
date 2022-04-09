import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TableCalendar(
          locale: 'pt_BR',
          headerStyle: const HeaderStyle(formatButtonVisible: false),
          calendarStyle: const CalendarStyle(
            markerDecoration: BoxDecoration(
              color: Color.fromRGBO(26, 165, 160, 1),
              shape: BoxShape.rectangle,
            ),
            todayDecoration: BoxDecoration(
              color: Color.fromRGBO(26, 165, 160, 1),
              shape: BoxShape.circle,
            ),
          ),
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: DateTime.now(),
          eventLoader: (day) {
            return _getEventsForDay(day);
          }),
    );
  }

  List<String> _getEventsForDay(DateTime day) {
    final Map<DateTime, List<String>> a = {
      DateTime.utc(2022, 4, 3): ["Consulta"],
      DateTime.utc(2022, 4, 11): ["Consulta"],
      DateTime.utc(2022, 4, 20): ["Consulta"]
    };
    return a[day] ?? [];
  }
}
