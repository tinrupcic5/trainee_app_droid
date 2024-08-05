import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:trainee_app/core/di.dart';
import 'package:trainee_app/core/style/style_extensions.dart';
import 'package:trainee_app/features/locations/presentation/controller/card/calendar_card.dart';
import 'package:trainee_app/features/locations/presentation/controller/card/calendar_items.dart';
import 'package:trainee_app/features/participation/domain/models/Participation.dart';

class CalendarScreen extends ConsumerStatefulWidget {
  const CalendarScreen({super.key});

  @override
  ConsumerState<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends ConsumerState<CalendarScreen> {
  late List<CalendarItemModel> _selectedEvents = [];
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _onDaySelected(DateTime.now(), _focusedDay);
    });
  }

  @override
  void dispose() {
    _selectedEvents.clear();
    super.dispose();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) async {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });
    }

    Future.microtask(() async {
      final notifier = ref.read(trainingListProvider.notifier);
      await notifier.gettingAllTrainingForDate(selectedDay.toString());

      final state = ref.watch(trainingListProvider);
      state.when(
        loading: () {
          setState(() {
            _selectedEvents = [];
          });
        },
        loaded: (trainings) {
          List<CalendarItemModel> newSelectedEvents = trainings.map((training) {
            List<Participation> participationList = training.participation;
            bool anyParticipantAttended = participationList
                .any((participation) => participation.attendedStatus);

            return CalendarItemModel(
              training.id!,
              training.name,
              training.trainingTime,
              training.trainingLevel.trainingLevelClassification,
              anyParticipantAttended,
              training.trainingStatus,
              anyParticipantAttended ? Colors.blue : Colors.green,
            );
          }).toList();

          setState(() {
            _selectedEvents = newSelectedEvents;
          });
        },
        error: (message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message)),
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(),
      ),
      body: Column(
        children: [
          TableCalendar<CalendarItemModel>(
            locale: locale,
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            calendarFormat: _calendarFormat,
            rangeSelectionMode: _rangeSelectionMode,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: const CalendarStyle(
              outsideDaysVisible: false,
            ),
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
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: _selectedEvents.length,
              itemBuilder: (context, index) {
                final calendarItem = _selectedEvents[index];
                return InkWell(
                  onLongPress: () {
                    // _handleCardTap(calendarItem.trainingId);
                  },
                  child: Container(
                    key: _selectedEvents[index].key,
                    width: MediaQuery.of(context).size.width > 992
                        ? ((MediaQuery.of(context).size.width - 20) / 2)
                        : MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                    child: CalendarCard(
                      calendarItemModelList: _selectedEvents[index],
                    ),
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
