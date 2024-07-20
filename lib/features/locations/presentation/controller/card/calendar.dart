import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:trainee_app/core/localization_extension.dart';
import 'package:trainee_app/features/locations/presentation/controller/card/calendar_card.dart';
import 'package:trainee_app/features/locations/presentation/controller/card/calendar_items.dart'; // Adjust import as needed

class Calendar extends StatefulWidget {
  const Calendar({super.key, required this.userToken});
  final String userToken;

  @override
  State<StatefulWidget> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late List<CalendarItemModel> _selectedEvents = [];
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _fetchEventsForDay(_focusedDay);
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) async {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
      await _fetchEventsForDay(selectedDay);
    }
  }

  Future<void> _fetchEventsForDay(DateTime day) async {
    // Fetch events for the selected day using the userToken
    List<CalendarItemModel> events =
        await _fetchTrainingData(day.toIso8601String());
    setState(() {
      _selectedEvents = events;
    });
  }

  Future<List<CalendarItemModel>> _fetchTrainingData(String date) async {
    // Implement your data fetching logic here
    // For demonstration purposes, returning an empty list
    return [];
  }

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    return Scaffold(
      body: Column(
        children: [
          TableCalendar<CalendarItemModel>(
            locale: locale,
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            calendarFormat: _calendarFormat,
            onDaySelected: _onDaySelected,
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
            calendarStyle: const CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ListView.builder(
              itemCount: _selectedEvents.length,
              itemBuilder: (context, index) {
                final calendarItem = _selectedEvents[index];
                return InkWell(
                  onTap: () {
                    // Handle tap
                  },
                  child: CalendarCard(
                    calendarItemModelList: _selectedEvents[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
