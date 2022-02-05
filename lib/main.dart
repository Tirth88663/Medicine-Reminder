import 'package:flutter/material.dart';
import 'UI/get_started.dart';
void main() => runApp(MedicineReminder());

class MedicineReminder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child:GetStarted() ,
      ),
    );
  }
}
