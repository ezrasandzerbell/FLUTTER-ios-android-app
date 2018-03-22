import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../GlobalWidgets/main-footer.dart';

class signUpAlmostDone extends StatefulWidget {
  @override

  final String title;
  signUpAlmostDone({Key key, this.title}) : super(key: key);
  static const String routeName = "/signUpAlmostDone";

  signUpAlmostDoneState createState() {
    return new signUpAlmostDoneState();
  }
}

class signUpAlmostDoneState extends State<signUpAlmostDone> {

  var whiteColor = const Color(0xFFeceff1);
  var pinkColor = const Color(0xFFf735e9);
  var regular = FontWeight.w300;
  var bold = FontWeight.w700;

  @override Widget build(BuildContext context) {

    Widget backgroundImage = new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("images/img1.jpg"),
            fit: BoxFit.cover,
          ),
        )
    );

    Widget style360Logo = new Container(
      padding: const EdgeInsets.only(top: 100.0, bottom: 20.0),
      child: new Image.asset(
        'images/style.png',
        width: 180.0,
        height: 180.0,
      ),
    );


    Widget subtitleTextSection = new Container(
      padding: const EdgeInsets.only(left: 40.0, right: 40.0),
      child: new Text(
        '''Almost Done...''',
        textAlign: TextAlign.center,
        style: new TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w400,
            color: const Color(0xFFeceff1)
        ),
      ),
    );

    Widget titleTextSection = new Container(
      padding: const EdgeInsets.only(left: 80.0, right: 80.0, top: 20.0, bottom: 20.0),
      child: new Text(
        '''Eric Dayton''',
        textAlign: TextAlign.center,
        style: new TextStyle(
            fontSize: 35.0,
            fontWeight: FontWeight.w500,
            color: const Color(0xFFeceff1)
        ),
      ),
    );



    Widget salonAddress(label, setFontWeight) {
      return new Text(
        label,
        textAlign: TextAlign.center,
        style: new TextStyle(
          fontSize: 15.0,
          fontWeight: setFontWeight,
          color: const Color(0xFFeceff1)
        ),
      );
    }


    Widget continueFooterButton = new Container(
      height: 50.0,
      decoration: new BoxDecoration(color: Colors.black),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          footerLink('CONTINUE', pinkColor, context, "signUpPage"),
        ],
      ),
    );

    Widget currentPageView = new Scaffold(
      body: new Stack (
          children: <Widget>[
            new PageView(
              children: [backgroundImage],
            ),
            new ListView(
              physics: new NeverScrollableScrollPhysics(),
              children: [
                style360Logo,
                subtitleTextSection,
                titleTextSection,
                salonAddress("Oranj Studio", bold),
                salonAddress("726 SW Gaines st", regular),
              ],
            ),
          ]
      ),
      bottomNavigationBar: continueFooterButton,
    );
    return currentPageView;
  }
}