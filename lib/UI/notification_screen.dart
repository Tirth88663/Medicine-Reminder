import 'package:flutter/material.dart';
import 'package:medicine_reminder/UI/theme.dart';
import 'package:get/get.dart';
import 'package:medicine_reminder/theme.dart';
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key, required this.payLoad}) : super(key: key);

  final String payLoad;

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    String _payLoad = widget.payLoad;
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.theme.backgroundColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 24,
            color: MyTheme.isDark ? white : darkGreyClr,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: const [
          CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage('assets/images/person.jpeg'),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Text(
                  'Hello, Hanan',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    color: MyTheme.isDark ? Colors.white : darkGreyClr,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'You have a new reminder',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: MyTheme.isDark ? Colors.grey[100] : darkGreyClr,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 10.0),
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: primaryClr,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.text_format,
                            size: 35,
                            color: white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Title',
                            style: TextStyle(color: white, fontSize: 30),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        _payLoad.toString().split('|')[0],
                        style: const TextStyle(color: white, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.description,
                            size: 35,
                            color: white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Description',
                            style: TextStyle(color: white, fontSize: 30),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        _payLoad.toString().split('|')[1],
                        textAlign: TextAlign.justify,
                        style: const TextStyle(color: white, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.calendar_today_outlined,
                            size: 35,
                            color: white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Date',
                            style: TextStyle(color: white, fontSize: 30),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        _payLoad.toString().split('|')[2],
                        style: const TextStyle(color: white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}