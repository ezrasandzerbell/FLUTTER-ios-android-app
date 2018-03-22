import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sightworks_flutter/GlobalWidgets/main-footer.dart';
import 'package:sightworks_flutter/GlobalWidgets/full-width-button.dart';

class signUpLocation extends StatefulWidget {
  @override
  signUpLocation({Key key, this.title}) : super(key: key);
  final String title;

  signUpLocationState createState() {
    return new signUpLocationState();
  }
}

class signUpLocationState extends State<signUpLocation> {


  static const String routeName = "/signUpLocation";

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

    Widget mapImage = new Container(
      padding: const EdgeInsets.only(bottom: 0.0),
      child: new Image.asset(
        'images/googleMap.png',
        width: 340.0,
      ),
    );

    Widget continueFooterButton = new Container(
      height: 50.0,
      decoration: new BoxDecoration(color: Colors.black),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          footerLink('CONTINUE', pinkColor, context, "signUpAlmostDone"),
        ],
      ),
    );

    Widget currentPageView = new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black,
        title: new Text("Location"),
      ),
      body: new Stack (
          children: <Widget>[
            new PageView(
              children: [backgroundImage],
            ),
            new ListView(
              physics: new NeverScrollableScrollPhysics(),
              children: [
                mapImage,
                fullWidthButton("Salon Name", whiteColor, context, "signInPage", "CLOSED"),
                fullWidthButton("Address", whiteColor, context, "signInPage"),
                fullWidthButton("Phone", whiteColor, context, "signInPage")
              ],
            ),
          ]
      ),
      bottomNavigationBar: continueFooterButton,
    );
    return currentPageView;
  }
}