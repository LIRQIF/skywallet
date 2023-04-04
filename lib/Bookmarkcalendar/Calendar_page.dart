import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_2/Bookmarkcalendar/main.dart';
import 'package:flutter_application_2/News/berita.dart';
import 'package:flutter_application_2/pages/login.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:google_fonts/google_fonts.dart';

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
          ),
          Container(
            width: double.infinity,
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Icon(
                      Icons.download,
                      color: Colors.greenAccent[400],
                    )),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Income',
                        style: GoogleFonts.montserrat(
                            fontSize: 12, color: Colors.white)),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Rp 3.800.000',
                        style: GoogleFonts.montserrat(
                            fontSize: 14, color: Colors.white)),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Icon(
                    Icons.upload,
                    color: Colors.redAccent[400],
                  )),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Expense',
                      style: GoogleFonts.montserrat(
                          fontSize: 12, color: Colors.white)),
                  SizedBox(
                    height: 5,
                  ),
                  Text('Rp 1.600.000',
                      style: GoogleFonts.montserrat(
                          fontSize: 14, color: Colors.white)),
                ],
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: 'Catatan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Artikel',
          ),
        ],
      ),
    );
  }
}
