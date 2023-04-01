import 'package:flutter/material.dart';
import 'package:flutter_application_2/Bookmarkcalendar/Bookmarkpage/Bookmark.dart';
import 'package:flutter_application_2/Bookmarkcalendar/Bookmarkpage/Index.dart';
import 'package:flutter_application_2/Bookmarkcalendar/Calendar_page.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  runApp(MyApp());
}

DateTime selectSchedule = DateTime.now();
var Calendar_start = DateTime.utc(2000);
var Calendar_end = DateTime.utc(2100);
var selectedday = null;
var primaryColor = Colors.blue;
var accentColor = Colors.white;
int selectedIndex = 0;
var highlightText = null;

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Bookmark(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
