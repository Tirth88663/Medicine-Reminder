import 'package:flutter/material.dart';

const TextStyle kHeadingStyle = TextStyle(
  fontSize: 35.0,
  decoration: TextDecoration.none,
  color: Colors.black,
);
const TextStyle kButtonTextStyle =
    TextStyle(fontSize: 30.0, color: Colors.white);
const TextStyle kBodyTextStyle = TextStyle(
    fontSize: 18.0, decoration: TextDecoration.none, color: Colors.grey);

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Image(
            image: AssetImage('images/frontpage.jpg'),
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
          SizedBox(
            height: 30.0,
          ),
          SizedBox(
            width: 250,
            height: 50.0,
            child: RaisedButton(
              onPressed: null,
              child: Text(
                'GetStarted',
                style: kButtonTextStyle,
              ),
              color: Color(0xFFEA5F5F),
              elevation: 10.0,

            ),
          ),
        ],
      ),
    );
  }
}
