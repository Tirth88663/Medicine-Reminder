import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';

const TextStyle kBodyTextHeading =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0);
const TextStyle kBodyTextSubHeading =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0);

class MedicinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Icon(
                    Icons.account_circle,
                    size: 50.0,
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
                  child: Text(
                    "Add Task",
                    textAlign: TextAlign.justify,
                    style: kBodyTextHeading,
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(
                    left: 20.0,
                    top: 5.0,
                  ),
                  child: Text(
                    "Title",
                    textAlign: TextAlign.justify,
                    style: kBodyTextSubHeading,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a search term',
                ),
              ),
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(
                    left: 20.0,
                    top: 5.0,
                  ),
                  child: Text(
                    "Note",
                    textAlign: TextAlign.justify,
                    style: kBodyTextSubHeading,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a search term',
                ),
              ),
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 5.0),
                  child: Text(
                    "Date",
                    textAlign: TextAlign.justify,
                    style: kBodyTextSubHeading,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DateTimeFormField(
                decoration: const InputDecoration(
                  hintStyle: TextStyle(color: Colors.black45),
                  errorStyle: TextStyle(color: Colors.redAccent),
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.event_note),
                  hintText: 'Enter Date'
                ),
                mode: DateTimeFieldPickerMode.date,
                autovalidateMode: AutovalidateMode.always,
                onDateSelected: (DateTime value) {
                  print(value);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 100.0,top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Start Time',
                    style: kBodyTextSubHeading,
                  ),
                  Text(
                    'End Time',
                    style: kBodyTextSubHeading,
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 190.0  ,
                  child: DateTimeFormField(
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.black45),
                      errorStyle: TextStyle(color: Colors.redAccent),
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.event_note),
                      hintText: 'Start time',
                    ),
                    mode: DateTimeFieldPickerMode.time,
                    autovalidateMode: AutovalidateMode.always,
                    onDateSelected: (DateTime startTime) {
                      print(startTime);
                    },
                  ),
                ),
                SizedBox(
                  width: 190.0  ,
                  child: DateTimeFormField(
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.black45),
                      errorStyle: TextStyle(color: Colors.redAccent),
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.event_note),
                      hintText: 'End time',
                    ),
                    mode: DateTimeFieldPickerMode.time,
                    autovalidateMode: AutovalidateMode.always,
                    onDateSelected: (DateTime endTime) {
                      print(endTime);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
