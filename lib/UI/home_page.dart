// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'medicine_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Container(
            child:RaisedButton(
              onPressed: (){Navigator.pushNamed(context, "/medicinepage");}
            ),

          )],
        ),
      ),
    );
  }
}
