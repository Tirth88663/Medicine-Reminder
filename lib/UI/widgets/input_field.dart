import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine_reminder/theme.dart';
import 'package:medicine_reminder/UI/theme.dart';

class MyInputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;

  const MyInputField({
    required this.title,
    required this.hint,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
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
            padding: const EdgeInsets.only(left: 14.0),
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
                    autofocus: false,
                    cursorColor:
                    MyTheme.isDark ? Colors.grey[100] : Colors.grey[700],
                    controller: controller,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}