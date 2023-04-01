import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_2/Bookmarkcalendar/API/Controller/Bookmarkcontroller.dart';
import 'package:flutter_application_2/Bookmarkcalendar/API/Model/Bookmark.dart';
import 'package:hive/hive.dart';

class GetBookmark extends StatefulWidget {
  const GetBookmark({Key key}) : super(key: key);

  @override
  _GetBookmarkState createState() => _GetBookmarkState();
}

class _GetBookmarkState extends State<GetBookmark>
    with TickerProviderStateMixin {
  BookmarkController apicontroller;

  @override
  void initState() {
    super.initState();
    apicontroller = BookmarkController();
  }

  @override
  Widget build(BuildContext context) {
    //double fullHeight = MediaQuery.of(context).size.height;
    //double fullWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      maintainBottomViewPadding: false,
      child: FutureBuilder(
        future: apicontroller.getAllbookmark(),
        builder: (BuildContext context,
            AsyncSnapshot<List<Bookmarkmodel>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<Bookmarkmodel> contents = snapshot.data;
            return _buildListView(contents);
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildListView(List<Bookmarkmodel> contents) {
    //double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;
    return Column(
        children: contents.map((content) {
      return Container(
        height: 30,
        child: Text(
          content.namabookmark,
          style: TextStyle(color: Colors.black),
        ),
      );
    }).toList());
  }
}
