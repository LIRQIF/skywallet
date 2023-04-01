import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/pages.dart';
import 'package:flutter_application_2/shared/shared.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          primaryColor: primaryColor,
          canvasColor: Colors.transparent,
        ),
        home: RegisterPage());
  }
}
