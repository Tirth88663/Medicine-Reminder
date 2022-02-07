// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                color: Colors.red,
                height: 100,
                width: 100,
                child: GestureDetector(
                  onTap: () {
                    Navigator.popAndPushNamed(context, "/");
                  },
                  child: Text("GO Back"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
