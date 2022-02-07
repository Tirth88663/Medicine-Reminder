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
      initialRoute: "/",
      routes: {
        "/": (contaxt) => GetStarted(),
        "/homepage": (context) => HomePage(),
      },
    );
  }
}
