import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../GlobalWidgets/main-footer.dart';
import '../GlobalWidgets/full-width-button.dart';

class signUpPageServices extends StatelessWidget {
  signUpPageServices({Key key, this.title}) : super(key: key);

  static const String routeName = "/signUpPageServices";

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
          footerLink('CONTINUE', pinkColor, context, "dayHourAvailability"),
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
          backgroundColor: Colors.black,
          title: new Text("Services"),
        ),
        body: new Stack (
            children: <Widget>[
              new PageView(
                children: [backgroundImage],
              ),
              new ListView(
                physics: new NeverScrollableScrollPhysics(),
                children: [
                  titleTextSection("Cutting"),
                  fullWidthButton("Women's Haircut", whiteColor, context, "signInPage"),
                  fullWidthButton("Women's Haircut", whiteColor, context, "signInPage"),
                  fullWidthButton("Women's Haircut", whiteColor, context, "signInPage"),
                  titleTextSection("Coloring"),
                  fullWidthButton("Women's Haircut", whiteColor, context, "signInPage"),
                ],
              ),
            ]
        ),
        bottomNavigationBar: continueFooterButton,
      );
      return currentPageView;
    }
  }