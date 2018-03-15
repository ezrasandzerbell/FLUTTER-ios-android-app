import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'main-footer.dart';
import 'full-width-button.dart';

class dayHourAvailability extends StatelessWidget {
  dayHourAvailability({Key key, this.title}) : super(key: key);

  static const String routeName = "/dayHourAvailability";

  final String title;
  var whiteColor = const Color(0xFFeceff1);
  var pinkColor = const Color(0xFFf735e9);

  @override Widget build(BuildContext context) {

    Widget backgroundImage = new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("images/img1.jpg"),
            fit: BoxFit.cover,
          ),
        )
    );

    Widget continueFooterButton = new Container(
      height: 50.0,
      decoration: new BoxDecoration(color: Colors.black),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          footerLink('CONTINUE', Colors.grey, context, "signUpPage"),
        ],
      ),
    );

    Widget titleTextSection(label) {
      return new Container(
        padding: const EdgeInsets.only(
            left: 80.0, right: 80.0, top: 20.0, bottom: 20.0),
        child: new Text(
          label,
          textAlign: TextAlign.center,
          style: new TextStyle(
              fontSize: 35.0,
              fontWeight: FontWeight.w500,
              color: const Color(0xFFeceff1)
          ),
        ),
      );
    }

    Widget currentPageView = new Scaffold(
      appBar: new AppBar(
        backgroundColor: pinkColor,
        title: new Text("Hours"),
      ),
      body: new Stack (
          children: <Widget>[
            new PageView(
              children: [backgroundImage],
            ),
            new ListView(
              physics: new NeverScrollableScrollPhysics(),
              children: [
                titleTextSection("Tap To Edit"),
                fullWidthButton("Monday", whiteColor, context, "signInPage", "CLOSED"),
                fullWidthButton("Tuesday", whiteColor, context, "signInPage"),
                fullWidthButton("Wednesday", whiteColor, context, "signInPage"),
                fullWidthButton("Thursday", whiteColor, context, "signInPage"),
                fullWidthButton("Friday", whiteColor, context, "signInPage"),
                fullWidthButton("Saturday", whiteColor, context, "signInPage"),
                fullWidthButton("Sunday", whiteColor, context, "signInPage"),
              ],
            ),
          ]
      ),
      bottomNavigationBar: continueFooterButton,
    );
    return currentPageView;
  }
}