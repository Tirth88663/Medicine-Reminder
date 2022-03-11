
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:medicine_reminder/UI/theme.dart';
import 'package:intl/intl.dart';
import 'package:medicine_reminder/components/notification_helper.dart';
import 'package:medicine_reminder/config.dart';
import '../models/task.dart';
import 'package:medicine_reminder/UI/widgets/mybutton.dart';
import 'package:get/get.dart';
import 'widgets/task_tile.dart';
import 'package:medicine_reminder/controllers/task_controller.dart';
import 'package:medicine_reminder/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late NotifyHelper notifyHelper;
  DateTime _selectedDate = DateTime.now();
  final _taskController = TaskController();

  // late User loggedInUser;
  // final _auth = FirebaseAuth.instance;
  // void getCurrentUser() async {
  //   try {
  //     final user = await _auth.currentUser;
  //     if (user != null) {
  //       loggedInUser = user;
  //       print(loggedInUser.uid);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState

    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();
    super.initState();
  }

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
                MyButton(
                  label: '+ Add Task',
                  onTap: () async {
                    await Navigator.pushNamed(context, '/addTaskPage');
                    _taskController.getTasks();
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: DatePicker(
              DateTime.now(),
              initialSelectedDate: DateTime.now(),
              selectionColor: Color(0xFFEB1997),
              selectedTextColor: Colors.white,
              monthTextStyle: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
              dateTextStyle: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              dayTextStyle: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
              onDateChange: (date){
                setState(() {
                  _selectedDate = date;
                });

              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          _showTasks(),
        ],
      ),
    );
  }


  _showTasks() {
    // if (_taskController.taskList.isEmpty) {
    _taskController.getTasks();
    return Expanded(
      child: Obx(() {
        return ListView.builder(
            itemCount: _taskController.taskList.length,
            itemBuilder: (_, index) {
              Task task=_taskController.taskList[index];
              print(task.toJson());
              if (task.date == DateFormat.yMd().format(_selectedDate) ||
                  task.repeat == 'Daily' ||
                  task.repeat == 'Weekly' &&
                      _selectedDate
                          .difference(
                          DateFormat.yMd().parse(task.date!))
                          .inDays %
                          7 ==
                          0 ||
                  task.repeat == 'Monthly' &&
                      _selectedDate.day ==
                          DateFormat.yMd().parse(task.date!).day) {               DateTime date=DateFormat.jm().parse(task.startTime.toString());
                var myTime=DateFormat("HH:mm").format(date);
                int hour;
                int minutes;
                hour = int.parse(myTime.toString().split(":")[0]);
                minutes = int.parse(myTime.toString().split(":")[1]);
                FlutterAlarmClock.createAlarm(hour, minutes);
                return AnimationConfiguration.staggeredList(
                    position: index,
                    child: SlideAnimation(
                      child: FadeInAnimation(
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _showBottomSheet(
                                    context, task);

                              },
                              child: TaskTile(task),
                            )
                          ],
                        ),
                      ),
                    ));
              }
              if (task.date==DateFormat.yMd().format(_selectedDate)){
                return AnimationConfiguration.staggeredList(
                    position: index,
                    child: SlideAnimation(
                      child: FadeInAnimation(
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _showBottomSheet(
                                    context, task);

                              },
                              child: TaskTile(task),
                            )
                          ],
                        ),
                      ),
                    ));
              }else{
                return Container();
              }
            });
      }),
    );
  }

  _appBar() {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          currentTheme.switchTheme();
          notifyHelper.displayNotification(
            title: "Theme Changed",
            body: MyTheme.isDark ? "Activated dark theme " : "Activated light theme",
          );
        },
        child: Icon(
            MyTheme.isDark ? Icons.wb_sunny_outlined:Icons.nightlight_round ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage("images/profile.png"),
          ),
        )
      ],
    );
  }

  _showBottomSheet(BuildContext context, Task task) {

    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              padding: const EdgeInsets.only(top: 4),
              height: task.isCompleted == 1
                  ? MediaQuery.of(context).size.height * 0.24
                  : MediaQuery.of(context).size.height * 0.32,
              color: MyTheme.isDark ? darkGreyClr : Colors.white,
              child: Column(
                children: [
                  Container(
                    height: 6,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:
                          MyTheme.isDark ? Colors.grey[600] : Colors.grey[300],
                    ),
                  ),
                  Spacer(),
                  task.isCompleted == 1
                      ? Container()
                      : _bottomSheetButton(
                          label: "Task Completed",
                          onTap: () {
                            _taskController.markTaskCompleted(task.id!);
                            Navigator.pop(context);
                          },
                          clr: primaryClr,
                          context: context,
                        ),

                  _bottomSheetButton(
                    label: "Delete Task",
                    onTap: () {
                      _taskController.delete(task);
                      Navigator.pop(context);
                    },
                    clr: Colors.red[300]!,
                    context: context,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _bottomSheetButton(
                    label: "Close",
                    onTap: () {
                      Navigator.pop(context);
                    },
                    clr: Colors.white,
                    context: context,
                    isClose: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ));
  }

  _bottomSheetButton({
    required String label,
    required Function()? onTap,
    required Color clr,
    bool isClose = false,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: 55,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          border:
              Border.all(width: 2, color: isClose == true ? MyTheme.isDark?Colors.grey[600]! :Colors.grey[300]! : clr),
          borderRadius: BorderRadius.circular(20),
          color: isClose == true ? Colors.transparent : clr,
        ),
        child: Center(
            child: Text(
          label,
          style:
              isClose ? titleStyle : titleStyle.copyWith(color: Colors.white),
        )),
      ),
    );
  }
}
