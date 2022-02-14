import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';

const TextStyle kBodyTextHeading =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0);
const TextStyle kBodyTextSubHeading =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0);

class MedicinePage extends StatefulWidget {
  @override
  _MedicinePageState createState() => _MedicinePageState();
}

class _MedicinePageState extends State<MedicinePage> {
  String dropdownValue = '5 minutes early';

  IconData icon = Icons.circle;
  int iconClickCounter=0;
  IconData iconOneCheck=Icons.check_circle;
  IconData iconTwoCheck=Icons.check_circle;
  IconData iconThreeCheck=Icons.check_circle;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
                      // top: 5.0,
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
                  onChanged: (String TitleData) {
                    print(TitleData);
                  },
                ),
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20.0,
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
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a search term',
                  ),
                  onChanged: (String NoteData) {
                    print(NoteData);
                  },
                ),
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, top: 10.0),
                    child: Text(
                      "Date",
                      textAlign: TextAlign.justify,
                      style: kBodyTextSubHeading,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 12.0,
                  right: 12.0,
                ),
                child: DateTimeFormField(
                  decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.black45),
                      errorStyle: TextStyle(color: Colors.redAccent),
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.event_note),
                      hintText: 'Enter Date'),
                  mode: DateTimeFieldPickerMode.date,
                  autovalidateMode: AutovalidateMode.always,
                  onDateSelected: (DateTime value) {
                    print(value);
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 100.0, top: 10.0),
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
                    width: 190.0,
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
                    width: 190.0,
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
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20.0,
                      top: 5.0,
                    ),
                    child: Text(
                      "Remind",
                      textAlign: TextAlign.justify,
                      style: kBodyTextSubHeading,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 390.0,
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  alignment: Alignment.center,

                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  // borderRadius:BorderRadius.all(),
                  elevation: 16,
                  style: const TextStyle(color: Colors.grey),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      print(newValue);
                    });
                  },
                  items: <String>[
                    '5 minutes early',
                    '10 minutes early',
                    '20 minutes early'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
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
                      "Repeat",
                      textAlign: TextAlign.justify,
                      style: kBodyTextSubHeading,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 390.0,
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  alignment: Alignment.center,

                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  // borderRadius:BorderRadius.all(),
                  elevation: 16,
                  style: const TextStyle(color: Colors.grey),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      print(newValue);
                    });
                  },
                  items: <String>[
                    '5 minutes early',
                    '10 minutes early',
                    '20 minutes early'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
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
                      "Color",
                      textAlign: TextAlign.justify,
                      style: kBodyTextSubHeading,
                    ),
                  ),
                ],
              ),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            iconClickCounter=1;
                          });
                        },
                        icon: Icon(
                          iconClickCounter==1 ? iconOneCheck:icon,
                          color: Colors.red,
                          size: 30.0,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            iconClickCounter=2;
                          });
                        },
                        icon: Icon(
                          iconClickCounter==2 ? iconTwoCheck:icon,
                          color: Colors.yellow,
                          size: 30.0,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            iconClickCounter=3;
                          });
                        },
                        icon: Icon(
                            iconClickCounter==3 ? iconThreeCheck:icon,
                          color: Colors.blue,
                          size: 30.0,
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width/3.5,),
                      RaisedButton(onPressed: (){},color: Colors.purple,child: Text('Create task',style:TextStyle(color: Colors.white),),)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class MedicinePage extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
