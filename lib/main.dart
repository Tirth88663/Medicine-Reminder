import 'package:flutter/material.dart';
import 'package:medicine_reminder/UI/home_page.dart';

import 'UI/get_started.dart';

void main() => runApp(MedicineReminder());

class MedicineReminder extends StatelessWidget {
  const MedicineReminder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Medicine Reminder",
      theme: ThemeData(
        primaryColor: Colors.white,
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.black)),
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        primaryColor: Colors.black,
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.black,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.white)),
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.light,
      initialRoute: "/",
      routes: {
        "/": (context) => GetStarted(),
        "/homepage": (context) => HomePage(),
      },
    );
  }
}
