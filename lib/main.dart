import 'package:flutter/material.dart';
import 'package:hotels_ui/pages/home_page.dart';
import 'package:hotels_ui/pages/homework_page.dart';
import 'package:hotels_ui/pages/hotel_ui_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      routes: {
        HotelUiPage.id:(context) => HotelUiPage(),
        HomePage.id:(context) => HomePage(),
        HomeworkPage.id:(context) => HomeworkPage(),
      },
    );
  }
}

