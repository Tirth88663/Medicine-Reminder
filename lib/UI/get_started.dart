import 'package:flutter/material.dart';

const TextStyle kHeadingStyle = TextStyle(
  fontSize: 24.0,
  decoration: TextDecoration.none,
  color: Colors.black,
);
const TextStyle kButtonTextStyle =
    TextStyle(fontSize: 21.0, color: Colors.white);
const TextStyle kBodyTextStyle = TextStyle(
    fontSize: 16.0, decoration: TextDecoration.none, color: Colors.grey);

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset('images/frontpage.jpg',width: 390.0,),

          Text(
            'Be In Safe Of \n Your Body',
            style: kHeadingStyle,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            'There is no substitute. A True Devotion to Healing. Achieve your goals together. In Love with Life.',
            style: kBodyTextStyle,
            textAlign: TextAlign.center,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color(0xFFEA5F5F),
            ),
            padding: EdgeInsets.all(10),

            child: GestureDetector(
              onTap: () => print("hello"),
              child: Text("Get Started",style: kButtonTextStyle,),
            ),
          ),
        ],
      ),
    );
  }
}
