// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat.yMMMMd().format(DateTime.now()),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Today",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/medicinepage");
                  },
                  child: Container(
                    height: 35.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                        child: Text(
                      "+add",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
                  ),
                )
              ],
            ),
          ),
          DatePicker(
            DateTime.now(),
            selectionColor: Colors.deepPurpleAccent,
          ),
        ],
      ),
    );
  }

  _appBar() {
    return AppBar(
      leading: GestureDetector(
        onTap: () {},
        child: Icon(Icons.nightlight_round),
      ),
      actions: [
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.account_circle,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
