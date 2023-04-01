import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_2/Bookmarkcalendar/API/Controller/Bookmarkcontroller.dart';
import 'package:flutter_application_2/Bookmarkcalendar/API/Model/Bookmark.dart';
import 'package:flutter_application_2/Bookmarkcalendar/Bookmarkpage/Bookmark.dart';
import 'package:hive/hive.dart';

class Bookmark extends StatefulWidget {
  const Bookmark({Key key}) : super(key: key);

  @override
  _BookmarkState createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          TextButton(
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('AlertDialog Title'),
                content: Container(height: 300, child: GetBookmark()),
              ),
            ),
            child: const Text('Show Dialog'),
          )
        ],
      ),
    );
  }
}
