import 'package:flutter/material.dart';
import 'package:trainee_app/core/localization_extension.dart';
import 'package:trainee_app/features/auth/presentation/util/HelperMethods.dart';
import 'package:trainee_app/features/locations/presentation/controller/card/calendar_items.dart';

class CalendarCard extends StatefulWidget {
  const CalendarCard({Key? key, required this.calendarItemModelList})
      : super(key: key);

  final CalendarItemModel calendarItemModelList;

  @override
  State<CalendarCard> createState() => _CalendarCardState();
}

class _CalendarCardState extends State<CalendarCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          widget.calendarItemModelList.color,
          widget.calendarItemModelList.color.withOpacity(0.5),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: const BoxConstraints(maxWidth: 170),
                child: Text(
                  widget.calendarItemModelList.trainingName,
                  style: const TextStyle(
                    fontSize: 24,
                    fontFamily: "Poppins",
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '@ ${widget.calendarItemModelList.trainingTime}h',
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                context.trainingLevel +
                    " " +
                    HelperMethods.getTrainingClassification(
                        widget.calendarItemModelList.trainingLevel, context),
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              if (!widget.calendarItemModelList.trainingStatus)
                Column(
                  children: [
                    const SizedBox(height: 8),
                    Text(
                      context.trainingCanceled,
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 77, 0, 0),
                      ),
                    ),
                  ],
                ),
              Text(
                widget.calendarItemModelList.attendedStatus
                    ? context.attendTheTraining
                    : context.notAttendTheTraining,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  color: widget.calendarItemModelList.attendedStatus
                      ? const Color.fromARGB(
                          255, 0, 0, 0) // Green color for attending
                      : const Color.fromARGB(
                          255, 0, 0, 0), // Red color for not attending
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
