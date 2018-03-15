import 'package:flutter/material.dart';
import 'my-app-homepage.dart';
import 'sign-in-page.dart';
import 'sign-up-p1.dart';
import 'sign-up-services.dart';
import 'day-hour-availability.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override

    Widget build(BuildContext context) {
    var routes = <String, WidgetBuilder> {
      signUpPageOne.routeName: (BuildContext context) => new signUpPageOne(title: "signUpPageOne"),
      signInPage.routeName: (BuildContext context) => new signInPage(title: "signInPage"),
      signUpPageServices.routeName: (BuildContext context) => new signUpPageServices(title: "signUpPageServices"),
      dayHourAvailability.routeName: (BuildContext context) => new dayHourAvailability(title: "dayHourAvailability"),
    };

    return new MaterialApp(
      title: 'Flutter Demo',
      home: new MyAppHomePage(),
      routes: routes,
    );
  }
}