import 'package:flutter/material.dart';

const TextStyle kHeadingStyle = TextStyle(
  fontSize: 24.0,
  decoration: TextDecoration.none,
  color: Colors.black,
  fontWeight: FontWeight.w600,
);
const TextStyle kButtonTextStyle = TextStyle(
  fontSize: 18.0,
  color: Colors.white,
  fontWeight: FontWeight.w500,
);
const TextStyle kBodyTextStyle = TextStyle(
  fontSize: 18.0,
  decoration: TextDecoration.none,
  color: Colors.grey,
  fontWeight: FontWeight.w600,
);

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(
              'images/frontpage.jpg',
              width: 390.0,
            ),
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
                borderRadius: BorderRadius.circular(25),
                color: Color(0xFFEA5F5F),
                shape: BoxShape.rectangle,
              ),
              padding: EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/homepage");
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    "Get Started",
                    style: kButtonTextStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
