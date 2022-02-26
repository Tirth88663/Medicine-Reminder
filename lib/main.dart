import 'package:flutter/material.dart';
import 'package:medicine_reminder/UI/home_page.dart';
import 'package:medicine_reminder/UI/medicine_page.dart';
import 'package:medicine_reminder/config.dart';

import 'UI/get_started.dart';

void main() => runApp(MedicineReminder());

class MedicineReminder extends StatefulWidget {
  const MedicineReminder({Key? key}) : super(key: key);

  @override
  _MedicineReminderState createState() => _MedicineReminderState();
}

class _MedicineReminderState extends State<MedicineReminder> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      print("changed");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Medicine Reminder",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[350],
        primaryColor: Colors.white,
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.grey[350],
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.black)),
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.black,
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.black,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.white)),
        brightness: Brightness.dark,
      ),
      themeMode: currentTheme.currentTheme(),
      initialRoute: "/",
      routes: {
        "/": (context) => GetStarted(),
        "/homepage": (context) => HomePage(),
        "/medicinepage": (context) => MedicinePage(),
      },
    );
  }
}
