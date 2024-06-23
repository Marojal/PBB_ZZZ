  import 'package:flutter/material.dart';
  import 'package:table_calendar/table_calendar.dart';
  import 'package:sh/navbar.dart';
  import 'package:sh/header.dart';

  class CalendarPage extends StatefulWidget {
    const CalendarPage({super.key});

    @override
    State<CalendarPage> createState() => _CalendarPageState();
  }

  class _CalendarPageState extends State<CalendarPage> {
    CalendarFormat _calendarFormat = CalendarFormat.month;
    DateTime _selectedDay = DateTime.now();
    DateTime _focusedDay = DateTime.now();

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: CustomHeader(
          title: "Calendar",
          onMenuPressed: () {},
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TableCalendar(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  }
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
              ),
              const SizedBox(height: 16.0),
              if (_selectedDay != null) ...[
                Text(
                  "Selected Day: ${_selectedDay.toLocal()}".split(' ')[0],
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ],
          ),
        ),
        bottomNavigationBar: CustomNavBar(),
      );
    }
  }
