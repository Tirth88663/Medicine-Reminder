import 'package:flutter/material.dart';
import 'package:medicine_reminder/UI/home_page.dart';
import 'package:medicine_reminder/UI/medicine_page.dart';
import 'package:medicine_reminder/config.dart';
import 'package:medicine_reminder/UI/welcome_page.dart';
import 'UI/get_started.dart';
import 'package:medicine_reminder/UI/login_page.dart';
import 'package:medicine_reminder/UI/registration_page.dart';
import 'package:firebase_core/firebase_core.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MedicineReminder());}

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
        "/welcomePage":(context) =>WelcomeScreen(),
        "/loginScreen":(context) =>LoginScreen(),
        "/registrationScreen":(context)=>RegistrationScreen()
      },
    );
  }
}
