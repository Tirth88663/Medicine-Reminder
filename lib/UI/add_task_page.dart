import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medicine_reminder/controllers/task_controller.dart';
import 'package:medicine_reminder/theme.dart';
import '../models/task.dart';
import 'package:medicine_reminder/UI/widgets/mybutton.dart';
import 'package:medicine_reminder/UI/theme.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  DateTime _selectedTime = DateTime.now();
  String _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  String _endTime = DateFormat('hh:mm a')
      .format((DateTime.now()).add(const Duration(minutes: 15)))
      .toString();
  int _selectedRemind = 5;
  List<int> reminderList = [5, 10, 15, 20];
  String _selectedRepeat = 'None';
  List<String> repeatList = ['None', 'Daily', 'Weekly', 'Monthly'];

  int _selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Add Task',
                style: headingStyle,
              ),
              MyInputField(
                title: 'Title',
                hint: 'Enter title here',
                textEditingController: _titleController,
              ),
              MyInputField(
                title: 'Note',
                hint: 'Enter note here',
                textEditingController: _noteController,
              ),
              MyInputField(
                title: 'Date',
                hint: DateFormat.yMd().format(_selectedTime),
                widget: IconButton(
                  onPressed: () => _getDateFromUser(),
                  icon: const Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.grey,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: MyInputField(
                      title: 'Start Time',
                      hint: _startTime,
                      widget: IconButton(
                        onPressed: () => _getTimeFromUser(isStartTime: true),
                        icon: const Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Expanded(
                    child: MyInputField(
                      title: 'End Time',
                      hint: _endTime,
                      widget: IconButton(
                        onPressed: () => _getTimeFromUser(isStartTime: false),
                        icon: const Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              MyInputField(
                title: 'Remind',
                hint: '$_selectedRemind minutes early',
                widget: Row(
                  children: [
                    DropdownButton(
                      dropdownColor: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10.0),
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      ),
                      underline: Container(
                        height: 0.0,
                      ),
                      iconSize: 32,
                      elevation: 4,
                      style: subTitleStyle,
                      items: reminderList
                          .map<DropdownMenuItem<String>>(
                              (item) => DropdownMenuItem<String>(
                              value: item.toString(),
                              child: Text(
                                '$item',
                                style: const TextStyle(color: white),
                              )))
                          .toList(),
                      onChanged: (String? val) {
                        setState(() {
                          _selectedRemind = int.parse(val!);
                        });
                      },
                    ),
                    const SizedBox(
                      width: 6.0,
                    )
                  ],
                ),
              ),
              MyInputField(
                title: 'Repeat',
                hint: _selectedRepeat,
                widget: Row(
                  children: [
                    DropdownButton(
                      dropdownColor: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10.0),
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      ),
                      underline: Container(
                        height: 0.0,
                      ),
                      iconSize: 32,
                      elevation: 4,
                      style: subTitleStyle,
                      items: repeatList
                          .map<DropdownMenuItem<String>>(
                              (item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(color: white),
                              )))
                          .toList(),
                      onChanged: (String? val) {
                        setState(() {
                          _selectedRepeat = val!;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 6.0,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 18.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _colorPalette(),
                  MyButton(
                    label: 'Create Task',
                    onTap: () {
                      _validateData();
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBar() => AppBar(
    elevation: 0,
    backgroundColor: context.theme.backgroundColor,
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back,
        size: 24,
        color: primaryClr,
      ),
      onPressed: () => Navigator.pop(context),
    ),
    actions: const [
      CircleAvatar(
        radius: 18,
        backgroundImage: AssetImage('images/profile.png'),
      ),
      SizedBox(
        width: 20,
      )
    ],
  );

  _addTaskToDb() async {
    int value = await _taskController.addTask(
        task: Task(
            title: _titleController.text,
            note: _noteController.text,
            isCompleted: 0,
            date: DateFormat.yMd().format(_selectedTime),
            startTime: _startTime,
            endTime: _endTime,
            color: _selectedColor,
            remind: _selectedRemind,
            repeat: _selectedRepeat));
  }

  _validateData() {
    if (_titleController.text.isNotEmpty && _noteController.text.isNotEmpty) {
      _addTaskToDb();
      Navigator.pop(context);
    } else if (_titleController.text.isEmpty || _noteController.text.isEmpty) {
      Get.snackbar(
          'Some fields are required!', 'Please fill the required fields.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          colorText: pinkClr,
          icon: const Icon(
            Icons.warning_amber,
            color: Colors.red,
          ));
    } else {
      print('### SOMETHING BAD HAPPENED ###');
    }
  }

  Column _colorPalette() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color',
          style: titleStyle,
        ),
        const SizedBox(
          height: 8.0,
        ),
        Wrap(
            children: List<Widget>.generate(
              3,
                  (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedColor = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CircleAvatar(
                    child: _selectedColor == index
                        ? const Icon(
                      Icons.done,
                      size: 16,
                      color: white,
                    )
                        : null,
                    radius: 14,
                    backgroundColor: index == 0
                        ? primaryClr
                        : index == 1
                        ? pinkClr
                        : orangeClr,
                  ),
                ),
              ),
            ))
      ],
    );
  }

  _getTimeFromUser({required bool isStartTime}) async {
    TimeOfDay? _pickedTime = await showTimePicker(
      context: context,
      initialTime: isStartTime
          ? TimeOfDay.fromDateTime(DateTime.now())
          : TimeOfDay.fromDateTime(
          DateTime.now().add(const Duration(minutes: 15))),
    );
    String _formattedTime = _pickedTime!.format(context);

    if (isStartTime)
      setState(() => _startTime = _formattedTime);
    else if (!isStartTime)
      setState(() => _endTime = _formattedTime);
    else
      print('time cancelled or sonething wrong');
  }

  _getDateFromUser() async {
    DateTime? _pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2030));
    if (_pickedDate != null) {
      setState(() => _selectedTime = _pickedDate);
      print('hhhh $_pickedDate');
    } else
      print('It\'s null or something error');
  }
}

// class AddTaskPage extends StatefulWidget {
//   const AddTaskPage({Key? key}) : super(key: key);
//
//   @override
//   _AddTaskPageState createState() => _AddTaskPageState();
// }
//
// class _AddTaskPageState extends State<AddTaskPage> {
//   final TaskController _taskController = Get.put(TaskController());
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _noteController = TextEditingController();
//   DateTime _selectedDate = DateTime.now();
//   String _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
//   String _endTime = '9:30 PM';
//   int _selectedRemind = 5;
//   List<int> remindList = [
//     5,
//     10,
//     15,
//     20,
//   ];
//   String _selectedRepeat = 'None';
//   List<String> repeatList = [
//     'None',
//     'Daily',
//     'Weekly',
//     'Monthly',
//   ];
//   int _selectedColor = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: context.theme.backgroundColor,
//       appBar: _appBar(context),
//       body: Container(
//         padding: const EdgeInsets.only(
//           left: 20,
//           right: 20,
//           bottom: 20,
//         ),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Add Task',
//                 style: headingStyle,
//               ),
//               MyInputField(
//                 title: 'Title',
//                 hint: 'Enter your title',
//                 textEditingController: _titleController,
//               ),
//               MyInputField(
//                 title: 'Note',
//                 hint: 'Enter your note',
//                 textEditingController: _noteController,
//               ),
//               MyInputField(
//                 title: 'Date',
//                 hint: DateFormat.yMd().format(_selectedDate),
//                 widget: IconButton(
//                   icon: Icon(
//                     Icons.calendar_today_outlined,
//                     color: Colors.grey,
//                   ),
//                   onPressed: () {
//                     _getDateFromUser();
//                   },
//                 ),
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: MyInputField(
//                       title: 'Start Time',
//                       hint: _startTime,
//                       widget: IconButton(
//                         icon: Icon(
//                           Icons.access_time_rounded,
//                           color: Colors.grey,
//                         ),
//                         onPressed: () {
//                           _getTimeFromUser(isStartTime: true);
//                         },
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 12,
//                   ),
//                   Expanded(
//                     child: MyInputField(
//                       title: 'End Time',
//                       hint: _endTime,
//                       widget: IconButton(
//                         icon: Icon(
//                           Icons.access_time_rounded,
//                           color: Colors.grey,
//                         ),
//                         onPressed: () {
//                           _getTimeFromUser(isStartTime: false);
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               MyInputField(
//                 title: 'Remind',
//                 hint: '$_selectedRemind minutes early',
//                 widget: DropdownButton(
//                   icon: Icon(
//                     Icons.keyboard_arrow_down,
//                     color: Colors.grey,
//                   ),
//                   iconSize: 32,
//                   elevation: 4,
//                   style: subTitleStyle,
//                   underline: Container(
//                     height: 0,
//                   ),
//                   onChanged: (String? value) {
//                     setState(() {
//                       _selectedRemind = int.parse(value!);
//                     });
//                   },
//                   items: remindList.map<DropdownMenuItem<String>>(
//                         (int value) {
//                       return DropdownMenuItem<String>(
//                         value: value.toString(),
//                         child: Text(value.toString()),
//                       );
//                     },
//                   ).toList(),
//                 ),
//               ),
//               MyInputField(
//                 title: 'Repeat',
//                 hint: '$_selectedRepeat',
//                 widget: DropdownButton(
//                   icon: Icon(
//                     Icons.keyboard_arrow_down,
//                     color: Colors.grey,
//                   ),
//                   iconSize: 32,
//                   elevation: 4,
//                   style: subTitleStyle,
//                   underline: Container(
//                     height: 0,
//                   ),
//                   onChanged: (String? value) {
//                     setState(() {
//                       _selectedRepeat = value!;
//                     });
//                   },
//                   items: repeatList.map<DropdownMenuItem<String>>(
//                         (String? value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(
//                           value!,
//                           style: TextStyle(
//                             color: Colors.grey,
//                           ),
//                         ),
//                       );
//                     },
//                   ).toList(),
//                 ),
//               ),
//               SizedBox(
//                 height: 18,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   _colorPallete(),
//                   MyButton(label: 'Create Task', onTap: () => _validateDate()),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   _validateDate() {
//     if (_titleController.text.isNotEmpty && _noteController.text.isNotEmpty) {
//       _addTaskToDb();
//       Navigator.pop(context,'/addTaskPage');
//     } else if (_titleController.text.isEmpty || _noteController.text.isEmpty) {
//       Get.snackbar(
//         'Required',
//         'All fields are required !',
//         snackPosition: SnackPosition.BOTTOM,
//         colorText: pinkClr,
//         backgroundColor: Colors.white,
//         icon: Icon(
//           Icons.warning_amber_rounded,
//           color: Colors.red,
//         ),
//       );
//     }
//   }
//
//   _addTaskToDb() async {
//     int value = await _taskController.addTask(
//         task: Task(
//           title: _titleController.text,
//           note: _noteController.text,
//           date: DateFormat.yMd().format(_selectedDate),
//           startTime: _startTime,
//           endTime: _endTime,
//           remind: _selectedRemind,
//           repeat: _selectedRepeat,
//           color: _selectedColor,
//           isCompleted: 0,
//         ));
//     print('My id is + $value');
//   }
//
//   _appBar(BuildContext context) {
//     return AppBar(
//       elevation: 0,
//       backgroundColor: context.theme.backgroundColor,
//       leading: GestureDetector(
//         onTap: () {
//           Navigator.pop(context);
//         },
//         child: Padding(
//           padding: const EdgeInsets.only(left: 8.0),
//           child: Icon(
//             Icons.arrow_back_ios,
//             size: 25,
//             color: MyTheme.isDark? Colors.white : Colors.black,
//           ),
//         ),
//       ),
//       actions: [
//         CircleAvatar(
//           backgroundColor: Colors.white,
//           child: Image(
//             image: AssetImage('images/profile.png'),
//             width: 25,
//             height: 25,
//           ),
//         ),
//         // Icon(
//         //   Icons.person,
//         //   size: 20,
//         // ),
//         SizedBox(
//           width: 20,
//         ),
//       ],
//     );
//   }
//
//   _getDateFromUser() async {
//     DateTime? _pickerDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2015),
//       lastDate: DateTime(2031),
//     );
//
//     if (_pickerDate != null) {
//       setState(() {
//         _selectedDate = _pickerDate;
//         print(_selectedDate);
//       });
//     } else {
//       print("it's null or something is wrong");
//     }
//   }
//
//   _getTimeFromUser({required bool isStartTime}) async {
//     var _pickerTime = await _showTimePicker();
//     String _formatedTime = _pickerTime.format(context);
//
//     if (_pickerTime == null) {
//       print('Time canceld');
//     } else if (isStartTime == true) {
//       setState(() {
//         _startTime = _formatedTime;
//         print(_startTime);
//       });
//     } else if (isStartTime == false) {
//       setState(() {
//         _endTime = _formatedTime;
//         print(_endTime);
//       });
//     }
//   }
//
//   _showTimePicker() {
//     return showTimePicker(
//       initialEntryMode: TimePickerEntryMode.input,
//       context: context,
//       initialTime: TimeOfDay(
//         hour: int.parse(_startTime.split(':')[0]),
//         minute: int.parse(_startTime.split(':')[1].split(' ')[0]),
//       ),
//     );
//   }
//
//   _colorPallete() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Color',
//           style: titleStyle,
//         ),
//         SizedBox(
//           height: 8.0,
//         ),
//         Wrap(
//           children: List<Widget>.generate(
//             3,
//                 (int index) {
//               return GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     _selectedColor = index;
//                     print('$index');
//                   });
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.only(right: 8.0),
//                   child: CircleAvatar(
//                     radius: 14,
//                     backgroundColor: index == 0
//                         ? primaryClr
//                         : index == 1
//                         ? pinkClr
//                         : yellowClr,
//                     child: _selectedColor == index
//                         ? Icon(
//                       Icons.done,
//                       color: Colors.white,
//                       size: 16,
//                     )
//                         : Container(),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
class MyInputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? textEditingController;
  final Widget? widget;

  const MyInputField(
      {Key? key,
        required this.title,
        required this.hint,
        this.textEditingController,
        this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleStyle,
          ),
          Container(
            height: 52,
            margin: const EdgeInsets.only(top: 8.0),
            padding: const EdgeInsets.only(left: 14),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: widget == null ? false : true,
                    autofocus: false,
                    cursorColor:
                    Get.isDarkMode ? Colors.grey[100] : Colors.grey[700],
                    controller: textEditingController,
                    style: subTitleStyle,
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: subTitleStyle,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: context.theme.backgroundColor,
                          width: 0,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: context.theme.backgroundColor,
                          width: 0,
                        ),
                      ),
                    ),
                  ),
                ),
                widget == null
                    ? Container()
                    : Container(
                  child: widget,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}