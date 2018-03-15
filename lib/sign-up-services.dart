import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'main-footer.dart';

class signUpPageServices extends StatelessWidget {
  signUpPageServices({Key key, this.title}) : super(key: key);

  static const String routeName = "/signUpPageServices";

  final String title;

  @override Widget build(BuildContext context) {

    Widget backgroundImage = new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("images/img1.jpg"),
            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.srcATop),
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

    Widget titleTextSection = new Container(
      padding: const EdgeInsets.only(left: 80.0, right: 80.0, top: 300.0, bottom: 20.0),
      child: new Text(
        ''' Cutting ''',
        textAlign: TextAlign.center,
        style: new TextStyle(
            fontSize: 35.0,
            fontWeight: FontWeight.w500,
            color: const Color(0xFFeceff1)
        ),
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
                titleTextSection
              ],
            ),
          ]
      ),
      bottomNavigationBar: continueFooterButton,
    );
    return currentPageView;
  }
}