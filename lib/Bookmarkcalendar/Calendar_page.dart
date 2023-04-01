import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_2/Bookmarkcalendar/main.dart';
import 'package:table_calendar/table_calendar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = selectSchedule;
  DateTime focusedDay = selectSchedule;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          TableCalendar(
            focusedDay: selectedDay,
            firstDay: Calendar_start,
            lastDay: Calendar_end,
            weekendDays: const [DateTime.sunday],
            calendarFormat: format,
            onFormatChanged: (CalendarFormat _format) {
              setState(() {
                format = _format;
              });
            },
            startingDayOfWeek: StartingDayOfWeek.sunday,
            daysOfWeekVisible: true,
            onDaySelected: (DateTime selectedDay, focusedDay) {
              setState(() {
                selectedDay = selectedDay;
                focusedDay = focusedDay;
                selectSchedule = selectedDay;
                selectedIndex = 2;

                //For now. need to be fixed soon!!!
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                );
              });
            },
            selectedDayPredicate: (DateTime date) {
              return isSameDay(selectedDay, date);
            },
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
              ),
              todayTextStyle: TextStyle(color: primaryColor),
              selectedTextStyle: const TextStyle(color: Colors.white),
              holidayTextStyle: const TextStyle(color: Colors.red),
              weekendTextStyle: const TextStyle(color: Colors.red),
            ),
            daysOfWeekStyle: const DaysOfWeekStyle(
              weekendStyle: TextStyle(color: Colors.red),
            ),
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
          )
        ],
      ),
    );
  }
}
